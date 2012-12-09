<!-- this is the meal template -->

<!-- this is the meal editInPlace template -->
<div id="meal">
 	
	<div id="description">
		<g:editInPlace id="description${meal.id}"
			url="[action:'updateDescription',id:meal.id]"
			rows="5"
			cols= "10"
			paramName="description">${meal.description}</g:editInPlace>
	</div>
</div>