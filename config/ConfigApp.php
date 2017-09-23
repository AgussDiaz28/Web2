<?php

class ConfigApp
{
    public static $ACTION = 'action';
    public static $PARAMS = 'params';
    public static $ACTIONS = [
      'home'=> 'home',
      ''=> 'home',

      'mostrarVuelos' => 'mostrarVuelos',
      'agregarVuelo' => 'agregarVuelo',
      'borrarVuelo' => 'borrarVuelo',
      'actualizarVwVuelos' => 'actualizarVwVuelos',

      'agregarCiudad' => 'agregarCiudad',
      'borrarCiudad'=> 'borrarCiudad',
      'mostrarCiudades' => 'mostrarCiudades',
      'modificarCiudad' => 'CiudadController',

      'agregarAerolinea' => 'agregarAerolinea',
      'deteleAerolinea' => 'deteleAerolinea',
      'mostrarAerolineas' => 'mostrarAerolineas',
      'modificarAerolinea' => 'AerolineaController',


    ];

    public static $CONTROLLERS = [

      'home'=> 'HomeController',                        //CONFIRMADO QUE EXISTE EN EL CONTROLADOR
      ''=> 'IndexController',                           //CONFIRMADO QUE EXISTE EN EL CONTROLADOR

      'vuelos' => 'VueloController',              //CLASE VACIA

      'admin' => 'AdminController',                     //CLASE VACIA

      'mostrarVuelos' => 'VueloController',             //CONFIRMADO QUE EXISTE EN EL CONTROLADOR
      'agregarVuelo' => 'VueloController',              //CONFIRMADO QUE EXISTE EN EL CONTROLADOR //FALTA DESAROLLARLA, NO HACE NADA
      'borrarVuelo' => 'VueloController',               //CONFIRMADO QUE EXISTE EN EL CONTROLADOR
      'actualizarVwVuelos' => 'VueloController',        //CONFIRMADO QUE EXISTE EN EL CONTROLADOR

      //------------------------------------ NINGUNA FUNCION DEL CONTROLADOR LLAMA A NADA ACTUALMENTE, PERO EXISTEN------------------------
      'agregarCiudad' => 'CiudadController',
      'borrarCiudad'=> 'CiudadController',
      'modificarCiudad' => 'CiudadController',
      'mostrarCiudades' => 'CiudadController',
      //------------------------------------------------------------------------------------------------------------------------

      'agregarAerolinea' => 'AerolineaController',
      'deteleAerolinea' => 'AerolineaController',
      'modificarAerolinea' => 'AerolineaController',
      'mostrarAerolineas' => 'AerolineaController',         //FUNCION EXISTE Y TIENE FUNCIONALIDAD

    ];
}

 ?>
