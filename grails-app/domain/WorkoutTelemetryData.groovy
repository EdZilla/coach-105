class WorkoutTelemetryData {
	Workout workout;
	String fileName;
	def gpsData;
	def hrmData;
	
	static belongsTo = Workout;
	
	static constraints = {
		fileName(maxLength:128,blank:false);
		workout(blank:false);
	}
	
	String toString(){"WorkoutTelemetry: \n" +
		" filename: ${this.fileName}, \n" +
		" workout: ${this.workout.name}, \n"}
	
}
