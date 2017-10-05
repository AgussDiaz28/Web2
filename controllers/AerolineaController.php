<?php
include_once('models/AerolineaModel.php');
include_once('views/AerolineaView.php');
include_once('controllers/Controller.php');

class AerolineaController extends Controller
{

  function __construct()
  {
    $this->modelo = new AerolineaModel();
    $this->view = new AerolineaView();
  }

  function getAerolineas(){                                 //FUNCION QUE DEVUELVE LAS AEROLINEAS
    $aerolineas = $this->modelo->getAerolineas();
    return $aerolineas;
  }

  function MostrarPaginaAerolineas(){
    $aerolineas = $this->getAerolineas();
    $this->view->mostrarPAerolineas($aerolineas);
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
