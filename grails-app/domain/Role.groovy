



/**
 * Authority domain class.
 */
class Role {

	static hasMany = [people: AuthUser]

	/** description */
	String description
	/** ROLE String */
	String authority = 'ROLE_'

	static constraints = {
		authority(blank: false)
		description()
	}
}
