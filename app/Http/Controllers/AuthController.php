<?php

namespace App\Http\Controllers;

use App\Models\User;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    public function register(Request $request)
    {
        $validasiData = Validator::make($request->all(), [
            'fullname' => 'required|string|max:255',
            // 'name' => 'required|string|max:255',
            'role' => 'required|string|max:255',
            'username' => 'required',
            'email' => 'required|string|email|max:255|unique:user',
            'telpon' => 'required|numeric',
            'password' => 'required|string|min:6',
        ]);
        // $validasiData['password'] = Hash::make($validasiData['password']);
        if ($validasiData->fails()) {
            return response()->json([
                'success' => false,
                'message' => 'Data User Gagal Ditambahkan',
                'errors' => $validasiData->errors()
            ], 400);
        }
        $user = User::create([
            'fullname' => $request->fullname,
            'role' => $request->role,
            'username' => $request->username,
            'email' => $request->email,
            'telpon' => $request->telpon,
            'password' => Hash::make($request->password),
        ]);

        return response()->json([
            'success' => true,
            'message' => 'Data User Berhasil Ditambahkan',
            'data' => $user
        ], 200);
    }

    public function login(Request $request)
    {
        $this->validate($request, [
            'username' => 'required',
            'password' => 'required|min:6'
        ]);

        $username = $request->input('username');
        $password = $request->input('password');

        $user = User::where('username', $username)->first();

        if (!$user) {
            return response()->json([
                'message' => 'User not found'
            ], 401);
        }

        $isValidPassword = Hash::check($password, $user->password);

        if (!$isValidPassword) {
            return response()->json([
                'message' => 'Login Failed'
            ], 401);
        }

        $generateToken = bin2hex(random_bytes(40));
        $user->update([
            'token' => $generateToken,
        ]);

        return response()->json($user);
    }
}
