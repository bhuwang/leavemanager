package com.egsgroup.leavemanager.model

import grails.test.*
import com.egsgroup.leavemanager.model.Position
import com.egsgroup.leavemanager.model.LeaveType

class MyLeaveIntegrationTests extends GrailsUnitTestCase {
    protected void setUp() {
        super.setUp()
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testAddUserAndLeave() {
        def position = new Position(positionName: 'Senior Developer')
        assertNotNull position.save()
        def user = new User(userName: 'joe', password: 'secret',firstName: 'Rihard', lastName: 'Nduka', email: 'richard.nduka@egsgroup.com', phoneNumber: '07943315680', position:position)
        assertNotNull user.save()

        def leaveType = new LeaveType(name: 'Annual Leave', numberOfDays: 24)
        assertNotNull leaveType.save()
        def myLeave = new MyLeave(balance: 24, fromDate: new Date(), thruDate: new Date(), leaveType: leaveType, user: user)
        assertNotNull myLeave.save()
        //user.addToMyLeaves(myLeave)
        //assertEquals 1, User.get(user.id).myLeaves.size()

    }
}
