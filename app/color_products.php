<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class color_products extends Model
{
    protected $table='color_products';
    protected $fillable = ['color'];

    public function det_products()
    {
        return $this->belongsTo('App\det_products');
    }
}
