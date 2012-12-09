/**
 * Notify the user regularly
 */
class NotifyUserJob {
	def notifyUserService
	def mailService
	/** fire at 10:AM, 3:PM, and 9:PM every day */
	def cronExpression = "0 0 10,16,21 * * ?"
	def emailPrefix = "[summitbid-coach]"
	
	/*
	 * Delay the startup by 10 seconds
	 */
	def startDelay = 10000
	/*
	 * execute every x seconds
	 */
    //def timeout = 80000l
    
    def execute() {
        log.trace "NotifyUserJob: execute. Date: ${new Date()}"
        def now = new Date()
    	def mealList = Meal.findAllByDateBetween(now-2,now).reverse()
    	def workoutList = Workout.findAllByStartDateTimeBetween(now-5,now).reverse()
    	println ("workoutList: " + workoutList)
    	if(mealList || workoutList)
    	{
    		def recentMeals = ""
    		def recentWorkouts = ""
    		//mealList.each { recentMeals += it.toHtmlMarkup() }
    		//workoutList.each { recentWorkouts += it.toHtmlMarkup() }
    		
    		mealList.each { recentMeals += it.toHTML() }
    		workoutList.each { recentWorkouts += it.toHTML() }    		

    		//println "recentMeals    html:\n ${recentMeals}"
    		println "recentWorkouts html:\n ${recentWorkouts}"
    		
    		mailService.sendMail {
    			to "ejy@summitbid.com"
    			title "${emailPrefix}recent meals & workouts"
    			from "coachNoReply@summitbid.com"
    			body view:"/meal/dailyReport",
    				model:[recentMeals:recentMeals,recentWorkouts:recentWorkouts,now:now]
    		}
    	}
    }
}
