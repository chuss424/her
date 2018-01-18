<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class usuarios extends Model
{
    protected $table='users';
   	protected $fillable = ['reporting_to','name','email','password','api_token', 'sex', 'dob', 'designation', 'dni', 'ruc', 'mobile', 'phone', 'address', 'stret', 'city', 'district','state','country','photo','web','permissions','status','user_id','user_type','upload_folder'];

}
