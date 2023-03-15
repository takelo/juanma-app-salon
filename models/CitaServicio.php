<?php

namespace Model;

class CitaServicio extends ActiveRecord {
    protected static $tabla = 'citas_servicios';
    protected static $columnasDB = ['id', 'id_cita_fk', 'id_servicio_fk'];

    public $id;
    public $id_cita_fk;
    public $id_servicio_fk;

    public function __construct($args = [])
    {
       $this->id = $args['id'] ?? null;
       $this->id_cita_fk = $args['id_cita_fk'] ?? '';
       $this->	id_servicio_fk = $args['id_servicio_fk'] ?? ''; 
    }
}