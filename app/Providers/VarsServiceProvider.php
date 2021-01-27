<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use View;

class VarsServiceProvider extends ServiceProvider
{
    /**
     * Register services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap services.
     *
     * @return void
     */
    public function boot()
    {
        View::composer('layouts.app', 'App\Providers\ViewComposers\BaseComposer');
        View::composer('includes.friend', 'App\Providers\ViewComposers\FriendComposer');
        View::composer('includes.message_menu', 'App\Providers\ViewComposers\LastMessageComposer');
    }
}
