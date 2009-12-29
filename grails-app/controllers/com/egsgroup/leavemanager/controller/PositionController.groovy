

package com.egsgroup.leavemanager.controller

import com.egsgroup.leavemanager.model.Position
import grails.converters.JSON


class PositionController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ positionInstanceList: Position.list( params ), positionInstanceTotal: Position.count() ]
    }

    def show = {
        def positionInstance = Position.get( params.id )

        if(!positionInstance) {
            flash.message = "Position not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ positionInstance : positionInstance ] }
    }

    def delete = {
        def positionInstance = Position.get( params.id )
        if(positionInstance) {
            try {
                positionInstance.delete(flush:true)
                flash.message = "Position ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "Position ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "Position not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def positionInstance = Position.get( params.id )

        if(!positionInstance) {
            flash.message = "Position not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ positionInstance : positionInstance ]
        }
    }

    def update = {
        def positionInstance = Position.get( params.id )
        if(positionInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(positionInstance.version > version) {
                    
                    positionInstance.errors.rejectValue("version", "position.optimistic.locking.failure", "Another user has updated this Position while you were editing.")
                    render(view:'edit',model:[positionInstance:positionInstance])
                    return
                }
            }
            positionInstance.properties = params
            if(!positionInstance.hasErrors() && positionInstance.save()) {
                flash.message = "Position ${params.id} updated"
                redirect(action:show,id:positionInstance.id)
            }
            else {
                render(view:'edit',model:[positionInstance:positionInstance])
            }
        }
        else {
            flash.message = "Position not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def create = {
        def positionInstance = new Position()
        positionInstance.properties = params
        return ['positionInstance':positionInstance]
    }

    def save = {
        def positionInstance = new Position(params)
        if(!positionInstance.hasErrors() && positionInstance.save()) {
            flash.message = "Position ${positionInstance.id} created"
            redirect(action:show,id:positionInstance.id)
        }
        else {
            render(view:'create',model:[positionInstance:positionInstance])
        }
    }

    def autoCompletePositionJSON = {
        def list = Position.findAll("from Position p where p.positionName like ?", [params.positionName])
        def jsonList = list.collect { [ id: it.id, positionName: it.positionName ] }
        def jsonResult = [result: jsonList]
        render jsonResult as JSON
    }


}
