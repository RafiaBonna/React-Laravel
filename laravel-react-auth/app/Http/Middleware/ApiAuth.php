<?php

namespace App\Http\Middleware;

use Closure;
use App\Models\User;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class ApiAuth
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        // 1. Authorization হেডার থেকে টোকেনটি নিন
        $token = $request->header('Authorization');

        // টোকেন না থাকলে Unauthorized মেসেজ দিন
        if (!$token) {
            return response()->json(['message' => 'Unauthorized'], 401);
        }

        // 2. টোকেনটি 'api_token' কলামে খুঁজে দেখুন
        $user = User::where('api_token', $token)->first(); 

        // যদি ইউজার না পাওয়া যায় বা টোকেন ভুল হয়
        if (!$user) {
            return response()->json(['message' => 'Invalid Token'], 401);
        }

        // 3. ইউজারকে অথেনটিকেটেড করুন
        auth()->login($user);

        // রিকোয়েস্টটি পরের ধাপে (Controller) পাঠান
        return $next($request);
    }
}