<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Materi extends Model
{


    protected $fillable = [
        'nama',
        'keterangan',
        'created_at',
        'updated_at'
    ];


    protected $table = 'materi';

    public function pertemuans()
    {
        return $this->hasMany(Pertemuan::class,'materi_id','id');
    }

    public function tugas(){
        return $this->hasMany(Tugas::class,'materi_id','id');
    }
}
