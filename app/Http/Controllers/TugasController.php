<?php

namespace App\Http\Controllers;

use App\Models\Tugas;

class TugasController extends Controller
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

    public function index()
    {
        $tugas = Tugas::with(['guru','materi','pertemuan'])->get();
        return response()->json(
            [
                'success' => true,
                'messaage' => 'Data Tugas Berhasil Ditampilkan',
                'data' => $tugas
            ],
            200
        );
    }

    public function show($id)
    {
        $tugas = Tugas::with(['guru','materi','pertemuan'])->find($id);
        if ($tugas) {
            return response()->json(
                [
                    'success' => 'true',
                    'message' => 'Detail Tugas Berhasil Ditampilkan',
                    'data' => $tugas
                ],
                200
            );
        } else {
            return response()->json(
                [
                    'success' => 'false',
                    'message' => 'Detail Tugas Tidak Ditemukan',

                ],
                400
            );
        }
    }
}
