<?php

namespace Database\Factories; // নিশ্চিত করো: এই লাইনটি আছে

use App\Models\Product;
use Illuminate\Database\Eloquent\Factories\Factory;

class ProductFactory extends Factory
{
    protected $model = Product::class;

    public function definition(): array
    {
        return [
            'name' => $this->faker->unique()->word() . ' ' . $this->faker->randomElement(['Pro', 'Max', 'Light', 'Base']),
            'sku' => 'SKU-' . $this->faker->unique()->randomNumber(5),
            'unit' => $this->faker->randomElement(['pcs', 'kg', 'meter', 'box']),
            'purchase_price' => $this->faker->numberBetween(100, 500),
            'sales_price' => $this->faker->numberBetween(600, 1500),
            'min_stock_alert' => $this->faker->numberBetween(5, 20),
            'current_stock' => 0, 
            'description' => $this->faker->sentence(),
        ];
    }
}