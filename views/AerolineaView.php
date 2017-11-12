<?php
require_once('libs/Smarty.class.php');

class AerolineaView
{
  private $aerolinea;

  function __construct()
  {
    $this->aerolinea = new Smarty();
  }

  function mostrarAerolineas($Aerolineas=''){
    $this->aerolinea->assign('Aerolineas',$Aerolineas);
    $this->aerolinea->display('templates/ccaerolineas.tpl');
  }

  function mostrarTablaAerolineas($logStatus,$Aerolineas=''){
    $this->aerolinea->assign('Admin',$logStatus["ADMIN"]);
    $this->aerolinea->assign('Aerolineas',$Aerolineas);
    $this->aerolinea->display('templates/tAerolinea.tpl');
  }

  function mostrarPAerolineas($logStatus,$Aerolineas=''){
    $this->aerolinea->assign('Admin',$logStatus["ADMIN"]);
    $this->aerolinea->assign('user',$logStatus["USER"]);
    $this->aerolinea->assign('Aerolineas',$Aerolineas);
    $this->aerolinea->display('templates/pAerolinea.tpl');
  }

}

?>
