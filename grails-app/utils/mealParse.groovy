def meals = new XmlParser().parse(new File('grails-app/conf/meal.xml'))

assert 'meals' == meals.name()
assert 'meal' == meals.meal[0].name()
assert 'food' == meals.meal[0].food[0].name()
//assert 'pizza' == meals.meal[0].food[0].value()
println("meal stuff: " + meals);
println("meal stuff: " + meals.meal[0]);
println("meal stuff: " + meals.meal[0].food[0]);
println("meal stuff value: " + meals.meal[0].food[0].name);
println("meal stuff value: " + meals.meal[0].food[0].description);

import groovy.xml.StreamingMarkupBuilder
def path = new XmlSlurper().parse(new File('grails-app/conf/meal.xml'))
def builder = new StreamingMarkupBuilder()
def copier = builder.bind{ mkp.yield(path) }
def result = "$copier"
assert result.startsWith('<meals><meal>')
assert result.endsWith('</meal></meals>')

//assert 'task' == meal.food[0].name()
//assert 'read XML chapter' == plan.week[0].task[0].'@title'