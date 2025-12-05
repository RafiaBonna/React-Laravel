<?php

namespace App\Models;

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('purchase_items', function (Blueprint $table) {
            $table->id();
            $table->foreignId('purchase_id')->constrained('purchases')->onDelete('cascade'); // Purchase Invoice এর সাথে লিংক
            $table->foreignId('product_id')->constrained('products')->onDelete('cascade'); // Product এর সাথে লিংক
            $table->integer('quantity');
            $table->decimal('unit_price', 10, 2);
            $table->decimal('sub_total', 10, 2);
            $table->timestamps();

            $table->unique(['purchase_id', 'product_id']); // একটি ইনভয়েসে একটি প্রোডাক্ট একবারই থাকবে
        });
    }

    /**
     * Reverse the migrations.
     */
    // ... (down function)
};
