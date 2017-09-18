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

  }


 ?>
