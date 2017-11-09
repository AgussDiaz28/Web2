<?php

class ConfigApp
{
    public static $ACTION = 'action';
    public static $PARAMS = 'params';
    public static $ACTIONS = [
      'home'=> 'NavController#home',
      ''=> 'NavController#index',
      'navBar' => 'NavController#navBar',

      'pvuelos' => 'VueloController#MostrarPaginaVuelos',

      'LogOut' => 'LogInController#LogOut',
      'LogIn' => 'LogInController#index',
      'SignUp' => 'LogInController#indexSignUp',
      'verificarUsuario' => 'LogInController#LogIn',
      'registrarUsuario' => 'LogInController#SignUp',

      'ControlPanel' => 'ControlPanelController#MostrarPaginaPermisos',
      'borrarUsuario' => 'ControlPanelController#borrarUsuario',
      'actualizarUsuario' => 'ControlPanelController#otorgarPermisoAdmin',

      'paerolineas' => 'AerolineaController#MostrarPaginaAerolineas',
      'pciudades' => 'CiudadController#MostrarPaginaCiudades',

      'agregarVuelo' => 'VueloController#agregarVuelo',
      'actualizarVuelo' => 'VueloController#actualizarVuelo',
      'borrarVuelo' => 'VueloController#borrarVuelo',
      'actualizarVwVuelos' => 'VueloController#actualizarVwVuelos',

      'agregarCiudad' => 'CiudadController#agregarCiudad',
      'borrarCiudad'=> 'CiudadController#borrarCiudad',
      'mostrarCiudades' => 'CiudadController#mostrarCiudades',
      'actualizarCiudades' => 'CiudadController#actualizarCiudades',
      'modificarCiudad' => 'CiudadController#modificarCiudad',

      'agregarAerolinea' => 'AerolineaController#agregarAerolinea',
      'deteleAerolinea' => 'AerolineaController#deteleAerolinea',
      'mostrarAerolineas' => 'AerolineaController#mostrarAerolineas',
      'modificarAerolinea' => 'AerolineaController#modificarAerolinea',

      'newDB' => 'dbModel#newDB', // Esta bien llamar al modelo de aca ?
      'uploadImage' => 'CiudadController#uploadImage',
      'getImages' => 'CiudadController#getImages'
    ];
}
