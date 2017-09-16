<?php

include_once 'views/AdmintView.php';

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
