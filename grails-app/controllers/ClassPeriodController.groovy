            
class ClassPeriodController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        if(!params.max) params.max = 10
        [ classPeriodList: ClassPeriod.list( params ) ]
    }

    def show = {
        def classPeriod = ClassPeriod.get( params.id )

        if(!classPeriod) {
            flash.message = "ClassPeriod not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ classPeriod : classPeriod ] }
    }

    def delete = {
        def classPeriod = ClassPeriod.get( params.id )
        if(classPeriod) {
            classPeriod.delete()
            flash.message = "ClassPeriod ${params.id} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "ClassPeriod not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def classPeriod = ClassPeriod.get( params.id )

        if(!classPeriod) {
            flash.message = "ClassPeriod not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ classPeriod : classPeriod ]
        }
    }

    def update = {
        def classPeriod = ClassPeriod.get( params.id )
        if(classPeriod) {
            classPeriod.properties = params
            if(!classPeriod.hasErrors() && classPeriod.save()) {
                flash.message = "ClassPeriod ${params.id} updated"
                redirect(action:show,id:classPeriod.id)
            }
            else {
                render(view:'edit',model:[classPeriod:classPeriod])
            }
        }
        else {
            flash.message = "ClassPeriod not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def classPeriod = new ClassPeriod()
        classPeriod.properties = params
        return ['classPeriod':classPeriod]
    }

    def save = {
        def classPeriod = new ClassPeriod(params)
        if(!classPeriod.hasErrors() && classPeriod.save()) {
            flash.message = "ClassPeriod ${classPeriod.id} created"
            redirect(action:show,id:classPeriod.id)
        }
        else {
            render(view:'create',model:[classPeriod:classPeriod])
        }
    }
}