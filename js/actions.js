$( document ).ready( function() {

	function cargar(data){
	$( "#main" ).html( data );
	};

	function partialRender( pagina ) {
		//let v1 = 'templates/';
		//let result = v1.concat(pagina)
		result =  pagina.concat('.tpl');
		console.log(result);
		$.ajax( {
				dataType: "html",
				url: result,
				success: cargar
		} );
		$( "li" ).removeClass( "active" );
		$( "#" + pagina ).addClass( "active" );
	};

	$( "#home" ).on( "click", function() {
		partialRender( "home" );
	} );

	$( "#experiencias" ).on( "click", function() {
		partialRender( "experiencias" );
	} );

	$( "#paquetes" ).on( "click", function() {
		partialRender( "paquetes" );
	} );

	$( "#contacto" ).on( "click", function() {
		partialRender( "contacto" );
	} );


});
