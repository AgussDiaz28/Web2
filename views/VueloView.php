<?php
include_once 'libs/Smarty.class.php';

class VueloView
{
  private $vuelo;

  function __construct(){
    $this->vuelo = new Smarty();
  }

  function mostrarVuelos($logStatus,$Ciudades='',$Aerolineas='',$Vuelos=''){    //muestra pagina vuelos
    $this->vuelo->assign('Admin',$logStatus["ADMIN"]);
    $this->vuelo->assign('ciudades',$Ciudades);
    $this->vuelo->assign('Aerolineas',$Aerolineas);
    $this->vuelo->assign('vuelos',$Vuelos);
    $this->vuelo->display('templates/vuelos.tpl');
  }

  function actualizarTablaVuelos($logStatus,$Vuelos=''){       //actualiza la tabla de vuelos
    $this->vuelo->assign('Admin',$logStatus["ADMIN"]);
    $this->vuelo->assign('vuelos',$Vuelos);
    $this->vuelo->display('templates/tvuelos.tpl');
  }

}

?>
