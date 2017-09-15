<?php

class vueloModel
{
    private $vuelo;
    private $db;

    function __construct(argument)
    {
      $this->db = new PDO('mysql:host=localhost;dbname=db_turismo;charset=utf8', 'root', 'root');
      $this->vuelo = getVuelos();
    }

    private function getVuelos(){
      $sentencia = $this->db->prepare( "select * from Vuelos");
      $sentencia->execute($sentencia);
      return $sentencia->fetchAll(PDO::FETCH_ASSOC);
    }
}

 ?>
