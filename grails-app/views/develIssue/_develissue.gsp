<!-- this is the develissue template -->
<div id="develissue">
 
	
	<div id="description">
		<g:editInPlace id="description${develissue.id}"
			url="[action:'updateDescription',id:develissue.id]"
			rows="5"
			cols= "10"
			paramName="description">${develissue.description}</g:editInPlace>
	</div>
</div>