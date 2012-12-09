/**
 * 
 */
class NotifyUserService {

    boolean transactional = false
    def mailService

    def emailAsHtml(def recipient, def subjectLine, def emailContent) {

    	mailService.sendMail {
    		to recipient
    		from "coachNoReply@summitbid.com"
    		subject subjectLine
    		html emailContent
    	}
    }
    
    def emailUser(def recipient, def subjectLine, def emailContent) {
    	mailService.sendMail {
    		to recipient
    		from "coachNoReply@summitbid.com"
    		subject subjectLine
    		body emailContent
    	}
    }
}
