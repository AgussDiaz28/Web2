<?php
include_once('models/LoginModel.php');
include_once('models/SignUpModel.php');
include_once('views/LoginView.php');
include_once('views/SignUpView.php');
include_once('controllers/SecuredController.php');
class LoginController extends SecuredController{

  function __construct(){
    $this->view = new LoginView();
    $this->model = new LoginModel();

    $this->viewSignUp = new SignUpView();
    $this->modelSignUp = new SignUpModel();
  }

  public function index(){
    if(!empty($_POST['error'])){
      $error = $_POST['error'];
      $this->view->mostrarLogin($error);
    }else {
      $this->view->mostrarLogin();
    }
  }

  public function indexSignUp(){
    if(!empty($_POST['error'])){
      $error = $_POST['error'];
      $this->viewSignUp->mostrarSignUp($error);
    }else {
      $this->viewSignUp->mostrarSignUp();
    }
  }

  public function SignUp()
  {
      $userName = $_POST['usuario'];
      $password = $_POST['password'];
      $email = $_POST['email'];
      if(!empty($userName) && !empty($password) && !empty($email)){

        $password = password_hash($password, PASSWORD_DEFAULT);

        $value = array($userName,$password,$email);
        $this->modelSignUp->registrarUsuario($value);

        session_start();
        $_SESSION['USER'] = $userName;
        $_SESSION['LAST_ACTIVITY'] = time();
        $_SESSION['LOGGED'] = TRUE;
        header('Location: '.HOME);
      }
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
            $_SESSION['LOGGED'] = TRUE;
            header('Location: '.HOME);
        }
        else{
            header('Location: '.HOME);
        }
      }
  }

  public function LogOut()
  {
    session_start();
    session_destroy();
    header('Location: '.HOME);
  }
}

 ?>
