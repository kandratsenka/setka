<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use App\Models\User;
use App\Observers\UserObserver;

class SenderProvider extends ServiceProvider
{
    /**
     * Register services.
     *
     * @return void
     */
    

    /**
     * Bootstrap services.
     *
     * @return void
     */
    public function boot()
    {
       /* User::creating(function($user){
            dd($user);
        });*/
       User::observe(UserObserver::class);
    }
}
