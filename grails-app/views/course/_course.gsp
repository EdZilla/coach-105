<!-- this is the course template -->
<div id="course">
 	
	<div id="description">
		<g:editInPlace id="description${course.id}"
			url="[action:'updateDescription',id:course.id]"
			rows="5"
			cols= "10"
			paramName="description">${course.description}</g:editInPlace>
	</div>
</div>