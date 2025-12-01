<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\ProductController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| These routes are typically accessed via React/Vue frontend or Postman.
|
*/

// Public Route (If you use a SPA login)
// Note: We assume the login/logout routes are handled by Sanctum's default system or separate routes.

// Admin Protected Routes (All routes for SCM management)
Route::middleware('auth:sanctum')->group(function () {
    
    // 1. DASHBOARD METRICS API
    // Used for fetching all the main cards, charts, and low stock alerts.
    Route::get('/admin/dashboard/metrics', [DashboardController::class, 'getMetrics']);
    
    // 2. PRODUCT CRUD API
    // Provides routes for listing, adding, viewing, updating, and deleting products.
    // Methods: GET /products, POST /products, GET /products/{product}, PUT/PATCH /products/{product}, DELETE /products/{product}
    Route::apiResource('products', ProductController::class);
    
    // 3. User Info (for frontend to identify the logged-in user)
    Route::get('/user', function (Request $request) {
        return $request->user();
    });
});