class ExerciseRef {
	Workout workout
	Exercise exercise
	
	static constraints = {
		workout(blank:false)
		exercise(blank:false)
	}
	
	//	 override the toString method
	String toString(){"ExerciseRef \n" +
		" workout: ${this.workout}, \n" +
		" exercise: ${this.exercise}, \n"}
}