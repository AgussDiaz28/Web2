<?php
include_once 'libs/Smarty.class.php';

class VueloView
{
  private $vuelo;

  function __construct(){
    $this->vuelo = new Smarty();
  }

  function mostrarVuelos($Ciudades='',$Aerolineas='',$Vuelos=''){    //muestra pagina vuelos
    $status = FALSE;
    session_start();
    if(isset($_SESSION['LOGGED']) && $_SESSION['LOGGED']){
      $status = $_SESSION['LOGGED'];
    }
    $this->vuelo->assign('Admin',$status);
    $this->vuelo->assign('ciudades',$Ciudades);
    $this->vuelo->assign('Aerolineas',$Aerolineas);
    $this->vuelo->assign('vuelos',$Vuelos);
    $this->vuelo->display('templates/vuelos.tpl');
  }

  function actualizarTablaVuelos($Vuelos=''){       //actualiza la tabla de vuelos
    $status = FALSE;
    session_start();
    if(isset($_SESSION['LOGGED']) && $_SESSION['LOGGED']){
      $status = $_SESSION['LOGGED'];
    }
    $this->vuelo->assign('Admin',$status);
    $this->vuelo->assign('vuelos',$Vuelos);
    $this->vuelo->display('templates/tvuelos.tpl');
  }

}

?>
