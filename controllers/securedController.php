<?php
require_once('controllers/Controller.php') ;
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
    $status = FALSE;
    session_start();
    if(isset($_SESSION['LOGGED']) && $_SESSION['LOGGED']){
      $status = $_SESSION['LOGGED'];
    }
    return $status;
  }
}

 ?>
