<?php
  include_once 'libs/Smarty.class.php';
  class SignUpView
  {
    private $smarty;

    function __construct(){
      $this->smarty = new Smarty();
    }

    function mostrarSignUp($error = ''){
      $this->smarty->Assign('error', $error);
      $this->smarty->display('templates/SignUp.tpl');
    }
  }

 ?>
