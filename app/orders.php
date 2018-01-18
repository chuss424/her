<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class orders extends Model
{
    protected $table='orders';
    protected $fillable = ['title','description','status','id_product','id_det_pro','cant','observation'];

}
