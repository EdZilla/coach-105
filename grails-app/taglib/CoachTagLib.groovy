class CoachTagLib {
	Writer out
	
	def repeat = { attrs, body ->
			attrs.times?.toInteger().times {
				out << body(it)
		}
	}
	
	/* I got this from the Contribute a tag:
	 * http://grails.org/Contribute+a+Tag#ContributeaTag-imageTag
	 */
	/*
	   src is the path to the image within the images directory
	 	<g:image src="grails_logo.jpg" alt="foo" title="bar" />
	 	If you pass in the code attribute it will use that to create
	 	an alt and title attribute pulled from your i18n messages.
	 	This will supercede any alt or title attributes that you
	 	have manually passed in.
	 	The code attribute is the only case where it will escape quotes
	 	in your attribute's contents.
	 */
	 def image = {attrs ->
	 	log.trace("Executing CoachTagLib image action: $actionName with params: $params, attrs: $attrs")
	 	//println(<g:meta name="app.activities.filepath"/>)
	 	def src = attrs.remove('src');
	 	
	 	def imageString = "<img src=\"${grailsApplication.config.mapFilePath}/${src}\"";
	 	
	 	//	def imageString = "<img src=\"${grailsAttributes.getApplicationUri(request)}/images/user/${src}\"";
	 	//  def imageString = "<img src=\"${grails.app.domain.Course.mapFilePath}/${src}\"";
	 	println("imageString is " + imageString)
	 	def newAttrs = [:];
	 	for (key in attrs.keySet()){
	 		if (key != 'code'){
	 			newAttrs[key] = attrs[key];
	 		}
	 	}
	 	if(attrs['code']) {
	 		def messageSource = grailsAttributes
				.getApplicationContext()
				.getBean("messageSource");
			def locale = RCU.getLocale(request);
			def code = attrs['code']
			def message = messageSource.getMessage( code, null, null, locale );
			if(message) {
				newAttrs['alt'] = message.replaceAll("\"", "\\\\\"");
				newAttrs['title'] = message.replaceAll("\"", "\\\\\"");
			} else {
				newAttrs['alt'] = code;
				newAttrs['title'] = code;
			}
	 	}

	 	for (key in newAttrs.keySet()){
	 		imageString += " ${key}=\"${newAttrs[key]}\"";
	 	}

	 	imageString += " />";
	 	out << imageString;
	 }


	
    def video = { attrs ->
		       if (! attrs.url || ! attrs.width || ! attrs.height) {
		           throw new IllegalArgumentException("Missing url, width or height in video tag!")
		       }

		       out << """
		           <object width="${attrs.width}" height=${attrs.height}">
		               <param name="movie" value="${attrs.url}"></param>
		               <param name="wmode" value="transparent"></param>
		               <embed src="${attrs.url}"
		               type="application/x-shockwave-flash" wmode="transparent"
		               width="${attrs.width}" height="${attrs.height}"></embed>
		           </object>
		       """
	}

	
	def editInPlace = { attrs, body ->
		def rows = attrs.rows ? attrs.rows : 0;
		def cols = attrs.cols ? attrs.cols : 0;
		def id = attrs.remove('id')
		out << "<span id='${id}'>"
		out << body()
		out << "</span>"
		out << "<script type='text/javascript'>"
		out << "new Ajax.InPlaceEditor('${id}', '"
		out << createLink(attrs)
		out << "',{"
			if(rows)
				out << "rows:${rows},"
				if(cols)
					out << "cols:${cols},"
					if(attrs.paramName) {
						out <<  "callback: function(form, value) { return '${attrs.paramName}=' + escape(value) }"
					}
					out << "});"
					out << "</script>"
		}
	}
