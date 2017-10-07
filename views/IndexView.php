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
    $status = FALSE;
    session_start();
    if(isset($_SESSION['LOGGED']) && $_SESSION['LOGGED']){
      $status = $_SESSION['LOGGED'];
    }
    $this->smarty->assign('Admin',$status);
    $this->smarty->display('templates/index.tpl');
  }

  function navBar(){
    $status = FALSE;
    session_start();
    if(isset($_SESSION['LOGGED']) && $_SESSION['LOGGED']){
      $status = $_SESSION['LOGGED'];
    }
    $this->smarty->assign('Admin',$status);
    $this->smarty->display('templates/navbar.tpl');
  }
}
 ?>
