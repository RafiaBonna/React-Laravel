<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;
    
    // Mass Assignment Protection
    protected $guarded = ['id']; 

    // Relational Methods
    public function stocks()
    {
        return $this->hasMany(Stock::class);
    }
    
    public function purchaseItems()
    {
        return $this->hasMany(PurchaseItem::class);
    }
    
    public function saleItems()
    {
        return $this->hasMany(SaleItem::class);
    }
}