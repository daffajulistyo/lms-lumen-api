<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Murid extends Model
{

    
    protected $fillable = [
        'nama','kelas_id','user_id'
    ];
    
    public $timestamps = false;

    protected $table = 'murid';

    public function kelas()
    {
        return $this->belongsTo(Kelas::class,'kelas_id');
    }
    public function user()
    {
        return $this->belongsTo(User::class,'user_id');
    }
}
