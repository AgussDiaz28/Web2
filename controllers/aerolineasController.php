<?php

class aerolineaController
{
    private $vista;
    private $modelo;

  function __construct()
  {
    $this->modelo = new aerolineaModel();
    $this->vista = new aerolineaView();
  }
}


 ?>
