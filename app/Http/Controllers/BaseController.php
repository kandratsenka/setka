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
		$friends = Friend::where('user_id', Auth::user()->id)->pluck('friend_id','friend_id')->toArray();
        $user_friends = User::whereIn('id',$friends)->get();
        $me_with_friends = $friends + [Auth::user()->id=>Auth::user()->id];
        //dd($me_with_friends);
        $objs=Publication::with(['users','users.accounts'])->whereIn('user_id',$me_with_friends)->orderBy('id',$request->sort)->simplePaginate(20);
        //dd($objs);
        
       //dd($friends);
        
       //dd($user_friends);
        
        $users = User::whereNotIn('id',$friends)->where('id','!=',Auth::user()->id)->inRandomOrder()->limit(2)->get();  
        
      /* dd($users);*/
            return view('index',compact('objs','users','user_friends'));
	}
    public function getText($url=null){
		$obj=Maintext::where('url',$url)->first();
        return view('static',compact('obj'));
	}
    
    
}
