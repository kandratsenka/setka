<?php

namespace App\Http\Controllers;
use App\Models\Maintext;
use App\Models\Publication;
use Auth;
use Illuminate\Http\Request;
use App\Models\Friend;
use App\Models\User;

class BaseController extends Controller
{
    //
	public function getIndex(Request $request){
		$objs=Publication::where('user_id',Auth::user()->id)->orderBy('id',$request->sort)->simplePaginate(20);
        
        $friends = Friend::where('user_id', Auth::user()->id)->pluck('id')->toArray();
         
        $users = User::whereNotIn('id',$friends)->where('id','!=',Auth::user()->id)->inRandomOrder()->limit(2)->get();    
      /* dd($users);*/
            return view('index',compact('objs','users'));
	}
    public function getText($url=null){
		$obj=Maintext::where('url',$url)->first();
        return view('static',compact('obj'));
	}
    
    
}
