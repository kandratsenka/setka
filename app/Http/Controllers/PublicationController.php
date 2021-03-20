<?php

namespace App\Http\Controllers;

use Auth;
use App\Http\Requests;
use App\Models\Publication;
use App\Models\Friend;


class PublicationController extends Controller
{
    public function postIndex(Requests\PublicationRequest $r){
        //dd($r->all());
        $r['user_id']=Auth::user()->id;
        $r['status']='active';
        $r['type']='';
        $r['group_id']=0;
        Publication::create($r->all());
        return redirect('/');
    }
    
    public function getPublication($id = null){
        $one = Publication::find($id);
        abort_if(!$one,404);
        abort_if(($one->status == 'deleted' || $one->status == 'hide'), 404);
        if($one->status == 'private'){
            abort_if(Auth::guest(),404);
            abort_if($one->user_id != Auth::user()->id,404);
        }
        if($one->status == 'for_friends'){
            abort_if(Auth::guest(),404);
            $friend = Friend::where('user_id',$one->user_id)->where('friend_id',Auth::user()->id)->first();
            if(Auth::user()->id != $one->user_id){
            abort_if(!$friend,404);
            }
        }
        
        return view('public',compact('one'));
    }
    
    public function getEdit(Publication $publication){
        return view('changePost',compact('publication'));
    }
    
    public function postEdit(Publication $publication){
        $publication_obj = Publication::where('user_id', Auth::user()->id)->where('id',$publication->id)->first();
        $publication->body = $_POST['body'];
        $publication->save();
        return redirect('/');
    }
}
