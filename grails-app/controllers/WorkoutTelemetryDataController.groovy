            
class WorkoutTelemetryDataController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        if(!params.max) params.max = 10
        [ workoutTelemetryDataList: WorkoutTelemetryData.list( params ) ]
    }

    def show = {
        def workoutTelemetryData = WorkoutTelemetryData.get( params.id )

        if(!workoutTelemetryData) {
            flash.message = "WorkoutTelemetryData not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ workoutTelemetryData : workoutTelemetryData ] }
    }

    def delete = {
        def workoutTelemetryData = WorkoutTelemetryData.get( params.id )
        if(workoutTelemetryData) {
            workoutTelemetryData.delete()
            flash.message = "WorkoutTelemetryData ${params.id} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "WorkoutTelemetryData not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def workoutTelemetryData = WorkoutTelemetryData.get( params.id )

        if(!workoutTelemetryData) {
            flash.message = "WorkoutTelemetryData not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ workoutTelemetryData : workoutTelemetryData ]
        }
    }

    def update = {
        def workoutTelemetryData = WorkoutTelemetryData.get( params.id )
        if(workoutTelemetryData) {
            workoutTelemetryData.properties = params
            if(!workoutTelemetryData.hasErrors() && workoutTelemetryData.save()) {
                flash.message = "WorkoutTelemetryData ${params.id} updated"
                redirect(action:show,id:workoutTelemetryData.id)
            }
            else {
                render(view:'edit',model:[workoutTelemetryData:workoutTelemetryData])
            }
        }
        else {
            flash.message = "WorkoutTelemetryData not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def workoutTelemetryData = new WorkoutTelemetryData()
        workoutTelemetryData.properties = params
        return ['workoutTelemetryData':workoutTelemetryData]
    }

    def save = {
        def workoutTelemetryData = new WorkoutTelemetryData(params)
        if(!workoutTelemetryData.hasErrors() && workoutTelemetryData.save()) {
            flash.message = "WorkoutTelemetryData ${workoutTelemetryData.id} created"
            redirect(action:show,id:workoutTelemetryData.id)
        }
        else {
            render(view:'create',model:[workoutTelemetryData:workoutTelemetryData])
        }
    }
}