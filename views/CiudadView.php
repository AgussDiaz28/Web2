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
    $this->ciudades->assign('Aerolineas',$Ciudades);
    $this->ciudades->display('templates/cciudades.tpl');
  }

}

?>
