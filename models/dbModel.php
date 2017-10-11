<?php
include_once('DBCONFIG.PHP');
class dbModel{

  protected $db;
  protected $view;

  function __construct(){
    try{

      $this->db = new PDO($config, USERNAME, PASSWORD);

    }catch (Exception $e) {

      $host = HOST;
      $dbn = DB;

      $this->db->exec('CREATE DATABASE IF NOT EXISTS '.$dbn);
      $this->db->exec('USE '. $dbn);
      $sql = file_get_contents('db.sql');
      $this->db->exec($sql);

      $config = "mysql:host=$host;dbname=$dbn;charset=utf8";
      $this->db = new PDO($config, USERNAME, PASSWORD);

    }
  }

}


 ?>
