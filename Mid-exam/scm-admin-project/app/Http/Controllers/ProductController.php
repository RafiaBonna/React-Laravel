<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    // 1. READ: সব প্রোডাক্ট লিস্ট করা
    public function index()
    {
        $products = Product::orderBy('id', 'desc')->paginate(10);
        return response()->json($products);
    }

    // 2. CREATE: নতুন প্রোডাক্ট যোগ করা
    public function store(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255|unique:products,name',
            'sku' => 'nullable|string|max:255|unique:products,sku',
            'unit' => 'required|string|max:50',
            'purchase_price' => 'required|numeric|min:0',
            'sales_price' => 'required|numeric|min:0|gt:purchase_price', // Sales price must be greater than Purchase price
            'min_stock_alert' => 'required|integer|min:1',
            'description' => 'nullable|string',
        ]);

        $product = Product::create($validated);
        return response()->json(['message' => 'Product added successfully!', 'product' => $product], 201);
    }

    // 3. READ: একটি নির্দিষ্ট প্রোডাক্ট দেখা
    public function show(Product $product)
    {
        return response()->json($product);
    }

    // 4. UPDATE: প্রোডাক্ট এডিট করা
    public function update(Request $request, Product $product)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255|unique:products,name,' . $product->id, // Ignoring current ID for unique check
            'sku' => 'nullable|string|max:255|unique:products,sku,' . $product->id,
            'unit' => 'required|string|max:50',
            'purchase_price' => 'required|numeric|min:0',
            'sales_price' => 'required|numeric|min:0|gt:purchase_price',
            'min_stock_alert' => 'required|integer|min:1',
            'description' => 'nullable|string',
        ]);

        $product->update($validated);
        return response()->json(['message' => 'Product updated successfully!', 'product' => $product]);
    }

    // 5. DELETE: প্রোডাক্ট ডিলিট করা
    public function destroy(Product $product)
    {
        $product->delete();
        return response()->json(['message' => 'Product deleted successfully!'], 204);
    }
}