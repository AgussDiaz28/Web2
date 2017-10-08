<?php
include_once('models/CiudadModel.php');
include_once('views/CiudadView.php' );
include_once('controllers/Controller.php') ;

class CiudadController extends Controller
{

  function __construct()
  {
    $this->modelo = new CiudadModel();
    $this->view = new CiudadView();
  }

  function getCiudades(){
      $ciudades = $this->modelo->getCiudades();
      return $ciudades;
  }

  function MostrarPaginaCiudades(){
    $ciudades = $this->getCiudades();
    $this->view->mostrarPCiudades($ciudades);
  }

  function agregarCiudad(){
    $NCiudad = filter_input(INPUT_POST, 'NCiudad');
    try {                  //PREGUNTAR SI LA EXCEPCION TERMINA LA EJECUCION INMEDIATAMENTE MEDIANTE EL CATCH
      if (empty($NCiudad)) {
        throw new Exception("No ingreso ninguna ciudad");
      }
      $value = array($NCiudad);
      $this->modelo->agregarCiudad($value);
      $result = true;
      $error = false;
    } catch (Exception $e) {
      $error = $e->getMessage();
      $result = false;
    }
    $this->actualizarCiudades();
  }
  function borrarCiudad()
  {
    $id_ciudad = filter_input(INPUT_POST, 'ciudadABorrar');
    $this->modelo->borrarCiudad([$id_ciudad]);
    $this->actualizarCiudades();
  }
  function modificarCiudad($id_ciudad){
    $NCiudad = filter_input(INPUT_POST, 'NCiudad');
    try {                  //PREGUNTAR SI LA EXCEPCION TERMINA LA EJECUCION INMEDIATAMENTE MEDIANTE EL CATCH
      if (empty($NCiudad)) {
        throw new Exception("No ingreso ninguna ciudad");
      }
      $values = array($NCiudad,(int)$id_ciudad[0]);
      $this->modelo->actualizarCiudad($values);
      $result = true;
      $error = false;
    } catch (Exception $e) {
      $error = $e->getMessage();
      $result = false;
    }
    $this->actualizarCiudades();
  }

  function actualizarCiudades(){
    $ciudades = $this->getCiudades();
    $this->view->mostrarTablaCiudades($ciudades);
  }

}


 ?>
