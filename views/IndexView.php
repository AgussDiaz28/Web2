<?php
include_once 'libs/Smarty.class.php';

class IndexView
{
  private $smarty;

  function __construct(){
    $this->smarty = new Smarty();
    $this->smarty->assign('titulo', 'Index Turismo');
  }

  function mostrarHome(){
    $this->smarty->display('templates/index.tpl');
  }
}
 ?>
