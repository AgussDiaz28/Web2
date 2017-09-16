<?php

include_once 'views/HomeView.php';

class NavController
{
  private $view;
  private $model;

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
