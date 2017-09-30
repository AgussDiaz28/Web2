<?php
class LoginView
{
  function mostrarLogin($error = ''){
    $this->smarty->assign('error', $error);
    $this->smarty->display('templates/LogIn.tpl');
  }

}

 ?>
