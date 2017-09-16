<?php
include_once 'libs/Smarty.class.php';

class HomeView
{
  private $vista;

  function __construct(){
    $this->vista = new Smarty();
  }

  function mostrarHome(){

    $this->vista->display('templates/home.tpl');
  }
}


 ?>
