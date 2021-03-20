<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Auth;

class CKEditorController extends Controller
{
    public function uploadImage(Request $request){
        $CKEditor = $request->input('CKEditor');
        $funcNum = $request->input('CKEditorFuncNum');
        $message = '';
        $url = '';
        /*dd($CKEditor);*/
        if($_FILES['upload']){
            $dir_first = '/uploads/'. Auth::user()->id . '/wall/';
            $dir = public_path().$dir_first;
            if(!file_exists($dir)){
                mkdir($dir, 0777, true);
            }
            $pic = \App::make('\App\Libs\Imag')->url($_FILES['upload']['tmp_name'],$dir_first);
            $url = asset($dir_first.$pic);
        }else{
            $message = "Error in upload's file!";
        }
        return '<script>
                    window.parent.CKEDITOR.tools.callFunction('.$funcNum.', "'.$url.'","'.$message.'");
                </script>';
    }
}
