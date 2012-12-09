



/**
 * User domain class.
 */
class AuthUser {
	static transients = ["pass"]
	static hasMany=[authorities:Role,workouts:Workout, meals:Meal, biometrics:BioMetrics]
	static belongsTo = Role

	/** Username */
	String username
	/** User Real Name*/
	String userRealName
	/** MD5 Password */
	String passwd
	/** enabled */
	boolean enabled

	String email
	boolean emailShow
	
	def timeZoneOffset = -7;

	/** description */
	String description = ''

	/** plain password to create a MD5 password */
	String pass = '[secret]'
	
	

	static constraints = {
		username(blank: false, unique: true)
		userRealName(blank: false)
		passwd(blank: false)
		enabled()
	}

	String toString()
	{
		String strRet = "Athlete: \n";
		strRet = strRet + "name: " + userRealName;
                strRet = strRet + ", username: " + username;
                strRet = strRet + ", email: " + email;
                strRet = strRet + ", passwd: " + passwd;
	}
}