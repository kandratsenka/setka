<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Property;
use App\Models\User;


class ProfileController extends Controller
{
    public function getIndex($id=null){
        $obj = Property::where('user_id',$id)->first();
        $obj_user = User::find($id);
        return view('profile',compact('obj','obj_user'));
    }
}
