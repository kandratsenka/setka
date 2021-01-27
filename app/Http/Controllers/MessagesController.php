<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Message;
use App\Models\Friend;
use App\Models\User;
use App\Models\LastMessage;
use Auth;

class MessagesController extends Controller
{
     public function getIndex(){
        /*$friends = Friend::where('user_id',Auth::user()->id)->orderBy('name')->get();  */
         $friends = Auth::user()->friends;
        return view('messages',compact('friends'));
    }
    
    public function getMessage($id){
        /*SELECT * FROM messages WHERE (sender_id = Auth::user_id AND resiver_id = $id) OR (sender_id =  $id AND resiver_id = Auth::user_id) ORDER BY id DESC LIMIT 100*/
        $objs = Message::where('sender_id',Auth::user()->id)->where('resiver_id',$id)-> orWhere(function($query) use($id){
            $query->where('sender_id',$id)
                  ->where('resiver_id',Auth::user()->id);
                })->orderBy('id','DESC')->limit(100)->get();
        return view('message',compact('id','objs'));
    }
    
    public function postIndex($id = null){
        if($_POST['body']){
            $obj = new Message;
            $obj->sender_id = Auth::user()->id;
            $obj->resiver_id = $id;
            $obj->body = $_POST['body'];
            $obj->save();
        }
        return redirect()->back();
    }
    
    public function postSend(Request $request){
       /* $friend = $_POST['friend'];*/
        $validated = $request->validate([
            'resiver_id' => 'required|integer',
            'body' => 'required|string',
            ]);
        $obj = new Message;
            $obj->sender_id = Auth::user()->id;
            $obj->resiver_id = $request->resiver_id;
            $obj->body = $request->body;
            $obj->save();
        return redirect ('message/'.$request->resiver_id);
    }
}
