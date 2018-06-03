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

    public function getConnectionNormal(){
        return $this->db;
    }
}