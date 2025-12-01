<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController; // AuthController কে ইমপোর্ট করা হলো

// ডিফল্ট Sanctum রুটটি এখানে আছে, তবে আমরা এটি ব্যবহার করছি না
Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

// 💡 পাবলিক রুট (টোকেন ছাড়া অ্যাক্সেস করা যাবে)
Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);

// 🔒 প্রোটেক্টেড রুট (কাস্টম মিডলওয়্যার দিয়ে সুরক্ষিত)
// 'auth.api' হলো স্টেপ ৩ এ তৈরি করা আমাদের কাস্টম ApiAuth মিডলওয়্যারের Alias
Route::middleware('auth.api')->group(function () {
    // এই রুটটি অ্যাক্সেস করতে হলে Authorization হেডারে ভ্যালিড টোকেন লাগবে
    Route::get('/user', [AuthController::class, 'user']); 
});