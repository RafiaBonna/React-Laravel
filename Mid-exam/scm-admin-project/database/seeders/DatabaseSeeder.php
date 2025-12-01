<?php

namespace Database\Seeders;

// database/seeders/DatabaseSeeder.php

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
        // 1. Admin User তৈরি:
        User::factory()->create([
            'name' => 'Admin User',
            'email' => 'admin@admin.com', 
            'password' => Hash::make('password'), 
        ]);

        // 2. Demo Data তৈরি:
        Supplier::factory(10)->create();
        Warehouse::factory(4)->create();
        Product::factory(30)->create();

        // Note: Purchase, Sale, এবং Stock-এর জন্য Seeding পরের ধাপে করবো।
    }
}