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

        list($diaF,$mesF,$anioF) = explode('/', $from);
        list($diaT,$mesT,$anioT) = explode('/', $to);

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

    function getAvailability(){
        //inicializacion de variables
        $fullRange = [];
        $range = [];

        //Obtengo los datos enviados por post a esta funcion
        $depto_id   = filter_input(INPUT_POST, 'id_departamento');
        $from   = filter_input(INPUT_POST, 'from');
        $to   = filter_input(INPUT_POST, 'to');

        if (!empty($depto_id) && !empty($from) && !empty($to)){

            $dates = $this->modelo->getDisponibilidad($depto_id,$from,$to);

            //Si encontro algun departamento ocupado para esas fechas
            if (!empty($dates)){
                foreach ($dates as $date){
                    $from = $this->formatDateForView($date['fecha_desde']);
                    $to = $this->formatDateForView($date['fecha_hasta']);
                    $fullRange[] = $this->fullRangeDatesForView($from,$to);
                    $range[] = ['from' => $from, 'to' => $to];
                }
            }
        }
        header('Content-Type: application/json');       //JSON de repuesta para ajax
        echo json_encode([$fullRange]);

    }

}
