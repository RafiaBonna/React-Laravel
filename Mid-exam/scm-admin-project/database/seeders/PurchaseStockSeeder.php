<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Product;
use App\Models\Supplier;
use App\Models\Warehouse;
use App\Models\Purchase;
use App\Models\Stock;
use App\Models\PurchaseItem; // ⬅️ THIS FIXES THE ERROR
use Illuminate\Support\Facades\DB; // DB::raw ব্যবহার করা নেই, তাই এটি এখন না দিলেও চলে

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

        // 2. 8টি ডেমো Purchase তৈরি করা
        for ($i = 0; $i < 8; $i++) {
            
            // Randomly select Supplier and Purchase details
            $supplierId = $supplierIds[array_rand($supplierIds)];
            $warehouseId = $warehouseIds[array_rand($warehouseIds)]; 
            $totalAmount = 0;
            
            // Purchase Invoice তৈরি
            $purchase = Purchase::create([
                'invoice_no' => 'INV-' . time() . rand(100, 999) . $i,
                'supplier_id' => $supplierId,
                'purchase_date' => now()->subDays(rand(1, 30)),
                'total_amount' => 0, 
                'description' => 'Demo purchase seeding',
            ]);

            // 3. Purchase-এর আইটেম এবং Stock আপডেট
            $itemsToPurchase = rand(2, 5); 
            
            for ($j = 0; $j < $itemsToPurchase; $j++) {
                $productId = $productIds[array_rand($productIds)];
                $product = Product::find($productId);
                
                $quantity = rand(20, 100);
                $subTotal = $quantity * $product->purchase_price;
                $totalAmount += $subTotal;
                
                // 3.1. PurchaseItem তৈরি
                PurchaseItem::create([
                    'purchase_id' => $purchase->id,
                    'product_id' => $productId,
                    'quantity' => $quantity,
                    'unit_price' => $product->purchase_price,
                    'sub_total' => $subTotal,
                ]);

                // 3.2. Stock আপডেট (Fix: increment ব্যবহার করে)
                $stock = Stock::firstOrNew(
                    ['product_id' => $productId, 'warehouse_id' => $warehouseId]
                );

                if ($stock->exists) {
                    $stock->increment('quantity', $quantity);
                } else {
                    $stock->quantity = $quantity;
                    $stock->save();
                }
            }

            // 4. মোট পরিমাণ দিয়ে Purchase Invoice আপডেট
            $purchase->update(['total_amount' => $totalAmount]);
        }
    }
}