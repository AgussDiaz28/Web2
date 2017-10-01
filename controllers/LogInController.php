<?php
include_once('models/LoginModel.php');
include_once('views/LoginView.php');
include_once('controllers/SecuredController.php');
class LoginController extends SecuredController{

  function __construct()
  {
    $this->view = new LoginView();
    $this->model = new LoginModel();
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
            header('Location: '.HOME);
        }
        else{
            $this->view->mostrarLogin('Usuario o Password incorrectos');
        }
      }
  }

  public function LogOut()
  {
    session_start();
    session_destroy();
    header('Location: '.LOGIN);
  }
}

 ?>
