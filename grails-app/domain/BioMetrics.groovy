import groovy.xml.MarkupBuilder

class BioMetrics {
	AuthUser athlete;
	Date date = new Date();
	Integer height;
	Integer weight;
	Integer waist;
	Integer chest;
	Integer bicep;
	Integer thigh;
        Integer bodyFatPercentage;
	static belongsTo = AuthUser;
	static optionals = ["height","weight","waist","chest","bicep","thigh"]
	
	static constraints = {
		height(blank:false)
		weight(blank:false)
		waist(blank:false)
		chest(blank:false)
		bicep(blank:false)
		thigh(blank:false)
	}
	
        String toHTML()
        {
             def writer = new StringWriter()
             def x = new groovy.xml.MarkupBuilder(writer)
             x.html{
                 head{
                     title("BioMetrics: ")
                 }
                 body{
                     h4("BioMetrics: ")
                 }
               }
        }

        // override the toString method
	String toString()
	{
		"BioMetrics \n" +
		" date: ${this.date}, \n" +
		" height: ${this.height}, \n" +
		" weight: ${this.weight}, \n" +
		" waist: ${this.waist} \n" +
		" chest: ${this.chest}, \n" +
		" thigh: ${this.thigh}"
	}
}
