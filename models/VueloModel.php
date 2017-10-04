<?php
include_once 'models/dbModel.php';
class VueloModel extends dbModel
{
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
      $sentencia = $this->db->prepare( "DELETE FROM vuelos WHERE ID_VUELO = ?");
      $sentencia->execute($id);
    }

    public function agregarVuelo($values){
      $sentencia = $this->db->prepare( "INSERT INTO vuelos(CODIGO_VUELO,ID_AEROLINEA,ID_ORIGEN,ID_DESTINO,FECHA_SALIDA,PRECIO) VALUES (?,?,?,?,?,?) ");
      $sentencia->execute($values);
    }


    //esto no anda y no tira error tampoco. Probe mil formas distintas, pasandole tod un arreglo, probando modificar solo una cosa, etc.. no hay caso y no se por que
    public function actualizarVuelo($values,$id_vuelo){
      $sentencia = $this->db->prepare( "UPDATE
                                                 vuelos
                                        SET
                                                 CODIGO_VUELO = ?
                                                ,ID_AEROLINEA = ?
                                                ,ID_ORIGEN = ?
                                                ,ID_DESTINO = ?
                                                ,FECHA_SALIDA = ?
                                                ,PRECIO = ?
                                        WHERE
                                                 ID_VUELO = $id_vuelo ");

      $sentencia->execute($values);
      return $sentencia->fetchAll(PDO::FETCH_ASSOC);
    }

    // ABM Vuelos //
}
 ?>
