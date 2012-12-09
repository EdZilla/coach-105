class Equipment {
	String name
	String description = "Click here to enter description"
	Float cost = 0;
	Date datePurchased
	String photo;
	
	static constraints = {
		// maximum name length of 50 chars and can't be blank.
		name(maxLength:50,blank:false)
		description(maxLength:512,blank:false)
		cost(blank:true)
		photo(nullable:true)
	}
	
	String toString(){"Equipment \n" +
			" name: ${this.name}, \n" +
			" desc: ${this.description}, \n"}
}
