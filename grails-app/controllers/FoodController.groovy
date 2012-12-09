            
class FoodController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
    		 log.trace("Executing action $actionName with params $params")
        if(!params.max) params.max = 10
        [ foodList: Food.list( params ) ]
    }
    
    def listXml = {
    		[ foodList: Food.list() ]
    }

    def show = {
    		 log.trace("Executing action $actionName with params $params")
        def food = Food.get( params.id )
        flash.food = food;
        if(!food) {
            flash.message = "Food not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ food : food ] }
    }

    def search = {
    		log.trace("Executing action $actionName with params $params")
//    		log.trace("Executing action $actionName with session $session")
    		def criteria = Food.createCriteria();
    		def foods;
    		// look for all foods that meet the criteria
    		//if(params.searchFieldCriteria && !params.searchFieldCriteria?.indexOf) {
    			if(params.searchFieldCriteria)
    			{
    				foods = criteria.list {
    				or {
    					like('name',"%${params.searchFieldCriteria}%")
    					like('description',"%${params.searchFieldCriteria}%")
    				}
    			}
    		}
    		
    		render(view:'list', model:[foodList:foods] )
    		log.trace("foodList: " + foods)
    		log.trace("search exit");
    }
    		
    /**
     * Derived from the example in the grails richui web page.
     */		
    def searchAJAX = { def foods = Food.findAllByNameLike("%${params.query}%")
    		log.trace("Executing action $actionName with params $params")
    		//    		Create XML response 
    		render(contentType: "text/xml") {
    			results() {
    				foods.each { food -> 
    					result(){ 
    						name(food.name) 
    						//Optional id which will be available in onItemSelect 
    						id(food.id) 
    					} 
    				} 
   				} 
    		}
    }
    
    def delete = {
    		log.trace("Executing action $actionName with params $params")
    		log.trace("NOTE: DELETE HAS BEEN DISABLED ");
        def food = Food.get( params.id )
        
        if(food) {
            // first delete all the food refs pointing to this food
            // find all the food refs pointing here and delete them.
            // Also, you'll have to find the meals they point to and delete those 
            // food refs
            def foodRefList;
            foodRefList = FoodRef.findAllByFood(food);
            log.trace("food id is : " + food.id);
            log.trace("foodRefList: " + foodRefList);
            
            for (FoodRef ref: foodRefList)
            {
            	log.trace("\ndeleting ref: " + ref);
            	ref.delete();
            }

        	food.delete()
            flash.message = "Food ${params.id} and references deleted"
            redirect(action:list)
        }
        else {
            flash.message = "Food not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
    		log.trace("Executing action $actionName with params $params")
        def food = Food.get( params.id )

        if(!food) {
            flash.message = "Food not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ food : food ]
        }
    }

    def update = {
    		log.trace("Executing action $actionName with params $params")
        def food = Food.get( params.id )
        if(food) {
            food.properties = params
            if(!food.hasErrors() && food.save()) {
                flash.message = "Food ${params.id} updated"
                redirect(action:show,id:food.id)
            }
            else {
                render(view:'edit',model:[food:food])
            }
        }
        else {
            flash.message = "Food not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    //  for calling the editInPlace tag in CoachTaglib.groovy
	// adapted from Bookmarks app, and updated from DGG errata.
	def updateDescription = {
		log.trace("Executing action $actionName with params $params")
	    log.debug("Executing action $actionName with params $params")    				
		def food = Food.get( params.id )
		log.debug("Called Food.get...")    				
		if(food) 
		{
			log.debug("have a workout. Will get properties and save.")
			food.properties = params
    		if(food.save())
    		{
    			log.debug("saving food")    			
    			render( Food.get(params.id)?.description )
    		}
    		else
    		{
    			log.debug("ERROR: saving food failed.")    			
    		}
		}
    	else
    	{
            render( "Error saving food" )
	    }
	}
    
    def create = {
			log.trace("Executing action $actionName with params $params")
			log.trace("Executing action $actionName with flash $flash")
        def food = new Food()
        food.properties = params
        flash.meal = flash.meal;
        return ['food':food]
    }
    
    def toXml = {
			log.trace("Executing action $actionName with params $params")
			def food = Food.get( params.id )
			if(!food)
			{
				flash.message = "food not found with id ${params.id}"
				redirect(action:list)
			}
			else {
			    flash.food = food
			    render "${food.toXml()?.encodeAsXML()}"
			}
	}			

    def save = {
			log.trace("Executing action $actionName with params $params")
        def food = new Food(params)
			// ejy
		food.nutritionData = new NutritionData(description:food.name,food:food);
        if(!food.hasErrors() && food.save()) {
            flash.message = "Food ${food.id} created"
            redirect(action:show,id:food.id)
        }
        else {
            render(view:'create',model:[food:food])
        }
    }
}