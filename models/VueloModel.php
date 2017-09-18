<?php

class VueloModel
{
    private $db;

    function __construct()
    {
      $this->db = new PDO('mysql:host=localhost;dbname=db_turismo;charset=utf8', 'root', 'root');
    }

    public function getVuelos(){
      $sentencia = $this->db->prepare( "SELECT * FROM vuelos_detalle");
      $sentencia->execute();
      return $sentencia->fetchAll(PDO::FETCH_ASSOC);
    }
    
    // ABM Vuelos //

    public function borrarVuelo($id){
      $sentencia = $this->db->prepare( "DELETE FROM Vuelos WHERE ID_VUELO = ?");
      $sentencia->execute($id);
      return $sentencia->fetchAll(PDO::FETCH_ASSOC);
    }

    public function agregarVuelo($values){
      $sentencia = $this->db->prepare( "INSERT INTO Vuelos(ID_AEROLINEA,ID_DESTINO,ID_ORIGEN,FECHA_SALIDA,CODIGO_VUELO,PRECIO) VALUES (?,?,?,?,?,?) ");
      $sentencia->execute($values);
      return $sentencia->fetchAll(PDO::FETCH_ASSOC);
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
