<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\ValidationException;

class AuthController extends Controller
{
    // ইউজার লগইন করার জন্য API endpoint
    public function login(Request $request)
    {
        // 1. ডেটা ভ্যালিডেশন
        $request->validate([
            'email' => 'required|email',
            'password' => 'required',
        ]);

        // 2. ইউজারকে ডেটাবেসে খোঁজা
        $user = User::where('email', $request->email)->first();

        // 3. Credential চেক
        if (!$user || !Hash::check($request->password, $user->password)) {
            throw ValidationException::withMessages([
                'email' => ['Invalid credentials provided.'],
            ]);
        }
        
        // 4. পুরানো টোকেন মুছে ফেলা (যদি থাকে)
        $user->tokens()->where('name', 'auth_token')->delete();

        // 5. নতুন টোকেন তৈরি করা (Sanctum)
        $token = $user->createToken('auth_token')->plainTextToken;

        // 6. সফল রেসপন্স
        return response()->json([
            'user' => [
                'name' => $user->name,
                'email' => $user->email,
            ],
            'token' => $token,
        ], 200);
    }

    // ইউজার লগআউট করার জন্য API endpoint
    public function logout(Request $request)
    {
        // বর্তমান ইউজার এবং তার সব টোকেন মুছে ফেলা
        $request->user()->tokens()->delete();

        return response()->json(['message' => 'Logged out successfully.'], 200);
    }
    
    // Auth Check: টোকেন বৈধ কিনা তা চেক করা 
    public function checkAuth(Request $request)
    {
        // যদি টোকেন বৈধ হয়, তাহলে ইউজার ডেটা রিটার্ন হবে
        return response()->json([
            'user' => $request->user(),
            'message' => 'Token is valid.'
        ]);
    }
}