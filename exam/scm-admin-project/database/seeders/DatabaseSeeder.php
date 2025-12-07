<?php

namespace Database\Seeders;

use App\Models\User;
use App\Models\Product;
use App\Models\Supplier;
use App\Models\Warehouse;
use App\Models\Stock;
use App\Models\Purchase;
use App\Models\PurchaseItem;
use App\Models\Sale;
use App\Models\SaleItem;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\DB;

class DatabaseSeeder extends Seeder
{
    public function run(): void
    {
        // 1. Admin User তৈরি
        User::create([
            'name' => 'Admin User',
            'email' => 'admin@admin.com',
            'password' => Hash::make('password'), // password: password
        ]);

        // 2. Core Data তৈরি (Supplier, Warehouse, Product)
        $suppliers = Supplier::factory()->count(10)->create();
        $warehouses = Warehouse::factory()->count(3)->create();
        $products = Product::factory()->count(30)->create();

        // 3. Initial Stock তৈরি
        // 20টি Product কে random Warehouse এ স্টক যুক্ত করা
        $productsToStock = $products->random(20);
        foreach ($productsToStock as $product) {
            $warehouse = $warehouses->random();
            $quantity = rand(50, 300);

            // Stock record তৈরি
            Stock::create([
                'product_id' => $product->id,
                'warehouse_id' => $warehouse->id,
                'quantity' => $quantity,
            ]);
            
            // Product মডেলেও current_stock আপডেট করা
            $product->current_stock = $quantity;
            $product->save();
        }

        // 4. Purchase Data তৈরি
        $purchases = Purchase::factory()->count(15)->create([
            'supplier_id' => $suppliers->random()->id,
        ]);
        
        $purchases->each(function ($purchase) use ($products, $warehouses) {
            $totalAmount = 0;
            // প্রতিটি Purchase-এ 2 থেকে 5টি Item যুক্ত করা
            $itemsCount = rand(2, 5);
            $items = $products->random($itemsCount);

            foreach ($items as $item) {
                $warehouse = $warehouses->random();
                $quantity = rand(20, 100);
                $unitPrice = $item->purchase_price;
                $subTotal = $quantity * $unitPrice;

                PurchaseItem::create([
                    'purchase_id' => $purchase->id,
                    'product_id' => $item->id,
                    'warehouse_id' => $warehouse->id,
                    'quantity' => $quantity,
                    'unit_price' => $unitPrice,
                    'sub_total' => $subTotal,
                ]);
                $totalAmount += $subTotal;
                
                // Stock আপডেট করা (যদি Stock থাকে, নাহলে নতুন রেকর্ড তৈরি)
                DB::table('stocks')->upsert(
                    [
                        'product_id' => $item->id,
                        'warehouse_id' => $warehouse->id,
                        'quantity' => DB::raw("quantity + $quantity"),
                        'updated_at' => now(),
                    ],
                    ['product_id', 'warehouse_id'],
                    ['quantity', 'updated_at']
                );
                // Product এর total stock আপডেট
                $item->increment('current_stock', $quantity);
            }

            // Purchase total_amount আপডেট
            $purchase->total_amount = $totalAmount;
            $purchase->save();
        });


        // 5. Sale Data তৈরি
        $sales = Sale::factory()->count(10)->create();

        $sales->each(function ($sale) use ($products, $warehouses) {
            $totalAmount = 0;
            $itemsCount = rand(1, 3);
            $items = $products->random($itemsCount);

            foreach ($items as $item) {
                $warehouse = $warehouses->random();
                $quantity = rand(1, 15); // বিক্রয়ের পরিমাণ কম রাখলাম
                $unitPrice = $item->sales_price;
                $subTotal = $quantity * $unitPrice;

                SaleItem::create([
                    'sale_id' => $sale->id,
                    'product_id' => $item->id,
                    'warehouse_id' => $warehouse->id,
                    'quantity' => $quantity,
                    'unit_price' => $unitPrice,
                    'sub_total' => $subTotal,
                ]);
                $totalAmount += $subTotal;
                
                // Stock আপডেট করা (Stock থেকে Quantity কমানো)
                DB::table('stocks')
                    ->where('product_id', $item->id)
                    ->where('warehouse_id', $warehouse->id)
                    ->decrement('quantity', $quantity);

                // Product এর total stock আপডেট
                $item->decrement('current_stock', $quantity);
            }

            // Sale total_amount আপডেট
            $sale->total_amount = $totalAmount;
            $sale->save();
        });

    }
}