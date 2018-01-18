<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class type_pro extends Model
{
    protected $table='type_pro';
    protected $fillable = ['id_categoria','name'];


    public function products()
    {
        return $this->belongsToMany('App\productos');
    }
}
