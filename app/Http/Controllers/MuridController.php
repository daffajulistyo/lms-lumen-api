<?php

namespace App\Http\Controllers;

use App\Models\Murid;


class MuridController extends Controller
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
        $murid = Murid::with(['kelas','user'])->get();
        return response()->json(
            [
                'success' => true,
                'messaage' => 'Data murid Berhasil Ditampilkan',
                'data' => $murid
            ],
            200
        );
    }

    public function show($id)
    {
        $murid = Murid::with(['kelas','user'])->find($id);
        if ($murid) {
            return response()->json([
                'success' => true,
                'message' => 'Detail Murid Berhasil Ditampilkan',
                'data' => $murid
            ], 200);
        } else {
            return response()->json([
                'success' => false,
                'message' => 'Data Murid Tidak Ditemukan',
            ], 404);
        }
    }

}
