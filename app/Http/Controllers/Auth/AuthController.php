<?php

namespace App\Http\Controllers\Auth;

use Auth;
use App\Http\Controllers\Controller;

class AuthController extends Controller
{

    public function login()
    {
        $credentials = request(['email', 'password']);

        if (! $token = auth('web')->attempt($credentials)) {
            return response()->json(['error' => 'Unauthorized'], 401);
        }

        return $this->respondWithToken($token);
    }
    public function me()
    {
        return response()->json(auth('web')->user());
    }

    public function token()
    {
        return response()->json(auth('web')->user()->getRememberToken());
    }

    public function logout()
    {
        auth()->logout();
        /*return response()->json(['user'=>'logout']);*/
        return redirect('/login');
    }


    protected function respondWithToken($token)
    {
        return response()->json([
            'access_token' => $token,
            'token_type' => 'bearer',
            'expires_in' => auth('api')->factory()->getTTL() * 60
        ]);
    }
    
    
    public function tokenId(){
        if (Auth::user()) {
            $token = auth('api')->tokenById(Auth::user()->id);
            return $this->respondWithToken($token);
        }
        return response()->json(['error' => 'Unauthorized'], 401);
    }
}