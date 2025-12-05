<?php

namespace Database\Seeders;

use App\Models\User;
use App\Models\Product;
use App\Models\Supplier;
use App\Models\Warehouse;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class DatabaseSeeder extends Seeder
{
    public function run(): void
    {
        // 1. Admin User create (Duplicate-Proof)
        User::firstOrCreate(
            ['email' => 'admin@admin.com'],
            [
                'name' => 'Admin User',
                'password' => Hash::make('password'),
                'email_verified_at' => now(),
            ]
        );

        // 2. Factories:
        Supplier::factory(10)->create();
        Warehouse::factory(4)->create();
        Product::factory(30)->create();

        // 3. Purchase → Stock → Sale
        $this->call(PurchaseStockSeeder::class); 
        $this->call(SaleSeeder::class);
    }
}
