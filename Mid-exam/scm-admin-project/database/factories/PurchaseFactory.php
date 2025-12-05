<?php

namespace Database\Factories;

use App\Models\Purchase;
use App\Models\Supplier;
use Illuminate\Database\Eloquent\Factories\Factory;

class PurchaseFactory extends Factory
{
    protected $model = Purchase::class;

    public function definition(): array
    {
        return [
            'supplier_id' => Supplier::factory(),
            'invoice_no' => 'INV-' . $this->faker->unique()->numberBetween(1000, 9999),
            'purchase_date' => $this->faker->date(),
            'total_amount' => $this->faker->randomFloat(2, 500, 5000),
        ];
    }
}
