<?php
include_once 'models/dbModel.php';
class CiudadModel extends dbModel
{
    public function getCiudades(){
      $sentencia = $this->db->prepare( "SELECT * FROM Ciudades");
      $sentencia->execute();
      return $sentencia->fetchAll(PDO::FETCH_ASSOC);
    }

    // ABM Ciudades //

    public function borrarCiudad($id){
      $sentencia = $this->db->prepare( "DELETE FROM Ciudades WHERE ID_CIUDAD = ?");
      $sentencia->execute($id);
      return $sentencia->fetchAll(PDO::FETCH_ASSOC);
    }

    public function agregarCiudad($nombre){
      $sentencia = $this->db->prepare( "INSERT INTO Ciudades(NOMBRE_CIUDAD) VALUES (?) ");
      $sentencia->execute($nombre);
      return $sentencia->fetchAll(PDO::FETCH_ASSOC);
    }

    public function updateCiudad($id,$nnuevo){
      $sentencia = $this->db->prepare( "UPDATE Ciudades SET NOMBRE_CIUDAD = ? WHERE ID_CIUDAD = ? ");
      $sentencia->execute(array($nnuevo,$id));
      return $sentencia->fetchAll(PDO::FETCH_ASSOC);
    }

    // ABM Ciudades //
}



?>
