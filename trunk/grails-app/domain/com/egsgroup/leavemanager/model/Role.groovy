package com.egsgroup.leavemanager.model

import com.egsgroup.leavemanager.model.User

/**
 * Authority domain class.
 */
class Role {

	static hasMany = [user: User]

	/** description */
	String description
	/** ROLE String */
	String authority

	static constraints = {
		authority(blank: false, unique: true)
		description()
	}
}
