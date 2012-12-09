import groovy.xml.MarkupBuilder

class Food {
	String name;
	String description = "Click here to enter description";
	Float cost;
	String animation;
	NutritionData nutritionData;
	
	static constraints = {
		// maximum name length of 50 chars and can't be blank.
		name(maxLength:50,blank:false)
		description(maxLength:255,blank:true)
		cost(nullable:true)
		animation(nullable:true)
	}		
	
//	 override the toString method
	String toString(){"Food \n" +
		" name: ${this.name}, \n" +
		" desc: ${this.description}"}
	
	String toXml()
	{
		def writer = new StringWriter();
    	def xml = new MarkupBuilder(writer);

    	xml.food(name:this.name, description:this.description, cost:this.cost ) 

    	return writer.toString();
	}
}
