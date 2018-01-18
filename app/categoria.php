<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class categoria extends Model
{
    protected $table='categoria';
    protected $fillable = ['name','url'];

    public function products()
    {
        return $this->belongsToMany('App\productos');
    }
}
