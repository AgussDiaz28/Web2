<?php

include_once('views/HomeView.php');
include_once('views/IndexView.php');
include_once('controllers/Controller.php');

class NavController extends Controller
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

  function navBar(){
    $this->index->navBar();
  }
}


 ?>
