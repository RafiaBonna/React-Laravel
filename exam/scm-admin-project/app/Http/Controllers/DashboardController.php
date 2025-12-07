<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Models\Supplier;
use App\Models\Warehouse;
use App\Models\Purchase;
use App\Models\Sale;
use App\Models\Stock; 
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB; 

class DashboardController extends Controller
{
    public function getMetrics(Request $request)
    {
        // 1. Core Metrics (Cards)
        $totalProducts = Product::count();
        $totalSuppliers = Supplier::count();
        $totalWarehouses = Warehouse::count();

        // 2. Financial Metrics
        $totalPurchaseAmount = Purchase::sum('total_amount'); 
        $totalSalesAmount = Sale::sum('total_amount'); 

        // 3. Stock Metrics
        $totalStock = Stock::sum('quantity'); 
        
        // Low Stock Count: current_stock <= min_stock_alert
        $lowStockCount = Product::whereColumn('current_stock', '<=', 'min_stock_alert')->count();
        
        // 4. Warehouse Stock Summary (for Chart)
        // প্রতি ওয়্যারহাউসে মোট স্টক কত আছে তা গণনা করা
        $warehouseStock = Warehouse::select('id', 'name', 'location')
            ->withSum('stocks', 'quantity') // Stock Model এ stocks() রিলেশনশিপ থাকতে হবে
            ->orderByDesc('stocks_sum_quantity')
            ->get()
            ->map(function ($warehouse) {
                return [
                    'name' => $warehouse->name,
                    'total_stock' => $warehouse->stocks_sum_quantity ?? 0,
                ];
            });

        return response()->json([
            'cards' => [
                ['title' => 'Total Products', 'value' => $totalProducts, 'icon' => '📦'],
                ['title' => 'Total Suppliers', 'value' => $totalSuppliers, 'icon' => '🤝'],
                ['title' => 'Total Warehouses', 'value' => $totalWarehouses, 'icon' => '🏭'],
                ['title' => 'Total Stock Qty', 'value' => (int)$totalStock, 'icon' => '🛒'],
                ['title' => 'Low Stock Alerts', 'value' => $lowStockCount, 'icon' => '🚨'],
                ['title' => 'Total Purchase Value', 'value' => number_format($totalPurchaseAmount, 0), 'icon' => '💰'],
                ['title' => 'Total Sales Value', 'value' => number_format($totalSalesAmount, 0), 'icon' => '📈'],
            ],
            'charts' => [
                'salesVsPurchase' => [
                    'labels' => ['Purchase', 'Sales'],
                    'data' => [$totalPurchaseAmount, $totalSalesAmount],
                ],
                'warehouseStock' => $warehouseStock->take(5)->values(),
            ],
        ]);
    }
}