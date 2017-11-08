<?php
include_once('models/AerolineaModel.php');
include_once('views/AerolineaView.php');
include_once('controllers/SecuredController.php');

class AerolineaController extends SecuredController
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
    $logStatus = $this->SessionActive();
    $this->view->mostrarPAerolineas($logStatus,$aerolineas);
  }

  public function agregarAerolinea(){
    $NAerolinea   = filter_input(INPUT_POST, 'NAerolinea');
    $PAerolinea   = filter_input(INPUT_POST, 'PAerolinea');
    $CAerolinea   = filter_input(INPUT_POST, 'CAerolinea');

    try{
      if (empty($NAerolinea)) {
        throw new Exception("No ingreso ninguna Aerolinea");
      }else if(empty($PAerolinea)){
        throw new Exception("No ingreso ningun pais de Aerolinea");
      }else if(empty($CAerolinea)){
        throw new Exception("No ingreso cantidad de aviones");
      }
      $values = array($NAerolinea,$PAerolinea,(int)$CAerolinea);

      if(!$this->SessionActive()['ADMIN']){
        $this->modelo->agregarAerolinea($values);
      }else {
        throw new Exception("No tiene permiso para agregar Aerolineas");
      }

      $result = true;
      $error = false;
    } catch (Exception $e) {
      $error = $e->getMessage();
      $result = false;
    }
    $this->actualizarAerolinea();
  }
  function deteleAerolinea(){
    $id_vuelo   = filter_input(INPUT_POST, 'aerolineaABorrar');

    if(!$this->SessionActive()['ADMIN']){
      $this->modelo->borrarAerolinea([$id_vuelo]);
    }else {
      throw new Exception("No tiene permiso para borrar Aerolineas");
    }

    $this->actualizarAerolinea();
  }

  function modificarAerolinea(){
    $NAerolinea  = filter_input(INPUT_POST, 'NAerolinea');
    $PAerolinea  = filter_input(INPUT_POST, 'PAerolinea');
    $CAerolinea  = filter_input(INPUT_POST, 'CAerolinea');
    $IDAerolinea = filter_input(INPUT_POST, 'IDAerolinea');
    $values = array($NAerolinea,$PAerolinea,(int)$CAerolinea,(int)$IDAerolinea);

    if(!$this->SessionActive()['ADMIN']){
      $this->modelo->updateAerolinea($values);

    }else {
      throw new Exception("No tiene permiso para modificar datos de una Aerolineas");
    }
    $this->actualizarAerolinea();

  }

  function actualizarAerolinea(){
    $aerolineas =  $this->modelo->getAerolineas();
    $logStatus = $this->SessionActive();
    $this->view->mostrarTablaAerolineas($logStatus,$aerolineas);
  }

}


 ?>
