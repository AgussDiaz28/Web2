<?php
require_once('models/dbModel.php');
class ImagenesModel extends dbModel
{

    private function uploadImages($imagenes)
    {
        $rutas = [];
        foreach ($imagenes as $imagen) {
            $destino_final = 'images/' . uniqid() . '.jpg';
            move_uploaded_file($imagen, $destino_final);
            $rutas[]=$destino_final;
        }
        return $rutas;
    }

    public function agregarImagenes($imagenes,$id_ciudad)
    {
      $rutas = $this->uploadImages($imagenes);
      $sentencia_imagenes = $this->db->prepare('INSERT INTO imagen(id_ciudad,path) VALUES(?,?)');
      foreach ($rutas as $ruta) {
        $sentencia_imagenes->execute([$id_ciudad,$ruta]);
      }
    }

    public function getImages($id)
    {
      $sentencia = $this->db->prepare("SELECT * FROM vw_comentarios WHERE ID_AEROLINEA = ?");
      $sentencia->execute([$id]);
      return $sentencia->fetchAll(PDO::FETCH_ASSOC);
    }

    public function deleteImages($id)
    {
      $sentencia = $this->db->prepare( "DELETE FROM Comentario WHERE ID_COMENTARIO= ?");
      $sentencia->execute([$id]);
    }

}
