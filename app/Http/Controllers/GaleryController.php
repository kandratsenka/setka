<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Album;
use App\Models\Galery;
use App\Models\User;
use Auth;
use App;

class GaleryController extends Controller
{
    public function getIndex($id){
        $user = User::find($id);
        $albums = Album::OrderBy('id','DESC')->get();
        $pictures = Galery::where('user_id',$user->id)->orderBy('id','DESC')->simplePaginate(21);
        
        return view('galery',compact('albums','pictures','user'));
    }
    
    public function postAdd(){
        if ($_FILES){
            $pic = \App::make('\App\Libs\Imag')->url($_FILES['picture1']['tmp_name']);
            $obj = new Galery;
            $obj->user_id = Auth::user()->id;
            $obj->description = $_POST['description'];
            $obj->files = $pic;
            $obj->status = 'show';
            $obj->album_id = (int)$_POST['album_id'];
            $obj->save();
        }
            return redirect()->back();
        
        
    }
}
