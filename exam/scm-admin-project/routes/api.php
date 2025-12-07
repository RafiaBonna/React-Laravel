<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\AuthController;

// -----------------------------
// Public Routes (No Auth Required)
// -----------------------------
Route::post('/login', [AuthController::class, 'login']);

// -----------------------------
// Protected Routes (Token Required)
// -----------------------------
Route::middleware('auth:sanctum')->group(function () {

    // Dashboard Metrics
    Route::get('/admin/dashboard/metrics', [DashboardController::class, 'getMetrics']);

    // Auth Check (to verify if user is logged in)
    Route::get('/admin/auth/check', [AuthController::class, 'checkAuth']);

    // Logout
    Route::post('/logout', [AuthController::class, 'logout']);

    // Future Protected Routes
    // Example:
    // Route::get('/products', [ProductController::class, 'index']);
    // Route::post('/purchases', [PurchaseController::class, 'store']);
});
