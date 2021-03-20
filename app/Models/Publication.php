<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Publication extends Model
{
    use HasFactory;
    protected $fillable=['body','status','type','group_id','user_id'];
    
    public function users() {
        return $this->belongsTo('App\Models\User','user_id');
    }
    
}
