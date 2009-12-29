package com.egsgroup.leavemanager.model

import grails.test.*
import com.egsgroup.leavemanager.model.User
import com.egsgroup.leavemanager.model.Position

class UserIntegrationTests extends GrailsUnitTestCase {
    protected void setUp() {
        super.setUp()
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testSaveUser() {
        def position = new Position(positionName: 'Senior Developer')
        assertNotNull position.save()
        def user = new User(userName: 'joe', password: 'secret',firstName: 'Rihard', lastName: 'Nduka', email: 'richard.nduka@egsgroup.com', phoneNumber: '07943315680', position:position)
        assertNotNull user.save()
        assertNotNull user.id
        def foundUser = User.get(user.id)
        assertEquals 'joe', foundUser.userName
    }

    void testSaveAndDelete() {
        def position = new Position(positionName: 'Senior Developer')
        assertNotNull position.save()
        def user = new User(userName: 'joe', password: 'secret',firstName: 'Rihard', lastName: 'Nduka', email: 'richard.nduka@egsgroup.com', phoneNumber: '07943315680', position:position)
        assertNotNull user.save()
        def foundUser = User.get(user.id)
        foundUser.delete()
        assertFalse User.exists(foundUser.id)
    }
    
    void testAddManaging(){
        def position = new Position(positionName: 'Senior Developer')
        assertNotNull position.save()
        def richard = new User(userName: 'joe', password: 'secret',firstName: 'Rihard', lastName: 'Nduka', email: 'richard.nduka@egsgroup.com', phoneNumber: '07943315680', position:position)
        assertNotNull richard.save()
        def andrew = new User(userName: 'rew', password: 'secreta',firstName: 'Andrew', lastName: 'Nduka', email: 'andrew.powell@egsgroup.com', phoneNumber: '07943315680', position:position)
        assertNotNull andrew.save()

        richard.addToManaging(andrew)
        assertEquals 1, richard.managing.size()
    }

    void testValidateBeforeSave() {
        def user = new User(userName: 'joe', password: 'sec',firstName: 'Rihard', lastName: 'Nduka', email: 'richard.nduka.egsgroup.com', phoneNumber: '07943315680')
        assertFalse user.validate()
        assertTrue user.hasErrors()
        def errors = user.errors
        assertEquals "size.toosmall",
        errors.getFieldError("password").code
        assertEquals "sec",
        errors.getFieldError("password").rejectedValue
        assertEquals "email.invalid",
        errors.getFieldError("email").code
        assertEquals "richard.nduka.egsgroup.com",
        errors.getFieldError("email").rejectedValue
        assertNull errors.getFieldError("userName")
    }
}
