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
    }
  }

  protected function setConnection(){
    $host = HOST;
    $dbn = DB;

    $config = "mysql:host=$host;dbname=$dbn;charset=utf8";
    $this->db = new PDO($config, USERNAME, PASSWORD);

    return $this->db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
  }

  public function newDB(){
    try{
          if (!$this->setConnection())
          {
            throw new Exception('No se pudo conectar con la Base de Datos');
          }else
          {
            $credenciales = $this->readFiledb();

            $HOST = HOST;
            $USERNAME = USERNAME;
            $PASSWORD = PASSWORD;
            $DB = DB;

            $mysqlImportFilename ='db.sql';
            $command='mysql -h'. $HOST .' -u'. $USERNAME .' -p'. $PASSWORD .' '. $DB .' < ' .$mysqlImportFilename;
            exec($command,$output=array(),$worked);
            if ($worked == 0){
                  echo 'Base de datos exportada exitosamente';
            }else{
                throw new Exception('No se pudo exportar la Base de Datos');
            }
          }
    }catch(Exception $e){
      $error = $e->getMessage();
      $this->view->pNewDB("No se encontro la Base de Datos, $error");
    }
  }

}

 ?>
