import groovy.xml.MarkupBuilder

class Workout {
	AuthUser athlete;
	String name;
	String description = "Click here to enter description"
	Date startDateTime;
	/**
	 * duration in minutes.
	 */
	Integer duration;
	Date endDateTime;
	String location;
	String animation;
	Integer maxHeartRate;
	Float distance;
	Integer avgHeartRate;
        Integer calories;
	Course course;
	def gpsHrmData;
	static hasMany = [exercises:ExerciseRef]
	
	
	// These should be optional, but the form requires them for some reason.
	static optionals = ["maxHeartRate", "distance", "avgHeartRate"]
	static belongsTo = AuthUser;

	static constraints = {
		//		 maximum name length of 50 chars and can't be blank.
		name(maxLength:50)
		
		description(maxLength:512,blank:true)
		duration(nullable:true);
			
		// must start and end in the past. (cannot define a workout not yet completed)
		// This may have to be revisited if we decide on creating a workout plan 
		// to be executed in the future.
		// custom validators are defined as closures.
		//startDateTime(validator: {return (it < new Date())})
		location(maxLength:50,blank:false)
		// Not sure why this fails...
		//endDateTime(validator: {return ((it < new Date()) && (it > startDateTime))})
		endDateTime(nullable:true);
		avgHeartRate(nullable:true);
		maxHeartRate(nullable:true);
		distance(nullable:true);
                calories(nullable:true);
		course(nullable:true);
		gpsHrmData(blank:true);
		animation(nullable:true)
	}
	

   		
	String toString(){"Workout \n" +
		" name: ${this.name}, \n" +
		" date: ${this.startDateTime}, \n" +
		" desc: ${this.description}, \n"}
	

	
	static Workout parseXmlFile(File file)
	{
    	def workoutXml = new XmlSlurper().parse(file)
    	def workout  = new Workout()
    	workout.name = workoutXml.@name.text()
    	workout.description = workoutXml.@description.text()
    	
    	workoutXml.exercises.exercise.each 	{
    		def exercise    = new Exercise(name: it.@name.text(), description:it.@description.text())
    		def exerciseRef = new ExerciseRef(exercise:exercise, workout:workout)
    		workout.addToExercises(exerciseRef)
    	}
    	return workout;
	}
	
	File writeXmlFile(String fileName)
	{
    	File file = new File(fileName)
    	file.write(this.toXml())
		return file;
	}
	
	String prettyPrint()
	{
		def writer = new StringWriter()
		def html = new groovy.xml.MarkupBuilder(writer)
		html.html 
		{
			head 
			{
				title 'Constructed with Groovy MarkupBuilder'
			}
			body 
			{
				h1 "${name}"
						form (action:'whatever') 
						{
							for (line in ["name: ${name}","description: ${description}"
							              ,"location: ${location}"
							              ,"start date/time: ${startDateTime}"
							              ,"end date/time: ${endDateTime}"
							              ,"distance: ${distance}"])
							{
								//input(type:'checkbox', id:line, '')
								label(for:line, line)
								br('')
							} 
							
							for (line in exercises.each{ it.exercise })
						    {
								input(type:'checkbox', id:line, '')
								label(line.exercise)
								br('')
							} 
						} 
			} 
		}
		return writer.toString();
	}

	/**
	 * generates an xml representation 
	 */
	String toXml()
	{
		def writer = new StringWriter();
    	def xml = new groovy.xml.MarkupBuilder(writer);
    	
    	xml.workout(name: this.name, description: this.description, date: this.startDateTime, duration: this.duration, calories: this.calories, course:this.course?.name)
    	{
    		exercises(){
    			for (ExerciseRef e: this.exercises)
    			{
    				exercise( name:e.exercise.name
    						,description:e.exercise.description
    						,avgSpeed:e.exercise.avgSpeed,maxSpeed:e.exercise.maxSpeed
    						,avgHeartRate:e.exercise.avgHeartRate,maxHeartRate:e.exercise.maxHeartRate
    						,reps:e.exercise.reps,sets:e.exercise.sets,seconds:e.exercise.seconds,calories:e.exercise.calories)
    			}
    		}
    	}

    	return writer.toString();
	}
	
	/**
	 * htmlify the object
	 */
	String toHTML()
	{
		def writer = new StringWriter()
		def x = new groovy.xml.MarkupBuilder(writer)
		x.html{
			head{
				title("Workout: this.name")
			}
			body{
				h2("Workout: ${this.name}, ${this.startDateTime}")
				h3("${this.name}: http://174.51.32.44:8080/coach/workout/show/${this.id}")
				table(border:2){
					tr{
						td("name: " )
						td("${this.name}" )
					}
					tr{
						td("description: " )
						td("${this.description}" )
					}
					this.exercises.each {
						def exerciseRef = it
						tr {
							td("exercise: ")
							td("${exerciseRef.exercise}")
						}
					}
			    }
		}
		
	  }
	  return writer.toString()
    }
	
	 

	
}
