<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Product;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    // Get all
    public function index()
    {
        return Product::all();
    }

    // Store
    public function store(Request $request)
    {
        $product = Product::create([
            'name' => $request->name,
            'price' => $request->price,
        ]);

        return response()->json($product, 201);
    }

    // Show single
    public function show(Product $product)
    {
        return $product;
    }

    // Update
    public function update(Request $request, Product $product)
    {
        $product->update($request->all());
        return response()->json($product, 200);
    }

    // Delete
    public function destroy(Product $product)
    {
        $product->delete();
        return response()->json(null, 204);
    }
}

