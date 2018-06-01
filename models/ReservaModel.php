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
        return $this->dbp;
    }

    public function getConnectionNormal(){
        return $this->db;
    }
}