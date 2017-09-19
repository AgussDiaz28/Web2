<?php
include_once 'libs/Smarty.class.php';

class PaginaVueloView
{
  private $vuelo;

  function __construct(){
    $this->vuelo = new Smarty();
  }

  function mostrarPagVuelos($Ciudades='',$Aerolineas='',$Vuelos=''){
    $this->vuelo->assign('ciudades',$Ciudades);
    $this->vuelo->assign('Aerolineas',$Aerolineas);
    $this->vuelo->assign('vuelos',$Vuelos);
    $this->vuelo->display('templates/vuelos.tpl');
  }


}


 ?>
