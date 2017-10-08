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

  public function agregarAerolinea(){
    $NAerolinea   = filter_input(INPUT_POST, 'NAerolinea');
    $PAerolinea   = filter_input(INPUT_POST, 'PAerolinea');
    $CAerolinea   = filter_input(INPUT_POST, 'CAerolinea');

    $values = array($NAerolinea,$PAerolinea,(int)$CAerolinea);
    $this->modelo->agregarAerolinea($values);
    $aerolineas =  $this->modelo->getAerolineas();
    $this->view->mostrarTablaAerolineas($aerolineas);

  }
  function deteleAerolinea(){
    $id_vuelo   = filter_input(INPUT_POST, 'aerolineaABorrar');
    $this->modelo->borrarAerolinea([$id_vuelo]);
    $aerolineas =  $this->modelo->getAerolineas();
    $this->view->mostrarTablaAerolineas($aerolineas);
  }

  function modificarAerolinea(){
    $NAerolinea  = filter_input(INPUT_POST, 'NAerolinea');
    $PAerolinea  = filter_input(INPUT_POST, 'PAerolinea');
    $CAerolinea  = filter_input(INPUT_POST, 'CAerolinea');
    $IDAerolinea = filter_input(INPUT_POST, 'IDAerolinea');
    $values = array($NAerolinea,$PAerolinea,(int)$CAerolinea,(int)$IDAerolinea);
    $this->modelo->updateAerolinea($values);
    $aerolineas =  $this->modelo->getAerolineas();
    $this->view->mostrarTablaAerolineas($aerolineas);

  }

}


 ?>
