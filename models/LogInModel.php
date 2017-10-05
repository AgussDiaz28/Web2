<?php
include_once 'models/dbModel.php';
class LoginModel extends dbModel
{

  function getUser($userName){
    $sentencia = $this->db->prepare( "SELECT * FROM usuario WHERE username = ? LIMIT 1");
    $sentencia->execute([$userName]);
    return $sentencia->fetchAll(PDO::FETCH_ASSOC);
  }
//
//   function guardarTarea($titulo, $descripcion, $completada){
//     $sentencia = $this->db->prepare('INSERT INTO tarea(titulo,descripcion,completado) VALUES(?,?,?)');
//     $sentencia->execute([$titulo,$descripcion,$completada]);
//   }
//
//   function borrarTarea($id_tarea){
//     $sentencia = $this->db->prepare( "delete from tarea where id_tarea=?");
//     $sentencia->execute([$id_tarea]);
//   }
//
//   function finalizarTarea($id_tarea)
//   {
//     $sentencia = $this->db->prepare( "update tarea set completado=1 where id_tarea=?");
//     $sentencia->execute([$id_tarea]);
//   }

}

 ?>
