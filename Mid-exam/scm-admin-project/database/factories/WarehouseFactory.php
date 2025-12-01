<?php
namespace Database\Factories;
// database/factories/WarehouseFactory.php

use App\Models\Warehouse;
use Illuminate\Database\Eloquent\Factories\Factory;

class WarehouseFactory extends Factory
{
    protected $model = Warehouse::class;

    public function definition(): array
    {
        return [
            'name' => $this->faker->unique()->randomElement(['Main Warehouse', 'East Branch', 'North Depot', 'Central Hub']),
            'location' => $this->faker->city(),
            'description' => $this->faker->sentence(),
        ];
    }
}