<?php

namespace Controllers;

use Model\Cita;
use Model\CitaServicio;
use Model\Servicio;

class APIController {
    public static function index() {
        // echo "hola desde index";
        $servicios = Servicio::all();
        // debuguear($servicios);
        echo json_encode($servicios);
    }

    public static function guardar() {
        
        // Almacena la Cita y devuelve el ID

        
        $cita = new Cita($_POST);
        $resultado = $cita->guardar();

        $id = $resultado['id'];

        // Almacena la Cita y el Servicio

        // Almacena los Servicios con el ID de la Cita
        $idServicios = explode(",", $_POST['ids_servicios']);
        // echo json_encode(['resultado' => $idServicios]);
        // die();
        foreach($idServicios as $idServicio) {
            $args = [
                'id_cita_fk' => $id,
                'id_servicio_fk' => $idServicio
            ];
            $citaServicio = new CitaServicio($args);
            $citaServicio->guardar();
            // echo json_encode(['guardar' => $x]);
            // die();
        }

        echo json_encode(['resultado' => $resultado]);
    }

    public static function eliminar() {
        
        if($_SERVER['REQUEST_METHOD'] === 'POST') {
            $id = $_POST['id'];
            $cita = Cita::find($id);
            $cita->eliminar();
            header('Location:' . $_SERVER['HTTP_REFERER']);
        }
    }
}