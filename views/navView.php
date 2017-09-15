<?php
include_once 'libs/Smarty.class.php';

/**
 *
 */
class partialRender
{
  private $vista;

  function __construct(){
    $this->vista = new smarty();
  }

  function mostrarHome(){

    $this->vista->display('templates/home.tpl');
  }
}


 ?>
