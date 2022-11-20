<?php

namespace App\Http\Controllers;

use App\Models\Kelas;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class KelasController extends Controller
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
        $kelas = Kelas::all();
        return response()->json(
            [
                'success' => true,
                'messaage' => 'Data Kelas Berhasil Ditampilkan',
                'data' => $kelas
            ],
            200
        );
    }

    public function show($id)
    {
        $kelas = Kelas::find($id);
        if ($kelas) {
            return response()->json([
                'success' => true,
                'message' => 'Detail Kelas Berhasil Ditampilkan',
                'data' => $kelas
            ], 200);
        } else {
            return response()->json([
                'success' => false,
                'message' => 'Data Materi Tidak Ditemukan',
            ], 404);
        }
    }

    // 2. Menginputkan Data
    public function store(Request $request)
    {
        $validasiData = Validator::make($request->all(), [
            'nama' => 'required'
        ]);

        if ($validasiData->fails()) {
            return response()->json(
                [
                    'success' => false,
                    'message' => 'Data Kelas Gagal Ditambahkan',
                    'data' => $validasiData->errors()
                ],
                401
            );
        } else {
            $kelas = Kelas::create($request->all());
            if ($kelas) {
                return response()->json(
                    [
                        'success' => true,
                        'message' => 'Data Kelas Berhasil Ditambahkan',
                        'data' => $kelas
                    ],
                    201
                );
            } else {
                return response()->json(
                    [
                        'success' => false,
                        'message' => 'Data Kelas Gagal Disimpan',
                    ],
                    401
                );
            }
        }
    }

    // 3. Mengupdate Data
    public function update(Request $request, $id)
    {
        $validasiData = Validator::make($request->all(), [
            'nama' => 'required'

        ]);

        if ($validasiData->fails()) {
            return response()->json(
                [
                    'success' => false,
                    'message' => 'Data Kelas Gagal Diubah',
                    'data' => $validasiData->errors()
                ],
                401
            );
        } else {
            $kelas = Kelas::whereId($id)->update([
                'nama' => $request->input('nama')

            ]);

            if ($kelas) {
                return response()->json(
                    [
                        'success' => true,
                        'message' => 'Data kelas Berhasil Diubah',
                        'data' => $kelas
                    ],
                    201
                );
            } else {
                return response()->json(
                    [
                        'success' => false,
                        'message' => 'Data Kelas Gagal Diubah',
                    ],
                    401
                );
            }
        }
    }

    // 4. Menghapus Data
    public function destroy($id)
    {
        $kelas = Kelas::whereId($id)->first();
        $kelas->delete();
        if ($kelas) {
            return response()->json([
                'success' => true,
                'message' => 'Data Kelas Berhasil Dihapus!',
            ], 200);
        }
    }
}
