<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MusicUser extends Model
{
    use HasFactory;
    public function musics()
  {
    return $this->belongsTo('App\Models\Music','music_id');
  }
}
