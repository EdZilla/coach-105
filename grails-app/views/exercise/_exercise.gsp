<!-- this is the exercise template -->
<div id="exercise">
 	
	<div id="description">
		<g:editInPlace id="description${exercise.id}"
			url="[action:'updateDescription',id:exercise.id]"
			rows="5"
			cols= "10"
			paramName="description">${exercise.description}</g:editInPlace>
	</div>
</div>