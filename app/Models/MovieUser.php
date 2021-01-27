<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MovieUser extends Model
{
    use HasFactory;
    public function movies()
  {
    return $this->belongsTo('App\Models\Movie','movie_id');
  }
}
