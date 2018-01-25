<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class det_products extends Model
{
    protected $table='det_products';
    protected $fillable = ['cod', 'picture','description','unidad','color','destacado'];

    public function products()
    {
        return $this->belongsToMany('App\productos');
    }
}
