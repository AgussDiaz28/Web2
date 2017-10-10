<?php
include_once('DBCONFIG.PHP');
class dbModel{

  protected $db;
  protected $view;

  function __construct(){
    try{
      if (!$this->setConnection()){
        throw new Exception('No se pudo conectar con la Base de Datos');
      }
    }catch (Exception $e) {
         $error = $e->getMessage();
        //  $this->newDB();
    }
  }

  protected function setConnection(){
    $host = HOST;
    $dbn = DB;

    $config = "mysql:host=$host;dbname=$dbn;charset=utf8";
    $this->db = new PDO($config, USERNAME, PASSWORD);


    $sql = file_get_contents('db.sql');

    $this->db->exec($sql);

      return $this->db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
  }

  public function newDB(){

            $HOST = HOST;
            $USERNAME = USERNAME;
            $PASSWORD = PASSWORD;
            $DB = DB;

            $config = "mysql:host=$host;dbname=$dbn;charset=utf8";
            $this->db = new PDO($config, USERNAME, PASSWORD);

            $sql = file_get_contents('db.sql');

            $this->db->exec($sql);
  }
}


 ?>
