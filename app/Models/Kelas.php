<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Kelas extends Model
{

    
    protected $fillable = [
        'nama'
    ];
    
    public $timestamps = false;

    protected $table = 'kelas';

    public function murid(){
        return $this->hasMany(Murid::class,'kelas_id','id');
    }

    public function absensi(){
        return $this->hasMany(Absensi::class,'kelas_id','id');
    }
}
