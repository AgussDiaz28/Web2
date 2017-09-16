<?php

include_once 'views/AdminView.php';

class AdminController
{
  private $view;

  function __construct()
  {
    $this->view =  new AdminView();
  }

  function adminABM()
  {
    $this->view->mostrarAdmin();
  }
}


 ?>
