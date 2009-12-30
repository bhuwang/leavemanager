security {

	// see DefaultSecurityConfig.groovy for all settable/overridable properties

	active = true

    algorithm = 'MD5'

    encodeHashAsBase64 = false

	loginUserDomainClass = "com.egsgroup.leavemanager.model.User"
    userName = 'username'
	password = 'passwd'
	authorityDomainClass = "com.egsgroup.leavemanager.model.Role"
	requestMapClass = "RequestMap"

    enabled = 'enabled'
	relationalAuthorities = 'authorities'
    useRequestMapDomainClass = false

    requestMapString = """\
        CONVERT_URL_TO_LOWERCASE_BEFORE_COMPARISON
        PATTERN_TYPE_APACHE_ANT
        /=IS_AUTHENTICATED_ANONYMOUSLY
        /login/auth=IS_AUTHENTICATED_ANONYMOUSLY
        /js/**=IS_AUTHENTICATED_ANONYMOUSLY
        /css/**=IS_AUTHENTICATED_ANONYMOUSLY
        /images/**=IS_AUTHENTICATED_ANONYMOUSLY
        /plugins/**=IS_AUTHENTICATED_ANONYMOUSLY
        /home/**=IS_AUTHENTICATED_FULLY
        """

    useHttpSessionEventPublisher = true
    
}
