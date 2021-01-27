<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Illuminate\Support\Facades\Auth;
use Tymon\JWTAuth\Contracts\JWTSubject;

class User extends \TCG\Voyager\Models\User implements JWTSubject
{
    use HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name',
        'email',
        'password',
        'sub'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];
    
    public function property(){
        return $this->hasOne('App\Models\Property');
    }
    
    public function friends() {
        /*return $this->hasMany('App\Models\Friend', 'user_id');*/
        return $this->belongsToMany('App\Models\User', 'App\Models\Friend', 'user_id', 'friend_id')->orderBy('name');
    }
    
    public function music() {
        return $this->belongsToMany('App\Models\Music', 'App\Models\MusicUser');
    }
    
    public function movie() {
        return $this->belongsToMany('App\Models\Movie', 'App\Models\MovieUser');
    }
    
    public function friendU() {
        return $this->hasMany('App\Models\Friend', 'friend_id');
    }
    
    function isFriend()
    {
        return Auth::user()->friends->contains('id', $this->id);
    }
    
    public function getJWTIdentifier()
    {
        return $this->getKey();
    }

    /**
     * Return a key value array, containing any custom claims to be added to the JWT.
     *
     * @return array
     */
    public function getJWTCustomClaims()
    {
        return [];
    }
}
