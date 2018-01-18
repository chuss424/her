<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class notify extends Model
{
    protected $table='notify';
    protected $fillable = ['titulo','url','read_n','name','id_user_receiver'];
}
