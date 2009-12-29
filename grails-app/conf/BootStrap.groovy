import com.egsgroup.leavemanager.model.Role
import com.egsgroup.leavemanager.model.Position
import com.egsgroup.leavemanager.model.User

class BootStrap {

    def authenticateService
    public static final String  USER_ROLE = "ROLE_USER"
	public static final String  USER_NAME = "rnduka"

     def init = { servletContext ->
         createDefaultRole()
         createDefaultUser()
     }
     def destroy = {
     }
     
    private def createDefaultRole() {
        if (!Role.findByAuthority(USER_ROLE)) 
            new Role(authority:USER_ROLE,description:"Normal User").save()	
    }

    private def createDefaultUser() {
        def position = new Position(positionName: 'Senior Developer')
        position.save()
		def superUser = User.findByUsername(USER_NAME)
        if (superUser == null) {
        	superUser = new User(username:USER_NAME,
        			passwd:authenticateService.passwordEncoder('password'),userRealName:'Richard Nduka',
        			email:'richard.nduka@egsgroup.com',enabled:true, position:position)
        	superUser.save()


        	Role.findByAuthority('ROLE_USER').addToUser(superUser)


        }


    }
} 