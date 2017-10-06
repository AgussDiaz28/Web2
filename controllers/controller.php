<?php
define('HOME', 'http://'.$_SERVER['HTTP_HOST'] . dirname($_SERVER['PHP_SELF']).'/');
define('LOGIN', 'http://'.$_SERVER['HTTP_HOST'] . dirname($_SERVER['PHP_SELF']).'/');
define('LOGOUT', 'http://'.$_SERVER['HTTP_HOST'] . dirname($_SERVER['PHP_SELF']).'/');

class Controller {

  protected $allVisible;
  protected $view;
  protected $model;

}

?>
