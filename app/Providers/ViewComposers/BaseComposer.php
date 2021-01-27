<?php
namespace App\Providers\ViewComposers;
use Illuminate\Contracts\View\View;
class BaseComposer{
  public function compose(View $view){
    $url = $_SERVER['REQUEST_URI'];
    $view->with('url',$url);
  }
}