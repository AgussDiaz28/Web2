<?php
/**
 * Created by PhpStorm.
 * User: adiaz
 * Date: 6/1/18
 * Time: 16:17
 */

class ReservaModel extends dbModel
{

    public function getConnection(){

        if (($this->dbp) != 'NULL' ){
            $this->constructPMySql();
        }
        return $this->dbp;
    }


    //Funcion que devuelve los departamentos existentes en la base de datos
    public function getDepartamentos(){
        $sentencia = $this->dbp->prepare( "SELECT id_dpto,descripcion FROM gr10_departamento");
        $sentencia->execute([]);
        return $sentencia->fetchAll(PDO::FETCH_ASSOC);
    }

    //Devuelve todas las reserva realizadas en un dado periodo de tiempo, por lo cual sacando el periodo de esas
    // reservas, el departamento se encuentra disponible
    public function getDisponibilidad($depto,$fromDate,$upToDate){

        $sentencia = $this->dbp->prepare( "SELECT fecha_desde,fecha_hasta FROM gr10_reserva WHERE id_dpto = ? and (fecha_desde >= ? and fecha_hasta <= ?)");
        $sentencia->execute([$depto,$fromDate,$upToDate]);
        return $sentencia->fetchAll(PDO::FETCH_ASSOC);

    }

}