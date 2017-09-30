<?php
include_once 'libs/Smarty.class.php';

class CiudadView
{
  private $ciudades;

  function __construct()
  {
    $this->ciudades = new Smarty();
  }

  function mostrarCiudades($Ciudades=''){
    $this->ciudades->assign('ciudades',$Ciudades);
    $this->ciudades->display('templates/cciudades.tpl');
  }

  function mostrarPCiudades($Ciudades=''){
    $this->ciudades->assign('ciudades',$Ciudades);
    $this->ciudades->display('templates/pCiudades.tpl');
  }

}

?>
