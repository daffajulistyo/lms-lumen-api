<?php

namespace App\Http\Controllers;

use App\Models\Guru;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class GuruController extends Controller
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
        $guru = Guru::with(['user'])->get();
        return response()->json(
            [
                'success' => true,
                'messaage' => 'Data Guru Berhasil Ditampilkan',
                'data' => $guru
            ],
            200
        );
    }

    public function show($id)
    {
        $guru = Guru::with(['user'])->find($id);
        if ($guru) {
            return response()->json(
                [
                    'success' => 'true',
                    'message' => 'Detail Guru Berhasil Ditampilkan',
                    'data' => $guru
                ],
                200
            );
        } else {
            return response()->json(
                [
                    'success' => 'false',
                    'message' => 'Detail Guru Tidak Ditemukan',

                ],
                400
            );
        }
    }

    public function update(Request $request, $id)
    {
        $validasiData = Validator::make($request->all(), [
            'nama' => 'required',
            'email' => 'required',
            'telpon' => 'numeric',
            'user_id' => 'required',
        ]);
        if ($validasiData->fails()) {
            return response()->json(
                [
                    'success' => false,
                    'message' => 'Data Guru Gagal Diubah',
                    'data' => $validasiData->errors()
                ],
                401
            );
        } else {
            $guru = Guru::whereId($id)->update([
                'nama' => $request->input('nama'),
                'email' => $request->input('email'),
                'telpon' => $request->input('telpon'),
                'user_id' => $request->input('user_id')

            ]);

            $guru = Guru::find($id);


            if ($guru) {
                return response()->json(
                    [
                        'success' => true,
                        'message' => 'Data Guru Berhasil Diubah',
                        'data' => $guru
                    ],
                    201
                );
            } else {
                return response()->json(
                    [
                        'success' => false,
                        'message' => 'Data Guru Gagal Diubah',
                    ],
                    401
                );
            }
        }
    }

    // 4. Menghapus Data
    public function destroy($id)
    {
        $guru = Guru::whereId($id)->first();
        $guru->delete();
        if ($guru) {
            return response()->json([
                'success' => true,
                'message' => 'Data guru Berhasil Dihapus!',
            ], 200);
        }
    }
}
