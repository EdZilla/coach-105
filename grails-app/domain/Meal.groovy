import groovy.xml.MarkupBuilder

class Meal {
	AuthUser athlete;
	String  name;
	String  description = "Click here to enter description"
	Date date;
	Float cost;
	String animation;
	
	static belongsTo = AuthUser;
	
	//	 each Meal has many Foods.
	static hasMany = [food:FoodRef]
	
	static constraints = {
		// maximum name length of 50 chars and can't be blank.
		name(maxLength:50,blank:false)
		description(maxLength:512,blank:true)
		cost(nullable:true)
		animation(nullable:true)
	}

	String toString(){"Meal \n" +
		" name: ${this.name}, \n" +
		" date: ${this.date}, \n" +
		" desc: ${this.description}"}
	
	/**
	 * generates an xml representation 
	 */
	String toXml()
	{
		def writer = new StringWriter();
    	def xml = new MarkupBuilder(writer);
    	
    	xml.meal(name: this.name, date: this.date, description: this.description, cost:this.cost ) 
    	{
    		foods() {
    			for (FoodRef f: this.food)
    			{
    				//f.food.toXml()
    				food(name: f.food.name, description: f.food.description, cost:f.food.cost) 
    			}
    		}
    	}

    	return writer.toString();
	}
	
	/**
	 * 
	 */
	String toHTML()
	{
		def writer = new StringWriter()
		def x = new groovy.xml.MarkupBuilder(writer)
		x.html{
			head{
				title("Meal: ${this.name}")
			}
			body{
				h4("Meal: ${this.name}, ${this.date}: ")
				h4("${this.name}: http://174.51.32.44:8080/coach/meal/show/${this.id}")
				table(border:2){
					tr{
						td("name: " )
						td("${this.name}" )
					}
					tr{
						td("description: " )
						td("${this.description}" )
					}
					tr{
						td("Date: " )
						td("${this.date}" )
					}
					if (this.cost)
					{
						tr{
							td("cost: " )
							td("${this.cost}" )
						}
					}
					tr{
						td("Athlete: " )
						td("${this.athlete}" )
					}
					this.food.each {
						def foodRef = it
						tr{
							td("food: " )
							td("${foodRef.food}")
							td("${foodRef.food.nutritionData}")
						}	
					}
				}
			}
		}
		return writer.toString()
	}
	

	
	static Meal parseXmlFile(File file)
	{
    	def mealXml = new XmlSlurper().parse(file)
    	def meal = new Meal()
    	meal.name = mealXml.@name.text()
    	meal.description = mealXml.@description.text()
    	//meal.date = mealXml.@date.text()
    	//meal.cost = mealXml.@cost.text()
    	
    	mealXml.foods.food.each 	{
    		def food    = new Food(name: it.@name.text(), description:it.@description.text(),cost:it.@cost.text())
    		def foodRef = new FoodRef(food:food, meal:meal)
    		meal.addToFood(foodRef)
    	}
    	return meal;
	}
	
	File writeXmlFile(String fileName)
	{
    	File file = new File(fileName)
    	this.parseXmlFile(file)
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
				title 'Constructed by MarkupBuilder'
			}
			body 
			{
				h1 'What can I do with MarkupBuilder?'
						form (action:'whatever') 
						{
							for (line in [this.name,this.description,this.reps,this.distance])
							{
								input(type:'checkbox',checked:'checked', id:line, '')
								label(for:line, line)
								br('')
							} 
						} 
			} 
		}
		return writer.toString();
	}
	
}
