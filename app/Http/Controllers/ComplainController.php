<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Auth;
use Mail;

class ComplainController extends Controller
{
   public function postComplain(){
        $content = asset('public/'.$_POST['publication']);
        $data = ['subject'=>'Получена жалоба на контент: '.$content,'name'=>Auth::user()->email];
        mail('helpforsetka@yandex.by', 'complain',$data['subject']);
        /*Mail::send(['html'=>'complain'],$data,function($message){
            $message->to('helpforsetka@yandex.by','admin')->subject('Жалоба');
            $message->from(env('MAIL_FROM_ADDRESS','helpforsetka@yandex.by'),env('APP_NAME','Сетка'));
            $message->getHeaders()->addTextHeader('Content-type', 'text/html; charset=utf-8 \r\n');
        });*/
       return redirect('/');
   }
}
