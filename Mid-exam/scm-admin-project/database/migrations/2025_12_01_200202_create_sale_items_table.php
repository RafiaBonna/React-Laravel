<?php
// database/migrations/...create_sale_items_table.php (নতুন তৈরি হওয়া ফাইল)

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
        Schema::create('sale_items', function (Blueprint $table) {
            $table->id();
            $table->foreignId('sale_id')->constrained('sales')->onDelete('cascade'); // Sale Invoice এর সাথে লিংক
            $table->foreignId('product_id')->constrained('products')->onDelete('cascade'); // Product এর সাথে লিংক
            $table->integer('quantity');
            $table->decimal('unit_price', 10, 2);
            $table->decimal('sub_total', 10, 2);
            $table->timestamps();

            $table->unique(['sale_id', 'product_id']); 
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('sale_items');
    }
};
