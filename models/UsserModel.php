<?php
include_once 'models/dbModel.php';
class UsserModel extends dbModel
{
  public function getUssers(){
    $sentencia = $this->db->prepare( "SELECT * FROM usuario");
    $sentencia->execute();
    return $sentencia->fetchAll(PDO::FETCH_ASSOC);
  }

  public function borrarUsser($id){
    $sentencia = $this->db->prepare( "DELETE FROM usuario WHERE ID_USUARIO = ?");
    $sentencia->execute($id);
  }

  public function actualizarUssers($values){
    $sentencia = $this->db->prepare( "UPDATE usuario SET ADMIN = ? WHERE ID_USUARIO = ? ");
    $sentencia->execute($values);
  }
}

 ?>
