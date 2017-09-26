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

	function mostrarMensaje(data) {
		if (data.result === true) {
			alert('INSERTO')
		}else {
			alert('NO SE PUDO INSERTAR LA TUPLA')
		}
	}

	function refreshVuelos(data){
			$( "#tvuelos" ).html( data ); 												// <Tbody> que contiene la tabla que muestra los vuelos
	}

	function actualizarFiltro(){											//Ajax que llama a la funcion que refresca la tabla
			data = {
						destino:$('#CCiudades').val(),
						aerolinea: $('#CAerolineas').val(),
						fecha:$('#date').val()
			};
			ajaxMethods(data,'/actualizarVwVuelos',refreshVuelos)
	}

	function cargar(data){
		$( "#main" ).html( data );															// <Div> donde se carga el contenido de las paginas

		$('#AAerolinea').on('click',function() { 									//Ajax que incerta una nueva Aerolinea a la BD
				JSdata = {
								NAerolinea: $('#NAerolinea').val()
				}
				ajaxMethods(JSdata,'/agregarAerolinea',mostrarMensaje);
		})

		$('#ACiudad').on('click',function() {  									//Ajax que incerta una nueva Ciudad a la BD
			JSdata = {
							NCiudad: $('#CCiudades').val()
			}
			ajaxMethods(JSdata,'/agregarCiudad',mostrarMensaje);
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
			ajaxMethods(JSdata,'/agregarVuelo',mostrarMensaje);
		})

		$(".deleteRow").on('click',function() {
			let vueloABorrar = $(this).attr('id');
			$.ajax({
						data: vueloABorrar,
						type:'POST',
						url: window.location.origin + window.location.pathname+'/borrarVuelo'+'/'+vueloABorrar,
						success: actualizarFiltro
			})
			// ajaxMethods(data,'/borrarVuelo',refreshVuelos)
		})

		$('#CCiudades').on('change',function(){
			actualizarFiltro();
		})
		$('#CAerolineas').on('change',function(){
			actualizarFiltro();
		})
	}
	//emprolijar esta parte junto a lo de arriba

// ------------------- EVENTOS DE CARGA DE PAGINAS --------------------------- //

	$( "#home" ).on( "click", function(e) {
		e.preventDefault();
		render('#home','/home');
	} );

	$( "#vuelos" ).on( "click", function(e) {
		e.preventDefault();
		render("#vuelos",'/vuelos');

	});

	$( "#admin" ).on( "click", function(e) {
		e.preventDefault();
		render('#admin','/admin');
	});

// ------------------- EVENTOS DE CARGA DE PAGINAS --------------------------- //


});
