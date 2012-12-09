class MealControllerTests extends GroovyTestCase {
	void testRenderHomePage() {
		def controller = new MealController()
		controller.index()
		println("content: " + controller.response.contentAsString)
		//assertTrue(controller.response.contentAsString.contains("Meal List"))
	}
}