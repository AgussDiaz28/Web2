<?php
include_once 'controllers/AerolineaController.php';
include_once 'controllers/CiudadController.php';
include_once 'controllers/VueloController.php';
include_once 'views/PaginaVueloView.php';

class PaginaVueloController
{
    private $AerolineaController;
    private $CiudadController;
    private $VueloController;
    private $PaginaVueloView;

  function __construct(){
    $this->AerolineaController = new AerolineaController();
    $this->CiudadController = new CiudadController();
    $this->VueloController = new VueloController();
    $this->PaginaVueloView = new PaginaVueloView();
  }

  function PaginaVuelos(){

    $aerolineas = $this->AerolineaController->getAerolineas();
    $ciudades = $this->CiudadController->getCiudades();
    $vuelos = $this->VueloController->mostrarVuelos();

    return $this->PaginaVueloView->mostrarPagVuelos($ciudades,$aerolineas,$vuelos);
  }

}


 ?>
