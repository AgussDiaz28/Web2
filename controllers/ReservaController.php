<?php
include_once('controllers/SecuredController.php');
include_once('models/ReservaModel.php');
include_once('views/ReservaView.php');

class ReservaController extends SecuredController
{

    function __construct()
    {
        $this->modelo = new ReservaModel();
        $this->view = new ReservaView();
    }

    function verDisponibilidad(){
        $this->view->mostrarReservas();
    }

}