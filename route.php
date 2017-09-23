<?php

  define('ACTION', 0);
  define('VALOR1', 1);
  define('VALOR2', 2);
  include_once 'controllers/AdminController.php';
  include_once 'controllers/AerolineaController.php';
  include_once 'controllers/CiudadController.php';
  include_once 'controllers/HomeController.php';
  include_once 'controllers/IndexController.php';
  include_once 'controllers/VueloController.php';
  include_once 'config/ConfigApp.php';

  function parseURL($url)
  {
    $urlExploded = explode('/', $url);
    $arrayReturn[ConfigApp::$ACTION] = $urlExploded[ACTION];
    $arrayReturn[ConfigApp::$PARAMS] = isset($urlExploded[VALOR1]) ? array_slice($urlExploded,1) : null;
    return $arrayReturn;
  }

  if(isset($_GET['action'])){
     $urlData = parseURL($_GET['action']);
      $action = $urlData[ConfigApp::$ACTION];
      if(array_key_exists($action,ConfigApp::$ACTIONS)){
          $params = $urlData[ConfigApp::$PARAMS];
          $metodo = ConfigApp::$ACTIONS[$action];
          $controller = new ConfigApp::$CONTROLLERS[$action]();
          if(isset($params) &&  $params != null){
              echo $controller->$metodo($params);
          }
          else{
              echo $controller->$metodo();
          }
      }
  }

 ?>
