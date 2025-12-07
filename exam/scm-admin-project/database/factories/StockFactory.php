<?php

namespace Database\Factories; // নিশ্চিত করো: এই লাইনটি আছে

use App\Models\Stock;
use App\Models\Product;
use App\Models\Warehouse;
use Illuminate\Database\Eloquent\Factories\Factory;

class StockFactory extends Factory
{
    protected $model = Stock::class;

    public function definition(): array
    {
        // নিশ্চিত করো যে database এ Product এবং Warehouse আছে
        return [
            'product_id' => Product::factory(), 
            'warehouse_id' => Warehouse::factory(),
            'quantity' => $this->faker->numberBetween(50, 300),
        ];
    }

    /**
     * Define a state where stock quantity is low.
     * এটি আমরা সেডারে ব্যবহার করবো না, শুধু উদাহরণের জন্য রাখা হলো।
     */
    public function lowStock(): Factory
    {
        return $this->state(function (array $attributes) {
            return [
                'quantity' => $this->faker->numberBetween(1, 15),
            ];
        });
    }
}