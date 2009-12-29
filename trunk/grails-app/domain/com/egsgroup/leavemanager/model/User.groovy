package com.egsgroup.leavemanager.model

import com.egsgroup.leavemanager.model.Role

/**
 * User domain class.
 */
class User {
	static transients = ['pass','confirmpassword','newpassword','oldpassword']
	static hasMany = [authorities: Role, myLeave : MyLeave, leaveApplication : LeaveApplication, managing : User]
	static belongsTo = Role

    Position position
	/** Username */
	String username
	/** User Real Name*/
	String userRealName
	/** MD5 Password */
	String passwd

    String confirmpassword

	String oldpassword

	String newpassword

	/** enabled */
	boolean enabled

    
	String email
	boolean emailShow

    String phoneNumber

	/** description */
	String description = ''

	/** plain password to create a MD5 password */
	String pass = '[secret]'

	static constraints = {
		username(blank: false, unique: true)
		userRealName(blank: false)
		passwd(blank: false)
        email(blank:false, email:true)
        phoneNumber(size:1..14, nullable: true)
		enabled()
	}

    static mapping = {
        position lazy:false
    }
    
    String toString(){
		"$userRealName"
	}
}
