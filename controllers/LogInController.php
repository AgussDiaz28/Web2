<?php
include_once('models/LoginModel.php');
include_once('views/LoginView.php');
include_once('controllers/SecuredController.php');
class LoginController extends SecuredController{

  function __construct()
  {
    $this->view = new LoginView();
    $this->model = new LoginModel();
    $this->viewH = new IndexView();
  }

  public function index()
  {
    $this->view->mostrarLogin();
  }

  public function LogIn()
  {
      $userName = $_POST['usuario'];
      $password = $_POST['password'];
      if(!empty($userName) && !empty($password)){
        $user = $this->model->getUser($userName);
        if((!empty($user)) && password_verify($password, $user[0]['PASSWORD'])) {
            session_start();
            $_SESSION['USER'] = $userName;
            $_SESSION['LAST_ACTIVITY'] = time();
        }
        else{
            $this->view->mostrarLogin('Usuario o Password incorrectos');
        }
        $this->viewH->mostrarIndex(TRUE);
        header('Location: '.HOME);
      }
  }

  public function LogOut()
  {
    session_start();
    session_destroy();
    $this->viewH->mostrarIndex(FALSE);
    header('Location: '.HOME);
  }
}

 ?>
