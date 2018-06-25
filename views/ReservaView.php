<?php
/**
 * Created by PhpStorm.
 * User: adiaz
 * Date: 6/1/18
 * Time: 16:18
 */

class ReservaView
{
    private $vista;
    private $month;

    function __construct(){
        $this->vista = new Smarty();
        $this->month =['January', 'February', 'March', 'April', 'May', 'June', 'July ', 'August', 'September', 'October', 'November', 'December'];
        $this->meses =['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio ', 'Agosto', 'Septiembre', 'Octubre',
            'Noviembre', 'Diciembre'];

    }

    function mostrarReservas($departamentos=''){
        $dates = [];
        $cont = 0;
        foreach ($this->month as $mes){
            $aux = New \DateTime($mes);
            $aux = $aux->modify('first day of this month');
            $dates[$cont]['start'] = $aux->format('Y-m-d');
            $aux = $aux->modify('last day of this month');
            $dates[$cont]['end'] = $aux->format('Y-m-d');
            $dates[$cont]['nombre'] = $this->meses[$cont].' '.$aux->format('Y');
            $cont++;
        }

        $this->vista->assign('departamentos',$departamentos);
        $this->vista->assign('meses',$dates);
        $this->vista->display('templates/reserva.tpl');
    }
}