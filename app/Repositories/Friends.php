<?php

namespace App\Repositories;
use App\Models\User;
use Auth;

class Friends{
    private $arrJoin = [];
    private $users;
    function __construct(){
        $this->users = User::query()->select('users.*');
        $this->users -> where('users.id','!=',Auth::user()->id);
        return $this;
    }
    
    
    private function findAll($name) {
        if (!in_array($name, $this->arrJoin)) {
            $this->arrJoin[] = $name;
            switch($name) {
                case 'properties' : 
                    $this->users->join('properties', 'users.id', '=', 'properties.user_id');
                    break;
            }
        }
    }
    
    function findByName($name = null){
        $this->users->where('name','like', '%' . $name . '%');
        return $this;
    }
    
    function findByMail($mail = null){
        $this->users->orWhere('email',$mail);
        return $this;
    }
    
    function findByCity($city = null){
        if(empty($city)){
            return $this;
        }
        $this->findAll('properties');
        $this->users->where('city','like', '%' . $city . '%');
        return $this;
    }
    
    function findByGender($gender = null){
        if(empty($gender)){
            return $this;
        }
        $this->findAll('properties');
        $this->users->where('gender','like', $gender);
        return $this;
    }
    
    
    function findByAge($ageFrom,$ageTo){
        if(empty($ageFrom)&&empty($ageTo)){
            return $this;
        }
        
        $this->findAll('properties');
        if(!empty($ageFrom)){
            $datefrom = date('Y-m-d',strtotime("-$ageFrom year"));
            $this->users->where('born','<=', $datefrom);
        }
        if(!empty($ageTo)){
            $dateto = date('Y-m-d',strtotime("-$ageTo year"));
            $this->users->where('born','>=', $dateto);
        }
        
        return $this;
    }
    
    
    function end(){
        return $this->users;
    }
}