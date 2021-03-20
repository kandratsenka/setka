<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Account;
use Auth;

class AjaxController extends Controller
{
    public function getBg(){
        /*dd($_POST['url']);*/
        $dat = str_replace(" ", "+", $_POST['url']);
        $obj = Account::where('user_id',Auth::user()->id)->first();
        if(!$obj){
             $obj = new Account;
        }
        $obj -> user_id = Auth::user()->id;
        $pic = \App::make('\App\Libs\Imag')->url($dat);
        
        /*$im = imageCreateFromString($bin);
        if (!$im) {
            die('Base64 value is not a valid image');
            }else{
         $img_file = public_path().'/uploads/'.Auth::user()->id.'/'.time().'.png'; 
        imagepng($im, $img_file, 0);    
        }*/
         if($pic){
          if($obj->bg_profile != ''){
              @unlink(public_path().'/uploads/'.Auth::user()->id.'/'.$obj->bg_profile);
              @unlink(public_path().'/uploads/'.Auth::user()->id.'/s'.$obj->bg_profile);
              @unlink(public_path().'/uploads/'.Auth::user()->id.'/ss'.$obj->bg_profile);
          }
             $obj -> bg_profile = $pic;
         }
         $obj -> save();
       
   }
}
