            
class EquipmentRefController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        if(!params.max) params.max = 10
        [ equipmentRefList: EquipmentRef.list( params ) ]
    }

    def show = {
        def equipmentRef = EquipmentRef.get( params.id )

        if(!equipmentRef) {
            flash.message = "EquipmentRef not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ equipmentRef : equipmentRef ] }
    }

    def delete = {
        def equipmentRef = EquipmentRef.get( params.id )
        if(equipmentRef) {
            equipmentRef.delete()
            flash.message = "EquipmentRef ${params.id} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "EquipmentRef not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def equipmentRef = EquipmentRef.get( params.id )

        if(!equipmentRef) {
            flash.message = "EquipmentRef not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ equipmentRef : equipmentRef ]
        }
    }

    def update = {
        def equipmentRef = EquipmentRef.get( params.id )
        if(equipmentRef) {
            equipmentRef.properties = params
            if(!equipmentRef.hasErrors() && equipmentRef.save()) {
                flash.message = "EquipmentRef ${params.id} updated"
                redirect(action:show,id:equipmentRef.id)
            }
            else {
                render(view:'edit',model:[equipmentRef:equipmentRef])
            }
        }
        else {
            flash.message = "EquipmentRef not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def equipmentRef = new EquipmentRef()
        equipmentRef.properties = params
        equipmentRef.equipment = flash.equipment;
        equipmentRef.exercise  = flash.exercise;
        
        return ['equipmentRef':equipmentRef]
    }

    def save = {
        def equipmentRef = new EquipmentRef(params)
        if(!equipmentRef.hasErrors() && equipmentRef.save()) {
            flash.message = "EquipmentRef ${equipmentRef.id} created"
            redirect(action:show,id:equipmentRef.id)
        }
        else {
            render(view:'create',model:[equipmentRef:equipmentRef])
        }
    }
}