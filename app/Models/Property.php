<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Property extends Model
{
    use HasFactory;
    
    public function getAgeAttribute(){
         return  \Carbon\Carbon::parse($this -> born)->age; 
    }
}
