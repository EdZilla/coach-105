import groovy.xml.MarkupBuilder

class DevelIssue {
	String name
	String description = "Click here to enter description"
	String domain
	Integer severity = 5
	//DevelIssueStatus status = OPEN
	String status = "OPEN"
	static belongsTo = DevelIssue
	static hasMany = [issues:DevelIssue]
	
	static constraints = {
		name(unique:true, maxLength:50, blank:false)
		description(maxLength:512, blank:false)
		severity(inList:[5, 4, 3, 2, 1])
		//status(inList:["OPEN","CLOSED","RESOLVED","VERIFIED", "CANT_REPRODUCE"])
		status(inList:['OPEN','CLOSED','RESOLVED','VERIFIED', 'CANT_REPRODUCE'])
		//status(inList:[OPEN, RESOLVED,CLOSED, VERIFIED, CANT_REPRODUCE])
	}
	
	String toString()
	{"DevelIssue \n" +
		" name: ${this.name}, \n" +
		" description: ${this.description},\n" + 
		" status: ${this.status},\n" + 
		" severity: ${this.severity}"}
	
	String toXml()
	{
		def writer = new StringWriter();
    	def xml = new MarkupBuilder(writer);
    	
    	xml.issue(name:this.name, description:this.description, domain: this.domain, severity: this.severity, status: this.status ) 
    	{
    			for (DevelIssue d: this.issues)
    			{
    				issue(name:d.name, description:d.description, domain: d.domain, severity: d.severity, status: d.status ) 
    			}
    	}

    	return writer.toString();
	}
}
