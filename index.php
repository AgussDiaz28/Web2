<?php
include_once 'libs/Smarty.class.php';
include_once 'views/navView.php';

    //define('HOME', 'http://'.$_SERVER['SERVER_NAME'] . dirname($_SERVER['PHP_SELF']).'/');

function home()
{
  $titulo = 'Web2 Parte 1';
  $smarty = new Smarty();
  $smarty->display('templates/index.tpl');
}

function mostrarHome(){
 $home = new  partialRender();
 $home->mostrarHome();
}

 ?>
