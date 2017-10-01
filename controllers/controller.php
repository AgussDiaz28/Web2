<?php
define('HOME', 'http://'.$_SERVER['HTTP_HOST'] . dirname($_SERVER['PHP_SELF']).'/');
define('LOGIN', 'http://'.$_SERVER['HTTP_HOST'] . dirname($_SERVER['PHP_SELF']).'/login');
define('LOGOUT', 'http://'.$_SERVER['HTTP_HOST'] . dirname($_SERVER['PHP_SELF']).'/logout');

class Controller
{
  protected $view;
  protected $model;
}

?>
