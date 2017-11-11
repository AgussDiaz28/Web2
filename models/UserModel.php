<?php
include_once 'models/dbModel.php';
class UserModel extends dbModel
{
    public function getusers()
    {
        $sentencia = $this->db->prepare( "SELECT * FROM usuario");
        $sentencia->execute();
        return $sentencia->fetchAll(PDO::FETCH_ASSOC);
    }

    public function borraruser($id)
    {
        $sentencia = $this->db->prepare( "DELETE FROM usuario WHERE ID_USUARIO = ?");
        $sentencia->execute($id);
    }

    public function actualizarusers($values)
    {
        $sentencia = $this->db->prepare( "UPDATE usuario SET ADMIN = ? WHERE ID_USUARIO = ? ");
        $sentencia->execute($values);
    }

    // --- Sing Up -- //
    public function registrarUsuario($value)
    {
        $sentencia = $this->db->prepare( "INSERT INTO usuario (USERNAME, PASSWORD, EMAIL) VALUES (?,?,?) ");
        $sentencia->execute($value);
    }

    // --- Log In -- //
    function getUser($userName)
    {
        $sentencia = $this->db->prepare( "SELECT * FROM usuario WHERE USERNAME = ? LIMIT 1");
        $sentencia->execute([$userName]);
        return $sentencia->fetchAll(PDO::FETCH_ASSOC);
    }
}
