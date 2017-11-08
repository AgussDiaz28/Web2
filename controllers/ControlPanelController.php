<?php
require_once('models/UsserModel.php');
require_once('views/UsserView.php' );
require_once('controllers/SecuredController.php') ;

class ControlPanelController extends SecuredController
{

  function __construct()
  {
    $this->modelo = new UsserModel();
    $this->view = new UsserView();
  }

  function getUsuarios(){
      $usuarios = $this->modelo->getUssers();
      return $usuarios;
  }

  function MostrarPaginaPermisos(){
    $usuarios = $this->getUsuarios();
    $this->view->mostrarPPermisos($usuarios);
  }

  function borrarUsuario()
  {
    $id_usuario = filter_input(INPUT_POST, 'usuarioABorrar');

    if ($this->SessionActive())
    {
      $this->modelo->borrarUsser([$id_usuario]);
    }else {
      throw new Exception("No tiene permiso para borar usuarios");
    }

    $this->actualizarUsuarios();
  }

  function otorgarPermisoAdmin($id_usuario){
    $permiso = filter_input(INPUT_POST, 'permiso');
    try {                  //PREGUNTAR SI LA EXCEPCION TERMINA LA EJECUCION INMEDIATAMENTE MEDIANTE EL CATCH
      if (empty($permiso)) {
        throw new Exception("No modifico nada");
      }
      $values = array((int)$permiso,(int)$id_usuario[0]);

      if ($this->SessionActive())
      {
        $this->modelo->actualizarUssers($values);
      }else {
        throw new Exception("No tiene permiso para actualizar datos de los usuarios");
      }

      $result = true;
      $error = false;
    } catch (Exception $e) {
      $error = $e->getMessage();
      $result = false;
    }
    $this->actualizarUsuarios();
  }

  function actualizarUsuarios(){
    $usuarios = $this->getUsuarios();
    $this->view->mostrarTablaPermisos($usuarios);
  }

}


 ?>
