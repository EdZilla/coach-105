
  

//grails.config.locations = [ "classpath:${appName}-BootStrap.groovy",
//                            "classpath:${appName}-config.groovy",
//                            "classpath:${appName}-dataSource.groovy",
//                            "file:${userHome}/.grails/${appName}-BootStrap.groovy",
//                            "file:${userHome}/.grails/${appName}-config.groovy",
//                            "file:${userHome}/.grails/${appName}-dataSource.groovy"]

       
 // locations to search for config files that get merged into the main config
// config files can either be Java properties files or ConfigSlurper scripts

// grails.config.locations = [ "classpath:${appName}-config.properties",
//                             "classpath:${appName}-config.groovy",
//                             "file:${userHome}/.grails/${appName}-config.properties",
//                             "file:${userHome}/.grails/${appName}-config.groovy"]

// if(System.properties["${appName}.config.location"]) {
//    grails.config.locations << "file:" + System.properties["${appName}.config.location"]
// }
grails.mime.file.extensions = true // enables the parsing of file extensions from URLs into the request format
grails.mime.types = [ html: ['text/html','application/xhtml+xml'],
                      xml: ['text/xml', 'application/xml'],
                      text: 'text-plain',
                      js: 'text/javascript',
                      rss: 'application/rss+xml',
                      atom: 'application/atom+xml',
                      css: 'text/css',
                      csv: 'text/csv',
                      all: '*/*',
                      json: ['application/json','text/json'],
                      form: 'application/x-www-form-urlencoded',
                      multipartForm: 'multipart/form-data'
                    ]
// The default codec used to encode data with ${}
grails.views.default.codec="none" // none, html, base64
grails.views.gsp.encoding="UTF-8"
grails.converters.encoding="UTF-8"

grails {
	   mail {
	     host = "smtp.gmail.com"
	     port = 465
	     username = "eddythejekyll@gmail.com"
	     password = "Skeeter1"
	     props = ["mail.smtp.auth":"true", 					   
	              "mail.smtp.socketFactory.port":"465",
	              "mail.smtp.socketFactory.class":"javax.net.ssl.SSLSocketFactory",
	              "mail.smtp.socketFactory.fallback":"false"]
	  } 
}

// enabled native2ascii conversion of i18n properties files
grails.enable.native2ascii = true

environments {
    //mapFilePath="c:/Documents and Settings/Ed Young/My Documents/My Pictures/Activities"
    mapFilePath="d:/temp/Activities"
    development {
        log4j {
            appender.'logfile.File' = "coach.log"
            appender.'stacktraceLog.File'="coachStacktrace.log"
           logger {
               grails {
                     app.controller="TRACE"
                     app.domain="TRACE"
//                   app.controller.LoginController="TRACE"
//                   app.controller.LogoutController="TRACE"
//                   app.controller.RegisterController="TRACE"
//                   app.controller.CaptchaController="TRACE"
//       	    	   app.controller.MealController="TRACE"
       	    	   //app.domain.Meal="TRACE"
               }
            }
       }
    }

     falcon {
        mapFilePath="/opt/data/images/activities"
    	//      set per-environment serverURL stem for creating absolute links
        grails.serverURL = "http://www.changeme.com"
       	log4j {
           appender.'logfile.File' = "/opt/data/logs/coach.log"
           appender.'stacktraceLog.File'="/opt/data/logs/coachStacktrace.log"
           logger {
               grails {
                   app.controller.LoginController="TRACE"
                   app.controller.LogoutController="TRACE"
       	    	   app.controller.MealController="TRACE"
       	    	   app.domain.Meal="TRACE"
               }
            }
       }
    }
    
    production {
        mapFilePath="/opt/data/images/activities"
    	//      set per-environment serverURL stem for creating absolute links
        grails.serverURL = "http://www.changeme.com"
       	log4j {
           appender.'logfile.File' = "/opt/data/logs/coach.log"
           appender.'stacktraceLog.File'="/opt/data/logs/coachStacktrace.log"
           logger {
               grails {
                   app.controller.LoginController="TRACE"
                   app.controller.LogoutController="TRACE"
       	    	   app.controller.MealController="TRACE"
       	    	   app.domain.Meal="TRACE"
               }
            }
       }
    }
}

// log4j configuration
log4j {
    appender.stdout = "org.apache.log4j.ConsoleAppender"
    appender.'stdout.layout'="org.apache.log4j.PatternLayout"
    appender.'stdout.layout.ConversionPattern'='[%r] %c{2} %m%n'
   
    appender.logfile = "org.apache.log4j.DailyRollingFileAppender "
    appender.'logfile.layout' = "org.apache.log4j.PatternLayout"
    appender.'logfile.layout.ConversionPattern' = '%d{[ dd.MM.yy HH:mm:ss.SSS]} [%t] %-5p %c %x - %m%n'
   
    appender.stacktraceLog = "org.apache.log4j.FileAppender"
    appender.'stacktraceLog.layout'="org.apache.log4j.PatternLayout"
    appender.'stacktraceLog.layout.ConversionPattern'='[%r] %c{2} %m%n'
    rootLogger="error,stdout,logfile"
    logger {
        grails="error"
        StackTrace="error,stacktraceLog"
        org {
            codehaus.groovy.grails.web.servlet="error"  //  controllers
            codehaus.groovy.grails.web.pages="error" //  GSP
            codehaus.groovy.grails.web.sitemesh="error" //  layouts
            codehaus.groovy.grails."web.mapping.filter"="error" // URL mapping
            codehaus.groovy.grails."web.mapping"="error" // URL mapping
            codehaus.groovy.grails.commons="info" // core / classloading
            codehaus.groovy.grails.plugins="error" // plugins
            codehaus.groovy.grails.orm.hibernate="error" // hibernate integration
            springframework="off"
            hibernate="off"
        }
    }
    additivity.StackTrace=false
}


  

// The following properties have been added by the Upgrade process...
grails.views.default.codec="none" // none, html, base64
grails.views.gsp.encoding="UTF-8"
