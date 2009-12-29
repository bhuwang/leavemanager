package com.egsgroup.leavemanager.controller

import com.egsgroup.leavemanager.model.User
import com.egsgroup.leavemanager.model.Role

/**
 * User controller.
 */
class UserController {

	def authenticateService

	// the delete, save and update actions only accept POST requests
	static Map allowedMethods = [delete: 'POST', save: 'POST', update: 'POST']

	def index = {
		redirect action: list, params: params
	}

	def list = {
		if (!params.max) {
			params.max = 10
		}
		[userInstanceList: User.list(params)]
	}

	def show = {
		def userInstance = User.get(params.id)
		if (!userInstance) {
			flash.message = "User not found with id $params.id"
			redirect action: list
			return
		}
		List roleNames = []
		for (role in userInstance.authorities) {
			roleNames << role.authority
		}
		roleNames.sort { n1, n2 ->
			n1 <=> n2
		}
		[userInstance: userInstance, roleNames: roleNames]
	}

	/**
	 * userInstance delete action. Before removing an existing userInstance,
	 * he should be removed from those authorities which he is involved.
	 */
	def delete = {

		def userInstance = User.get(params.id)
		if (userInstance) {
			def authPrincipal = authenticateService.principal()
			//avoid self-delete if the logged-in user is an admin
			if (!(authPrincipal instanceof String) && authPrincipal.username == userInstance.username) {
				flash.message = "You can not delete yourself, please login as another admin and try again"
			}
			else {
				//first, delete this userInstance from User_Authorities table.
				Role.findAll().each { it.removeFromUser(userInstance) }
				userInstance.delete()
				flash.message = "User $params.id deleted."
			}
		}
		else {
			flash.message = "User not found with id $params.id"
		}

		redirect action: list
	}

	def edit = {

		def userInstance = User.get(params.id)
		if (!userInstance) {
			flash.message = "User not found with id $params.id"
			redirect action: list
			return
		}

		return builduserInstanceModel(userInstance)
	}

	/**
	 * userInstance update action.
	 */
	def update = {

		def userInstance = User.get(params.id)
		if (!userInstance) {
			flash.message = "User not found with id $params.id"
			redirect action: edit, id: params.id
			return
		}

		long version = params.version.toLong()
		if (userInstance.version > version) {
			userInstance.errors.rejectValue 'version', "userInstance.optimistic.locking.failure",
				"Another user has updated this User while you were editing."
				render view: 'edit', model: builduserInstanceModel(userInstance)
			return
		}

		def oldPassword = userInstance.passwd
		userInstance.properties = params
		if (!params.passwd.equals(oldPassword)) {
			userInstance.passwd = authenticateService.encodePassword(params.passwd)
		}
		if (userInstance.save()) {
			Role.findAll().each { it.removeFromUser(userInstance) }
			addRoles(userInstance)
			redirect action: show, id: userInstance.id
		}
		else {
			render view: 'edit', model: builduserInstanceModel(userInstance)
		}
	}

	def create = {
		[userInstance: new User(params), authorityList: Role.list()]
	}

	/**
	 * userInstance save action.
	 */
	def save = {

		def userInstance = new User()
		userInstance.properties = params
		userInstance.passwd = authenticateService.encodePassword(params.passwd)
		if (userInstance.save()) {
            for (long key in params.managingId.keySet()){
                def userInstanceManaging = User.get(key)
                userInstance.addToManaging(userInstanceManaging)
            }
            //def userInstanceManaging = User.get(params.managingId)
            //userInstance.addToManaging(userInstanceManaging)
			addRoles(userInstance)
			redirect action: show, id: userInstance.id
		}
		else {
			render view: 'create', model: [authorityList: Role.list(), userInstance: userInstance]
		}
	}

	private void addRoles(userInstance) {
		for (String key in params.keySet()) {
			if (key.contains('ROLE') && 'on' == params.get(key)) {
				Role.findByAuthority(key).addToUser(userInstance)
			}
		}
	}

	private Map builduserInstanceModel(userInstance) {

		List roles = Role.list()
		roles.sort { r1, r2 ->
			r1.authority <=> r2.authority
		}
		Set userRoleNames = []
		for (role in userInstance.authorities) {
			userRoleNames << role.authority
		}
		LinkedHashMap<Role, Boolean> roleMap = [:]
		for (role in roles) {
			roleMap[(role)] = userRoleNames.contains(role.authority)
		}

		return [userInstance: userInstance, roleMap: roleMap]
	}
}
