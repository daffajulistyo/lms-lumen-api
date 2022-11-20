<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Pertemuan extends Model
{


    protected $fillable = [
        'nama',
        'keterangan',
        'file',
        'materi_id'

    ];

    public $timestamps = false;

    protected $table = 'pertemuan';

    public function materi()
    {
        return $this->belongsTo(Materi::class,'materi_id');
    }

    public function tugas(){
        return $this->hasOne(Tugas::class,'pertemuan_id','id');
    }
}
