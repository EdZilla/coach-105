import org.grails.plugins.springsecurity.service.AuthenticateService

class MealController {
    def mailService
    def notifyUserService
    def authenticateService
        
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        log.trace("Executing action $actionName with params $params")
	log.trace("Executing action $actionName with session $session")  
	log.trace("AuthenticateService: $AuthenticateService.")  

        if(!params.max) params.max = 10
        //[ mealList: Meal.list( params ) ]
        log.debug("about to findByUsername")

        log.debug("name: " + authenticateService.userDomain().username)
        [ mealList: Meal.findAllByAthlete(AuthUser.findByUsername(authenticateService.userDomain().username), params ) ]

    }
    
    def listXml = {
        [ mealList: Meal.findAllByAthlete(AuthUser.findByUsername(authenticateService.userDomain().username)) ]
    }

    def show = {
        log.trace("Executing action $actionName with params  : $params")
        log.trace("Executing action $actionName with session : $session")
        log.trace("Executing action $actionName with flash   : $flash")
    		
        def meal = Meal.get( params.id )
        session.meal = meal;

        if(!meal) {
            flash.message = "Meal not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ meal : meal ] }
    }
	
    /**
     * Get the next meal by id
     */
    def nextMeal = {
        log.trace("Executing action $actionName with params  : $params")
		
        def meal = Meal.get( params.id )
        log.debug("meal: ${meal.id}, ${meal}")
        def nextMeal = Meal.findByIdGreaterThan(meal.id)
        log.debug("next Meal: " + nextMeal.each { it.id } )
		
        if(!nextMeal)
        {
            flash.message = "no next Meal"
            redirect(action:list)
        }
        else
        {
            redirect(action:show, id:nextMeal.id)
        }
    }
	
    /**
     * Get the prev meal by id
     * Note: this is extremely innefficient since it first collects all
     * and then iterates from 0, and usually you're looking for something
     * toward the end.
     */
    def prevMeal = {
        log.trace("Executing action $actionName with params  : $params")
		
        def meal = Meal.get( params.id )
		
        def meals = Meal.findAll();
		
        if(!meal)
        {
            flash.message = "Meal not found with id ${params.id}"
            redirect(action:list)
        }
        else
        {
            def mealIdx = meals.findIndexOf { it.id == meal.id }

            log.debug("meal index: ${mealIdx -1}")
            redirect(action:show, id:meals[mealIdx-1].id)
        }
    }
    
    def search = {
        log.trace("Executing action $actionName with params $params")
        //    		log.trace("Executing action $actionName with session $session")
        def criteria = Meal.createCriteria();
        def meals;
        // look for all meals that meet the criteria
        //if(params.searchFieldCriteria && !params.searchFieldCriteria?.indexOf) {
        if(params.searchFieldCriteria)
        {
            meals = criteria.list {
                or {
                    like('name',"%${params.searchFieldCriteria}%")
                    like('description',"%${params.searchFieldCriteria}%")
                }
            }
        }
    		
        render(view:'list', model:[mealList:meals] )
        log.trace("mealList: " + meals)
        log.trace("search exit");
    }
    		
    /**
     * Derived from the example in the grails richui web page.
     */		
    def searchAJAX = { def meals = Meal.findAllByNameLike("%${params.query}%")
        log.trace("Executing action $actionName with params $params")
        //    		Create XML response
        render(contentType: "text/xml") {
            results() {
                meals.each { meal ->
                    result(){
                        name(meal.name)
                        //Optional id which will be available in onItemSelect
                        id(meal.id)
                    }
                }
            }
        }
    }

    
    def beforeDelete = { meal ->
        meal.athlete.removeFromMeals(meal)
    }
    
    def delete = {
       	log.trace("Executing action $actionName with params $params")
        def meal = Meal.get( params.id )
        // only way to deal with cascad error
        beforeDelete(meal)
        if(meal) 
        {
            log.debug("meal is not null, so we can delete")
            if (meal.food)
            {
                log.debug("meal has food refs.")
                meal.food.each 	{
                    if(it.delete())
                    {
                        log.trace("deleted food ref: " + it.id)
                    }
                    else
                    {
                        log.trace("ERROR: could not delete food ref: " + it.id)
                    }
            	}
            }

            if (meal.delete())
            {
            	log.debug("Got a meal. Must delete")
            	flash.message = "Meal ${params.id} deleted"
            }
            else
            {
            	log.trace("ERROR: meal " + params.id + " not deleted.wtf?")
            	flash.message = "ERROR: Meal ${params.id} NOT deleted"
            	log.trace("ERROR: did not delete: errors: " + meal.errors.each {it} )
            }
            
            redirect(action:list)
        }
        else {
            log.debug("meal is null, I guess, so we can not delete?")
            flash.message = "Meal not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def meal = Meal.get( params.id )

        if(!meal) {
            flash.message = "Meal not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ meal : meal ]
        }
    }

    def update = {
    	log.trace("Executing action $actionName with params $params")
        def meal = Meal.get( params.id )
        if(meal) {
            meal.properties = params
            if(!meal.hasErrors() && meal.save()) {
                flash.message = "Meal ${params.id} updated"
                redirect(action:show,id:meal.id)
            }
            else {
                render(view:'edit',model:[meal:meal])
            }
        }
        else {
            flash.message = "Meal not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }
    
    //  for calling the editInPlace tag in CoachTaglib.groovy
    // adapted from Bookmarks app, and updated from DGG errata.
    def updateDescription = {
        log.trace("Executing action $actionName with params $params")
	    
        def meal = Meal.get( params.id )
        log.debug("Called Workout.get...")
        if(meal)
        {
            log.debug("have a meal. Will get properties and save.")
            meal.properties = params
            if(meal.save())
            {
                log.debug("saving meal")
                render( Meal.get(params.id)?.description )
            }
            else
            {
                log.debug("ERROR: saving meal failed.")
            }
        }
    	else
    	{
            render( "Error saving meal" )
        }
    }

    def create = {
	log.trace("Executing action $actionName with params $params")
        log.trace("Executing action $actionName with session $session")
        def meal = new Meal()
        meal.properties = params

        log.trace("username is: " + authenticateService.userDomain().username)
        return ['meal':meal]
    }

    def save = {
        log.trace("Executing action $actionName with params $params")
        def meal = new Meal(params)
        // ejy-I'll bet there's a groovier way to do this...
        //        def foodList = meal.food;
        //        for (Food f: foodList)
        //        {
        //        	meal.cost += f.cost;
        //        }

        log.trace("username is: " + authenticateService.userDomain().username)
        meal.athlete = AuthUser.findByUsername(authenticateService.userDomain().username)
        log.debug("meal: " + meal)
        
        if(!meal.hasErrors() && meal.save()) {
            flash.message = "Meal ${meal.id} created"
            redirect(action:show,id:meal.id)
        }
        else {
            render(view:'create',model:[meal:meal])
        }
    }
    
    /**
     * Not yet working. updated meal will not persist
     */
    def addFoodTo = {
        log.trace("Executing action $actionName with params $params")
        log.trace("session: $session")
        log.trace("flash: $flash")
        def foodRef;
        def meal = session.meal;
        def food = flash.food;
			
        if (meal)
        {
            foodRef = new FoodRef(meal:meal,food:food);
            log.debug("new foodRef: " + foodRef)
            log.debug("adding new food to meal");
            meal.addToFood(foodRef)
            log.debug("added new food to meal");
			
            // TODO: force errors somehow
            log.debug("about to save meal ${meal.id}...");
            if (!meal.hasErrors() && meal.save())
            {
                log.trace("meal: " + meal);
                flash.message = "Added food ${foodRef.food.name} to meal ${meal.name}"
                redirect(action:show, id:meal.id)
            }
            else
            {
                //flash.message = "ERROR: could not add request to AteRequestSequence ${meal.name}, with id: ${meal.id}: ERROR: ${meal.errors.each { it }}"
                flash.message = "ERROR: could not add food to meal ${meal.name}, with id: ${meal.id}"
                log.trace("errors: " + meal.errors.each {it} )
                redirect(action:show, id:meal.id)
            }
        }
        else
        {
            flash.message = "ERROR: no current Meal"
            redirect(action:list)
        }
    }
    
    def toXml = {
        log.trace("Executing action $actionName with params $params")
        def meal = Meal.get( params.id )
        if (!meal)
        {
            flash.message = "Meal not found with id ${params.id}"
            redirect(action:list)
        }
        else
        {
            flash.meal = meal
            render "${meal.toXml()?.encodeAsXML()}"
            log.trace("meal:" + meal.toXml())
        }
    }
    
    def prettyPrint = {
    	log.trace("Executing action $actionName with params $params")
    	log.trace("Executing action $actionName with flash $flash")
    	def meal = Meal.get( params.id )
    	session.meal = meal;

        if(!meal) {
            flash.message = "Meal not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ meal : meal ] }
    }
    
    /**
     * email an htmlified meal
     */
    def email = {
        log.trace("Executing action $actionName with params $params")
        def meal = Meal.get( params.id )
        println "html:\n ${meal.toHTML()}"
        def date = new Date();
        date.hours = date.hours - 7
        notifyUserService.emailAsHtml("ejy@summitbid.com",
    				"Meal ${date}", meal.toHTML())
        redirect(action:show,id:meal.id)
    }
    
    /**
     * email an htmlified list of recent workouts
     */
    def emailRecent = {
        log.trace("Executing action $actionName with params $params")
        def emailPrefix = "[summitbid-coach]"
        def now = new Date()
        now.hours = now.hours - 7
        def list = Meal.findAllByDateBetween(now-2,now).reverse()
        println ("reverse meal list: " + list)

        if (list)
        {
            def recentMeals = ""
            list.each { recentMeals += it.toHTML() }

            println "recentMeals html:\n ${recentMeals}"

            mailService.sendMail {
                to "ejy@summitbid.com"
                title "${emailPrefix}recent meals"
                from "coachNoReply@summitbid.com"
                body view:"/meal/reportRecent",
                model:[recentMeals:recentMeals,now:now]
            }
        }
        redirect(action:list)
    }
    
}