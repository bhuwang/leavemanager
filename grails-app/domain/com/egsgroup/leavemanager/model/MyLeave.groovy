package com.egsgroup.leavemanager.model


class MyLeave {

    LeaveType leaveType

    static constraints = {
    }

    BigDecimal balance
    Date fromDate
    Date thruDate

    static mapping = {
        leaveType lazy:false
    }

    static belongsTo = [user: User]
}
