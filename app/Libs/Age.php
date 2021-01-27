<?php

namespace App\Libs;

use App\Models\Property;

class Age{
    public function countAge($inputAgeFrom,$inputAgeTo){
        $objs = Property::all();
        $arr = [];
        foreach($objs as $one){
            $user_age = $this->calculate_age($one->born);
            if($user_age >= $inputAgeFrom &&  $user_age <= $inputAgeTo){
                $arr[] = $one->user_id;
            }
        }
       return $arr;
       /*dd($inputAgeFrom,$inputAgeTo); */
    }
    
    private function calculate_age($birthday) {
        $birthday_timestamp = strtotime($birthday);
        $age = date('Y') - date('Y', $birthday_timestamp);
        if (date('md', $birthday_timestamp) > date('md')) {
            $age--;
        }
        return $age;
    }
}
