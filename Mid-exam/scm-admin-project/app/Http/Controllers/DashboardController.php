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
    public function getMetrics()
    {
        // 1. Core Counts
        $totalProducts = Product::count();
        $totalSuppliers = Supplier::count();
        $totalWarehouses = Warehouse::count();

        // 2. Financial Summaries (Purchase/Sale)
        $totalPurchaseAmount = Purchase::sum('total_amount');
        $totalSaleAmount = Sale::sum('total_amount'); // Sale data will be 0 now, but structure is ready

        // 3. Stock/Inventory Metrics
        $totalCurrentStock = Stock::sum('quantity');

        // Low Stock Products (Less than min_stock_alert)
        $lowStockProducts = Product::where('min_stock_alert', '>', DB::raw('(SELECT SUM(quantity) FROM stocks WHERE stocks.product_id = products.id)'))
            ->whereExists(function ($query) {
                $query->select(DB::raw(1))
                    ->from('stocks')
                    ->whereColumn('stocks.product_id', 'products.id');
            })
            ->select('name', 'sku', DB::raw('(SELECT SUM(quantity) FROM stocks WHERE stocks.product_id = products.id) as current_stock'))
            ->get();
        
        $lowStockCount = $lowStockProducts->count();

        // 4. Warehouse Stock Summary (For Warehouse Table/Chart)
      $warehouseStock = Warehouse::select('name', 'location')
        ->selectRaw('SUM(stocks.quantity) as total_quantity') // টোটাল কোয়ান্টিটি কলামে আনো
        ->leftJoin('stocks', 'warehouses.id', '=', 'stocks.warehouse_id')
        ->groupBy('warehouses.id', 'warehouses.name', 'warehouses.location') // গ্রুপ বাই করো
        ->orderByDesc('total_quantity') // টোটাল কোয়ান্টিটি দ্বারা অর্ডার করো
        ->get();

        return response()->json([
            'cards' => [
                'products' => $totalProducts,
                'suppliers' => $totalSuppliers,
                'warehouses' => $totalWarehouses,
                'purchase_total' => number_format($totalPurchaseAmount, 2),
                'sales_total' => number_format($totalSaleAmount, 2),
                'current_stock' => $totalCurrentStock,
                'low_stock_count' => $lowStockCount,
            ],
            'low_stock_items' => $lowStockProducts,
            'warehouse_summary' => $warehouseStock,
        ]);
    }
}