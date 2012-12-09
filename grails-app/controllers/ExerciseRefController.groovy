            
class ExerciseRefController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        if(!params.max) params.max = 10
        [ exerciseRefList: ExerciseRef.list( params ) ]
    }

    def show = {
        def exerciseRef = ExerciseRef.get( params.id )

        if(!exerciseRef) {
            flash.message = "ExerciseRef not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ exerciseRef : exerciseRef ] }
    }

    def delete = {
        def exerciseRef = ExerciseRef.get( params.id )
        if(exerciseRef) {
            exerciseRef.delete()
            flash.message = "ExerciseRef ${params.id} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "ExerciseRef not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def exerciseRef = ExerciseRef.get( params.id )

        if(!exerciseRef) {
            flash.message = "ExerciseRef not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ exerciseRef : exerciseRef ]
        }
    }

    def update = {
        def exerciseRef = ExerciseRef.get( params.id )
        if(exerciseRef) {
            exerciseRef.properties = params
            if(!exerciseRef.hasErrors() && exerciseRef.save()) {
                flash.message = "ExerciseRef ${params.id} updated"
                redirect(action:show,id:exerciseRef.id)
            }
            else {
                render(view:'edit',model:[exerciseRef:exerciseRef])
            }
        }
        else {
            flash.message = "ExerciseRef not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def exerciseRef = new ExerciseRef()
        exerciseRef.properties = params
        // populate the workout and exercise dropdown.
        exerciseRef.workout = session.workout;
        exerciseRef.exercise = flash.exercise;
        return ['exerciseRef':exerciseRef]
    }

    def save = {
        def exerciseRef = new ExerciseRef(params)
        if(!exerciseRef.hasErrors() && exerciseRef.save()) {
            flash.message = "ExerciseRef ${exerciseRef.id} created"
            redirect(action:show,id:exerciseRef.id)
        }
        else {
            render(view:'create',model:[exerciseRef:exerciseRef])
        }
    }
    
    def search = {
    		log.trace("Executing action $actionName with params $params")
//    		log.trace("Executing action $actionName with session $session")
    		def criteria = Exercise.createCriteria();
    		def exercises;
    		// look for all foods that meet the criteria
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
    		
    		render(view:'searchResults', model:[exerciseList:exercises] )
    		log.trace("exerciseList: " + exercises)
    		log.trace("search exit");
    }

}