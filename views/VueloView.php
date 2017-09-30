<?php
include_once 'libs/Smarty.class.php';

class VueloView
{
  private $vuelo;

  function __construct(){
    $this->vuelo = new Smarty();
  }

  function mostrarVuelos($Ciudades='',$Aerolineas='',$Vuelos=''){    //funcion que genera tabla HTML de vuelos mediante parametros
    $this->vuelo->assign('Admin',TRUE);
    $this->vuelo->assign('ciudades',$Ciudades);
    $this->vuelo->assign('Aerolineas',$Aerolineas);
    $this->vuelo->assign('vuelos',$Vuelos);
    $this->vuelo->display('templates/vuelos.tpl');
  }

}

?>
