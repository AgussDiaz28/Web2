<?php

include_once 'views/HomeView.php';
include_once 'views/IndexView.php';

class NavController
{


  function __construct(){
    $this->view =  new HomeView();
    $this->index = new IndexView();
  }

  function home(){
    $this->view->mostrarHome();
  }

  function index(){
      $this->index->mostrarIndex();
  }
}


 ?>
