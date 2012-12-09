class FoodRef {
	Meal meal;
	Food food;
	
	static constraints = {
		meal(blank:false)
		food(blank:false)
	}
	
	//	 override the toString method
	String toString(){"FoodRef \n" +
		" meal: ${this.meal} \n," +
		" food: ${this.food}, "}
}
