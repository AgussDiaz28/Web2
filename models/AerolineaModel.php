<?php

class AerolineaModel
{
  private $db;

  function __construct()
  {
    $this->db = new PDO('mysql:host=localhost;dbname=db_turismo;charset=utf8', 'root', 'root');
  }

  public function getAerolineas(){
    $sentencia = $this->db->prepare( "SELECT * FROM Aerolineas");
    $sentencia->execute();
    return $sentencia->fetchAll(PDO::FETCH_ASSOC);
  }

  // ABM Aerolineas //

  public function borrarAerolinea($id){
    $sentencia = $this->db->prepare( "DELETE FROM Aerolineas WHERE ID_AEROLINEA = ?");
    $sentencia->execute($id);
    return $sentencia->fetchAll(PDO::FETCH_ASSOC);
  }

  public function agregarAerolinea($nombre){
    $sentencia = $this->db->prepare( "INSERT INTO Aerolineas(NOMBRE_AEROLINEA) VALUES (?) ");
    $sentencia->execute($nombre);
    return $sentencia->fetchAll(PDO::FETCH_ASSOC);
  }

  public function updateAerolinea($id,$nnuevo){
    $sentencia = $this->db->prepare( "UPDATE Ciudades SET NOMBRE_AEROLINEA = ? WHERE ID_AEROLINEA = ? ");
    $sentencia->execute(array($nnuevo,$id));
    return $sentencia->fetchAll(PDO::FETCH_ASSOC);
  }

  // ABM Aerolineas //
}

 ?>
