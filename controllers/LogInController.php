<?php
include_once('models/UserModel.php');
include_once('views/LoginView.php');
include_once('views/SignUpView.php');
include_once('controllers/SecuredController.php');
class LoginController extends SecuredController
{

    function __construct()
    {
        $this->view = new LoginView();
        $this->viewSignUp = new SignUpView();

        $this->model = new UserModel();
    }

    public function index()
    {
        if (!empty($_POST['error'])) {
            $error = $_POST['error'];
            $this->view->mostrarLogin($error);
        } else {
            $this->view->mostrarLogin();
        }
    }

    public function indexSignUp()
    {
        if (!empty($_POST['error'])) {
            $error = $_POST['error'];
            $this->viewSignUp->mostrarSignUp($error);
        } else {
            $this->viewSignUp->mostrarSignUp();
        }
    }

    public function SignUp()
    {
        $userName = $_POST['usuario'];
        $password = $_POST['password'];
        $email = $_POST['email'];
        if (!empty($userName) && !empty($password) && !empty($email)) {
            $password = password_hash($password, PASSWORD_DEFAULT);

            $value = array($userName,$password,$email);
            $this->model->registrarUsuario($value);

            $user = $this->model->getUser($userName);
            $esAdmin = (int) $user[0]['ADMIN'];

            $this->loguearse($userName, $esAdmin, $user);
        }
    }

    private function loguearse($userName, $esAdmin, $user)
    {
        session_start();
        $_SESSION['USER'] = $userName;
        $_SESSION['USER_ID'] = $user[0]['ID_USUARIO'];

        if ($esAdmin == 1) {
            $_SESSION['ADMIN'] = true;
        } else {
            $_SESSION['ADMIN'] = false;
        }

        $_SESSION['LAST_ACTIVITY'] = time();
        $_SESSION['LOGGED'] = true;
        header('Location: '.HOME);
    }

    public function LogIn()
    {
        $userName = $_POST['usuario'];
        $password = $_POST['password'];
        if (!empty($userName) && !empty($password)) {
            $user = $this->model->getUser($userName);
            $esAdmin = (int) $user[0]['ADMIN'];
            if ((!empty($user)) && password_verify($password, $user[0]['PASSWORD'])) {
                $this->loguearse($userName, $esAdmin, $user);
            } else {
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
