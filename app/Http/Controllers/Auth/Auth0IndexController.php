<?php

namespace App\Http\Controllers\Auth;
use App;
use Auth;
use Redirect;
use App\Http\Controllers\Controller;

class Auth0IndexController extends Controller
{
    public function login()
    {
       
        if (Auth::check()) {
            return redirect()->intended('/');
        }
       /* dd(App::make('auth0')); */ 
        /*dd(App::make(\Auth0\Login\Auth0Service::class));*/
        return App::make('auth0')->login(
            null,
            null,
            ['scope' => 'openid name email email_verified'],
            'code'
        );
    }

    public function logout()
    {
        Auth::logout();

        $logoutUrl = sprintf(
            'https://%s/v2/logout?client_id=%s&returnTo=%s',
            config('laravel-auth0.domain'),
            config('laravel-auth0.client_id'),
            config('app.url')
        );

        return Redirect::intended($logoutUrl);
    }

    public function profile()
    {
        if (!Auth::check()) {
            return redirect()->route('login');
        }

        return view('profile')->with(
            'user',
            print_r(Auth::user()->getUserInfo(), true)
        );
    }
}
