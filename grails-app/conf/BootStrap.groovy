class BootStrap {


     def init = { servletContext ->
     
     log.trace("BootStrap: enter")
     def roleCoach;
     def roleAthlete;

     	 if (!Role.findByAuthority('ROLE_ATHLETE'))
     	 {
	    	 println("initializing role athlete")
	    	 roleAthlete = new Role(authority:'ROLE_ATHLETE',description:'athlete role desc').save()
	    	 println("role athlete created")
     	 }
     	 	
     	 if (!Role.findByAuthority('ROLE_COACH'))
	     {
	    	 println("initializing default roles")
	    	 roleCoach = new Role(authority:'ROLE_COACH',description:'coach role desc').save()
	    	 println("role coach created")
	     }
	     else
    	 {
    		 println("default role previously initialized")
    	 }
     
     	 final String ADMIN = 'admin'
    	 if (!AuthUser.findByUsername(ADMIN)) {
    		 println("initializing default user")
		 // 'e9c4bb7e20067b5707c2c1c7375f549e' is 'gr00vy'
    		 def adminUser = new AuthUser(username:ADMIN,passwd:'e9c4bb7e20067b5707c2c1c7375f549e',userRealName:'Ed Young',email:'ejy@summitbid.com')
    		 adminUser = validateAndSave(adminUser)
    		 if (adminUser)
    		 {
    			 adminUser.addToAuthorities(Role.findByAuthority('ROLE_COACH'))
    			 adminUser.enabled = true;
    			 println("adminUser: " + adminUser.toString());
	     		 adminUser = validateAndSave(adminUser)
    		 }
    		 else
    		 {
    			 println "ERROR: can't create admin user"
    		 }
    		 println("done.")
    	 }
    	 else
    	 {
    		 println("default user previously initialized")
    	 }
     	 
    	 //def roleAthlete = new Role(authority:'ROLE_ATHLETE',description:'athlete role desc').save()
    	 
    	 log.trace("BootStrap: exit")
     }
     def destroy = {
     }
     
     def validateAndSave = { thang ->
		
		if (thang.validate()) {
			thang.save(flush:true)
			//println("thang saved: ${thang.id}, " + thang)
		}
		else {
			println "Internal error: invalid domainObject: $thang"
			println thang.errors
		}
		return thang
	}
} 
