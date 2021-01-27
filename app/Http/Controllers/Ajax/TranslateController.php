<?php

namespace App\Http\Controllers\Ajax;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Parser\EmTranslate;
use App\Models\Publication;

class TranslateController extends Controller
{
    public function postData(){
        $id = (int)$_POST['data_id']; 
        $obj = Publication::find($id);
        $obj_t = new EmTranslate;
        echo $obj_t -> getParse($obj->body);
         
    }
    
}
