$( document ).ready( function() {
	function ajaxMethods(JSdata,metodo){
		$.ajax({
					data:JSdata,
					datatype: JSON,
					type:'POST',
					url: window.location.origin + window.location.pathname+metodo,
					success: mostrarMensaje
		})
	}
	function mostrarMensaje(){
		alert('mensaje')
	}

	function refreshVuelos(data){
			$( "#tvuelos" ).html( data ); 												// <Tbody> que contiene la tabla que muestra los vuelos
	}

	function cargar(data){
		$( "#main" ).html( data );															// <Div> donde se carga el contenido de las paginas
		//
		$('#BVuelo').on('click',function() {										//Ajax que llama a la funcion que refresca la tabla
				$.ajax({
								data:{
											destino: $('#CCiudades').val(),
											aerolinea: $('#CAerolineas').val(),
											fecha: $('#date').val()
								},
								type:'POST',
								url: window.location.origin + window.location.pathname+'/actualizarVwVuelos',
								success: refreshVuelos
				});
		});

		$('#AAerolinea').on('click',function() { 									//Ajax que incerta una nueva Aerolinea a la BD
				JSdata:{
								NAerolinea: $('#NAerolinea').val()
				}
				ajaxMethods(JSdata,'/CargarAerolinea');
		})

		$('#ACiudad').on('click',function() {  									//Ajax que incerta una nueva Ciudad a la BD
			JSdata:{
							NCiudad: $('#NAerolinea').val()
			}
			ajaxMethods(JSdata,'/CargarCiudad');
		})

		$('#AVuelo').on('click',function() {  									//Ajax que incerta un nuevo vuelo a la BD
			JSdata = {
							CVuelo: $('#CVuelo').val(),
							SNAerolinea: $('#SNAerolinea').val(),
							SCOrigen: $('#SCOrigen').val(),
							SCDestino: $('#SCDestino').val(),
							FSVuelo: $('#FSV').val(),
							PVuelo: $('#PVuelo').val(),
			}
			console.log(JSdata);
			ajaxMethods(JSdata,'/CargarVuelo');
		})
	}

	function render(pagina,metodo){  									//Ajax para carga de Paginas
		$.ajax({
			type:'GET',
			url: window.location.origin + window.location.pathname+metodo,
			success: cargar
 		});
		$( "li" ).removeClass( "active" );
		$(pagina).addClass( "active" );


	}

// ------------------- EVENTOS DE CARGA DE PAGINAS --------------------------- //

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

// ------------------- EVENTOS DE CARGA DE PAGINAS --------------------------- //

});
