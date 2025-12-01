<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany; // <-- এটি যোগ করো

class Warehouse extends Model
{
    use HasFactory;
    
    // Fillable properties (Database Schema অনুযায়ী)
    protected $fillable = ['name', 'location', 'description'];

    /**
     * Get the stock records associated with the warehouse.
     */
    public function stocks(): HasMany
    {
        // One Warehouse can have Many Stocks (entries)
        return $this->hasMany(Stock::class);
    }
}