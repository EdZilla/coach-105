            
class ExerciseController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        if(!params.max) params.max = 10
        [ exerciseList: Exercise.list( params ) ]
    }

    def listXml = {
    		[ exerciseList: Exercise.list( ) ]
    }
    
    def show = {
        def exercise = Exercise.get( params.id )
        // store this for the next redirect
        flash.exercise = exercise;
        if(!exercise) {
            flash.message = "Exercise not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ exercise : exercise ] }
    }
    
    def search = {
    		log.trace("Executing action $actionName with params $params")
//    		log.trace("Executing action $actionName with session $session")
    		def criteria = Exercise.createCriteria();
    		def exercises;
    		// look for all exercises that meet the criteria
    		//if(params.searchFieldCriteria && !params.searchFieldCriteria?.indexOf) {
    			if(params.searchFieldCriteria)
    			{
    				exercises = criteria.list {
    				or {
    					like('name',"%${params.searchFieldCriteria}%")
    					like('description',"%${params.searchFieldCriteria}%")
    				}
    			}
    		}
    		
    		render(view:'list', model:[exerciseList:exercises] )
    		log.trace("exerciseList: " + exercises)
    		log.trace("search exit");
    }
    		
    /**
     * Derived from the example in the grails richui web page.
     */		
    def searchAJAX = { def exercises = Exercise.findAllByNameLike("%${params.query}%")
    		log.trace("Executing action $actionName with params $params")
    		//    		Create XML response 
    		render(contentType: "text/xml") {
    			results() {
    				exercises.each { exercise -> 
    					result(){ 
    						name(exercise.name) 
    						//Optional id which will be available in onItemSelect 
    						id(exercise.id) 
    					} 
    				} 
   				} 
    		}
    }

    // when an exercise gets deleted, all refs to it get deleted too.    		
    def delete = {
        def exercise = Exercise.get( params.id )
        if(exercise) {

        	// delete all the exercise refs
        	def refs = ExerciseRef.findAllByExercise(exercise);
        	for (ExerciseRef ref: refs)
        	{
        		log.trace("deleting ex ref pointing to exercise id: " + params.id + ". deleting ref " + ref);
        		ref.delete();
        	}

        	//        	 now delete all the equipment refs
        	refs = EquipmentRef.findAllByExercise(exercise);
        	for (EquipmentRef ref: refs)
        	{
        		log.trace("deleting equipment ref pointing to exercise id: " + params.id + ". deleting ref " + ref);
        		ref.delete();
        	}
           exercise.delete()
           flash.message = "Exercise ${params.id} deleted"
           redirect(action:list)
        }
        else {
            flash.message = "Exercise not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def exercise = Exercise.get( params.id )
        flash.exercise = exercise;
        if(!exercise) {
            flash.message = "Exercise not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ exercise : exercise ]
        }
    }

    def update = {
        def exercise = Exercise.get( params.id )
        if(exercise) {
            exercise.properties = params
            if(!exercise.hasErrors() && exercise.save()) {
                flash.message = "Exercise ${params.id} updated"
                redirect(action:show,id:exercise.id)
            }
            else {
                render(view:'edit',model:[exercise:exercise])
            }
        }
        else {
            flash.message = "Exercise not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }
    
//  for calling the editInPlace tag in CoachTaglib.groovy
	// adapted from Bookmarks app, and updated from DGG errata.
	def updateDescription = {
		log.trace("Executing action $actionName with params $params")
	    log.debug("Executing action $actionName with params $params")    				
		def exercise = Exercise.get( params.id )
		log.debug("Called Exercise.get...")    				
		if(exercise) 
		{
			log.debug("have a workout. Will get properties and save.")
			exercise.properties = params
    		if(exercise.save())
    		{
    			log.debug("saving exercise")    			
    			render( Exercise.get(params.id)?.description )
    		}
    		else
    		{
    			log.debug("ERROR: saving exercise failed.")    			
    		}
		}
    	else
    	{
            render( "Error saving Exercise" )
	    }
	}
    
    def create = {
        def exercise = new Exercise()
        exercise.properties = params
        return ['exercise':exercise]
    }

    def save = {
        def exercise = new Exercise(params)
        if(!exercise.hasErrors() && exercise.save()) {
            flash.message = "Exercise ${exercise.id} created"
            redirect(action:show,id:exercise.id)
        }
        else {
            render(view:'create',model:[exercise:exercise])
        }
    }
    
    def toXml = {
			log.trace("Executing action $actionName with params $params")
			def exercise = Exercise.get( params.id )
			if(!exercise)
			{
				flash.message = "exercise not found with id ${params.id}"
				redirect(action:list)
			}
			else {
			    flash.exercise = exercise
			    render "${exercise.toXml()?.encodeAsXML()}"
			}
	}			
    
    def prettyPrint = {
			log.trace("Executing action $actionName with params $params")
			def exercise = Exercise.get( params.id )
	}
}