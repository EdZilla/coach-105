            
class BioMetricsController {
    def mailService
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        if(!params.max) params.max = 10
        [ bioMetricsList: BioMetrics.list( params ) ]
    }

    def show = {
        def bioMetrics = BioMetrics.get( params.id )

        if(!bioMetrics) {
            flash.message = "BioMetrics not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ bioMetrics : bioMetrics ] }
    }

    def delete = {
        def bioMetrics = BioMetrics.get( params.id )
        if(bioMetrics) {
            bioMetrics.delete()
            flash.message = "BioMetrics ${params.id} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "BioMetrics not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def bioMetrics = BioMetrics.get( params.id )

        if(!bioMetrics) {
            flash.message = "BioMetrics not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ bioMetrics : bioMetrics ]
        }
    }

    def update = {
        def bioMetrics = BioMetrics.get( params.id )
        if(bioMetrics) {
            bioMetrics.properties = params
            if(!bioMetrics.hasErrors() && bioMetrics.save()) {
                flash.message = "BioMetrics ${params.id} updated"
                redirect(action:show,id:bioMetrics.id)
            }
            else {
                render(view:'edit',model:[bioMetrics:bioMetrics])
            }
        }
        else {
            flash.message = "BioMetrics not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def bioMetrics = new BioMetrics()
        bioMetrics.properties = params
        return ['bioMetrics':bioMetrics]
    }

    def save = {
        def bioMetrics = new BioMetrics(params)
        if(!bioMetrics.hasErrors() && bioMetrics.save()) {
            flash.message = "BioMetrics ${bioMetrics.id} created"
            redirect(action:show,id:bioMetrics.id)
        }
        else {
            render(view:'create',model:[bioMetrics:bioMetrics])
        }
    }

      /**
     * email an htmlified
     */
    def email = {
		log.trace("Executing action $actionName with params $params")
    		def bioMetrics = BioMetrics.get( params.id )
    		println "html:\n ${bioMetrics.toHTML()}"

    		if (bioMetrics)
    		{
    			mailService.sendMail {
				   to "ejy@summitbid.com"
				   from "ejy@summitbid.com"
				   subject "BioMetric Email..."
				   html "${bioMetrics.toHTML()}"
    			}
    		}
    		redirect(action:show,id:bioMetrics.id)
    }
}