<?php
namespace App\Providers\ViewComposers;
use Illuminate\Contracts\View\View;
use App\Models\Friend;
use Auth;

class FriendComposer{
  public function compose(View $view){
      $arr = [];
      $friends = Friend::where('user_id',Auth::user()->id)->get();
      foreach($friends as $one){
          $arr[$one->friend_id]=$one->friend_id;
      }
        
      $view->with('arr',$arr);
  }
}