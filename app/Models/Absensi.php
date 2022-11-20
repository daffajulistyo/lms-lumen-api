<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Absensi extends Model
{

    
    protected $fillable = [
        'user_id',
        'kelas_id',
        'status',
        'keterangan'
    ];
    
    public $timestamps = false;

    protected $table = 'absensi';

    public function murid(){
        return $this->hasMany(Murid::class,'kelas_id','id');
    }

    public function kelas()
    {
        return $this->belongsTo(Kelas::class,'kelas_id');
    }
    public function user()
    {
        return $this->belongsTo(User::class,'user_id');
    }
}
