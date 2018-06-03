<?php

namespace App\Http\Middleware\UserType;

use Closure;
use Illuminate\Auth;

class isTeacher
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        if (\Auth::user()->id_type_user !== 2) {
            return redirect()->route('index');
        }

        return $next($request);
    }
}
