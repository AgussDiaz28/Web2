<?php

include_once 'views/HomeView.php';
include_once 'views/IndexView.php';
include_once 'views/AdminView.php';
include_once 'views/PaginaVueloView.php';

include_once 'models/AerolineaModel.php';
include_once 'models/CiudadModel.php';
include_once 'models/VueloModel.php';

class NavController
{
  private $view;
  private $index;
  private $admin;
  private $vuelos;

  private $mAerolinea;
  private $mCiudad;
  private $mVuelos;

  function __construct()
  {
    $this->view =  new HomeView();
    $this->index = new IndexView();
    $this->admin = new AdminView();
    $this->vuelos = new PaginaVueloView();

    $this->mAerolinea = new AerolineaModel();
    $this->mCiudad = new CiudadModel();
    $this->mVuelos = new VueloModel();
  }

  function home(){
    $this->view->mostrarHome();
  }

  function index(){
      $this->index->mostrarIndex();
  }

  function adminABM(){
      $this->admin->mostrarAdmin($this->mCiudad->getCiudades(),$this->mAerolinea->getAerolineas(),$this->mVuelos->getVuelos());
  }

  function PaginaVuelos(){
    $this->vuelos->mostrarPagVuelos($this->mCiudad->getCiudades(),$this->mAerolinea->getAerolineas(),$this->mVuelos->getVuelos());
  }

}


 ?>
