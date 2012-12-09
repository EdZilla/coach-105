            
class DevelIssueController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        if(!params.max) params.max = 10
        [ develIssueList: DevelIssue.list( params ) ]
    }
    
    def listXml = {
    		[ develIssueList: DevelIssue.list() ]
    }

    def show = {
        def develIssue = DevelIssue.get( params.id )

        if(!develIssue) {
            flash.message = "DevelIssue not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ develIssue : develIssue ] }
    }
    
    def search = {
    		log.trace("Executing action $actionName with params $params")
//    		log.trace("Executing action $actionName with session $session")
    		def criteria = DevelIssue.createCriteria();
    		def issues;
    		// look for all issues that meet the criteria
    		//if(params.searchFieldCriteria && !params.searchFieldCriteria?.indexOf) {
    			if(params.searchFieldCriteria)
    			{
    				issues = criteria.list {
    				or {
    					like('name',"%${params.searchFieldCriteria}%")
    					like('description',"%${params.searchFieldCriteria}%")
    					like('domain',"%${params.searchFieldCriteria}%")
    					like('status',"%${params.searchFieldCriteria}%")
    				}
    			}
    		}
    		
    		render(view:'list', model:[develIssueList:issues] )
    		log.trace("develIssueList: " + issues)
    		log.trace("search exit");
    }

    def delete = {
        def develIssue = DevelIssue.get( params.id )
        if(develIssue) {
            develIssue.delete()
            flash.message = "DevelIssue ${params.id} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "DevelIssue not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def develIssue = DevelIssue.get( params.id )

        if(!develIssue) {
            flash.message = "DevelIssue not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ develIssue : develIssue ]
        }
    }

    def update = {
        def develIssue = DevelIssue.get( params.id )
        if(develIssue) {
            develIssue.properties = params
            if(!develIssue.hasErrors() && develIssue.save()) {
                flash.message = "DevelIssue ${params.id} updated"
                redirect(action:show,id:develIssue.id)
            }
            else {
                render(view:'edit',model:[develIssue:develIssue])
            }
        }
        else {
            flash.message = "DevelIssue not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }
    
    //  for calling the editInPlace tag in CoachTaglib.groovy
	// adapted from Bookmarks app, and updated from DGG errata.
	def updateDescription = {
		log.trace("Executing action $actionName with params $params")
	    log.debug("Executing action $actionName with params $params")    				
		def issue = DevelIssue.get( params.id )
		log.debug("Called DevelIssue.get...")    				
		if(issue) 
		{
			log.debug("have an issue. Will get properties and save.")
			issue.properties = params
    		if(issue.save())
    		{
    			log.debug("saving issue")    			
    			render( DevelIssue.get(params.id)?.description )
    		}
    		else
    		{
    			log.debug("ERROR: saving issue failed.")    			
    		}
		}
    	else
    	{
            render( "Error saving issue" )
	    }
	}

    def create = {
        def develIssue = new DevelIssue()
        develIssue.properties = params
        return ['develIssue':develIssue]
    }

    def save = {
        def develIssue = new DevelIssue(params)
        if(!develIssue.hasErrors() && develIssue.save()) {
            flash.message = "DevelIssue ${develIssue.id} created"
            redirect(action:show,id:develIssue.id)
        }
        else {
            render(view:'create',model:[develIssue:develIssue])
        }
    }
}