<?php
include_once 'libs/Smarty.class.php';

class VueloView
{
  private $vuelo;

  function __construct(){
    $this->vuelo = new Smarty();
  }

  function mostrarVuelos($vuelos=''){
    //    $this->vuelo->assing();
    $this->vuelo->display('templates/vuelos.tpl');
  }

}


 ?>
