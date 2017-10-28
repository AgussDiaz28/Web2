<?php
include_once 'models/dbModel.php';
class LoginModel extends dbModel
{
  function getUser($userName){
    $sentencia = $this->db->prepare( "SELECT * FROM usuario WHERE USERNAME = ? LIMIT 1");
    $sentencia->execute([$userName]);
    return $sentencia->fetchAll(PDO::FETCH_ASSOC);
  }
}

 ?>
