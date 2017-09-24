<?php
include_once 'libs/Smarty.class.php';

class AdminView
{
  private $vista;

  function __construct(){
    $this->vista = new Smarty();
  }

  function mostrarAdmin($ciudades='',$aerolineas='',$vuelos=''){
    $this->vista->assign('ciudades',$ciudades);
    $this->vista->assign('Aerolineas',$aerolineas);
    $this->vista->assign('vuelos',$vuelos);
    $this->vista->display('templates/admin.tpl');
  }
}


 ?>
