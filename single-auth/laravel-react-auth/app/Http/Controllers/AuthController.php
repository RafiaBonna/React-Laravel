<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Hash;
use Illuminate\Http\Request;

class AuthController extends Controller
{
    // ১. নতুন ইউজার রেজিস্ট্রেশনের ফাংশন
    public function register(Request $request)
    {
        // রেজিস্ট্রেশনের জন্য একটি 60 ক্যারেক্টারের র্যান্ডম টোকেন তৈরি
        $token = Str::random(60);

        $user = User::create([
            'name'     => $request->name,
            'email'    => $request->email,
            'password' => Hash::make($request->password),
            'api_token'=> $token, // টোকেনটি ডেটাবেজে সেভ করা হলো
        ]);

        return response()->json([
            'message' => 'Registration Successful',
            'token'   => $token // রেজিস্ট্রেশন টোকেনটি ক্লায়েন্টকে দেওয়া হলো
        ]);
    }


    // ২. ইউজার লগইনের ফাংশন
    public function login(Request $request)
    {
        $user = User::where('email', $request->email)->first();

        if(!$user || !Hash::check($request->password, $user->password)){
            return response()->json(['message'=>'Invalid credentials'], 401);
        }

        // লগইনের জন্য ইউজার ইমেইলকে Base64 এনকোড করে টোকেন হিসেবে রিটার্ন করা হলো
        // (এটি আপনার কাস্টম স্যাম্পল ফাইলের লজিক)
        $token = base64_encode($user->email);

        return response()->json([
            'message'=>'Login successful',
            'token'=>$token, // লগইন টোকেনটি ক্লায়েন্টকে দেওয়া হলো
            'user'=>$user
        ], 200);
    }


    // ৩. অথেনটিকেটেড ইউজারের ডেটা দেখানোর ফাংশন (মিডলওয়্যার দ্বারা সুরক্ষিত)
    public function user()
    {
        // auth()->user() মিডলওয়্যারের মাধ্যমে পাওয়া ইউজারকে রিটার্ন করবে
        return response()->json(auth()->user());
    }
}