<?php
require_once('models/UserModel.php');
require_once('views/UserView.php' );
require_once('controllers/SecuredController.php') ;

class ControlPanelController extends SecuredController
{

    function __construct()
    {
        $this->modelo = new UserModel();
        $this->view = new UserView();
    }

    function getUsuarios()
    {
        $usuarios = $this->modelo->getusers();
        return $usuarios;
    }

    function MostrarPaginaPermisos()
    {
        $usuarios = $this->getUsuarios();
        $this->view->mostrarPPermisos($usuarios);
    }

    function borrarUsuario()
    {
        $id_usuario = filter_input(INPUT_POST, 'usuarioABorrar');
        if ($this->SessionActive()['ADMIN']) {
            $this->modelo->borraruser([$id_usuario]);
        } else {
            throw new Exception("No tiene permiso para borar usuarios");
        }

        $this->actualizarUsuarios();
    }

    function otorgarPermisoAdmin()
    {
        $id_usuario = filter_input(INPUT_POST, 'usuarioAEditar');
        $esAdmin = filter_input(INPUT_POST, 'permisoAdmin');

        try {
            $values = array((int)$esAdmin,(int)$id_usuario);

            if ($this->SessionActive()['ADMIN']) {
                $this->modelo->actualizarusers($values);
            } else {
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

    function actualizarUsuarios()
    {
        $usuarios = $this->getUsuarios();
        $this->view->mostrarTablaPermisos($usuarios);
    }
}
