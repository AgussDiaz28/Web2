$( document ).ready( function() {
	function ajaxMethods(JSdata,metodo,sfunction){		//Ajax POST parametrizado para hacer llamado a funciones de metodos
		$.ajax({
					data:JSdata,
					datatype: JSON,
					type:'POST',
					url: window.location.origin + window.location.pathname+metodo,
					success: sfunction
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

	function mostrarMensaje() {
		alert('mensaje')
	}

	function refreshVuelos(data){
			$( "#tvuelos" ).html( data ); 												// <Tbody> que contiene la tabla que muestra los vuelos
	}

	function cargar(data){
		$( "#main" ).html( data );															// <Div> donde se carga el contenido de las paginas
		//
		$('#BVuelo').on('click',function() {										//Ajax que llama a la funcion que refresca la tabla
				data = {
							destino: $('#CCiudades').val(),
							aerolinea: $('#CAerolineas').val(),
							fecha: $('#date').val()
				}
				ajaxMethods(data,'/actualizarVwVuelos','refreshVuelos')
		});

		$('#AAerolinea').on('click',function() { 									//Ajax que incerta una nueva Aerolinea a la BD
				JSdata = {
								NAerolinea: $('#NAerolinea').val()
				}
				ajaxMethods(JSdata,'/agregarAerolinea','mostrarMensaje');
		})

		$('#ACiudad').on('click',function() {  									//Ajax que incerta una nueva Ciudad a la BD
			JSdata = {
							NCiudad: $('#CCiudades').val()
			}
			ajaxMethods(JSdata,'/agregarCiudad','mostrarMensaje');
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
			ajaxMethods(JSdata,'/agregarVuelo','mostrarMensaje');
		})

		$(".deleteRow").on('click',function() {
			data = {
					vueloABorrar: $(this).attr('id'),
					NAerolinea: $('#NAerolinea').val(),
					NCiudad: $('#CCiudades').val()
			}

			ajaxMethods(data,'/borrarVuelo','refreshVuelos')
		})
	}

// ------------------- EVENTOS DE CARGA DE PAGINAS --------------------------- //

	$( "#home" ).on( "click", function(e) {
		e.preventDefault();
		render('#home','/home');
	} );

	$( "#vuelos" ).on( "click", function(e) {
		e.preventDefault();
		render("#vuelos",'/mostrarVuelos');
	});

	$( "#admin" ).on( "click", function(e) {
		e.preventDefault();
		render('#admin','/mostrarVuelos'); //mostrarAdmin
	});

// ------------------- EVENTOS DE CARGA DE PAGINAS --------------------------- //

});
