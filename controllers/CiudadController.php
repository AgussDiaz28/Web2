<?php
require_once('models/CiudadModel.php');
require_once('views/CiudadView.php' );
require_once('controllers/SecuredController.php') ;

class CiudadController extends SecuredController
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
    $logStatus = $this->SessionActive();
    $this->view->mostrarPCiudades($logStatus,$ciudades);
  }

  function agregarCiudad(){
    $NCiudad = filter_input(INPUT_POST, 'NCiudad');

    try {
      if (empty($NCiudad)) {
        throw new Exception("No ingreso ninguna ciudad");
      }

      $value = array($NCiudad);

      if ($this->SessionActive())
      {
        $this->modelo->agregarCiudad($value);
      }else {
        throw new Exception("No tiene permiso para agregar ciudades");
      }

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

    if ($this->SessionActive())
    {
      $this->modelo->borrarCiudad([$id_ciudad]);
    }else {
      throw new Exception("No tiene permiso para borar ciudades");
    }

    $this->actualizarCiudades();
  }
  function modificarCiudad($id_ciudad){
    $NCiudad = filter_input(INPUT_POST, 'NCiudad');
    try {                  //PREGUNTAR SI LA EXCEPCION TERMINA LA EJECUCION INMEDIATAMENTE MEDIANTE EL CATCH
      if (empty($NCiudad)) {
        throw new Exception("No ingreso ninguna ciudad");
      }
      $values = array($NCiudad,(int)$id_ciudad[0]);

      if ($this->SessionActive())
      {
        $this->modelo->actualizarCiudad($values);
      }else {
        throw new Exception("No tiene permiso para actualizar datos de ciudades");
      }

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
    $logStatus = $this->SessionActive();
    $this->view->mostrarTablaCiudades($logStatus,$ciudades);
  }

}


 ?>
