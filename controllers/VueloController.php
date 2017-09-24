<?php
include_once 'models/VueloModel.php';
include_once 'views/VueloView.php';

class VueloController
{
    private $modelo;
    private $view;

  function __construct(){
    $this->modelo = new VueloModel();
    $this->view = new VueloView();
  }

  function mostrarVuelos(){
    $vuelos = $this->modelo->getVuelos();
    $this->view->mostrarVuelos($vuelos);
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
