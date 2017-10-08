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

function render(pagina,metodo){  	//Ajax para carga de Paginas
	$.ajax({
		type:'GET',
		url: window.location.origin + window.location.pathname+metodo,
		success: cargar
	});
	$( "li" ).removeClass( "active" );
	$(pagina).addClass( "active" );
}

function llenarFormularioAerolinea(codigo){
		$('#NAerolinea').val(codigo.prevObject[0].cells[0].innerHTML);
	  $('#PAerolinea').val(codigo.prevObject[0].cells[1].innerHTML);
 		$('#CAerolinea').val(codigo.prevObject[0].cells[2].innerHTML);
}

function refreshAerolineas(data){ //Refresh de la tabla Aerolineas
	$('#tAerolinea').html(data);

	$('#AAerolinea').on('click',function(){ 		//Ajax que incerta una nueva Aerolinea a la BD
		data = llenarJSA();
		ajaxMethods(data,'/agregarAerolinea',refreshAerolineas);
		limpiarFormularioAerolineas();
	});

	$('.deleteAerolineaRow').on('click',function(){
			data = {
				aerolineaABorrar : $(this).attr('id')
			}
			ajaxMethods(data,'/deteleAerolinea',refreshAerolineas);
	});

	$('.editAerolienaRow').on('click',function(){
		let AerolineaAEditar = $(this).attr('id');
		let codigo = $(this).closest('tr').find('.rdata')
		llenarFormularioAerolinea(codigo);
		$('#AAerolinea').unbind('click');
		$('#AAerolinea').on('click',function() {
			data = llenarJSA();	//LLENA EL JSON CON LOS VALORS DEL FORMULARIO DE AEROLINEA
			data.IDAerolinea=AerolineaAEditar;
			ajaxMethods(data,'/modificarAerolinea',refreshAerolineas);
			limpiarFormularioAerolineas();
		});
		$('#AAerolinea').unbind('click'); //desbindeo evento modificar
		$('#AAerolinea').bind('click',function(){
			data = llenarJSA(); 	//LLENA EL JSON CON LOS VALORS DEL FORMULARIO DE AEROLINEA
			ajaxMethods(data,'/modificarAerolinea',refreshAerolineas);
			limpiarFormularioAerolineas();
		})
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

function mostrarMensaje(data) {
	if (data.result == true) {
		alert('INSERTO');
	}else {
		alert('NO SE PUDO INSERTAR LA TUPLA');
	}
}

function refreshVuelos(data){ //Refresa la tabla de vuelos y blinde de nuevo los eventos

	$( "#tvuelos" ).html( data );		// <Tbody> que contiene la tabla que muestra los vuelos

	$(".deleteRow").on('click',function() {
		let vueloABorrar = $(this).attr('id');
		$.ajax({
					data: vueloABorrar,
					type:'POST',
					url: window.location.origin + window.location.pathname+'/borrarVuelo'+'/'+vueloABorrar,
					success: actualizarFiltro
		})
	})

	$(".editRow").on('click',function() {
		let vueloAEditar = $(this).attr('id');
		let id_vuelo = $(this).attr("id");
		let codigo = $(this).closest('tr').find('.rdata').map(function () {
				return $(this).val();
	  	});
	  	llenarFormulario(codigo);

		$('#AVuelo').unbind('click'); //desbindeo el evento de add
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

			$('#AVuelo').unbind('click'); //desbindeo evento modificar
			$('#AVuelo').bind('click',function(){
				addVuelo();
			}) //vuelvo a bindear evento add

			limpiarFormulario();
		})

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
}	// AGREGA VUELOS


	function addCiudad(){
		JSdata = {
			NCiudad: $('#NCiudad').val()
		}
		ajaxMethods(JSdata,'/agregarCiudad',actualizarTablaCiudades);
	}

	function editarCiudad(thisElement){
		let ciudadAEditar = $(thisElement).attr('id');
		let nombreCiudad = $(thisElement).closest('tr').find('.ciudad').text();
		$('#NCiudad').val(nombreCiudad); //cargo formulario con el nombre de la ciudad a modificar
		$('#ACiudad').unbind('click');
		$('#ACiudad').on('click',function() {
			alert("aca no entro");
			JSdata = {
				NCiudad: $('#NCiudad').val()
			}
			ajaxMethods(JSdata,'/modificarCiudad/'+ciudadAEditar,actualizarTablaCiudades);
			$('#NCiudad').val(""); //limpio el formulario de ciudad
		});
		$('#ACiudad').unbind('click');
		$('#ACiudad').on('click',function(){
			addCiudad();
		});
	}

	function borrarCiudad(thisElement){
		data = {
			ciudadABorrar : $(thisElement).attr('id')
		}
		ajaxMethods(data,'/borrarCiudad',actualizarTablaCiudades);
	}

	function actualizarTablaCiudades(data){		//Ajax que llama a la funcion que refresca la tabla
		$("#tciudades").html(data);

		$('.editCityRow').on('click',function() {  			//Ajax que edita una Ciudad de la BD
			editarCiudad(this);
		})

		$('.deleteCityRow').on('click',function() {  			//Ajax que elimina una Ciudad de la BD
			borrarCiudad(this);
		})
	}


// ----------------- CARGAR PAGINA ---------------------
function cargar(data){
	$( "#main" ).html( data );	// <Div> donde se carga el contenido de las paginas

	// -------------------------------------------------- AEROLINEAS ----------------------------------------------

	$('#AAerolinea').on('click',function(){ 		//Ajax que incerta una nueva Aerolinea a la BD
		data = llenarJSA();
		ajaxMethods(data,'/agregarAerolinea',refreshAerolineas);
		limpiarFormularioAerolineas();
	});

	$('.deleteAerolineaRow').on('click',function(){
			data = {
				aerolineaABorrar : $(this).attr('id')
			}
			ajaxMethods(data,'/deteleAerolinea',refreshAerolineas);
	});

	$('.editAerolienaRow').on('click',function(){
		let AerolineaAEditar = $(this).attr('id');
		let codigo = $(this).closest('tr').find('.rdata')
		llenarFormularioAerolinea(codigo);
		$('#AAerolinea').unbind('click');
		$('#AAerolinea').on('click',function() {
			data = llenarJSA();	//LLENA EL JSON CON LOS VALORS DEL FORMULARIO DE AEROLINEA
			data.IDAerolinea=AerolineaAEditar;
			console.log(data);
			ajaxMethods(data,'/modificarAerolinea',refreshAerolineas);
			limpiarFormularioAerolineas();
		});
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
		let vueloABorrar = $(this).attr('id');
		$.ajax({
					data: vueloABorrar,
					type:'POST',
					url: window.location.origin + window.location.pathname+'/borrarVuelo'+'/'+vueloABorrar,
					success: actualizarFiltro
		})
		// ajaxMethods(data,'/borrarVuelo',refreshVuelos)
	})

	$(".editRow").on('click',function() {
		let vueloAEditar = $(this).attr('id');
		let codigo = $(this).closest('tr').find('.rdata').map(function () {
				return $(this).val();
	  	});
	  	llenarFormulario(codigo);

		$('#AVuelo').unbind('click'); //desbindeo el evento de add
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

			$('#AVuelo').unbind('click'); //desbindeo evento modificar
			$('#AVuelo').on('click',function(){
				addVuelo();
			}) //vuelvo a bindear evento add

			limpiarFormulario();
		})

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

// ------------------- EVENTOS DE CARGA DE PAGINAS --------------------------- //


});
