<?php

/**
 *
 */
class ClassName extends AnotherClass
{
  private $view;
  private $model;

  function __construct(argument)
  {
    $this->view =  new mostrarHome();
  }

  function homeController()
  {
    $this->view->mostrarHome();
  }
}


 ?>
