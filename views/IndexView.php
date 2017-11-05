<?php
include_once 'libs/Smarty.class.php';

class IndexView
{
  private $smarty;

  function __construct(){
    $this->smarty = new Smarty();
    $this->smarty->assign('titulo', 'Index Turismo');
  }

  function mostrarIndex(){
    $this->smarty->display('templates/index.tpl');
  }

  function navBar($logStatus){
    $this->smarty->assign('Usser',$logStatus["USSER"]);
    $this->smarty->display('templates/navbar.tpl');
  }
}
 ?>
