<?php

/**
 *
 */
class aerolineaModel
{

  private $aerolinea;
  private $db;

  function __construct()
  {
    $this->db = new PDO('mysql:host=localhost;dbname=db_turismo;charset=utf8', 'root', 'root');
    $this->vuelo = getAerolineas();
  }

  private function getAerolineas(){
    $sentencia = $this->db->prepare( "select * from Aerolineas");
    $sentencia->execute($sentencia);
    return $sentencia->fetchAll(PDO::FETCH_ASSOC);
  }
}

 ?>
