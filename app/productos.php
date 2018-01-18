<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class productos extends Model
{
    protected $table='products';
    protected $fillable = ['name','marca','picture'];


    public function det_products()
    {
        return $this->belongsToMany('App\det_products');
    }

     public function color()
    {
        return $this->belongsToMany('App\color');
    }

    public function categoria()
    {
        return $this->belongsToMany('App\categoria');
    }

    public function tipo()
    {
        return $this->belongsToMany('App\type_pro');
    }
}
