<?php
include_once('views/NewDBView.php');
class dbModel{

  protected $db;
  protected $view;

  function __construct(){
    try{
        $this->db = new PDO('mysql:host=localhost;dbname=db_turismo;charset=utf8', 'root', 'root');
        $this->db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    }catch (Exception $e) {
         $error = $e->getMessage();
         $this->view = new NewDBView;
         $this->view->pNewDB("No se encontro la Base de Datos, $error");
    }
  }
  
  public function newDB(){
    //  -------------------------- Datos a traer por POST  --------------------------
    $mysqlDatabaseName ='test';
    $mysqlUserName ='root';
    $mysqlPassword ='';
    $mysqlHostName ='localhost';
    // -------------------------- Datos a traer por POST  --------------------------

    $mysqlImportFilename ='db.sql';
    $command='mysql -h' .$mysqlHostName .' -u' .$mysqlUserName .' -p' .$mysqlPassword .' ' .$mysqlDatabaseName .' < ' .$mysqlImportFilename;

    try{
        exec($command,$output=array(),$worked);
          if ($worked == 0){
                echo 'Base de datos exportada exitosamente';
          }else{
              throw new Exception('No se pudo exportar la Base de Datos');
          }
    }catch(Exception $e){
      $e->getMessage();
    }
  }

}

 ?>
