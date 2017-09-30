<?php
include_once 'models/CiudadModel.php';
include_once 'views/CiudadView.php';

class CiudadController
{
    private $modelo;
    private $view;

  function __construct()
  {
    $this->modelo = new CiudadModel();
    $this->view = new CiudadView();
  }

  function getCiudades(){
      $ciudades = $this->modelo->getCiudades();
      return $ciudades;
  }

  function MostrarPaginaCiudades(){
    $ciudades = $this->getCiudades();
    $this->view->mostrarPCiudades($ciudades);
  }
  function agregarCiudad($value='')
  {
    # code...
  }
  function borrarCiudad($value='')
  {
    # code...
  }
  function modificarCiudad(){

  }
  function mostrarCiudades($value='')
  {
    # code...
  }

}


 ?>
