<?php

namespace App\Http\Controllers;

use App\Models\Absensi;


class AbsensiController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    //1. Index Menampilkan Data
    public function index()
    {
        $absensi = Absensi::with(['kelas','user'])->get();
        return response()->json(
            [
                'success' => true,
                'messaage' => 'Data absensi Berhasil Ditampilkan',
                'data' => $absensi
            ],
            200
        );
    }

    public function show($id)
    {
        $absensi = Absensi::with(['kelas','user'])->find($id);
        if ($absensi) {
            return response()->json([
                'success' => true,
                'message' => 'Detail absensi Berhasil Ditampilkan',
                'data' => $absensi
            ], 200);
        } else {
            return response()->json([
                'success' => false,
                'message' => 'Data absensi Tidak Ditemukan',
            ], 404);
        }
    }

}
