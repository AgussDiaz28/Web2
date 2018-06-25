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
        $departamentos = $this->modelo->getDepartamentos();
        $this->view->mostrarReservas($departamentos);
    }

    function formatDateForDb($date){
        //Quito todos los espacios del string con las fehcas
        $date = str_replace(' ', '', $date);

        //Separo el string por / , para volver a crear la fecha con un nuevo formato
        list($dia, $mes, $anio) = explode('/', $date);

        //Armo la fecha con el nuevo formato para la Base de Datos (Y-m-d)
        $date = "$anio/$mes/$dia";

        return $date;
    }

    function formatDateForView($date){
        //Quito todos los espacios del string con las fehcas
        $date = str_replace(' ', '', $date);

        //Separo el string por / , para volver a crear la fecha con un nuevo formato
        list($anio,$mes,$dia) = explode('-', $date);

        //Armo la fecha con el nuevo formato para la Base de Datos (d-m-Y)
        $date = "$dia/$mes/$anio";

        return $date;
    }
    
    function fullRangeDatesForView($from,$to){
        $fullRange = [];

        list($anioF,$mesF,$diaF) = explode('-', $from);
        list($anioT,$mesT,$diaT) = explode('-', $to);

        //Guardo el inicio de la se reserva
        $fullRange[] = "'$anioF-$mesF-$diaF'";

        //Casteo a integer los dias
        $diaF = (int) $diaF;
        $diaT = (int) $diaT;
        $diaF += 1;

        //Asumo que la reservas seran durante un mismo anio
        while (($diaF != $diaT)){
            $diaF = sprintf("%02d", $diaF);
            $date = "'$anioT-$mesT-$diaF'";
            $fullRange[] = $date;
            $diaF += 1;
        }

        //Agrego el ultimo de ocupacion
        $fullRange[] = "'$anioT-$mesT-$diaT'";

        return $fullRange;
    }
    
    private function getTheRightStart($dbDate,$requestedDate){
        $dbDate = new \DateTime($dbDate);
        $requestedDate = new \DateTime($requestedDate);
        if ($dbDate < $requestedDate ){
            return $requestedDate->format('Y-m-d');
        }else{
            return $dbDate->format('Y-m-d');
        }
    }
    
    private function getTheRightEnd($dbDate,$requestedDate){
        $dbDate = new \DateTime($dbDate);
        $requestedDate = new \DateTime($requestedDate);
        if ($dbDate > $requestedDate ){
            return $requestedDate->format('Y-m-d');
        }else{
            return $dbDate->format('Y-m-d');
        }
    }

    function getAvailability(){
        ini_set('display_errors', 1);
        ini_set('display_startup_errors', 1);
        error_reporting(E_ALL);
        //inicializacion de variables
        $fullRange = [];

        //Obtengo los datos enviados por post a esta funcion
        $depto_id   = filter_input(INPUT_POST, 'id_departamento');
        $from   = filter_input(INPUT_POST, 'from');
        $to   = filter_input(INPUT_POST, 'to');

        if (!empty($depto_id) && !empty($from) && !empty($to)){

            $dates = $this->modelo->getDisponibilidad($depto_id,$from,$to);
            //Si encontro algun departamento ocupado para esas fechas
            if (!empty($dates)){
                foreach ($dates as $date){
                    $desde= $this->getTheRightStart($date['fecha_desde'],$from);
                    $hasta = $this->getTheRightEnd($date['fecha_hasta'],$to);
                    $fullRange[] = $this->fullRangeDatesForView($desde,$hasta);
                }
            }
        }
        header('Content-Type: application/json');       //JSON de repuesta para ajax
        echo json_encode([$fullRange]);

    }

}
