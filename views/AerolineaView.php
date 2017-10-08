<?php
include_once 'libs/Smarty.class.php';

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

  function mostrarTablaAerolineas($Aerolineas=''){
    $this->aerolinea->assign('Aerolineas',$Aerolineas);
    $this->aerolinea->display('templates/tAerolinea.tpl');
  }

  function mostrarPAerolineas($Aerolineas=''){
    $this->aerolinea->assign('Aerolineas',$Aerolineas);
    $this->aerolinea->display('templates/pAerolinea.tpl');
  }

}

?>
