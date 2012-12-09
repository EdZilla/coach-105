security {
  active = true
//  active = false

  algorithm="MD5" 
  //use Base64 text ( true or false )
  encodeHashAsBase64=false
  errorPage="null"

  /** login user domain class name and fields */
  loginUserDomainClass="AuthUser"
  userName="username"
  password="passwd"
  enabled="enabled"
  relationalAuthorities = "authorities"
  /* you can specify method for to retrieve the roles. (you need to set relationalAuthorities=null)
  */
  //getAuthoritiesMethod=null //"getMoreAuthorities"

  /**
   * Authority domain class authority field name 
   * authorityFieldInList
   */
  authorityDomainClass="Role"
  authorityField="authority"

  /** use RequestMap from DomainClass */
  useRequestMapDomainClass = false
  /** Requestmap domain class (if useRequestMapDomainClass = true) */
  requestMapClass="Requestmap"
  requestMapPathField="url"
  requestMapConfigAttributeField="configAttribute"

	

 /** 
  * if useRequestMapDomainClass is false, set request map pattern in string
  * see example below
  */
  
  requestMapString = """
	   CONVERT_URL_TO_LOWERCASE_BEFORE_COMPARISON
	   PATTERN_TYPE_APACHE_ANT
	   
	   /user/show**=IS_AUTHENTICATED_REMEMBERED
	   /user/**=ROLE_COACH

	   /role/**=ROLE_COACH
	   /requestmap/**=ROLE_COACH

	   /meal/**=IS_AUTHENTICATED_REMEMBERED
	   /food/**=IS_AUTHENTICATED_REMEMBERED
	   /workout/**=IS_AUTHENTICATED_REMEMBERED
	   /exercise/**=IS_AUTHENTICATED_REMEMBERED
	   
	   /course/delete**=ROLE_COACH
	   /course/edit**=ROLE_COACH
	   /course/**=IS_AUTHENTICATED_ANONYMOUSLY
	   
	   /biometrics/**=ROLE_COACH

	   /equipment/list**=IS_AUTHENTICATED_REMEMBERED
	   /equipment/show**=IS_AUTHENTICATED_REMEMBERED
	   /equipment/**=ROLE_COACH

	   /develissue/delete**=ROLE_COACH

	   /**=IS_AUTHENTICATED_ANONYMOUSLY
	"""
  
  
 /*  requestMapString = """
  CONVERT_URL_TO_LOWERCASE_BEFORE_COMPARISON
  PATTERN_TYPE_APACHE_ANT

  /login/**=IS_AUTHENTICATED_ANONYMOUSLY
  /admin/**=ROLE_USER
  /book/test/**=IS_AUTHENTICATED_FULLY
  /book/**=ROLE_SUPERVISOR
  /**=IS_AUTHENTICATED_ANONYMOUSLY
  """*/

 /**
  * To use email notification for user registration, set the following userMail to
  * true and config your mail settings.Note you also need to implement the script
  * grails generate-registration.
  */
  useMail = false
  mailHost = "smtp.gmail.com"
  mailUsername = "eddythejekyll@summitbid.com"
  mailPassword = "Skeeter1"
  mailProtocol = "smtp"
  mailFrom = "webmaster@summitbid.com"
  
  /** AJAX request header */
  ajaxHeader="X-Requested-With"
  
  /** default user's role for user registration */
  defaultRole="ROLE_ATHLETE"
  //defaultRole="ROLE_COACH"
  
  /** use basicProcessingFilter */
  basicProcessingFilter=false
  /** use switchUserProcessingFilter */
  switchUserProcessingFilter=false
}