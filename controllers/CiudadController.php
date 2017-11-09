<?php
require_once('models/CiudadModel.php');
require_once('views/CiudadView.php' );
require_once('controllers/SecuredController.php') ;
require_once('models/ImagenesModel.php');

class CiudadController extends SecuredController
{
    protected $images;

    function __construct()
    {
        $this->modelo = new CiudadModel();
        $this->images = new ImagenesModel();
        $this->view = new CiudadView();
    }

    function getCiudades()
    {
        $ciudades = $this->modelo->getCiudades();
        return $ciudades;
    }

    function MostrarPaginaCiudades()
    {
        $ciudades = $this->getCiudades();
        $logStatus = $this->SessionActive();
        $this->view->mostrarPCiudades($logStatus, $ciudades);
    }

    function agregarCiudad()
    {
        $NCiudad = filter_input(INPUT_POST, 'NCiudad');

        try {
            if (empty($NCiudad)) {
                throw new Exception("No ingreso ninguna ciudad");
            }

            if ($this->SessionActive()['ADMIN']) {
                $value = array($NCiudad);
                $this->modelo->agregarCiudad($value);
            } else {
                throw new Exception("No tiene permiso para agregar ciudades");
            }

            $result = true;
            $error = false;
        } catch (Exception $e) {
            $error = $e->getMessage();
            $result = false;
        }
        $this->actualizarCiudades();
    }

    function borrarCiudad()
    {
        $id_ciudad = filter_input(INPUT_POST, 'ciudadABorrar');

        if ($this->SessionActive()['ADMIN']) {
            $this->modelo->borrarCiudad([$id_ciudad]);
        } else {
            throw new Exception("No tiene permiso para borar ciudades");
        }

        $this->actualizarCiudades();
    }
    function modificarCiudad($id_ciudad)
    {
        $NCiudad = filter_input(INPUT_POST, 'NCiudad');
        try {                  //PREGUNTAR SI LA EXCEPCION TERMINA LA EJECUCION INMEDIATAMENTE MEDIANTE EL CATCH
            if (empty($NCiudad)) {
                throw new Exception("No ingreso ninguna ciudad");
            }
            $values = array($NCiudad,(int)$id_ciudad[0]);

            if ($this->SessionActive()['ADMIN']) {
                $this->modelo->actualizarCiudad($values);
            } else {
                throw new Exception("No tiene permiso para actualizar datos de ciudades");
            }

            $result = true;
            $error = false;
        } catch (Exception $e) {
            $error = $e->getMessage();
            $result = false;
        }
        $this->actualizarCiudades();
    }

    function actualizarCiudades()
    {
        $ciudades = $this->getCiudades();
        $logStatus = $this->SessionActive();
        $this->view->mostrarTablaCiudades($logStatus, $ciudades);
    }

    function uploadImage()
    {
        $id_ciudad = filter_input(INPUT_POST, 'id_ciudad');
        $files = $_FILES['imagenes']['tmp_name'];

        try {
            if ($this->SessionActive()['ADMIN']) {
                if (!empty($id_ciudad) && !empty($files)) {
                        $this->images->agregarImagenes($files, $id_ciudad);
                } else {
                    throw new Exception("Error Processing Request");
                }
            } else {
                throw new Exception("Error Processing Request");
            }
        } catch (Exception $e) {
        }
    }
}
