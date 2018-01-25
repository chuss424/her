<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class orders extends Model
{
    protected $table='orders';
    protected $fillable = ['title','description','status','nombre_cliente','dni_cliente','tel_cliente','correo_cliente','dir_cliente'];

}
