<?php

namespace App\Http\Controllers;

use Auth;
use App\Http\Requests;
use App\Models\Publication;


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
}
