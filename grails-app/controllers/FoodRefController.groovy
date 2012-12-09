            
class FoodRefController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        if(!params.max) params.max = 10
        [ foodRefList: FoodRef.list( params ) ]
    }

    def show = {
    		log.trace("Executing action $actionName with params $params")
    		def foodRef = FoodRef.get( params.id )

        if(!foodRef) {
            flash.message = "FoodRef not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ foodRef : foodRef ] }
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
    		
    		render(view:'searchResults', model:[foodList:foods] )
    		log.trace("foodList: " + foods)
    		log.trace("search exit");
    }

    def delete = {
        def foodRef = FoodRef.get( params.id )
        if(foodRef) {
            foodRef.delete()
            flash.message = "FoodRef ${params.id} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "FoodRef not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def foodRef = FoodRef.get( params.id )

        if(!foodRef) {
            flash.message = "FoodRef not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ foodRef : foodRef ]
        }
    }

    def update = {
        def foodRef = FoodRef.get( params.id )
        if(foodRef) {
            foodRef.properties = params
            if(!foodRef.hasErrors() && foodRef.save()) {
                flash.message = "FoodRef ${params.id} updated"
                redirect(action:show,id:foodRef.id)
            }
            else {
                render(view:'edit',model:[foodRef:foodRef])
            }
        }
        else {
            flash.message = "FoodRef not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
    		log.trace("Executing action $actionName with params $params")
    		log.trace("Executing action $actionName with flash $flash")
    		log.trace("Executing action $actionName with session $session")
        
        def foodRef = new FoodRef()
        foodRef.properties = params
        // populate our meal dropdown.
        foodRef.meal = session.meal;
        foodRef.food = flash.food;    		
        return ['foodRef':foodRef]
    }

    def save = {
        def foodRef = new FoodRef(params)
        if(!foodRef.hasErrors() && foodRef.save()) {
            flash.message = "FoodRef ${foodRef.id} created"
            redirect(action:show,id:foodRef.id)
        }
        else {
            render(view:'create',model:[foodRef:foodRef])
        }
    }
}