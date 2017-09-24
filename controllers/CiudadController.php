<?php
include_once 'models/CiudadModel.php';

class CiudadController
{
    private $modelo;

  function __construct()
  {
    $this->modelo = new CiudadModel();
  }

  function getCiudades(){
      $ciudades = $this->modelo->getCiudades();
      return $ciudades;
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
