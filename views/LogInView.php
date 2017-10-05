<?php
include_once 'libs/Smarty.class.php';
class LoginView
{
  private $smarty;

  function __construct(){
    $this->smarty = new Smarty();
  }

  function mostrarLogin($error = ''){
    $this->smarty->Assign('error', $error);
    $this->smarty->display('templates/LogIn.tpl');
  }

}

 ?>
