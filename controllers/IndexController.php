<?php

include_once 'views/IndexView.php';

class IndexController
{
  private $view;

  function __construct(){
    $this->view = new IndexView();
  }

  function home(){
    $this->view->mostrarHome();
  }
}
?>
