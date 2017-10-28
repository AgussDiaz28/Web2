<?php

define('RESOURCE', 0);
define('PARAMS', 1);

require_once('api/config/Router.php');
require_once('api/controller/ComentariosController.php');


$router = new Router();
//url, verb, controller, method
$router->AddRoute("comentario/:id", "GET", "ComentariosController", "getComentarios");
$router->AddRoute("comentario", "POST", "ComentariosController", "agregarComentarioAerolinea");
$router->AddRoute("comentario/:id", "DELETE", "ComentariosController", "borrarComentario");

$route = $_GET['resource'];
$array = $router->Route($route);

if(sizeof($array) == 0)
  echo "404";
else
{
  $controller = $array[0];
  $metodo = $array[1];
  $url_params = $array[2];
  echo (new $controller())->$metodo($url_params);
}

?>
