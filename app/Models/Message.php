<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\LastMessage;
use Auth;

class Message extends Model
{
    use HasFactory;
    
    protected static function booted()
    {
       
        static::created(function ($message) {
            $resiver_id = $message->resiver_id;
            $obj = LastMessage::where('user_id',Auth::user()->id)
                              ->where('friend_id',$resiver_id)
                              ->orWhere(function($query) use($resiver_id){
                                    $query->where('user_id',$resiver_id)
                                          ->where('friend_id',Auth::user()->id);
                                        })->first();
             if(!$obj){
                $obj = new LastMessage;             
                $obj->count=0; 
                $obj->user_id = Auth::user()->id;
                $obj->friend_id = $message->resiver_id;
             }   
                
            /*dd($obj);*/
            $obj->count++;
            $obj->body = substr($message->body, 0, 25);
            $obj->put_date = date('Y-m-d H:i:s');
            $obj->save();
        });
    }
}
