<?php

namespace App\Http\Controllers;

use App\Models\Materi;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class MateriController extends Controller
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
        $materi = Materi::all();
        return response()->json(
            [
                'success' => true,
                'messaage' => 'Data Produk Berhasil Ditampilkan',
                'data' => $materi
            ],
            200
        );
    }

    // 2. Menginputkan Data
    public function store(Request $request)
    {
        $validasiData = Validator::make($request->all(), [
            'nama' => 'required',
            'keterangan' => 'required'
        ]);

        if ($validasiData->fails()) {
            return response()->json(
                [
                    'success' => false,
                    'message' => 'Data Materi Gagal Ditambahkan',
                    'data' => $validasiData->errors()
                ],
                401
            );
        } else {
            $materi = Materi::create($request->all());
            if ($materi) {
                return response()->json(
                    [
                        'success' => true,
                        'message' => 'Data Materi Berhasil Ditambahkan',
                        'data' => $materi
                    ],
                    201
                );
            } else {
                return response()->json(
                    [
                        'success' => false,
                        'message' => 'Data Materi Gagal Disimpan',
                    ],
                    401
                );
            }
        }
    }

    public function show($id)
    {
        $materi = Materi::find($id);
        if ($materi) {
            return response()->json([
                'success' => true,
                'message' => 'Data Materi Berhasil Ditampilkan',
                'data' => $materi
            ], 200);
        } else {
            return response()->json([
                'success' => false,
                'message' => 'Data Materi Tidak Ditemukan',
            ], 404);
        }
    }

    // 3. Mengupdate Data
    public function update(Request $request, $id)
    {
        $validasiData = Validator::make($request->all(), [
            'nama' => 'required',
            'keterangan' => 'required'

        ]);

        if ($validasiData->fails()) {
            return response()->json(
                [
                    'success' => false,
                    'message' => 'Data Materi Gagal Diubah',
                    'data' => $validasiData->errors()
                ],
                401
            );
        } else {
            $materi = Materi::whereId($id)->update([
                'nama' => $request->input('nama'),
                'keterangan' => $request->input('keterangan')

            ]);

            if ($materi) {
                return response()->json(
                    [
                        'success' => true,
                        'message' => 'Data Materi Berhasil Diubah',
                        'data' => $materi
                    ],
                    201
                );
            } else {
                return response()->json(
                    [
                        'success' => false,
                        'message' => 'Data Materi Gagal Diubah',
                    ],
                    401
                );
            }
        }
    }

    // 4. Menghapus Data
    public function destroy($id)
    {
        $materi = Materi::whereId($id)->first();
        $materi->delete();
        if ($materi) {
            return response()->json([
                'success' => true,
                'message' => 'Data Materi Berhasil Dihapus!',
            ], 200);
        }
    }
}
