<?php
require_once('controllers/Controller.php') ;
require_once('vendor/simple-php-captcha-master/simple-php-captcha.php');
class SecuredController extends Controller
{

  function __construct()
  {
    session_start();
    if(isset($_SESSION['USER'])){
      if (time() - $_SESSION['LAST_ACTIVITY'] > 100000) { //15 segundos
        header('Location: '.LOGOUT);
        die();
      }
      $_SESSION['LAST_ACTIVITY'] = time();
    }
    else {
      header('Location: '.LOGIN);
      die();
    }
  }

  function SessionActive()
  {
    $userStatus = FALSE;
    $adminStatus = FALSE;
    if(!isset($_SESSION))
    {
        session_start();
    }
    if(isset($_SESSION['LOGGED']) && $_SESSION['LOGGED']){
      $userStatus = $_SESSION['LOGGED'];
    }
    if(isset($_SESSION['ADMIN']) && $_SESSION['ADMIN']){
      $adminStatus = $_SESSION['ADMIN'];
    }

    return $session = array("ADMIN" => $adminStatus, "USER" => $userStatus);
  }
}

 ?>
