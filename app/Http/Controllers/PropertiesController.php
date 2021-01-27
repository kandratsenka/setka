<?php

namespace App\Http\Controllers;

use App\Models\Property;
use App\Models\MusicUser;
use App\Models\MovieUser;
use Auth;


class PropertiesController extends Controller
{
    public function getIndex(){
        $obj = Property::where('user_id',Auth::user()->id)->first();
        if(!$obj){
            $obj = new Property;
        }
        $obj_musics = MusicUser::with('musics')->where('user_id',Auth::user()->id)->get();
        
        $obj_movies = MovieUser::with('movies')->where('user_id',Auth::user()->id)->get();
                    
        return view('properties',compact('obj','obj_musics','obj_movies'));
    }
    
    public function postIndex(){
        if($_POST['music']){
            \App::make('App\Libs\Musi')->postData($_POST['music']);
        }
        
        if($_POST['movie']){
            \App::make('App\Libs\Movi')->postData($_POST['movie']);
        }
        
        $objU = Property::where('user_id',Auth::user()->id)->first();
        if(!$objU){
             $objU = new Property;
        }
            /*$objU = new Property;*/
            $objU->user_id = Auth::user()->id;
            $objU->born = $_POST['born'];
            $objU->gender = $_POST['gender'];
            $objU->city = $_POST['city'];
            $objU->maritalStatus = $_POST['maritalStatus'];
            $objU->aboutMe = $_POST['aboutMe'];
            $objU->save();
        return redirect('profile/'.Auth::user()->id);
    }
}
