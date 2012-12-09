            
class CourseController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        if(!params.max) params.max = 10
        [ courseList: Course.list( params ) ]
    }

    def show = {
    	log.trace("Executing action $actionName with params $params")
        def course = Course.get( params.id )

        if(!course) {
            flash.message = "Course not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ course : course ] }
    }

    def delete = {
        def course = Course.get( params.id )
        if(course) {
            course.delete()
            flash.message = "Course ${params.id} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "Course not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
    		log.trace("Executing action $actionName with params $params")
        def course = Course.get( params.id )

        if(!course) {
            flash.message = "Course not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ course : course ]
        }
    }

    def update = {
    		log.trace("Executing action $actionName with params $params")
        def course = Course.get( params.id )
        if(course) {
            course.properties = params
            if(!course.hasErrors() && course.save()) {
                flash.message = "Course ${params.id} updated"
                redirect(action:show,id:course.id)
            }
            else {
                render(view:'edit',model:[course:course])
            }
        }
        else {
            flash.message = "Course not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }
    
     
    
    //  for calling the editInPlace tag in CoachTaglib.groovy
	// adapted from Bookmarks app, and updated from DGG errata.
	def updateDescription = {
		log.trace("Executing action $actionName with params $params")
	    log.debug("Executing action $actionName with params $params")    				
		def course = Course.get( params.id )
		log.debug("Called Course.get...")    				
		if(course) 
		{
			log.debug("have a workout. Will get properties and save.")
			course.properties = params
    		if(course.save())
    		{
    			log.debug("saving course")    			
    			render( Course.get(params.id)?.description )
    		}
    		else
    		{
    			log.debug("ERROR: saving course failed.")    			
    		}
		}
    	else
    	{
            render( "Error saving course" )
	    }
	}

    def create = {
			log.trace("Executing action $actionName with params $params")
        def course = new Course()
        course.properties = params
        return ['course':course]
    }

    def save = {
			log.trace("Executing action $actionName with params $params")
        def course = new Course(params)
        if(!course.hasErrors() && course.save()) {
            flash.message = "Course ${course.id} created"
            redirect(action:show,id:course.id)
        }
        else {
            render(view:'create',model:[course:course])
        }
    }
}