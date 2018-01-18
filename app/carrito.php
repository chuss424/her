<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class carrito extends Model
{
    protected $table='carrito';
    protected $fillable = ['id_cliente','id_producto','id_det_producto','cantidad'];
}
