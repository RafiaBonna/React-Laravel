<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany; // HasMany যোগ করো
use Illuminate\Database\Eloquent\Relations\BelongsTo; // BelongsTo যোগ করো

class Purchase extends Model
{
    use HasFactory;

    protected $fillable = [
        'invoice_no', 'supplier_id', 'purchase_date', 'total_amount', 'description'
    ];

    // Purchase-এর সাথে PurchaseItems-এর সম্পর্ক (Many Items)
    public function items(): HasMany 
    {
        return $this->hasMany(PurchaseItem::class);
    }

    // Purchase-এর সাথে Supplier-এর সম্পর্ক (Belongs to one Supplier)
    public function supplier(): BelongsTo
    {
        return $this->belongsTo(Supplier::class);
    }
}