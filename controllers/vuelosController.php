<?php

class vuelosController
{
    private $vista;
    private $modelo;

  function __construct(argument)
  {
    $this->modelo = new vueloModel();
    $this->vista = new TareasView();
  }
}


 ?>
