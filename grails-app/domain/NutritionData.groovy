class NutritionData {
	Food food;
	String description = "description"
	Integer calories;
	Integer gramsFat;
	Integer gramsProtein;
	Integer servingSize;
	def units = 'oz'
	static belongsTo = Food;
	static optionals = ["description","calories", "gramsFat", "servingSize"]
	static constraints = {
		description(maxLength:50,nullable:true)
		calories(nullable:true)
		gramsFat(nullable:true)
		gramsProtein(nullable:true)
		servingSize(nullable:true)
		units(inList:["grams", "oz"])
	}
	
	String toString(){"NutritionData \n" +
		" desc: ${this.description}, calories: ${this.calories}, gramsFat: ${this.gramsFat}"}
}
