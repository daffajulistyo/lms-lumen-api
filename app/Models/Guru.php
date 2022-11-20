<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Guru extends Model
{


    protected $fillable = [
        'nama',
        'email',
        'telpon',
        'user_id',
    ];


    protected $table = 'guru';

    public $timestamps = false;

    public function user(){
        return $this->belongsTo(User::class,'user_id');
    }

    public function tugas(){
        return $this->hasMany(Tugas::class,'guru_id','id');
    }
}
