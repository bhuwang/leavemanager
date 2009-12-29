package com.egsgroup.leavemanager.model

class Position {

    String positionName
    String positionDescription
    
    static constraints = {
        positionName(size:1..70, unique: true, blank: false)
        positionDescription(size:1..255, nullable: true)
    }

    String toString(){
		"$positionName"
	}
}
