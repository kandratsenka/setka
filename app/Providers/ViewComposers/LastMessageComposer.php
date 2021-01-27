<?php
namespace App\Providers\ViewComposers;
use Illuminate\Contracts\View\View;
use App\Models\LastMessage;
use Auth;

class LastMessageComposer{
  public function compose(View $view){
      $lastMessages = LastMessage::where('user_id',Auth::user()->id)->orderBy('put_date','DESC')
           ->orWhere(function($query){
                        $query->where('friend_id',Auth::user()->id);
                    })->get();
      $view->with('lastMessages',$lastMessages);
  }
}