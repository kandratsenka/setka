<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Property;
use File;

class JsonController extends Controller
{
    public function __construct(){
        $this->headers = ['Content-type' => 'application/json; charset=utf-8'];
    }
    //work with JSON
    public function getProfile(){
        $users = User::with('property')->get();
        return response()->json(['users' => $users], 200, $this->headers, JSON_UNESCAPED_UNICODE);
    }
    //work with common file
    public function getFile(){
        $url = file_get_contents(public_path().'/setkaMail.txt');
        $file_array = explode("#",$url);
        foreach($file_array as $file){
            $this->getFileUser($file);
        }
    }
    
    private function getFileUser($file){
        echo '<hr>';
        $fileM = explode("\r\n",$file);
        $dr = null;
        $gender = null;
        $city = null;
        $userSt = null;
        $user = null;
        $music = null;
        $movie = null;
        if(isset($fileM[1])){
            $fileU = explode(":",$fileM[1]);
            $user = User::where('email',$fileU[1])->first();
            echo $user->id.'<br>';
        }
        if(isset($fileM[2])){
            $dr_arr = explode(":",$fileM[2]);
            $dr = $dr_arr[1];
        echo $fileM[2].'<br>';
        }
       if(isset($fileM[3])){
           $gender_arr = explode(":",$fileM[3]);
           $gender = $gender_arr[1];
        echo $fileM[3].'<br>';
        }
        if(isset($fileM[4])){
            $city_arr = explode(":",$fileM[4]);
            $city = $city_arr[1];
        echo $fileM[4].'<br>';
        }
        if(isset($fileM[5])){
            $userSt_arr = explode(":",$fileM[5]);
            $userSt = $userSt_arr[1];
        echo $fileM[5].'<br>';
        }
        if($user){
            $property = Property::where('user_id',$user->id)->firstOrNew();
            $property->user_id=$user->id;
            $property->born=$dr;
            $property->gender=$gender;
            $property->city=$city;
            $property->maritalStatus=$userSt;
            $property->save();
            if(isset($fileM[6])){
                $music_arr = explode(":",$fileM[6]);
                $music = $music_arr[1];
                if($music){
                    \App::make('App\Libs\Musi')->postData($music,$user->id);
                }
                echo $fileM[6].'<br>';
            }
            if(isset($fileM[7])){
                $movie_arr = explode(":",$fileM[7]);
                $movie = $movie_arr[1];
                if($movie){
                    \App::make('App\Libs\Movi')->postData($movie,$user->id);
                }
            echo $fileM[7].'<br>';    
            }
        }    
    }
}
