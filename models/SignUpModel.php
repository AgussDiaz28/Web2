<?php
include_once 'models/dbModel.php';
class SignUpModel extends dbModel
{

  public function registrarUsuario($value){
    $sentencia = $this->db->prepare( "INSERT INTO usuario (USERNAME, PASSWORD, EMAIL) VALUES (?,?,?) ");
    $sentencia->execute($value);
  }
}

 ?>
