<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class categoria_productos extends Model
{
    protected $table='categoria_productos';
    protected $fillable = ['productos_id','categoria_id'];

}
