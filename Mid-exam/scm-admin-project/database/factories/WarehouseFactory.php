<?php

namespace Database\Factories;

use App\Models\Warehouse;
use Illuminate\Database\Eloquent\Factories\Factory;

class WarehouseFactory extends Factory
{
    protected $model = Warehouse::class;

    public function definition(): array
    {
        return [
            'name' => $this->faker->unique()->company(),       // Unique warehouse name
            'location' => $this->faker->city(),
            'description' => $this->faker->sentence(),
        ];
    }
}
