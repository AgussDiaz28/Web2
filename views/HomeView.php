<?php
include_once 'libs/Smarty.class.php';

class HomeView
{
  private $smarty;

  function __construct(){
    $this->smarty = new Smarty();
    $this->smarty->assign('titulo', 'Home Turismo');
  }

  function mostrarHome(){
    $this->smarty->display('templates/home.tpl');
  }
}


 ?>
