

package com.egsgroup.leavemanager.controller

import com.egsgroup.leavemanager.model.LeaveType

class LeaveTypeController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ leaveTypeInstanceList: LeaveType.list( params ), leaveTypeInstanceTotal: LeaveType.count() ]
    }

    def show = {
        def leaveTypeInstance = LeaveType.get( params.id )

        if(!leaveTypeInstance) {
            flash.message = "LeaveType not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ leaveTypeInstance : leaveTypeInstance ] }
    }

    def delete = {
        def leaveTypeInstance = LeaveType.get( params.id )
        if(leaveTypeInstance) {
            try {
                leaveTypeInstance.delete(flush:true)
                flash.message = "LeaveType ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "LeaveType ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "LeaveType not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def leaveTypeInstance = LeaveType.get( params.id )

        if(!leaveTypeInstance) {
            flash.message = "LeaveType not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ leaveTypeInstance : leaveTypeInstance ]
        }
    }

    def update = {
        def leaveTypeInstance = LeaveType.get( params.id )
        if(leaveTypeInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(leaveTypeInstance.version > version) {
                    
                    leaveTypeInstance.errors.rejectValue("version", "leaveType.optimistic.locking.failure", "Another user has updated this LeaveType while you were editing.")
                    render(view:'edit',model:[leaveTypeInstance:leaveTypeInstance])
                    return
                }
            }
            leaveTypeInstance.properties = params
            if(!leaveTypeInstance.hasErrors() && leaveTypeInstance.save()) {
                flash.message = "LeaveType ${params.id} updated"
                redirect(action:show,id:leaveTypeInstance.id)
            }
            else {
                render(view:'edit',model:[leaveTypeInstance:leaveTypeInstance])
            }
        }
        else {
            flash.message = "LeaveType not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def create = {
        def leaveTypeInstance = new LeaveType()
        leaveTypeInstance.properties = params
        return ['leaveTypeInstance':leaveTypeInstance]
    }

    def save = {
        def leaveTypeInstance = new LeaveType(params)
        if(!leaveTypeInstance.hasErrors() && leaveTypeInstance.save()) {
            flash.message = "LeaveType ${leaveTypeInstance.id} created"
            redirect(action:show,id:leaveTypeInstance.id)
        }
        else {
            render(view:'create',model:[leaveTypeInstance:leaveTypeInstance])
        }
    }
}
