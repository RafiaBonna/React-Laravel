<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany; // HasMany যোগ করো

class Sale extends Model
{
    use HasFactory;

    protected $fillable = [
        'invoice_no', 'customer_name', 'customer_phone', 'sales_date', 'total_amount', 'description'
    ];

    // Sale-এর সাথে SaleItems-এর সম্পর্ক (Many Items)
    public function items(): HasMany
    {
        return $this->hasMany(SaleItem::class);
    }
}