<?php

class ciudadController
{
    private $vista;
    private $modelo;

  function __construct()
  {
    $this->modelo = new ciudadModel();
    $this->vista = new ciudadesView();
  }
}


 ?>
