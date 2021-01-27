<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Main;
use Auth;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        return view('home');
    }
    
     public function postMain()
    {
         $obj=new Main;
         $obj->comment=$_POST['comment'];
         $obj->user_id=Auth::user()->id;
         $obj->save();
         return redirect()->back();
     }
    
    
   /* public function postPage(){
    $obj = new Maintext;
    $obj->name=$_POST['name'];
    $obj->name=$_POST['body'];
    $obj->pictures
    }*/
    
}
