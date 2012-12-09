            
class EquipmentController {
    
    //def index = { redirect(action:list,params:params) }

    def list = {
        if(!params.max) params.max = 10
        [ equipmentList: Equipment.list( params ) ]
    }
    
    // the delete, save and update actions only accept POST requests
    static def allowedMethods = [delete:'POST', save:'POST', update:'POST']


    def show = {
        def equipment = Equipment.get( params.id )
        flash.equipment = equipment
        
        if(!equipment) {
            flash.message = "Equipment not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ equipment : equipment ] }
    }

    def delete = {
        def equipment = Equipment.get( params.id )
        if(equipment) {
        	//        	 delete all the Equipment refs
        	def refs = EquipmentRef.findAllByEquipment(equipment);
        	for (EquipmentRef ref: refs)
        	{
        		log.trace("deleting ex ref pointing to equipment id: " + params.id + ". deleting ref " + ref);
        		ref.delete();
        	}
            equipment.delete()
            flash.message = "Equipment ${params.id} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "Equipment not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def equipment = Equipment.get( params.id )

        if(!equipment) {
            flash.message = "Equipment not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ equipment : equipment ]
        }
    }

    def update = {
        def equipment = Equipment.get( params.id )
        if(equipment) {
            equipment.properties = params
            if(!equipment.hasErrors() && equipment.save()) {
                flash.message = "Equipment ${params.id} updated"
                redirect(action:show,id:equipment.id)
            }
            else {
                render(view:'edit',model:[equipment:equipment])
            }
        }
        else {
            flash.message = "Equipment not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }
    
    //  for calling the editInPlace tag in CoachTaglib.groovy
	// adapted from Bookmarks app, and updated from DGG errata.
	def updateDescription = {
		log.trace("Executing action $actionName with params $params")
	    log.debug("Executing action $actionName with params $params")    				
		def item = Equipment.get( params.id )
		log.debug("Called Equipment.get...")    				
		if(item) 
		{
			log.debug("have an issue. Will get properties and save.")
			item.properties = params
    		if(item.save())
    		{
    			log.debug("saving issue")    			
    			render( Equipment.get(params.id)?.description )
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
        def equipment = new Equipment()
        equipment.properties = params
        return ['equipment':equipment]
    }

    def save = {
        def equipment = new Equipment(params)
        if(!equipment.hasErrors() && equipment.save()) {
            flash.message = "Equipment ${equipment.id} created"
            redirect(action:show,id:equipment.id)
        }
        else {
            render(view:'create',model:[equipment:equipment])
        }
    }
    
    def search = {
    		log.trace("Executing action $actionName with params $params")
//    		log.trace("Executing action $actionName with session $session")
    		def criteria = Equipment.createCriteria();
    		def items;
    		// look for all foods that meet the criteria
    		//if(params.searchFieldCriteria && !params.searchFieldCriteria?.indexOf) {
    			if(params.searchFieldCriteria)
    			{
    				items = criteria.list {
    				or {
    					like('name',"%${params.searchFieldCriteria}%")
    					like('description',"%${params.searchFieldCriteria}%")
    				}
    			}
    		}
    		
    		render(view:'list', model:[equipmentList:items] )
    		log.trace("equipmentList: " + items)
    		log.trace("search exit");
    }
}