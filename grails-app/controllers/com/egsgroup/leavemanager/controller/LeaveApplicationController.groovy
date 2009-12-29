

package com.egsgroup.leavemanager.controller

import com.egsgroup.leavemanager.model.LeaveApplication

class LeaveApplicationController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ leaveApplicationInstanceList: LeaveApplication.list( params ), leaveApplicationInstanceTotal: LeaveApplication.count() ]
    }

    def show = {
        def leaveApplicationInstance = LeaveApplication.get( params.id )

        if(!leaveApplicationInstance) {
            flash.message = "LeaveApplication not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ leaveApplicationInstance : leaveApplicationInstance ] }
    }

    def delete = {
        def leaveApplicationInstance = LeaveApplication.get( params.id )
        if(leaveApplicationInstance) {
            try {
                leaveApplicationInstance.delete(flush:true)
                flash.message = "LeaveApplication ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "LeaveApplication ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "LeaveApplication not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def leaveApplicationInstance = LeaveApplication.get( params.id )

        if(!leaveApplicationInstance) {
            flash.message = "LeaveApplication not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ leaveApplicationInstance : leaveApplicationInstance ]
        }
    }

    def update = {
        def leaveApplicationInstance = LeaveApplication.get( params.id )
        if(leaveApplicationInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(leaveApplicationInstance.version > version) {
                    
                    leaveApplicationInstance.errors.rejectValue("version", "leaveApplication.optimistic.locking.failure", "Another user has updated this LeaveApplication while you were editing.")
                    render(view:'edit',model:[leaveApplicationInstance:leaveApplicationInstance])
                    return
                }
            }
            leaveApplicationInstance.properties = params
            if(!leaveApplicationInstance.hasErrors() && leaveApplicationInstance.save()) {
                flash.message = "LeaveApplication ${params.id} updated"
                redirect(action:show,id:leaveApplicationInstance.id)
            }
            else {
                render(view:'edit',model:[leaveApplicationInstance:leaveApplicationInstance])
            }
        }
        else {
            flash.message = "LeaveApplication not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def create = {
        def leaveApplicationInstance = new LeaveApplication()
        leaveApplicationInstance.properties = params
        return ['leaveApplicationInstance':leaveApplicationInstance]
    }

    def save = {
        def leaveApplicationInstance = new LeaveApplication(params)
        if(!leaveApplicationInstance.hasErrors() && leaveApplicationInstance.save()) {
            flash.message = "LeaveApplication ${leaveApplicationInstance.id} created"
            redirect(action:show,id:leaveApplicationInstance.id)
        }
        else {
            render(view:'create',model:[leaveApplicationInstance:leaveApplicationInstance])
        }
    }
}
