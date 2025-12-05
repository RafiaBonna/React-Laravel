<?php

namespace Database\Factories;

use App\Models\Purchase;
use App\Models\Product;
use Illuminate\Database\Eloquent\Factories\Factory;

class PurchaseItemFactory extends Factory
{
    protected $model = \App\Models\PurchaseItem::class;

    public function definition(): array
    {
        $price = $this->faker->randomFloat(2, 50, 500);
        $qty   = $this->faker->numberBetween(1, 10);

        return [
            'purchase_id' => Purchase::factory(),
            'product_id' => Product::factory(),
            'quantity' => $qty,
            'unit_price' => $price,
            'sub_total' => $qty * $price,

        ];
    }
}
