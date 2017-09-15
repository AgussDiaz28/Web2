$( document ).ready( function() {

	function cargar(data){
	$( "#main" ).html( data );
	};

	function partialRender( pagina ) {
		//let v1 = 'templates/';
		//let result = v1.concat(pagina)
		console.log("entro");
		//result =  pagina.concat('.tpl');
		$.ajax({
			type:'GET',
			url:'http://localhost:8888/projects/web2-P1/mostrarHome', //FINDLOCATION JS
			success: cargar
 		});



		$( "li" ).removeClass( "active" );
		$( "#" + pagina ).addClass( "active" );
	};

	$( "#home" ).on( "click", function(e) {
		e.preventDefault();
		partialRender( "home" );
	} );

	$( "#experiencias" ).on( "click", function() {
		e.preventDefault();
		partialRender( "experiencias" );
	} );

	$( "#paquetes" ).on( "click", function() {
		e.preventDefault();
		partialRender( "paquetes" );
	} );

	$( "#contacto" ).on( "click", function() {
		e.preventDefault();
		partialRender( "contacto" );
	} );


});
