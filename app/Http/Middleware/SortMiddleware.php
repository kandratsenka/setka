<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class SortMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {
        if(isset($_GET['sort'])){
            switch ($_GET['sort']) { //условный оператор
                case 'new': $sort = 'DESC'; break;
                case 'old': $sort = 'ASC'; break; 
                default:    $sort = 'DESC';
}
        }else{
            $sort='DESC';
        }
        $request->merge(compact('sort'));
        return $next($request);
    }
}
