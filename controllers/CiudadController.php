<?php
include_once('models/CiudadModel.php');
include_once('views/CiudadView.php' );
include_once('controllers/Controller.php') ;

class CiudadController extends Controller
{

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
