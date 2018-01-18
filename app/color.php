<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class color extends Model
{
    protected $table='color';
    protected $fillable = ['color'];

    public function products()
    {
        return $this->belongsTo('App\products');
    }
}
