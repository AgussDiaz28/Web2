<?php
include_once('views/NewDBView.php');
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
         $this->view = new NewDBView;
        //  $this->view->pNewDB("No se encontro la Base de Datos, $error");
    }
  }

  protected function setConnection(){
    $credenciales = $this->readFiledb();

    $dbn = substr($credenciales[0], 0, -1); //Elimino un espacio al final del strign, verificar por que pasa lo del espacio al final
    $host = substr($credenciales[1], 0, -1);
    $username =  substr($credenciales[2], 0, -1);
    if(isset($credenciales[3])){
      $password =  substr($credenciales[3], 0, -1);
    }else{
      $password = "";
    }

    $config = "mysql:host=$host;dbname=$dbn;charset=utf8";
    $this->db = new PDO($config, $username, $password);

    return $this->db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
  }

  protected function readFiledb(){
    $row = 0;
    $fh = fopen('dbconfig.txt','r');
    while ($line = fgets($fh)) {
      $arr[$row] = $line;
      $row++;
    }
    fclose($fh);
    return($arr);
  }

  public function newDB(){
    try{
          if ($_POST['setDB'])
          {
            if (!$this->setConnection())
            {
              throw new Exception('No se pudo conectar con la Base de Datos');
            }
          }
          else
          {
            $credenciales = $this->readFiledb();

            $HOST = substr($credenciales[0],0,-1);
            $USERNAME = substr($credenciales[1],0,-1);
            $PASSWORD = substr($credenciales[2],0,-1);
            $DB = substr($credenciales[3],0,-1);

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
