<?php
namespace App\Libs;
use App\Models\Music;
use App\Models\MusicUser;
use Auth;

class Musi{
    public function postData($data=null,$user_id = null){
        if(!$user_id){
            $user_id = Auth::user()->id;
        }
        $arr=explode(',',$data);
        $arr1=[];
        
        foreach($arr as $one){
            $one1=trim($one);
            $arr1[]=$one1;
            $obj=Music::where('name',$one1)->first();
            if(!$obj){
            if($one1 != ''){
                $obj = new Music;
                $obj->name=$one1;
                $obj->user_id=$user_id;
                $obj->save();
            }
            }
            if($obj){
            $obj_user=MusicUser::where('music_id',$obj->id)->where('user_id',$user_id)->first();
            if(!$obj_user){
                $obj_user = new MusicUser;
                $obj_user->music_id=$obj->id;
                $obj_user->user_id=$user_id;
                $obj_user->save();
            }
        }}
        $obj_musics=MusicUser::with('musics')->where('user_id',$user_id)->get();
        foreach($obj_musics as $music){
            if($music->musics->name){
            if (!in_array($music->musics->name, $arr1)) {
                MusicUser::where('id',$music->id)->where('user_id',$user_id)->delete();
            }
        } 
        }
    }
    
}
