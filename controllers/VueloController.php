<?php
include_once('views/VueloView.php');

include_once('models/CiudadModel.php');
include_once('models/VueloModel.php');
include_once('models/AerolineaModel.php');

include_once('controllers/Controller.php');

require_once('utilities/criterio_ordenamiento.php');

class VueloController extends Controller
{

    private $tVuelos;
    private $tCiudades;
    private $tAerolienas;

    private $vuelos;

  function __construct(){
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
    $aerolinea = (int) $aerolinea;
    /* Conversion a Integer para la comparacion*/
    //FALTA AGREGAR LA FECHA PARA QUE TAMBIEN SE USE PARA FILTRAR

    $vuelos = $this->modelo->getVuelos($destino,$aerolinea,$fecha);
    uasort($vuelos, 'criterio_ordenamiento');
    return $this->vuelos->actualizarTablaVuelos($vuelos);
  }

  function agregarVuelo(){
    $CVuelo         = filter_input(INPUT_POST, 'CVuelo');
    $SNAerolinea    = filter_input(INPUT_POST, 'SNAerolinea');
    $SCOrigen       = filter_input(INPUT_POST, 'SCOrigen');
    $SCDestino      = filter_input(INPUT_POST, 'SCDestino');
    $FSVuelo        = filter_input(INPUT_POST, 'FSVuelo');
    $PVuelo         = filter_input(INPUT_POST, 'PVuelo');

    try {                  //PREGUNTAR SI LA EXCEPCION TERMINA LA EJECUCION INMEDIATAMENTE MEDIANTE EL CATCH
          if (empty($CVuelo)) {
            throw new Exception("No ingreso el codigo del Vuelo");
          }
          if (empty($SNAerolinea)) {
            throw new Exception("No selecciono Aerolinea");
          }
          if (empty($SCOrigen)) {
            throw new Exception("No selecciono una Ciudad de Origen");
          }
          if (empty($SCDestino)) {
            throw new Exception("No se selecciono una ciudad de Destino");
          }
          if (empty($PVuelo)) {
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

  function actualizarVuelo($id_vuelo){

    $CVuelo         = filter_input(INPUT_POST, 'CVuelo');
    $SNAerolinea    = filter_input(INPUT_POST, 'SNAerolinea');
    $SCOrigen       = filter_input(INPUT_POST, 'SCOrigen');
    $SCDestino      = filter_input(INPUT_POST, 'SCDestino');
    $FSVuelo        = filter_input(INPUT_POST, 'FSVuelo');
    $PVuelo         = filter_input(INPUT_POST, 'PVuelo');

    try {
      if (empty($CVuelo)) {
        throw new Exception("No ingreso el codigo del Vuelo");
      }
      if (empty($SNAerolinea)) {
        throw new Exception("No selecciono Aerolinea");
      }
      if (empty($SCOrigen)) {
        throw new Exception("No selecciono una Ciudad de Origen");
      }
      if (empty($SCDestino)) {
        throw new Exception("No se selecciono una ciudad de Destino");
      }
      if (empty($PVuelo)) {
        throw new Exception("No ingreso el precio del vuelo");
      }
      $values = array($CVuelo,(int)$SNAerolinea,(int)$SCOrigen,(int)$SCDestino,$FSVuelo,(int)$PVuelo,(int)$id_vuelo[0]); //params contiene el id del vuelo a modificar
      $this->modelo->actualizarVuelo($values);
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

  function borrarVuelo($id_vuelo){
    return  $this->modelo->borrarVuelo($id_vuelo);
  }
}
 ?>
