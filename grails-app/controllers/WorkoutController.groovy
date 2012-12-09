            
class WorkoutController {
    def authenticateService
    def mailService
    def ONE_HOUR = 3600000;
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
    	log.trace("Executing action $actionName with params $params")		
        log.trace("Executing action $actionName with session $session")
    		 
        if(!params.max) params.max = 10
        //[ workoutList: Workout.list( params ) ]
        [ workoutList: Workout.findAllByAthlete(AuthUser.findByUsername(authenticateService.userDomain().username), params ).reverse() ]
    }
    
    def listXml = {
        [ workoutList : Workout.findAllByAthlete(AuthUser.findByUsername(authenticateService.userDomain().username),params ) ]
    }

    def show = {
        def workout = Workout.get( params.id )
        session.workout = workout;
        if(!workout) {
            flash.message = "Workout not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ workout : workout ] }
    }

    /**
     * Get the prev Workout by id
     */
    def prevWorkout = {
        log.trace("Executing action $actionName with params  : $params")

        def workout = Workout.get( params.id )

        def workouts = Workout.findAll();

        if(!workout)
        {
            flash.message = "Workout not found with id ${params.id}"
            redirect(action:list)
        }
        else
        {
            def workoutIdx = workouts.findIndexOf { it.id == workout.id }

            log.debug("Workout index: ${workoutIdx -1}")
            redirect(action:show, id:workouts[workoutIdx-1].id)
        }
    }
    
    def nextWorkout = {
    	log.trace("Executing action $actionName with params $params")		
        def workout = Workout.get( params.id )
        session.workout = workout;
        def nextWorkout = Workout.findByIdGreaterThan(workout.id)
        
        if(!nextWorkout) {
            flash.message = "No next Workout"
            redirect(action:list)
        }
        else 
        { 
            redirect(action:show, id:nextWorkout.id)
        }
    }
    
    /**
     * Export workout data as xml or other report format.
     */
    def export = {
        log.trace("Executing action $actionName with params $params")
    		
        def workoutList;
        workoutList = Workout.findAll();
        log.trace("workouts: " + workoutList);
    		
        if(!params.max) params.max = 10
        [ workoutList: Workout.list( params ) ]
    }

    def search = {
        log.trace("Executing action $actionName with params $params")
        //    		log.trace("Executing action $actionName with session $session")
        def criteria = Workout.createCriteria();
        def workouts;
        // look for all workouts that meet the criteria
        //if(params.searchFieldCriteria && !params.searchFieldCriteria?.indexOf) {
        if(params.searchFieldCriteria)
        {
            workouts = criteria.list {
                or {
                    like('name',"%${params.searchFieldCriteria}%")
                    like('description',"%${params.searchFieldCriteria}%")
                    like('location',"%${params.searchFieldCriteria}%")
                }
            }
        }
    		
        render(view:'list', model:[workoutList:workouts] )
        log.trace("workoutList: " + workouts)
        log.trace("search exit");
    }
    
    // this may work for me, but seems like a kluge...  
    // It deletes the workout and the exercise refs, 
    // but the controller debug indicates that 
    // none were deleted. Examination of the db shows
    // they were in fact deleted. 
    def beforeDelete = { workout ->
        workout.athlete.removeFromWorkouts(workout)
    }
   	
    def delete = {
        log.trace("Executing action $actionName with params $params")
        log.trace("Executing action $actionName with session $session")
    	
        def workout = Workout.get( params.id )
        beforeDelete(workout)
        if(workout) 
        {
            log.trace("workout is not null, so we can delete")

            if (workout.exercises)
            {
            	log.trace("workout has exercise refs. must delete them first.")
            	workout.exercises.each  {
                    if(it.delete())
                    {
                        log.trace("deleted exercise ref: " + it.id)
                    }
                    else
                    {
                        log.trace("ERROR: could not delete exercise ref: " + it.id)
                    }
            	}
            }

            if (workout.delete())
            {
            	log.trace("deleted workout")
            	flash.message = "Workout ${params.id} deleted"
            }
            else
            {
            	log.trace("ERROR: Workout " + params.id + " not deleted.wtf?")
            	flash.message = "ERROR: Workout ${params.id} NOT deleted"
            }
            redirect(action:list)
        }
        else {
            flash.message = "Workout not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def workout = Workout.get( params.id )

        if(!workout) {
            flash.message = "Workout not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ workout : workout ]
        }
    }

    def update = {
        def workout = Workout.get( params.id )
        if(workout) {
            workout.properties = params
            if(!workout.hasErrors() && workout.save()) {
                flash.message = "Workout ${params.id} updated"
                redirect(action:show,id:workout.id)
            }
            else {
                render(view:'edit',model:[workout:workout])
            }
        }
        else {
            flash.message = "Workout not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }
    
    //  for calling the editInPlace tag in CoachTaglib.groovy
    // adapted from Bookmarks app, and updated from DGG errata.
    def updateDescription = {
        log.trace("Executing action $actionName with params $params")
        log.debug("Executing action $actionName with params $params")
        def workout = Workout.get( params.id )
        log.debug("Called Workout.get...")
        if(workout)
        {
            log.debug("have a workout. Will get properties and save.")
            workout.properties = params
            if(workout.save())
            {
                log.debug("saving workout")
                render( Workout.get(params.id)?.description )
            }
            else
            {
                log.debug("ERROR: saving workout failed.")
            }
        }
    	else
    	{
            render( "Error saving workout" )
        }
    }

    def create = {
        log.trace("Executing action $actionName with params $params")
        def workout = new Workout()
        //workout.startDateTime.getTime();
        //workout.endDateTime.getTime();
        log.trace("startDateTime = ${workout.startDateTime}, endDateTime = ${workout.endDateTime}")
        workout.properties = params
        return ['workout':workout]
    }

    // if the endDateTime is equal to startDateTime, 
    // then when saving, set the end date 60 minutes later than the start date by default.
    def save = {
    	log.trace("Executing action $actionName with params $params")
        def workout = new Workout(params)

        log.trace("username is: " + authenticateService.userDomain().username)
        workout.athlete = AuthUser.findByUsername(authenticateService.userDomain().username)
        log.debug("workout: " + workout)
	// initialize the dates;
        workout.endDateTime = workout.startDateTime;			
        if (workout.duration != null)
        {
            workout.endDateTime.setTime(workout.startDateTime.getTime() + (workout.duration * 60000))
            log.trace("duration is NOT null: $workout.duration, $workout.endDateTime")
        }
        else
        {
            workout.endDateTime.setTime(workout.startDateTime.getTime() + ONE_HOUR)
            log.trace("duration is null: $workout.endDateTime")
        }
        
        if(!workout.hasErrors() && workout.save()) {
            flash.message = "Workout ${workout.id} created"
            // set the last workout for display
            //(AuthUser.findByUsername(session.SPRING_SECURITY_LAST_USERNAME)).lastUpdatedWorkout = workout;
            
            log.trace("startDateTime = ${workout.startDateTime}, endDateTime = ${workout.endDateTime}")
            
            redirect(action:show,id:workout.id)
        }
        else {
            log.trace("exiting save: startDateTime = ${workout.startDateTime}, endDateTime = ${workout.endDateTime}")            	        	
            render(view:'create',model:[workout:workout])
        }
    }
    
    /**
     * Not yet working. updated workout will not persist
     */
    def addExerciseTo = {
        log.trace("Executing action $actionName with params $params")
        log.trace("session: $session")
        log.trace("flash: $flash")
        def exerciseRef;
        def workout = session.workout;
        def exercise = flash.exercise;
			
        if (workout)
        {
            exerciseRef = new ExerciseRef(workout:workout,exercise:exercise);
            log.debug("new exerciseRef: " + exerciseRef)
            log.debug("adding new exercise to workout");
            workout.addToExercises(exerciseRef)
            log.debug("added new exercise to workout");
			
            // TODO: force errors somehow
            log.debug("about to save workout ${workout.id}...");
            if (!workout.hasErrors() && workout.save())
            {
                log.trace("workout: " + workout);
                flash.message = "Added exercise ${exerciseRef.exercise.name} to workout ${workout.name}"
                redirect(action:show, id:workout.id)
            }
            else
            {
                //flash.message = "ERROR: could not add request to AteRequestSequence ${Workout.name}, with id: ${Workout.id}: ERROR: ${Workout.errors.each { it }}"
                flash.message = "ERROR: could not add exercise to workout ${workout.name}, with id: ${workout.id}"
                log.trace("errors: " + workout.errors.each {it} )
                redirect(action:show, id:workout.id)
            }
        }
        else
        {
            flash.message = "ERROR: no current workout"
            redirect(action:list)
        }
    }
    
    def toXml = {
        log.trace("Executing action $actionName with params $params")
        def workout = Workout.get( params.id )
        if(!workout)
        {
            flash.message = "Workout not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            flash.workout = workout
            render "${workout.toXml()?.encodeAsXML()}"
        }
    }
    
    def prettyPrint = {
        log.trace("Executing action $actionName with params $params")
        log.trace("Executing action $actionName with flash $flash")
        def workout = Workout.get( params.id )
    }
    
    /**
     * email an htmlified workout
     */
    def email = {
        def workout = session.workout
        if (workout)
        {
            mailService.sendMail {
                to "ejy@summitbid.com"
                from "ejy@summitbid.com"
                subject "Workout Email..."
                html "${workout.toHTML()}"
            }
        }
        redirect(action:show,id:workout.id)
    }
    
    /**
     * email an htmlified list of recent workouts
     */
    def emailRecent = {
        log.trace("Executing action $actionName with params $params")
        def emailPrefix = "[summitbid-coach]"
        def now = new Date()
        now.hours = now.hours - 7
        //def workoutList = Workout.findAllByStartDateTimeBetween(now-5,now).reverse()
        //def workoutList = Workout.findAllByStartDateTime(now)
        def athlete = AuthUser.findByusername("ed")
        //def workoutList = Workout.findAllByAthlete(athlete)
        //workoutList = Workout.findAllByLocation("Denver")
        def workoutList = Workout.findAllBystartDateTimeBetween(now-7,now).reverse()
        println ("reverse workoutList: " + workoutList)

        if (workoutList)
        {
            def recentWorkouts = ""
            workoutList.each { recentWorkouts += it.toHTML() }

            println "recentWorkouts html:\n ${recentWorkouts}"

            mailService.sendMail {
                to "ejy@summitbid.com"
                title "${emailPrefix}recent workouts"
                from "coachNoReply@summitbid.com"
                body view:"/workout/reportRecent",
                model:[recentWorkouts:recentWorkouts,now:now]
            }
        }
        redirect(action:list)
    }
}