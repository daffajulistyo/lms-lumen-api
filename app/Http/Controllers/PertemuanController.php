<?php

namespace App\Http\Controllers;

use App\Models\Pertemuan;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class PertemuanController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    //1. Index Menampilkan Data
    public function index()
    {
        $p = Pertemuan::with('materi')->get();
        return response()->json(
            [
                'success' => true,
                'messaage' => 'Data Pertemuan Berhasil Ditampilkan',
                'data' => $p
            ],
            200
        );
    }

    // tapilkan data pertemuan by id dengan tabel relasi materi_id


    public function show($id)
    {
        $p = Pertemuan::with('materi')->find($id);
        if ($p) {
            return response()->json([
                'success' => true,
                'message' => 'Detail Pertemuan Berhasil Ditampilkan',
                'data' => $p
            ], 200);
        } else {
            return response()->json([
                'success' => false,
                'message' => 'Data Pertemuan Tidak Ditemukan',
            ], 404);
        }
    }

}
