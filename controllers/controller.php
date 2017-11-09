<?php
define('HOME', 'http://'.$_SERVER['HTTP_HOST'] . dirname($_SERVER['PHP_SELF']).'/');
define('CIUDADES', 'http://'.$_SERVER['HTTP_HOST'] . dirname($_SERVER['PHP_SELF']).'/pciudades');

class Controller
{
    protected $view;
    protected $model;
}
