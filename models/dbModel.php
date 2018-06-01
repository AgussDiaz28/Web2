<?php
require_once('dbconfig.php');
class dbModel{

  protected $db;
  protected $dbp;
  protected $view;

    private function constructMysql(){ // Contruyo mi base MySqL
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
    }

    // Coneccion con la base postgres
    private function constructPMySql(){
        $host = HOSTP;
        $dbn = DBP;

        $config = "pgsql:host=$host;charset=utf8";
        $this->dbp = new PDO($config, USERNAMEP, PASSWORDP);

        $this->dbp->exec('CREATE DATABASE IF NOT EXISTS '.$dbn);
        $this->dbp->exec('USE '. $dbn);

        $query = $this->dbp->exec( "SELECT * FROM usuario");

        $sqlPostgress = file_get_contents('Reservas_create.sql');

        if (!$query){
            $this->dbp->exec($sqlPostgress);
            $config = "mysql:host=$host;dbname=$dbn;charset=utf8";
            $this->dbp = new PDO($config, USERNAMEP, PASSWORDP);
        }
    }

  function __construct(){
    try{

        $this->constructMysql();
        $this->constructPMySql();

    }catch (Exception $e) {

    }

  }

}


 ?>
