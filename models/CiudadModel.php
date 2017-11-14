<?php
include_once 'models/dbModel.php';
class CiudadModel extends dbModel
{
    public function getCiudades()
    {
        $sentencia = $this->db->prepare( "SELECT * FROM Ciudades ORDER BY NOMBRE_CIUDAD ASC");
        $sentencia->execute();
        return $sentencia->fetchAll(PDO::FETCH_ASSOC);
    }

    // ABM Ciudades //

    public function borrarCiudad($id)
    {
        $sentencia = $this->db->prepare( "DELETE FROM ciudades WHERE ID_CIUDAD = ?");
        $sentencia->execute($id);
    }

    public function agregarCiudad($nombre)
    {
        $sentencia = $this->db->prepare( "INSERT INTO ciudades(NOMBRE_CIUDAD) VALUES (?) ");
        $sentencia->execute($nombre);
    }

    public function actualizarCiudad($values)
    {
        $sentencia = $this->db->prepare( "UPDATE ciudades SET NOMBRE_CIUDAD = ? WHERE ID_CIUDAD = ? ");
        $sentencia->execute($values);
    }

    // ABM Ciudades //
}
