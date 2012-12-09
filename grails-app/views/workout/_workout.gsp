<!-- this is the workout template -->
<div id="workout">
 	
	<div id="description">
		<g:editInPlace id="description${workout.id}"
			url="[action:'updateDescription',id:workout.id]"
			rows="5"
			cols= "10"
			paramName="description">${workout.description}</g:editInPlace>
	</div>
</div>