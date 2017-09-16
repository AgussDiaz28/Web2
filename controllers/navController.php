<?php

include_once 'views/HomeView.php';

class NavController
{
  private $view;

  function __construct()
  {
    $this->view =  new HomeView();
  }

  function homeController()
  {
    $this->view->mostrarHome();
  }
}


 ?>
