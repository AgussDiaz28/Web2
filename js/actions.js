$( document ).ready( function() {
	// **************MUSTACHE*****************

	let templateComentarios;
	$.ajax({ url: 'js/templates/comentarios.mst'}).done( template => templateComentarios = template);

	//***************FUNCIONES****************

	//---------Funciones General----------

	function ajaxMethods(JSdata,metodo,sfunction){		//Ajax POST parametrizado para hacer llamado a funciones de metodos
		$.ajax({
			data:JSON.stringify(JSdata),
			type:'POST',
			url: window.location.origin + window.location.pathname + metodo,
			success: sfunction
		})
	}

	function render(pagina,metodo){  	//Ajax para carga de Paginas
		$.ajax({
			type:'GET',
			url: window.location.origin + window.location.pathname+metodo,
			success: cargar
		});
		$( "li" ).removeClass( "active" );
		$(pagina).addClass( "active" );
	}

	//---------Funciones Aerolinea----------

	//----------- ABM Aerolinea -----------
	function addAerolinea(){
		data = llenarJSA();
		ajaxMethods(data,'/agregarAerolinea',refreshAerolineas);
		limpiarFormularioAerolineas();
	}

	function deleteAerolinea(thisElement){
		data = {
			aerolineaABorrar : $(thisElement).attr('id')
		}
		ajaxMethods(data,'/deteleAerolinea',refreshAerolineas);
	}

	function editAerolinea(thisElement){
		let AerolineaAEditar = $(thisElement).attr('id');
		let codigo = $(thisElement).closest('tr').find('.rdata')
		llenarFormularioAerolinea(codigo);
		$('#AAerolinea').off('click');
		$('#AAerolinea').on('click',function() {
			data = llenarJSA();	//LLENA EL JSON CON LOS VALORS DEL FORMULARIO DE AEROLINEA
			data.IDAerolinea=AerolineaAEditar;
			ajaxMethods(data,'/modificarAerolinea',refreshAerolineas);
			limpiarFormularioAerolineas();
			$('#AAerolinea').off('click');
			$('#AAerolinea').on('click',function(){
				addAerolinea();
			});
		});
	}

	//----------- /FIN ABM Aerolinea -----------

	function llenarFormularioAerolinea(codigo){
			$('#NAerolinea').val(codigo.prevObject[0].cells[0].innerHTML);
		  $('#PAerolinea').val(codigo.prevObject[0].cells[1].innerHTML);
	 		$('#CAerolinea').val(codigo.prevObject[0].cells[2].innerHTML);
	}

	function refreshAerolineas(data){ //Refresh de la tabla Aerolineas
		$('#tAerolinea').html(data);

		$('.deleteAerolineaRow').on('click',function(){
			deleteAerolinea(this);
		});

		$('.editAerolienaRow').on('click',function(){
			editAerolinea(this);
		})
	}

	function limpiarFormularioAerolineas(){ //Limpia el formulario de Aerolinas despues de Agregar o modificar una tupla
		$('#NAerolinea').val('');
		$('#PAerolinea').val('');
		$('#CAerolinea').val('');
	}

	function llenarJSA(){
		data = {
						NAerolinea: $('#NAerolinea').val(),
						PAerolinea: $('#PAerolinea').val(),
						CAerolinea: $('#CAerolinea').val(),
		}
		return data;
	}; //Crea JSON con los datos de Aerolineas

	//---------Funciones Ciudad----------

	//----------- ABM Ciudad -----------

	function addCiudad(){
		JSdata = {
			NCiudad: $('#NCiudad').val()
		}
		ajaxMethods(JSdata,'/agregarCiudad',actualizarTablaCiudades);
		NCiudad: $('#NCiudad').val(""); //limpio el input
	}

	function borrarCiudad(thisElement){
		data = {
			ciudadABorrar : $(thisElement).attr('id')
		}
		ajaxMethods(data,'/borrarCiudad',actualizarTablaCiudades);
	}

	function editarCiudad(thisElement){
		let ciudadAEditar = $(thisElement).attr('id');
		let nombreCiudad = $(thisElement).closest('tr').find('.ciudad').text();
		$('#NCiudad').val(nombreCiudad); //cargo formulario con el nombre de la ciudad a modificar
		$('#ACiudad').off('click');
		$('#ACiudad').on('click',function() {
			JSdata = {
				NCiudad: $('#NCiudad').val()
			}
			ajaxMethods(JSdata,'/modificarCiudad/'+ciudadAEditar,actualizarTablaCiudades);
			NCiudad: $('#NCiudad').val(""); //limpio el input
			$('#NCiudad').val(""); //limpio el formulario de ciudad
			$('#ACiudad').off('click');
			$('#ACiudad').on('click',function(){
				addCiudad();
			});
		});
	}

	//----------- /FIN ABM Ciudad -----------

	function actualizarTablaCiudades(data){		//Ajax que llama a la funcion que refresca la tabla
		$("#tciudades").html(data);

		$('.editCityRow').on('click',function() {  			//Ajax que edita una Ciudad de la BD
			editarCiudad(this);
		})

		$('.deleteCityRow').on('click',function() {  			//Ajax que elimina una Ciudad de la BD
			borrarCiudad(this);
		})
	}

	//---------Funciones Vuelo----------

	//----------- ABM Vuelo -----------

	function addVuelo(){
		JSdata = {
			CVuelo: $('#CVuelo').val(),
			SNAerolinea: $('#SNAerolinea').val(),
			SCOrigen: $('#SCOrigen').val(),
			SCDestino: $('#SCDestino').val(),
			FSVuelo: $('#FSV').val(),
			PVuelo: $('#PVuelo').val()
		}
		ajaxMethods(JSdata,'/agregarVuelo',actualizarFiltro);
		limpiarFormulario();
	}	// AGREGA VUELOS

	function eliminarVuelo(thisElement){
		let vueloABorrar = $(thisElement).attr('id');
		$.ajax({
					data: vueloABorrar,
					type:'POST',
					url: window.location.origin + window.location.pathname+'/borrarVuelo'+'/'+vueloABorrar,
					success: actualizarFiltro
		})
	}

	function editarVuelo(thisElement){
		let vueloAEditar = $(thisElement).attr('id');
		let id_vuelo = $(thisElement).attr("id");
		let codigo = $(thisElement).closest('tr').find('.rdata').map(function () {
				return $(thisElement).val();
	  	});
	  	llenarFormulario(codigo);

		$('#AVuelo').off('click'); //desbindeo el evento de add
		$('#AVuelo').on('click',function() { //bindeo evento de modificar
			JSdata = {
				CVuelo: $('#CVuelo').val(),
				SNAerolinea: $('#SNAerolinea').val(),
				SCOrigen: $('#SCOrigen').val(),
				SCDestino: $('#SCDestino').val(),
				FSVuelo: $('#FSV').val(),
				PVuelo: $('#PVuelo').val()
			}
			ajaxMethods(JSdata, '/actualizarVuelo/' + id_vuelo, actualizarFiltro);
			limpiarFormulario();
			$('#AVuelo').off('click'); //desbindeo evento modificar
			$('#AVuelo').on('click',function(){
				addVuelo();
			}) //vuelvo a bindear evento add
		})
	}

	//----------- /FIN ABM Vuelo -----------

	function refreshVuelos(data){ //Refresa la tabla de vuelos y blinde de nuevo los eventos

		$( "#tvuelos" ).html( data );		// <Tbody> que contiene la tabla que muestra los vuelos

		$(".deleteRow").on('click',function() {
			eliminarVuelo(this);
		})

		$(".editRow").on('click',function() {
			editarVuelo(this);
		});
	}

	function actualizarFiltro(){		//Ajax que llama a la funcion que refresca la tabla de los VUELOS
		data = {
			destino:$('#CCiudades').val(),
			aerolinea: $('#CAerolineas').val(),
			fecha:$('#date').val()
		};
		ajaxMethods(data,'/actualizarVwVuelos',refreshVuelos)
	}

	function limpiarFormulario(){
		$('#CVuelo').val('');
		$('#SNAerolinea').val('');
		$('#SCOrigen').val('');
		$('#SCDestino').val('');
		$('#FSV').val('');
		$('#PVuelo').val('');
	}

	function llenarFormulario(codigo){ //LLENA FORMULARIO DE VUELOS PARA EDITARLO
		codigoA = codigo.prevObject[0].attributes[1].value;
		aerolinea = codigo.prevObject[1].attributes[1].value;
		origen = codigo.prevObject[2].attributes[1].value;
		destino = codigo.prevObject[3].attributes[1].value;
		fecha = codigo.prevObject[4].attributes[1].value;
		pvuelo = codigo.prevObject[5].attributes[1].value;

		$('#CVuelo').val(codigoA);
		$('#SNAerolinea').val(aerolinea);
		$('#SCOrigen').val(origen);
		$('#SCDestino').val(destino);
		$('#FSV').val(fecha);
		$('#PVuelo').val(pvuelo)
	}

	function actualizarComentarios(IDAerolinea){ //Trae todos los comentarios de la aerolinea correspondiente
		$.ajax({
			type:'GET',
			url: window.location.origin + window.location.pathname+"/api/comentario/"+IDAerolinea,
			success: cargarComentarios
		});
	}

	function cargarComentarios(data){
		let rendered = Mustache.render(templateComentarios , data);
		$('#comentariosHolder').html(rendered);

		let IDAerolinea = $('#ANComentario').attr('dvalue');

		$('#ANComentario').on('click',function(e){
			e.preventDefault();
			JSdata = {
				descripcion : $('#NComentario').val(),
				id_aerolinea : IDAerolinea,
			}
			console.log(JSdata);
			ajaxMethods(JSdata,'/api/comentario');
			actualizarComentarios(IDAerolinea);
		})

		$('#deleteComentario').on('click',function() {
			$.ajax({
				type:'DELETE',
				url: window.location.origin + window.location.pathname + "/api/comentario/" + IDAerolinea,
			})
			actualizarComentarios(IDAerolinea);
		})
	}

	function autoRefresh(){
		let IDAerolinea = $('.comentAerolinea').attr('id');
		actualizarComentarios(IDAerolinea);
	}
	// ----------------- CARGAR PAGINA / ******* EVENTOS ********* ---------------------
	function cargar(data){
		$( "#main" ).html( data );	// <Div> donde se carga el contenido de las paginas

		$('#comentariosHolder').hide();

		$('.comentAerolinea').on('click',function(){
			$('#comentariosHolder').show();
			let IDAerolinea = $(this).attr('id');
			$('#ANComentario').attr('dvalue',IDAerolinea);
			actualizarComentarios(IDAerolinea)
			// setInterval(autoRefresh,2000); // No puedo hacer que refresque correctamente con el id correspondiente
		});

		// -------------------------------------------------- AEROLINEAS ----------------------------------------------

		$('#AAerolinea').on('click',function(){ 		//Ajax que incerta una nueva Aerolinea a la BD
			addAerolinea();
		});

		$('.deleteAerolineaRow').on('click',function(){
			deleteAerolinea(this);
		});

		$('.editAerolienaRow').on('click',function(){
			editAerolinea(this);
		})

		// ----------------------------------------------------------- CIUDADES ------------------------------------------------------
		$('#ACiudad').on('click',function() {  			//Ajax que incerta una nueva Ciudad a la BD
			addCiudad();
		})

		$('.editCityRow').on('click',function() {  			//Ajax que edita una Ciudad de la BD
			editarCiudad(this);
		})

		$('.deleteCityRow').on('click',function() {  			//Ajax que elimina una Ciudad de la BD
			borrarCiudad(this);
		})

		// ---------------------------------------------------------- VUELOS ------------------------------------------------------
		$('#AVuelo').on('click',function(){
			addVuelo();
		})  	//Ajax que incerta un nuevo vuelo a la BD

		$(".deleteRow").on('click',function() {
			eliminarVuelo(this);
		})

		$(".editRow").on('click',function() {
			editarVuelo(this);
		});



		// ---------------------------------------------------------- FILTRO DE VUELOS ------------------------------------------------------

		$('#CCiudades').on('change',function(){
			actualizarFiltro();
		});
		$('#CAerolineas').on('change',function(){
			actualizarFiltro();
		});

	} // FINALIZA LA FUNCION CARGAR


	// ------------------- EVENTOS DE CARGA DE PAGINAS --------------------------- //

	$( "#home" ).on( "click", function(e) {
		e.preventDefault();
		render('#home','/home');
	} );

	$( "#vuelos" ).on( "click", function(e) {
	e.preventDefault();
	render("#vuelos",'/pvuelos');
	});

	$( "#ciudades" ).on( "click", function(e) {
	e.preventDefault();
	render("#ciudades",'/pciudades');
	});

	$( "#aerolineas" ).on( "click", function(e) {
	e.preventDefault();
	render("#aerolineas",'/paerolineas');
	});

	$( "#LogIn" ).on( "click", function(e) {
	e.preventDefault();
	render('#LogIn','/LogIn');
	});

	$( "#SignUp" ).on( "click", function(e) {
	e.preventDefault();
	render('#SignUp','/SignUp');
	});

	// ------------------- /FIN EVENTOS DE CARGA DE PAGINAS --------------------------- //


});
