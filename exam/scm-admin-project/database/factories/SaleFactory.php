<?php

namespace Database\Factories; // নিশ্চিত করো: এই লাইনটি আছে

use App\Models\Sale;
use Illuminate\Database\Eloquent\Factories\Factory;

class SaleFactory extends Factory
{
    protected $model = Sale::class;

    public function definition(): array
    {
        return [
            'invoice_no' => 'SAL-' . $this->faker->unique()->randomNumber(6),
            'customer_name' => $this->faker->name,
            'sale_date' => $this->faker->dateTimeBetween('-6 months', 'now'),
            'total_amount' => $this->faker->numberBetween(6000, 60000), // এটা পরে Item যোগ করে ঠিক হবে
            'note' => $this->faker->sentence(3),
        ];
    }
}