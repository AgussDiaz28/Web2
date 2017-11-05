<?php
include_once 'libs/Smarty.class.php';

class CiudadView
{
  private $ciudades;

  function __construct()
  {
    $this->ciudades = new Smarty();
  }

  function mostrarTablaCiudades($logStatus,$Ciudades=''){
    $this->ciudades->assign('Admin',$logStatus["ADMIN"]);
    $this->ciudades->assign('ciudades',$Ciudades);
    $this->ciudades->display('templates/tciudades.tpl');
  }

  function mostrarPCiudades($logStatus,$Ciudades=''){
    $this->ciudades->assign('Admin',$logStatus["ADMIN"]);
    $this->ciudades->assign('ciudades',$Ciudades);
    $this->ciudades->display('templates/pCiudades.tpl');
  }

}

?>
