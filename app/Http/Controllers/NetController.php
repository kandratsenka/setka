<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Friend;
use Auth;



class NetController extends Controller
{
    public function getIndex(){
        return view('net');
    }
    
    public function getAdd(Request $request){
        
        $objs = \App::make('App\Repositories\Friends')->findByName($request->user)->findByMail($request->user)->end()->get();
        return view('net',compact('objs'));
    }
    
    public function getAddOne($id = null){
        if(Auth::user()->id == $id){
            return redirect()->back();
        }
        $obj = Friend::where('user_id',Auth::user()->id)->where('friend_id',$id)->first();
        if(!$obj && Auth::user()->id != $id){
            $obj = new Friend;
            $obj->user_id = Auth::user()->id;
            $obj->friend_id = $id;
            $obj->save();
            
        }
        return redirect('net/friends');
    }
    
    public function getDeleteOne($id = null){
        Auth::user()->friends()->detach($id);
        return redirect('net/friends');
    }
    
    public function getFriends(){
        /*$allfriends = Friend::with('userF')->where('user_id',Auth::user()->id)->get();*/
        $allfriends = Auth::user()->friends;
       
        return view('friends',compact('allfriends'));
    }
    
}
