<?php
include_once 'libs/Smarty.class.php';

class VuelosView
{
  private $vuelo;

  function __construct()
  {
    $this->vuelo = new Smarty();
  }

  function mostrarVuelos($Vuelos=''){                         //funcion que genera tabla HTML de vuelos mediante parametros
    $this->vuelo->assign('vuelos',$Vuelos);
    $this->vuelo->display('templates/tvuelos.tpl');
  }

}

?>
