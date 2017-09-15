<?php
include_once 'libs/Smarty.class.php';

class vuelosView
{
  private $vuelo;

  function __construct(){
    $this->vuelo = new smarty();
  }

  function mostrarVuelos($vuelos=''){
    //    $this->vuelo->assing();
    $this->vuelo->display('templates/vuelos.tpl');
  }

}


 ?>
