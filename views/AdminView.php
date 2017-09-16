<?php
include_once 'libs/Smarty.class.php';

class AdminView
{
  private $vista;

  function __construct(){
    $this->vista = new Smarty();
  }

  function mostrarAdmin(){
    $this->vista->display('templates/admin.tpl');
  }
}


 ?>
