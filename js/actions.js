$( document ).ready( function() {

	function cargar(data){
		$( "#main" ).html();
		$( "#main" ).html( data );
	}

	function renderAdmin(){
		$.ajax({
			type:'GET',
			url:'http://localhost/git-nico/web2/adminABM',
			success: cargar
		});
		$( "li" ).removeClass( "active" );
		$("#admin" ).addClass( "active" );
	}

	function renderHome(){
		$.ajax({
			type:'GET',
			url:'http://localhost/git-nico/web2/mostrarHome',
			success: cargar
 		});
		$( "li" ).removeClass( "active" );
		$( "#home" ).addClass( "active" );
	}

	function renderVuelos(){
		$.ajax({
			type:'GET',
			url:'http://localhost/git-nico/web2/mostrarVuelos',
			success: cargar
 		});
		$( "li" ).removeClass( "active" );
		$("#vuelos" ).addClass( "active" );
	}

	$( "#home" ).on( "click", function(e) {
		e.preventDefault();
		renderHome();
	} );

	$( "#vuelos" ).on( "click", function(e) {
		e.preventDefault();
		renderVuelos();

	});

	$( "#admin" ).on( "click", function(e) {
		e.preventDefault();
		renderAdmin();
	});

});
