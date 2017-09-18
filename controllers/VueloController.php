<?php
include_once 'models/VueloModel.php';

class VueloController
{
    private $modelo;

  function __construct()
  {
    $this->modelo = new VueloModel();
  }

  function getVuelos(){
    $vuelos = $this->modelo->getVuelos();
    return $vuelos;
  }

}


 ?>
