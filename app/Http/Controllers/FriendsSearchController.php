<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Property;
use App\Models\User;
use Auth;
use Carbon;

class FriendsSearchController extends Controller
{
    public function postIndex(Request $request){
       $objs = \App::make('App\Repositories\Friends')
           ->findByCity($request->post('city'))
           ->findByGender($request->post('gender'))
           ->findByAge($request->post('inputAgeFrom'),$request->post('inputAgeTo'))
           ->end()->get();
       
        
       
        /*$arrAge = \App::make('App\Libs\Age')->countAge($request->post('inputAgeFrom'),$request->post('inputAgeTo'));
        $props = $query->get();
        $arrUser = [];
        foreach($props as $one){
            $arrUser[] = $one->user_id;
        }*/
        /*$arr = array_unique(array_merge($arrAge,$arrUser));*/
        /*$arr = [];
        array_map(function($oneUser) use($arrAge){
            if(in_array($oneUser,$arrAge)){
                $arr[] = $oneUser;
            }
        },$arrUser);*/
        
        /*$objs = User::whereIn('id',$arr)->where('id','!=',Auth::user()->id)->limit(100)->get();*/
        
        return view('net',compact('objs'));
    }
}
