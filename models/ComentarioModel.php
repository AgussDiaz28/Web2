<?php
require_once('models/dbModel.php');
class ComentarioModel extends dbModel
{

  public function getComentarios($id)
  {
    $sentencia = $this->db->prepare("SELECT * FROM Comentario WHERE ID_AEROLINEA = ?");
    $sentencia->execute([$id]);
    return $sentencia->fetchAll(PDO::FETCH_ASSOC);
  }

  public function borrarComentario($id)
  {
    $sentencia = $this->db->prepare( "DELETE FROM Comentario WHERE ID_COMENTARIO= ?");
    $sentencia->execute([$id]);
  }

  public function agregarComentarioAerolinea($id_aerolinea,$descripcion) //Comentario trae en la primer posicion el DETALLE y ID_AEROLINEA
  {
    $sentencia = $this->db->prepare( "INSERT INTO Comentario(DETALLE,ID_AEROLINEA) VALUES (?,?) ");
    $sentencia->execute([$descripcion,$id_aerolinea]);
  }

}
 ?>
