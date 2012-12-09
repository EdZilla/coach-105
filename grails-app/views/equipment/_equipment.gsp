<!-- this is the equipment template -->
<div id="equipment">
 	
	<div id="description">
		<g:editInPlace id="description${equipment.id}"
			url="[action:'updateDescription',id:equipment.id]"
			rows="5"
			cols= "10"
			paramName="description">${equipment.description}</g:editInPlace>
	</div>
</div>