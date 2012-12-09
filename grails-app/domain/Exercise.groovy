import groovy.xml.MarkupBuilder

/**
 * Exercise is a class that is intended to be subclassed
 * with specific exercises.
 */
class Exercise {
	String name;
	String description = "Click here to enter description"
	//boolean completed;
	// Video example
	String animation;
	
	static hasMany = [equipment:EquipmentRef]
	
	// Exercise needs to be subclassed 
	// between Kinetic and Static (or something like that)
	Float avgSpeed;
	Float maxSpeed;
	Integer avgHeartRate;
	Integer maxHeartRate;
	Integer reps;
	Integer sets;
	Integer seconds;
	Integer calories;
	Boolean completed;
	Float distance;
	
	static optionals = ['equipment', 'avgSpeed','maxSpeed']
	
	static constraints = {
		// maximum name length of 50 chars and can't be blank.
		name(maxLength:50,blank:false)
		description(maxLength:512,blank:false)
		avgSpeed(nullable:true)
		maxSpeed(nullable:true)
		avgHeartRate(nullable:true)
		maxHeartRate(nullable:true)
		calories(nullable:true)
		completed(nullable:true)
		distance(nullable:true,min:0.1f,max:200.00f)
		reps(nullable:true)
		sets(nullable:true)
		seconds(nullable:true)
		equipment(nullable:true)
		animation(nullable:true)
	}
	
	
	String toString(){"Exercise \n" +
		" name: ${this.name}, \n" +
		" desc: ${this.description}\n"}
	
	String toXml()
	{
		def writer = new StringWriter();
    	def xml = new MarkupBuilder(writer);

    	// TODO: how do you print out composite objects using the xml builder syntax?
    	xml.exercise(name:this.name, description:this.description, 
    				   calories:this.calories,
    			       avgSpeed:this.avgSpeed, maxSpeed:this.maxSpeed, 
    			       avgHeartRate:this.avgHeartRate,maxHeartRate:this.maxHeartRate,
    			       distance:this.distance,reps:this.reps,sets:this.sets, seconds:this.seconds,animation:this.animation ) 

    	return writer.toString();
	}
	
	String prettyPrint()
	{
		def writer = new StringWriter()
		def html   = new groovy.xml.MarkupBuilder(writer)
		html.html 
		{
			head 
			{
				title 'Exercise Form'
			}
			body 
			{
				h1 "${this.name}"
						form (action:'whatever') 
						{
							for (line in ["name: ${name}"
							              ,"description: ${description}"
							              ,"reps: ${reps}"
							              ,"sets: ${sets}"
							              ,"calories: ${calories}"
							              ,"average Heart Rate: ${avgHeartRate}"
							              ,"max Heart Rate: ${maxHeartRate}"
							              ,"average Speed: ${avgSpeed}"
							              ,"max Speed: ${maxSpeed}"
							              ,"duration in seconds: ${seconds}"
							              ,"distance: ${distance}"])
							{
								//input(type:'checkbox', id:line, '')
								label(for:line, line)
								br('')
							} 
						} 
			} 
		}
		return writer.toString();
	}
}