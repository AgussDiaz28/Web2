<?php
include_once 'libs/Smarty.class.php';

class UserView
{
    private $usuarios;

    function __construct()
    {
        $this->usuarios = new Smarty();
    }

    function mostrarTablaPermisos($Usuarios = '')
    {
        $this->usuarios->assign('usuarios', $Usuarios);
        $this->usuarios->display('templates/tpermisos.tpl');
    }

    function mostrarPPermisos($Usuarios = '')
    {
        $this->usuarios->assign('usuarios', $Usuarios);
        $this->usuarios->display('templates/permisos.tpl');
    }
}
