<?php
include_once 'models/VueloModel.php';

class VueloController
{
    private $modelo;

  function __construct(){
    $this->modelo = new VueloModel();
  }

  function mostrarVuelos(){
    $vuelos = $this->modelo->getVuelos();
    return $vuelos;
  }

  function actualizarVwVuelos(){

    /* Conversion a Integer para la comparacion*/
    $destino = (int) $destino;
    $aerolinea= (int) $aerolinea;
    /* Conversion a Integer para la comparacion*/
    //FALTA AGREGAR LA FECHA PARA QUE TAMBIEN SE USE PARA FILTRAR

    return $this->modelo->getVuelos($destino,$aerolinea,$fecha);

    }

    function borrarVuelo($id){
      return  $this->modelo->borrarVuelo($id);
    }

    function cargarVuelo($value=''){

    }
}
 ?>
