<?php
require_once('Api.php');
require_once('models/ComentarioModel.php');

class ComentariosController extends Api
{

  function __construct()
  {
    parent::__construct();
    $this->model = new ComentarioModel();
  }

  function getComentario($url_params = []){ //Comentarios por Aerolinea
    $id = $url_params[":id"];
    $comentarios = $this->model->getComentarios($id);
    $response = new stdClass();
    $response->comentarios = $comentarios;
    $response->status = 200;
    return $this->json_response($response, 200);
  }

  public function borrarComentario($url_params = [])
  {
    $id_comentario = $url_params[":id"];
    $this->model->borrarComentario($id_comentario);
  }

  public function agregarComentarioAerolinea($url_params = [])
  {
    $body = json_decode($this->raw_data);
    $id_aerolinea = $body->id_aerolinea;
    $descripcion = $body->descripcion;
    $id_usuario = $_SESSION['ID']; //FALTA IMPLEMENTAR ESTO
    $this->model->agregarComentarioAerolinea($id_aerolinea,$descripcion,$id_usuario);
  }

}

 ?>
