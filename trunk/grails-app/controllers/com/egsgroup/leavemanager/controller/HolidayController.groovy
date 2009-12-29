

package com.egsgroup.leavemanager.controller

import com.egsgroup.leavemanager.model.Holiday

class HolidayController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ holidayInstanceList: Holiday.list( params ), holidayInstanceTotal: Holiday.count() ]
    }

    def show = {
        def holidayInstance = Holiday.get( params.id )

        if(!holidayInstance) {
            flash.message = "Holiday not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ holidayInstance : holidayInstance ] }
    }

    def delete = {
        def holidayInstance = Holiday.get( params.id )
        if(holidayInstance) {
            try {
                holidayInstance.delete(flush:true)
                flash.message = "Holiday ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "Holiday ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "Holiday not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def holidayInstance = Holiday.get( params.id )

        if(!holidayInstance) {
            flash.message = "Holiday not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ holidayInstance : holidayInstance ]
        }
    }

    def update = {
        def holidayInstance = Holiday.get( params.id )
        if(holidayInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(holidayInstance.version > version) {
                    
                    holidayInstance.errors.rejectValue("version", "holiday.optimistic.locking.failure", "Another user has updated this Holiday while you were editing.")
                    render(view:'edit',model:[holidayInstance:holidayInstance])
                    return
                }
            }
            holidayInstance.properties = params
            if(!holidayInstance.hasErrors() && holidayInstance.save()) {
                flash.message = "Holiday ${params.id} updated"
                redirect(action:show,id:holidayInstance.id)
            }
            else {
                render(view:'edit',model:[holidayInstance:holidayInstance])
            }
        }
        else {
            flash.message = "Holiday not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def create = {
        def holidayInstance = new Holiday()
        holidayInstance.properties = params
        return ['holidayInstance':holidayInstance]
    }

    def save = {
        def holidayInstance = new Holiday(params)
        if(!holidayInstance.hasErrors() && holidayInstance.save()) {
            flash.message = "Holiday ${holidayInstance.id} created"
            redirect(action:show,id:holidayInstance.id)
        }
        else {
            render(view:'create',model:[holidayInstance:holidayInstance])
        }
    }
}
