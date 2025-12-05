<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Product;
use App\Models\Warehouse;
use App\Models\Sale;
use App\Models\SaleItem; // ⬅️ REQUIRED
use App\Models\Stock;     // ⬅️ REQUIRED
use Illuminate\Support\Facades\DB;

class SaleSeeder extends Seeder
{
    public function run(): void
    {
        $productData = Product::all();
        $warehouseIds = Warehouse::pluck('id')->toArray();

        if ($productData->isEmpty() || empty($warehouseIds)) {
            echo "পণ্য বা গুদাম ডেটা পাওয়া যায়নি।";
            return;
        }

        $products = $productData->keyBy('id');

        // 5টি ডেমো Sale তৈরি করা
        for ($i = 0; $i < 5; $i++) {
            $totalAmount = 0;

            // Sale Invoice তৈরি
            $sale = Sale::create([
                'invoice_no' => 'SALE-' . time() . rand(100, 999) . $i,
                'customer_name' => fake()->name(),
                'customer_phone' => fake()->phoneNumber(),
                'sales_date' => now()->subDays(rand(1, 15)),
                'total_amount' => 0, 
                'description' => 'Demo sales seeding',
            ]);

            // Sale-এর আইটেম এবং Stock আপডেট
            $itemsToSell = rand(1, 3);
            $soldProducts = [];
            
            for ($j = 0; $j < $itemsToSell; $j++) {
                $productId = $products->keys()->random();
                
                if (in_array($productId, $soldProducts)) continue;
                $soldProducts[] = $productId;

                $product = $products->get($productId);
                
                $quantityToSell = rand(5, 15); 
                $warehouseId = $warehouseIds[array_rand($warehouseIds)]; 
                
                $subTotal = $quantityToSell * $product->sales_price;
                $totalAmount += $subTotal;

                // 1. SaleItem তৈরি
                SaleItem::create([
                    'sale_id' => $sale->id,
                    'product_id' => $productId,
                    'quantity' => $quantityToSell,
                    'unit_price' => $product->sales_price,
                    'sub_total' => $subTotal,
                ]);

                // 2. Stock কমানো (Fix: decrement ব্যবহার করে)
                $stock = Stock::where('product_id', $productId)
                              ->where('warehouse_id', $warehouseId)
                              ->first();

                if ($stock) {
                    $stock->decrement('quantity', $quantityToSell);
                } else {
                    Stock::create([
                        'product_id' => $productId, 
                        'warehouse_id' => $warehouseId, 
                        'quantity' => -$quantityToSell
                    ]);
                }
            }

            // 3. মোট পরিমাণ দিয়ে Sale Invoice আপডেট
            $sale->update(['total_amount' => $totalAmount]);
        }
    }
}