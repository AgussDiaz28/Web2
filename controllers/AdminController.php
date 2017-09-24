<?php

include_once 'views/AdminView.php';
include_once 'controllers/AerolineaController.php';
include_once 'controllers/CiudadController.php';
include_once 'controllers/VueloController.php';

class AdminController
{
  private $view;
  private $AerolineaController;
  private $CiudadController;
  private $VueloController;

  function __construct()
  {
    $this->view =  new AdminView();
    $this->AerolineaController = new AerolineaController();
    $this->CiudadController = new CiudadController();
    $this->VueloController = new VueloController();
  }

  function adminABM(){

    $aerolineas = $this->AerolineaController->getAerolineas();
    $ciudades = $this->CiudadController->getCiudades();
    $vuelos = $this->VueloController->mostrarVuelos();

    return $this->view->mostrarAdmin($ciudades,$aerolineas,$vuelos);
  }
}


 ?>
