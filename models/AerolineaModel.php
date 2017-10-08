<?php
include_once 'models/dbModel.php';
class AerolineaModel extends dbModel
{

  public function getAerolineas(){
    $sentencia = $this->db->prepare( "SELECT * FROM Aerolineas");
    $sentencia->execute();
    return $sentencia->fetchAll(PDO::FETCH_ASSOC);
  }

  // ABM Aerolineas //

  public function borrarAerolinea($id){
    $sentencia = $this->db->prepare( "DELETE FROM Aerolineas WHERE ID_AEROLINEA = ?");
    $sentencia->execute($id);
  }

  public function agregarAerolinea($datos){
    $sentencia = $this->db->prepare( "INSERT INTO Aerolineas(NOMBRE_AEROLINEA,PAIS_ORIGEN,CANT_AVIONES) VALUES (?,?,?) ");
    $sentencia->execute($datos);
  }

  public function updateAerolinea($datos){
    $sentencia = $this->db->prepare( "UPDATE Aerolineas SET NOMBRE_AEROLINEA = ? , PAIS_ORIGEN = ? , CANT_AVIONES =? WHERE ID_AEROLINEA = ? ");
    $sentencia->execute($datos);
  }

  // ABM Aerolineas //
}

 ?>
