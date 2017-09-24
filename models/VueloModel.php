<?php

class VueloModel
{
    private $db;

    function __construct()
    {
      $this->db = new PDO('mysql:host=localhost;dbname=db_turismo;charset=utf8', 'root', '');
    }

    public function getVuelos($IDD='',$IDA='',$FS=''){
      $where = " WHERE ";
       if(!empty($IDD)) {
           $where .= "(ID_DESTINO='{$IDD}')";
       }
       if(!empty($IDA)) {
           if($where!=" WHERE "){
             $where .= ' AND ';
           }
           $where .= "(ID_AEROLINEA = '{$IDA}')";
       }
       if(!empty($FS)) {
           if($where!=" WHERE "){
             $where .= ' AND ';
           }
           $where .= "(FECHA_SALIDA='{$FS}')";
       }
       if($where == " WHERE ") $where = '';

      $sentencia = $this->db->prepare( "SELECT * FROM VW_VUELOS {$where} "); //WHERE {$Where}
      $sentencia->execute();
      return $sentencia->fetchAll(PDO::FETCH_ASSOC);
    }

    // ABM Vuelos //

    public function borrarVuelo($id){
      $vid = array();
      $vid[0] = $id;
      $sentencia = $this->db->prepare( "DELETE FROM Vuelos WHERE ID_VUELO = {$id}");
      $sentencia->execute($vid);
    }

    public function agregarVuelo($values){
      $sentencia = $this->db->prepare( "INSERT INTO Vuelos(ID_AEROLINEA,ID_DESTINO,ID_ORIGEN,FECHA_SALIDA,CODIGO_VUELO,PRECIO) VALUES (?,?,?,?,?,?) ");
      $sentencia->execute($values);
    }

    public function updateVuelo($values){
      $sentencia = $this->db->prepare( "UPDATE
                                                 Vuelos
                                        SET
                                                 ID_AEROLINEA = ?
                                                ,ID_DESTINO = ?
                                                ,ID_ORIGEN = ?
                                                ,FECHA_SALIDA = ?
                                                ,CODIGO_VUELO = ?
                                                ,PRECIO =?
                                        WHERE
                                                 ID_VUELO = ? ");
      $sentencia->execute($values);
      return $sentencia->fetchAll(PDO::FETCH_ASSOC);
    }

    // ABM Vuelos //
}
 ?>
