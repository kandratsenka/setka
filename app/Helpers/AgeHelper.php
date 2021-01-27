<?php
 function AgeHelper($count){
     return  \Lang::choice('год|года|лет', $count, [], 'ru');
}