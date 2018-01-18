<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class orders_users extends Model
{
    protected $table='orders_users';
    protected $fillable = ['id_orders','id_users_sender','id_users_receiver'];
}
