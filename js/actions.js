$( document ).ready( function() {

	function loadVuelos(data){
			$( "#tvuelos" ).html( data );
	}


	function cargar(data){
		$( "#main" ).html( data );

		$('#BVuelo').on('click',function() {
			$.ajax({
							data:{
										destino: $('#CCiudades').val(),
										aerolinea: $('#CAerolineas').val(),
										fecha: $('#date').val()
							},
							type:'POST',
							url: window.location.origin + window.location.pathname+'/actualizarVwVuelos',
							success: loadVuelos
			});
		});
	}

	function render(pagina,metodo){
		$.ajax({
			type:'GET',
			url: window.location.origin + window.location.pathname+metodo,
			success: cargar
 		});
		$( "li" ).removeClass( "active" );
		$(pagina).addClass( "active" );


	}

	$( "#home" ).on( "click", function(e) {
		e.preventDefault();
		render('#home','/mostrarHome');
	} );

	$( "#vuelos" ).on( "click", function(e) {
		e.preventDefault();
		render("#vuelos",'/mostrarVuelos');

	});

	$( "#admin" ).on( "click", function(e) {
		e.preventDefault();
		render('#admin','/adminABM');
	});

});
