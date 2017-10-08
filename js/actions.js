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

function refreshAerolineas(){
	
}

function mostrarMensaje(data) {
	if (data.result == true) {
		alert('INSERTO');
	}else {
		alert('NO SE PUDO INSERTAR LA TUPLA');
	}
}

function refreshVuelos(data){
	$( "#tvuelos" ).html( data );		// <Tbody> que contiene la tabla que muestra los vuelos
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
				add();
			}) //vuelvo a bindear evento add

			limpiarFormulario();
		})

	});
}

function actualizarFiltro(){		//Ajax que llama a la funcion que refresca la tabla
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

function llenarFormulario(codigo){
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

function add(){
	JSdata = {
		CVuelo: $('#CVuelo').val(),
		SNAerolinea: $('#SNAerolinea').val(),
		SCOrigen: $('#SCOrigen').val(),
		SCDestino: $('#SCDestino').val(),
		FSVuelo: $('#FSV').val(),
		PVuelo: $('#PVuelo').val()
	}
	ajaxMethods(JSdata,'/agregarVuelo',actualizarFiltro);
}

function cargar(data){
$( "#main" ).html( data );	// <Div> donde se carga el contenido de las paginas

$('#AAerolinea').on('click',function() { 		//Ajax que incerta una nueva Aerolinea a la BD
	JSdata = {
					NAerolinea: $('#NAerolinea').val(),
					PAerolinea: $('#PAerolinea').val(),
					CAerolinea: $('#CAerolinea').val(),
	}
	ajaxMethods(JSdata,'/agregarAerolinea',refreshAerolineas);
})

$('#ACiudad').on('click',function() {  			//Ajax que incerta una nueva Ciudad a la BD
	JSdata = {
					NCiudad: $('#CCiudades').val()
	}
	ajaxMethods(JSdata,'/agregarCiudad',mostrarMensaje);
})

$('#AVuelo').on('click',function(){
	add();
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
			add();
		}) //vuelvo a bindear evento add

		limpiarFormulario();
	})

});

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
