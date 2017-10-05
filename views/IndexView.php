<?php
include_once 'libs/Smarty.class.php';

class IndexView
{
  private $smarty;

  function __construct(){
    $this->smarty = new Smarty();
    $this->smarty->assign('titulo', 'Index Turismo');
  }

  function mostrarIndex($status=''){
    $this->smarty->assign('Admin',$status);
    $this->smarty->display('templates/index.tpl');
  }
}
 ?>
