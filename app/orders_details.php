<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class orders_details extends Model
{
    protected $table='orders_details';
    protected $fillable = ['id_order','id_product','id_det_pro','cant'];
}
