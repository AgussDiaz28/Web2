<?php

class dbModel{

  protected $db;

  function __construct(){
    $this->db = new PDO('mysql:host=localhost;dbname=db_turismo;charset=utf8', 'root', 'root');
  }
}

 ?>
