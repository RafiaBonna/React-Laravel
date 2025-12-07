<?php

// ..._create_products_table.php ফাইলটি ওপেন করো

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->string('name')->unique();
            $table->string('sku')->unique()->nullable();
            $table->string('unit'); // pcs, kg, box
            $table->decimal('purchase_price', 10, 2);
            $table->decimal('sales_price', 10, 2);
            $table->integer('min_stock_alert')->default(10);
            $table->integer('current_stock')->default(0); // এটি পরে Stock টেবিল থেকে যোগ হবে
            $table->text('description')->nullable();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('products');
    }
};
