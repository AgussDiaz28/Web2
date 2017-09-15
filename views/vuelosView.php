<?php


class Vuelo
{
  private $vuelo;

  function __construct(argument)
  {
    $this->vuelo = new smarty();
  }

  function mostrarVuelos(){
    
    $this->vista->display('templates/vuelos.tpl');
  }
}


 ?>
