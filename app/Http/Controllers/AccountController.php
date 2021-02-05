<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Account;
use App\Models\User;
use Auth;

class AccountController extends Controller
{
    public function postIndex(){
      $obj = Account::where('user_id',Auth::user()->id)->first();
        if(!$obj){
             $obj = new Account;
        }
         $obj -> user_id = Auth::user()->id;
         $obj -> surname = $_POST['surname'];
         $obj -> status = $_POST['status'];
         $obj -> phone = $_POST['phone'];
         $obj -> show_contacts =(isset($_POST['show_contacts'])) ? 1 : 0;
         $pic = \App::make('\App\Libs\Imag')->url($_FILES['picture1']['tmp_name']);
         if($pic){
          if($obj->photo_profile != ''){
              @unlink(public_path().'/uploads/'.Auth::user()->id.'/'.$obj->photo_profile);
              @unlink(public_path().'/uploads/'.Auth::user()->id.'/s'.$obj->photo_profile);
              @unlink(public_path().'/uploads/'.Auth::user()->id.'/ss'.$obj->photo_profile);
          }
             $obj -> photo_profile = $pic;
         }
         $obj -> save();
         $obj_user = User::where('id',Auth::user()->id)->first();
         $obj_user -> name = $_POST['name']; 
         $obj_user -> save();
        
         return redirect()->back();
    }
}
