<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class TUgas extends Model
{

    
    protected $fillable = [
        'nama',
        'file',
        'jam_mulai',
        'jam_berakhir',
        'keterangan',
        'materi_id',
        'guru_id',
        'pertemuan_id'
    ];
    
    public $timestamps = false;

    protected $table = 'tugas';

    public function guru()
    {
        return $this->belongsTo(Guru::class,'guru_id');
    }
    public function materi()
    {
        return $this->belongsTo(Materi::class,'materi_id');
    }
    public function pertemuan()
    {
        return $this->belongsTo(Pertemuan::class,'pertemuan_id');
    }
}
