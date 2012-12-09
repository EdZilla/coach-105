import grails.converters.*;

class Course {
	String name;
	String location;
	String description = "Click here to enter description"
	/** path to the map images. */
	static String mapFilePath;
	/*
	 * Map is a jpg or gif or something. 
	 */
	String map; 
	/*
	 *  profile is an image of the terain profile
	 */
	String profile;
	Float distance
	Integer baseElevation
	Integer maxElevation
	
	def geocoderService
	
	static constraints = {
		name(maxLength:50,blank:false)		
		description(maxLength:512,blank:false)
		location(maxLength:50,blank:false)		
		distance(blank:true)		
		baseElevation(blank:true)
		maxElevation(blank:true)
		map(blank:true)
	}
	
	def geocode = {
	    def result = geocoderService.geocodeAirport(params.iata)
	    render result as JSON
    }  

	
	String toString(){"Course \n" +
		" name: ${this.name}, \n" +
		" dist: ${this.distance}, \n"}
}
	