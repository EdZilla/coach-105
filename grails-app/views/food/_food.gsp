<!-- this is the food template -->
<div id="food">
 	
	<div id="description">
		<g:editInPlace id="description${food.id}"
			url="[action:'updateDescription',id:food.id]"
			rows="5"
			cols= "10"
			paramName="description">${food.description}</g:editInPlace>
	</div>
</div>