master branch of 12-8-2012 is the original grails 1.0.5 version. 

Very old grails app, but works from command line (grails run-app) 

Main problem with upgrading seems to be acegi (now SpringSecurity)
here is beckwith's migration docs: 
http://grails-plugins.github.com/grails-spring-security-core/docs/manual/guide/3%20Migrating%20from%20the%20Acegi%20Plugin.html

See upgradeExp branch for that work. 

Courses and equipment tables seem to be ok with coach_acegi2_prod-12-9-2012.sql

