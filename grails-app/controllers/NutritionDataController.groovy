            
class NutritionDataController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        if(!params.max) params.max = 10
        [ nutritionDataList: NutritionData.list( params ) ]
    }

    def show = {
        def nutritionData = NutritionData.get( params.id )

        if(!nutritionData) {
            flash.message = "NutritionData not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ nutritionData : nutritionData ] }
    }

    def delete = {
        def nutritionData = NutritionData.get( params.id )
        if(nutritionData) {
            nutritionData.delete()
            flash.message = "NutritionData ${params.id} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "NutritionData not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def nutritionData = NutritionData.get( params.id )

        if(!nutritionData) {
            flash.message = "NutritionData not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ nutritionData : nutritionData ]
        }
    }

    def update = {
        def nutritionData = NutritionData.get( params.id )
        if(nutritionData) {
            nutritionData.properties = params
            if(!nutritionData.hasErrors() && nutritionData.save()) {
                flash.message = "NutritionData ${params.id} updated"
                redirect(action:show,id:nutritionData.id)
            }
            else {
                render(view:'edit',model:[nutritionData:nutritionData])
            }
        }
        else {
            flash.message = "NutritionData not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def nutritionData = new NutritionData()
        nutritionData.properties = params
        nutritionData.food = flash.food;
        return ['nutritionData':nutritionData]
    }

    def save = {
        def nutritionData = new NutritionData(params)
        if(!nutritionData.hasErrors() && nutritionData.save()) {
            flash.message = "NutritionData ${nutritionData.id} created"
            redirect(action:show,id:nutritionData.id)
        }
        else {
            render(view:'create',model:[nutritionData:nutritionData])
        }
    }
}