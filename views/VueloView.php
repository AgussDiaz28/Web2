<?php
include_once 'libs/Smarty.class.php';

class VueloView
{
  private $vuelo;

  function __construct()
  {
    $this->vuelo = new Smarty();
  }

  function mostrarVuelos($Vuelos=''){
    $this->vuelo->assign('vuelos',$Vuelos);
    $this->vuelo->display('templates/vuelos.tpl');
  }

}

?>
