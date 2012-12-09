class ClassPeriod {
	String name;
	Date startDate;
	Date endDate;
	Date startTime;
	Integer maxAthletes = 30;
	String location;
	static hasMany = [athletes:AuthUser]
	
	static constraints = {
		name(maxLength:50,blank:false)
		startDate(nullable:true)
		endDate(nullable:true)
		startTime(nullable:true)
	}
	
}