<?php

namespace Model;

class Cita extends ActiveRecord {
    // Base de datos
    protected static $tabla = 'citas';
    protected static $columnasDB = ['id', 'fecha', 'hora', 'id_usuario_fk'];

    public $id;
    public $fecha;
    public $hora;
    public $id_usuario_fk;

    public function __construct($args = [])
    {
        $this->id = $args['id'] ?? null;
        $this->fecha = $args['fecha'] ?? '';
        $this->hora = $args['hora'] ?? '';
        $this->id_usuario_fk = $args['id_usuario_fk'] ?? '';
    }
}