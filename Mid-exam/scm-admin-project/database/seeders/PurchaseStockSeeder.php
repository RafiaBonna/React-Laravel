<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Product;
use App\Models\Supplier;
use App\Models\Warehouse;
use App\Models\Purchase;
use App\Models\Stock;
use Illuminate\Support\Facades\DB;

class PurchaseStockSeeder extends Seeder
{
    public function run(): void
    {
        // 1. ডেটাবেজ থেকে বিদ্যমান ID গুলো নিয়ে আসা
        $productIds = Product::pluck('id')->toArray();
        $supplierIds = Supplier::pluck('id')->toArray();
        $warehouseIds = Warehouse::pluck('id')->toArray();

        if (empty($productIds) || empty($supplierIds) || empty($warehouseIds)) {
            echo "পণ্য, সরবরাহকারী, বা গুদাম ডেটা পাওয়া যায়নি।";
            return;
        }

        // 2. 5 থেকে 10টি ডেমো Purchase তৈরি করা
        for ($i = 0; $i < 8; $i++) { // 8টি Purchase Invoice তৈরি
            
            // Randomly select Supplier and Purchase details
            $supplierId = $supplierIds[array_rand($supplierIds)];
            $totalAmount = 0;
            
            // Purchase Invoice তৈরি
            $purchase = Purchase::create([
                'invoice_no' => 'INV-' . time() . rand(100, 999),
                'supplier_id' => $supplierId,
                'purchase_date' => now()->subDays(rand(1, 30)),
                'total_amount' => 0, // পরে আপডেট করা হবে
                'description' => 'Demo purchase seeding',
            ]);

            // 3. Purchase-এর আইটেম এবং Stock আপডেট
            $itemsToPurchase = rand(2, 5); // প্রতিটি ইনভয়েসে 2-5টি আইটেম
            $warehouseId = $warehouseIds[array_rand($warehouseIds)]; // একটি warehouse select
            
            for ($j = 0; $j < $itemsToPurchase; $j++) {
                $productId = $productIds[array_rand($productIds)];
                $product = Product::find($productId);
                
                $quantity = rand(20, 100);
                $subTotal = $quantity * $product->purchase_price;
                $totalAmount += $subTotal;
                
                // Stock আপডেট (বা ইনসার্ট)
                Stock::updateOrCreate(
                    ['product_id' => $productId, 'warehouse_id' => $warehouseId],
                    ['quantity' => DB::raw("quantity + $quantity")]
                );
            }

            // 4. মোট পরিমাণ দিয়ে Purchase Invoice আপডেট
            $purchase->update(['total_amount' => $totalAmount]);
        }
        echo "Purchase এবং Stock ডেটা সফলভাবে তৈরি হয়েছে।";
    }
}