<?php
include_once 'models/AerolineaModel.php';
include_once 'views/AerolineaView.php';


class AerolineaController
{
    private $modelo;

  function __construct()
  {
    $this->modelo = new AerolineaModel();
  }

  function getAerolineas(){
    $aerolineas = $this->modelo->getAerolineas();

    return $aerolineas;
  }

}


 ?>
