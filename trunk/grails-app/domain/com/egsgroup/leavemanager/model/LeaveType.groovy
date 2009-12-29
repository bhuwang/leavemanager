package com.egsgroup.leavemanager.model

class LeaveType {

    static constraints = {
        name(size:1..60, blank:false)
        description(size:1..255, nullable:true)
    }

    String name;
    String description;
    int numberOfDays;
}
