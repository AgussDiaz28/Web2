<?php

class CiudadModel
{
    private $ciudad;
    private $db;

    function __construct()
    {
      $this->db = new PDO('mysql:host=localhost;dbname=db_turismo;charset=utf8', 'root', 'root');
      $this->vuelo = getCiudades();
    }

    private function getCiudades(){
      $sentencia = $this->db->prepare( "select * from Ciudades");
      $sentencia->execute($sentencia);
      return $sentencia->fetchAll(PDO::FETCH_ASSOC);
    }
}

?>
