<?php
namespace App\Libs;
use App\Models\Movie;
use App\Models\MovieUser;
use Auth;

class Movi{
    public function postData($data = null,$user_id = null){
        if(!$user_id){
            $user_id = Auth::user()->id;
        }
        $arr=explode(',',$data); 
        $arr1=[];
        
        foreach($arr as $one){
            $one1=trim($one);
            $arr1[]=$one1;
            $obj=Movie::where('name',$one1)->first();
            if(!$obj){
            if($one1 != ''){
                $obj = new Movie;
                $obj->name=$one1;
                $obj->user_id=$user_id;
                $obj->save();
            }
            }
            if($obj){
            $obj_user=MovieUser::where('movie_id',$obj->id)->where('user_id',$user_id)->first();
            if(!$obj_user){
                $obj_user = new MovieUser;
                $obj_user->movie_id=$obj->id;
                $obj_user->user_id=$user_id;
                $obj_user->save();
            }
        }}
        $obj_movies=MovieUser::with('movies')->where('user_id',$user_id)->get();
        foreach($obj_movies as $movie){
            if($movie->movies->name){
            if (!in_array($movie->movies->name, $arr1)) {
                MovieUser::where('id',$movie->id)->where('user_id',$user_id)->delete();
            }
        } 
        }
    }
}