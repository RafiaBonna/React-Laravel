<?php

namespace Database\Factories; // নিশ্চিত করো: এই লাইনটি আছে

use App\Models\Purchase;
use App\Models\Supplier;
use Illuminate\Database\Eloquent\Factories\Factory;

class PurchaseFactory extends Factory
{
    protected $model = Purchase::class;

    public function definition(): array
    {
        return [
            'invoice_no' => 'PUR-' . $this->faker->unique()->randomNumber(6),
            'supplier_id' => Supplier::factory(), // Supplier থেকে অটো আইডি নেবে
            'purchase_date' => $this->faker->dateTimeBetween('-1 year', 'now'),
            'total_amount' => $this->faker->numberBetween(5000, 50000), // এটা পরে Item যোগ করে ঠিক হবে
            'note' => $this->faker->sentence(3),
        ];
    }
}