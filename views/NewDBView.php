<?php 
include_once 'libs/Smarty.class.php';
class NewDBView{

      protected $view;

      function __construct(){
             $this->view = new Smarty();
      }

      function pNewDB($error){
            $this->view->assign('error',$error);
            $this->view->display('templates/dbdatos.tpl');
      }
}
?>