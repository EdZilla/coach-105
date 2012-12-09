class WorkoutTests extends GroovyTestCase {

    void testSomething() {

    }
    
    void testParseXmlFile()
    {
    	println("testParseXmlFile: enter")
    	def workout = Workout.parseXmlFile(new File('test/integration/data/workout.xml'))
    	assertNotNull(workout)
    	assertNotNull(workout.exercises)
//    	println ("parsed workout back to html: " + workout.toHtmlMarkup())
    	println ("parsed workout back to xml: " + workout.toXml())

		println("testParseXmlFile: exit")
    }
    
    /*
     * Throws IllegalArgumentException
     */
//    void testParseXmlFileThrowFileNotFoundException()
//    {
//    	try {
//    		def meal = Meal.parseXmlFile(new File('test/integration/data/mealFileThatDoesnotExist.xml'))
//    	}
//    	catch(FileNotFoundException ie)
//    	{
//    		println("successfully threw FileNotFoundException")
//    	}
//    }
//    
//
    
	void testWriteXmlFile()
    {
    	def workout = Workout.parseXmlFile(new File('test/integration/data/workout.xml'))
    	assertNotNull(workout)
    	workout.writeXmlFile("test/integration/data/workoutOutput.xml")
    }
    
 
}
