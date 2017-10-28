<?php
require_once('dbconfig.php');
class dbModel{

  protected $db;
  protected $view;

  function __construct(){
    try{

      $host = HOST;
      $dbn = DB;

      $config = "mysql:host=$host;charset=utf8";
      $this->db = new PDO($config, USERNAME, PASSWORD);

      $this->db->exec('CREATE DATABASE IF NOT EXISTS '.$dbn);
      $this->db->exec('USE '. $dbn);

      $query = $this->db->exec( "SELECT * FROM usuario");

      $sql = file_get_contents('db.sql');

      if (!$query){
          $this->db->exec($sql);
          $config = "mysql:host=$host;dbname=$dbn;charset=utf8";
          $this->db = new PDO($config, USERNAME, PASSWORD);
      }

    }catch (Exception $e) {

    }

  }

}


 ?>
