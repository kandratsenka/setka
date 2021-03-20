<?php

namespace App\Observers;

use App\Models\User;
use Mail;

class UserObserver
{
    /**
     * Handle the user "created" event.
     *
     * @param  \App\Models\User  $user
     * @return void
     */
    public function created(User $user)
    {
        /*dd($user);*/
        $toname = $user->name;
        $toemail = $user->email;
        $data = ['subject'=>'Вы зарегистрированы на сайте "Сетка"','name'=>$user->name];
        mail('helpforsetka@yandex.by', 'register',$data['subject']);
        /*Mail::send(['html'=>'email'],$data,function($message) use ($toname,$toemail){
            $message->to($toemail,$toname)->subject('Регистрация');
            $message->from(env('MAIL_FROM_ADDRESS','helpforsetka@yandex.by'),env('APP_NAME','Сетка'));
            $message->getHeaders()->addTextHeader('Content-type', 'text/html; charset=utf-8 \r\n');
        });*/
    }

    /**
     * Handle the user "updated" event.
     *
     * @param  \App\Models\User  $user
     * @return void
     */
    public function updated(User $user)
    {
        //
    }

    /**
     * Handle the user "deleted" event.
     *
     * @param  \App\Models\User  $user
     * @return void
     */
    public function deleted(User $user)
    {
        //
    }

    /**
     * Handle the user "restored" event.
     *
     * @param  \App\Models\User  $user
     * @return void
     */
    public function restored(User $user)
    {
        //
    }

    /**
     * Handle the user "force deleted" event.
     *
     * @param  \App\Models\User  $user
     * @return void
     */
    public function forceDeleted(User $user)
    {
        //
    }
}
