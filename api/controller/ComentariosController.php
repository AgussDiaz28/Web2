<?php
require_once('Api.php');
require_once('models/ComentarioModel.php');
require_once('vendor/simple-php-captcha-master/simple-php-captcha.php');
class ComentariosController extends Api
{
    private $captcha;

    function __construct()
    {
        parent::__construct();
        $this->model = new ComentarioModel();
    }

    function getComentario($url_params = [])
    {
 //Comentarios por Aerolinea
        $id = $url_params[":id"];
        $comentarios = $this->model->getComentarios($id);
        $response = new stdClass();
        $response->comentarios = $comentarios;
        $response->admin = false;
        $response->status = 200;
        $response->id_aerolinea = $id;
        if ($this->SessionActive()['ADMIN']) {
            $response->admin = true;
        }
        //captcha
        $_SESSION['captcha_array'] = $_SESSION['captcha'] = simple_php_captcha();
        $response->captcha_img = $_SESSION['captcha_array']['image_src'];

        return $this->json_response($response, 200);
    }

    public function borrarComentario($url_params = [])
    {
        if ($this->SessionActive()['ADMIN']) {
            $id_comentario = $url_params[":id"];
            $this->model->borrarComentario($id_comentario);
        }
    }

    public function agregarComentarioAerolinea($url_params = [])
    {
        if ($this->SessionActive()['USER']) {
            $body = json_decode($this->raw_data);
            $id_aerolinea = $body->id_aerolinea;
            $descripcion = $body->descripcion;
            $captcha_code = $body->captcha;
            if (!isset($_SESSION)) {
                session_start();
            }
            $id_usuario = $_SESSION['USER_ID'];
            if ($_SESSION['captcha_array']['code'] == $captcha_code) {
                $this->model->agregarComentarioAerolinea($id_aerolinea, $descripcion, $id_usuario);
            } else {
                $response = "No incerto correctamente el capcha.";
                return $this->json_response($response, 404);
            }
                $_SESSION['captcha_array'] = $_SESSION['captcha'] = simple_php_captcha();
        } else {
            $response = "No tiene Permiso para agregar Comentarios.";
            return $this->json_response($response, 404);
        }
    }

    public function puntajeConmentario($url_params = [])
    {
        if ($this->SessionActive()['USER']) {
            $id_comentario = $url_params[":id"];
            $body = json_decode($this->raw_data);
            $nuevoPuntaje = $body->puntajeComentario;
            $this->model->setPuntajeComentario($id_comentario, $nuevoPuntaje);
        } else {
            $response = "No tiene Permiso para modificar la calificacion.";
            return $this->json_response($response, 404);
        }
    }
}
