package com.egsgroup.leavemanager.model

class LeaveApplication {

    LeaveType leaveType

    static constraints = {
    }

    Date startDate
    Date endDate
    int Status
    String leaveReason
    String comment

    static belongsTo = [user: User]
}
