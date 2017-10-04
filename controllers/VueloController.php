<?php
include_once('views/VuelosView.php');
include_once('views/VueloView.php');

include_once('models/CiudadModel.php');
include_once('models/VueloModel.php');
include_once('models/AerolineaModel.php');

include_once('controllers/controller.php');

class VueloController extends Controller
{

    private $tVuelos;
    private $tCiudades;
    private $tAerolienas;

    private $vuelos;

  function __construct(){
    $this->view = new VuelosView();
    $this->vuelos = new VueloView();

    $this->modelo = new VueloModel();
    $this->mCiudades = new CiudadModel();
    $this->mAerolineas =  new AerolineaModel();
  }


  function MostrarPaginaVuelos(){
    $this->getDatos();
    $this->vuelos->mostrarVuelos($this->tCiudades,$this->tAerolienas,$this->tVuelos);
  }

  function getDatos(){
      $this->tCiudades = $this->mCiudades->getCiudades();
      $this->tVuelos = $this->modelo->getVuelos();
      $this->tAerolienas = $this->mAerolineas->getAerolineas();
  }


  function mostrarVuelos(){
    $vuelos = $this->modelo->getVuelos();
    return $vuelos;
  }

  function actualizarVwVuelos(){

    $destino    = filter_input(INPUT_POST, 'destino');
    $aerolinea  = filter_input(INPUT_POST, 'aerolinea');
    $fecha      = filter_input(INPUT_POST, 'fecha');

    /* Conversion a Integer para la comparacion*/
    $destino = (int) $destino;
    $aerolinea= (int) $aerolinea;
    /* Conversion a Integer para la comparacion*/
    //FALTA AGREGAR LA FECHA PARA QUE TAMBIEN SE USE PARA FILTRAR

    $vuelos = $this->modelo->getVuelos($destino,$aerolinea,$fecha);
    return $this->view->mostrarVuelos($vuelos);

  }

  function agregarVuelo(){
    $CVuelo         = filter_input(INPUT_POST, 'CVuelo');
    $SNAerolinea    = filter_input(INPUT_POST, 'SNAerolinea');
    $SCOrigen       = filter_input(INPUT_POST, 'SCOrigen');
    $SCDestino      = filter_input(INPUT_POST, 'SCDestino');
    $FSVuelo        = filter_input(INPUT_POST, 'FSVuelo');
    $PVuelo         = filter_input(INPUT_POST, 'PVuelo');

    try {                  //PREGUNTAR SI LA EXCEPCION TERMINA LA EJECUCION INMEDIATAMENTE MEDIANTE EL CATCH
          if (!empty($CVuelo)) {
            # code...
          }else {
            throw new Exception("No ingreso el codigo del Vuelo");
          }
          if (!empty($SNAerolinea)) {
            # code...
          }else {
            throw new Exception("No selecciono Aerolinea");
          }
          if (!empty($SCOrigen)) {
            # code...
          }else {
            throw new Exception("No selecciono una Ciudad de Origen");
          }
          if (!empty($SCDestino)) {
            # code...
          }else {
            throw new Exception("No se selecciono una ciudad de Destino");
          }
          if (!empty($FSVuelo)) {
            # code...
          }
          if (!empty($PVuelo)) {
            # code...
          }else {
            throw new Exception("No ingreso el precio del vuelo");
          }
          $values = array($CVuelo,(int)$SNAerolinea,(int)$SCOrigen,(int)$SCDestino,$FSVuelo,(int)$PVuelo);
          $this->modelo->agregarVuelo($values); //ESTRE PROCESO NO ESTA INCERTANDO CORRECTAMENTE, VERIFICAR PROBLEMA
          $result = true;
          $error = false;
    } catch (Exception $e) {
      $error = $e->getMessage();
      $result = false;
    }
    header('Content-Type: application/json');       //JSON de repuesta para ajax
    echo json_encode([
        'result'=> $result,
        'error'=>$error,
    ]);
      die();
  }

  function actualizarVuelo($params){

    $CVuelo         = filter_input(INPUT_POST, 'CVuelo');
    $SNAerolinea    = filter_input(INPUT_POST, 'SNAerolinea');
    $SCOrigen       = filter_input(INPUT_POST, 'SCOrigen');
    $SCDestino      = filter_input(INPUT_POST, 'SCDestino');
    $FSVuelo        = filter_input(INPUT_POST, 'FSVuelo');
    $PVuelo         = filter_input(INPUT_POST, 'PVuelo');

    try {                  //PREGUNTAR SI LA EXCEPCION TERMINA LA EJECUCION INMEDIATAMENTE MEDIANTE EL CATCH
          if (!empty($CVuelo)) {
            # code...
          }else {
            throw new Exception("No ingreso el codigo del Vuelo");
          }
          if (!empty($SNAerolinea)) {
            # code...
          }else {
            throw new Exception("No selecciono Aerolinea");
          }
          if (!empty($SCOrigen)) {
            # code...
          }else {
            throw new Exception("No selecciono una Ciudad de Origen");
          }
          if (!empty($SCDestino)) {
            # code...
          }else {
            throw new Exception("No se selecciono una ciudad de Destino");
          }
          if (!empty($FSVuelo)) {
            # code...
          }
          if (!empty($PVuelo)) {
            # code...
          }else {
            throw new Exception("No ingreso el precio del vuelo");
          }
          $values = array($CVuelo,(int)$SNAerolinea,(int)$SCOrigen,(int)$SCDestino,$FSVuelo,(int)$PVuelo);
          $id_vuelo = $params[0]; //recibe como params el id del vuelo (en forma de string.. aunque castees en (int) no funca)
          $this->modelo->actualizarVuelo($values,$id_vuelo);
          $result = true;
          $error = false;
    } catch (Exception $e) {
      $error = $e->getMessage();
      $result = false;
    }
    header('Content-Type: application/json');       //JSON de repuesta para ajax
    echo json_encode([
        'result'=> $result,
        'error'=>$error,
    ]);
      die();
  }

  function borrarVuelo($id){
    return  $this->modelo->borrarVuelo($id);
  }

  function cargarVuelo($value=''){

  }
}
 ?>
