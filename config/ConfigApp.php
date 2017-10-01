<?php

class ConfigApp
{
    public static $ACTION = 'action';
    public static $PARAMS = 'params';
    public static $ACTIONS = [
      'home'=> 'NavController#home',
      ''=> 'NavController#index',

      'pvuelos' => 'VueloController#MostrarPaginaVuelos',

      'LogOut' => 'LogInController#LogOut',
      'LogIn' => 'LogInController#index',
      'verificarUsuario' => 'LogInController#LogIn',

      'paerolineas' => 'AerolineaController#MostrarPaginaAerolineas',
      'pciudades' => 'CiudadController#MostrarPaginaCiudades',

      'agregarVuelo' => 'VueloController#agregarVuelo',
      'borrarVuelo' => 'VueloController#borrarVuelo',
      'actualizarVwVuelos' => 'VueloController#actualizarVwVuelos',

      'agregarCiudad' => 'CiudadController#agregarCiudad',
      'borrarCiudad'=> 'CiudadController#borrarCiudad',
      'mostrarCiudades' => 'CiudadController#mostrarCiudades',
      'modificarCiudad' => 'CiudadController#',

      'agregarAerolinea' => 'AerolineaController#agregarAerolinea',
      'deteleAerolinea' => 'AerolineaController#deteleAerolinea',
      'mostrarAerolineas' => 'AerolineaController#mostrarAerolineas',
      'modificarAerolinea' => 'AerolineaController#AerolineaController',
    ];
}

 ?>
