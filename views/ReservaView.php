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

    function __construct(){
        $this->vista = new Smarty();
    }

    function mostrarReservas($departamentos=''){
        $this->vista->assign('departamentos',$departamentos);
        $this->vista->display('templates/reserva.tpl');
    }
}