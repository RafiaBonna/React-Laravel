<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany; // Stock relationship-এর জন্য

class Product extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'sku',
        'unit',
        'purchase_price',
        'sales_price',
        'min_stock_alert',
        'description',
    ];

    // Optional: Product-এর সাথে Stock-এর রিলেশনশিপ
    public function stocks(): HasMany
    {
        return $this->hasMany(Stock::class);
    }
}