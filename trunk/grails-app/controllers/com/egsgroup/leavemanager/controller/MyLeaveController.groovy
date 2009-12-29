

package com.egsgroup.leavemanager.controller

import com.egsgroup.leavemanager.model.MyLeave

class MyLeaveController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ myLeaveInstanceList: MyLeave.list( params ), myLeaveInstanceTotal: MyLeave.count() ]
    }

    def show = {
        def myLeaveInstance = MyLeave.get( params.id )

        if(!myLeaveInstance) {
            flash.message = "MyLeave not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ myLeaveInstance : myLeaveInstance ] }
    }

    def delete = {
        def myLeaveInstance = MyLeave.get( params.id )
        if(myLeaveInstance) {
            try {
                myLeaveInstance.delete(flush:true)
                flash.message = "MyLeave ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "MyLeave ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "MyLeave not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def myLeaveInstance = MyLeave.get( params.id )

        if(!myLeaveInstance) {
            flash.message = "MyLeave not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ myLeaveInstance : myLeaveInstance ]
        }
    }

    def update = {
        def myLeaveInstance = MyLeave.get( params.id )
        if(myLeaveInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(myLeaveInstance.version > version) {
                    
                    myLeaveInstance.errors.rejectValue("version", "myLeave.optimistic.locking.failure", "Another user has updated this MyLeave while you were editing.")
                    render(view:'edit',model:[myLeaveInstance:myLeaveInstance])
                    return
                }
            }
            myLeaveInstance.properties = params
            if(!myLeaveInstance.hasErrors() && myLeaveInstance.save()) {
                flash.message = "MyLeave ${params.id} updated"
                redirect(action:show,id:myLeaveInstance.id)
            }
            else {
                render(view:'edit',model:[myLeaveInstance:myLeaveInstance])
            }
        }
        else {
            flash.message = "MyLeave not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def create = {
        def myLeaveInstance = new MyLeave()
        myLeaveInstance.properties = params
        return ['myLeaveInstance':myLeaveInstance]
    }

    def save = {
        def myLeaveInstance = new MyLeave(params)
        if(!myLeaveInstance.hasErrors() && myLeaveInstance.save()) {
            flash.message = "MyLeave ${myLeaveInstance.id} created"
            redirect(action:show,id:myLeaveInstance.id)
        }
        else {
            render(view:'create',model:[myLeaveInstance:myLeaveInstance])
        }
    }
}
