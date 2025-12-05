<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany; // HasMany যোগ করো

class Product extends Model
{
    use HasFactory;

    protected $fillable = [
        'name', 'sku', 'unit', 'purchase_price', 'sales_price', 'min_stock_alert', 'description'
    ];

    // একটি প্রোডাক্ট বিভিন্ন Warehouse-এ Stock-এ থাকবে
    public function stocks(): HasMany 
    {
        return $this->hasMany(Stock::class);
    }
    
    // একটি প্রোডাক্ট বিভিন্ন Purchase Invoice-এ ব্যবহৃত হতে পারে
    public function purchaseItems(): HasMany 
    {
        return $this->hasMany(PurchaseItem::class);
    }

    // একটি প্রোডাক্ট বিভিন্ন Sale Invoice-এ ব্যবহৃত হতে পারে
    public function saleItems(): HasMany 
    {
        return $this->hasMany(SaleItem::class);
    }
}