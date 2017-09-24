<?php

include_once 'views/HomeView.php';

class HomeController
{
  private $view;

  function __construct()
  {
    $this->view =  new HomeView();
  }

  function home()
  {
    $this->view->mostrarHome();
  }
}


 ?>
