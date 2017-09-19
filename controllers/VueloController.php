<?php
include_once 'models/VueloModel.php';

class VueloController
{
    private $modelo;

  function __construct(){
    $this->modelo = new VueloModel();
  }

  function getVuelos(){
    $vuelos = $this->modelo->getVuelos();
    return $vuelos;
  }

  function actualizarVwVuelos($destino,$aerolinea,$fecha){

    /* Conversion a Integer para la comparacion*/
    $destino = (int) $destino;
    //$aerolinea= (int) $aerolinea;
    /* Conversion a Integer para la comparacion*/

    if (!empty($destino)){
      //if (!empty($aerolinea)){
        //if (!empty($fecha)){
          return $this->modelo->getVuelos($destino,$aerolinea,$fecha);
      //  }
    //  }
    }
  }
}
 ?>
