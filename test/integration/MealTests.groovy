import groovy.xml.MarkupBuilder
import groovy.xml.StreamingMarkupBuilder

class MealTests extends GroovyTestCase {

    void testToHTML() {
        println("test toHTML: enter")
//        def meals = Meal.findAll();
//        def meal = meals[31];
//        println("meal: " + meal.toHTML());
        println("test toHTML: exit")
    }

       void testFindPreviousMeal()
    {
        println("test FindPreviousMeal: enter")
//        def meals = Meal.findAll();
//        assertNotNull(meals)
//        println("number of  meals: " + meals.size())
//        println("meal name: " + meals[31].name)
//        println("previous meal name: " + meals[30].name)
//        def targetMeal = Meal.findByName(meals[31].name)
//        println("target: " + targetMeal)
//        def idx = meals.findIndexOf { it.id == targetMeal.id }
//        println("meal index: " + idx )
//        targetMeal = meals[idx-1]
//        println("target: " + targetMeal)
        println("test FindPreviousMeal: exit")
    }
    
    void testParseXmlFile()
    {
    	println("testReadxml: enter")
    	def mealXml = new XmlSlurper().parse(new File('test/integration/data/meal.xml'))
    	assertNotNull(mealXml)
    	assert 'meal' == mealXml.name()
    	//assert 'Dinner at Beu Jo&apos;s' == mealXml.@name.text()
    	assert '2008-02-10 18:27:00.0' == mealXml.@date.text()
    	assert 'Had a Pacific Plantation pizza and a diet coke. Ate half and took rest home.' == mealXml.@description.text()
    	assert 'foods' == mealXml.foods.name()    	
    	assert 'food' == mealXml.foods.food[0].name()    	
    	assert 'Pepperoni Pizza Slice' == mealXml.foods.food[0].@name.text() 	
    	assert 'Cheese Pizza Slice' == mealXml.foods.food[1].@name.text() 	
    	assert 'description of Pepparoni Pizza' == mealXml.foods.food[0].@description.text() 	
    	assert 'description of Cheese Pizza' == mealXml.foods.food[1].@description.text() 	

    	//assert '2.98' == mealXml.foods.food[1].@cost.text() 	
    	//assert '2.68' == mealXml.foods.food[2].@cost.text() 	
    	
    	def meal = Meal.parseXmlFile(new File('test/integration/data/meal.xml'))
    	assertNotNull(meal)
    	println ("parsed meal back to xml: " + meal.toXml())
		println("testReadxml: exit")
    }
    
    /*
     * Throws IllegalArgumentException
     */
    void testParseXmlFileThrowFileNotFoundException()
    {
    	try {
    		def meal = Meal.parseXmlFile(new File('test/integration/data/mealFileThatDoesnotExist.xml'))
    	}
    	catch(FileNotFoundException ie)
    	{
    		println("successfully threw FileNotFoundException")
    	}
    }
    

    void testWriteXmlFile()
    {
    	def meal = Meal.parseXmlFile(new File('test/integration/data/meal.xml'))
    	meal.writeXmlFile("test/integration/data/mealOutput.xml")
    }

 
    
    void testPrintMeals()
    {
    	def meal = new Meal();
    	meal.name = "dinner"
    	meal.date = new Date();
    	println("meal: " + meal);
    	def foodRef = new FoodRef()
    	foodRef.food = new Food()
    	foodRef.meal = meal
    	foodRef.food.name = "pizza";
    	foodRef.food.description = "with pepparoni"
    	println ("XML: " + foodRef.food.toXml());
    	meal.food = [foodRef];
    	println("meal: " + meal);
    	println("meal food: " + meal.food);
    	
    	// add another food ref 
    	def foodRef2 = new FoodRef()
    	foodRef2.food = new Food()
    	foodRef2.meal = meal
    	foodRef2.food.name = "burger";
    	
    	meal.food = [foodRef, foodRef2];
    	
    	println("meal food: " + meal.food);
    	
    	println("XML: " + meal.toXml())
    }
    
    void testBuildMealXml()
    {
    	def writer = new StringWriter();
    	def xml = new MarkupBuilder(writer);
    	def today = new Date();
    	xml.meals() {
    		meal(id: '1', description: 'breakfast', date: today) {
    			food(id:'1', name:'cereal', description:'with milk')
    		}
    		meal(id: '2', description: 'lunch', date: today) {
    			food(id:'2', name:'pizza', description:'pepparoni')
    		}
    		meal(id: '3', description: 'dinner', date: today) {
    			food(id:'5', name:'burger', description:'vegan')
    			food(id:'3', name:'soda', description:'coke')
    			food(id:'4', name:'beer', description:'ale')
    		}
    	}
    	println writer.toString();
    }
    
    
    /**
     * From the example at 
     * http://docs.codehaus.org/display/GROOVY/Using+MarkupBuilder+for+Agile+XML+creation
     */
     void testBuildXmlExample1()
    {
    	def writer = new StringWriter();
    	def xml = new MarkupBuilder(writer);
    	
    	xml.truck(id:'ABC123') {
    	    box(country:'Australia') {
    	        box(country:'Australia', state:'QLD') {
    	            book(title:'Groovy in Action', author:'Dierk K�nig et al')
    	            book(title:'Groovy in Action', author:'Dierk K�nig et al')
    	            book(title:'Groovy for VBA Macro writers')
    	        }
    	        box(country:'Australia', state:'NSW') {
    	            box(country:'Australia', state:'NSW', city:'Sydney') {
    	                book(title:'Groovy in Action', author:'Dierk K�nig et al')
    	                book(title:'Groovy for COBOL Programmers')
    	            }
    	            box(country:'Australia', state:'NSW', suburb:'Albury') {
    	                book(title:'Groovy in Action', author:'Dierk K�nig et al')
    	                book(title:'Groovy for Fortran Programmers')
    	            }
    	        }
    	    }
    	    box(country:'USA') {
    	        box(country:'USA', state:'CA') {
    	            book(title:'Groovy in Action', author:'Dierk K�nig et al')
    	            book(title:'Groovy for Ruby programmers')
    	        }
    	    }
    	    box(country:'Germany') {
    	        box(country:'Germany', city:'Berlin') {
    	            book(title:'Groovy in Action', author:'Dierk K�nig et al')
    	            book(title:'Groovy for PHP Programmers')
    	        }
    	    }
    	    box(country:'UK') {
    	        box(country:'UK', city:'London') {
    	            book(title:'Groovy in Action', author:'Dierk K�nig et al')
    	            book(title:'Groovy for Haskel Programmers')
    	        }
    	    }
    	}

    	println writer.toString()
    	
    }
    
    /**
     * From the example at 
     * http://docs.codehaus.org/display/GROOVY/Using+MarkupBuilder+for+Agile+XML+creation
     */
     /*
    void testBuildXmlExample2()
    {
//    	 standard book
    	 def standardBook1(builder) { builder.book(title:'Groovy in Action', author:'Dierk K�nig et al') }
//    	  other standard books
    	 def standardBook2(builder, audience) { builder.book(title:"Groovy for ${audience}") }
    	 def writer = new StringWriter()
    	 def xml = new MarkupBuilder(writer)
    	 xml.truck(id:'ABC123') {
    	     box(country:'Australia') {
    	         box(country:'Australia', state:'QLD') {
    	             standardBook1(xml)
    	             standardBook1(xml)
    	             standardBook2(xml, 'VBA Macro writers')
    	         }
    	         box(country:'Australia', state:'NSW') {
    	             box(country:'Australia', state:'NSW', city:'Sydney') {
    	                 standardBook1(xml)
    	                 standardBook2(xml, 'COBOL Programmers')
    	             }
    	             box(country:'Australia', state:'NSW', suburb:'Albury') {
    	                 standardBook1(xml)
    	                 standardBook2(xml, 'Fortran Programmers')
    	             }
    	         }
    	     }
    	     box(country:'USA') {
    	         box(country:'USA', state:'CA') {
    	             standardBook1(xml)
    	             standardBook2(xml, 'Ruby Programmers')
    	         }
    	     }
    	     box(country:'Germany') {
    	         box(country:'Germany', city:'Berlin') {
    	             standardBook1(xml)
    	             standardBook2(xml, 'PHP Programmers')
    	         }
    	     }
    	     box(country:'UK') {
    	         box(country:'UK', city:'London') {
    	             standardBook1(xml)
    	             standardBook2(xml, 'Haskel Programmers')
    	         }
    	     }
    	 }

    	 println writer.toString()
    }
    	*/
    	
    /**
     * From the example at 
     * http://docs.codehaus.org/display/GROOVY/Using+MarkupBuilder+for+Agile+XML+creation
     */
     /*
    void testBuildXmlExample3()
    {
//    	 define standard book and version allowing multiple copies
    	 def standardBook1(builder) { builder.book(title:'Groovy in Action', author:'Dierk K�nig et al') }
    	 def standardBook1(builder, copies) { (0..<copies).each{ standardBook1(builder) } }
//    	  another standard book
    	 def standardBook2(builder, audience) { builder.book(title:"Groovy for ${audience}") }
//    	  define standard box
    	 def standardBox1(builder, args) {
    	     def other = args.findAll{it.key != 'audience'}
    	     builder.box(other) { standardBook1(builder); standardBook2(builder, args['audience']) }
    	 }
//    	  define standard country box
    	 def standardBox2(builder, args) {
    	     builder.box(country:args['country']) {
    	         if (args.containsKey('language')) {
    	             args.put('audience', args['language'] + ' programmers')
    	             args.remove('language')
    	         }
    	         standardBox1(builder, args)
    	 }   }


    	 def writer = new StringWriter()
    	 def xml = new MarkupBuilder(writer)
    	 xml.truck(id:'ABC123') {
    	     box(country:'Australia') {
    	         box(country:'Australia', state:'QLD') {
    	             standardBook1(xml, 2)
    	             standardBook2(xml, 'VBA Macro writers')
    	         }
    	         box(country:'Australia', state:'NSW') {
    	             [Sydney:'COBOL', Albury:'Fortran'].each{ city, language ->
    	                 standardBox1(xml, [country:'Australia', state:'NSW',
    	                            city:"${city}", audience:"${language} Programmers"])
    	     }   }   }
    	     standardBox2(xml, [country:'USA', state:'CA', language:'Ruby'])
    	     standardBox2(xml, [country:'Germany', city:'Berlin', language:'PHP'])
    	     standardBox2(xml, [country:'UK', city:'London', language:'Haskel'])
    	 }

    	 println writer.toString()
    }
    	*/
    	
    /**
     * From the example at 
     * http://docs.codehaus.org/display/GROOVY/Using+MarkupBuilder+for+Agile+XML+creation
     */
     /*
    void testBuildXmlExample4()
    {
    	 def writer = new StringWriter()
    	 def xml = new MarkupBuilder(writer)
    	 def standard = new StandardBookDefinitions(xml)
    	 xml.truck(id:'ABC123') {
    	     box(country:'Australia') {
    	         box(country:'Australia', state:'QLD') {
    	             standard.book1(2)
    	             standard.book2('VBA Macro writers')
    	         }
    	         box(country:'Australia', state:'NSW') {
    	             [Sydney:'COBOL', Albury:'Fortran'].each{ city, language ->
    	                 standard.box1(country:'Australia', state:'NSW',
    	                     city:"${city}", audience:"${language} Programmers")
    	     }   }   }
    	     standard.box2(country:'USA', state:'CA', language:'Ruby')
    	     standard.box2(country:'Germany', city:'Berlin', language:'PHP')
    	     standard.box2(country:'UK', city:'London', language:'Haskel')
    	 }

    	 println writer.toString()
    }
    	*/
    	
    /**
     * From the example at 
     * http://docs.codehaus.org/display/GROOVY/Using+MarkupBuilder+for+Agile+XML+creation
     */
    void testBuildXmlExample5()
    {
    	 
    }    	 

}
