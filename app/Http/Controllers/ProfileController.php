<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Property;
use App\Models\User;
use Auth;


class ProfileController extends Controller
{
    public function getIndex($id=null){
        $obj = Property::where('user_id',$id)->first();
        $obj_user = User::find($id);
        $allfriends = Auth::user()->friends;
        return view('profile',compact('obj','obj_user','allfriends'));
    }
    
}
