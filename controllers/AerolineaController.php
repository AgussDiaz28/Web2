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

  function mostrarAerolineas(){
    $aerolineas = $this->modelo->getAerolineas();
    return $aerolineas;
  }

  public function agregarAerolinea($value=''){
    # code...
  }
  function deteleAerolinea($value=''){
    # code...
  }
  function modificarAerolinea($value=''){
    # code...
  }

}


 ?>
