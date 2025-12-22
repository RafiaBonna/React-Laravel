import React, { useState } from "react";
import axios from "axios";

function ProductForm({ loadProducts }) {
  const [form, setForm] = useState({ name: "", price: "" });

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      await axios.post("http://localhost:8000/api/products", form);
      setForm({ name: "", price: "" });
      loadProducts(); // Reload products in parent.
    } catch (err) {
      console.error(err);
    }
  };

  return (
    <form onSubmit={handleSubmit} style={{ marginBottom: 20 }}>
      <input
        type="text"
        placeholder="Product Name"
        value={form.name}
        onChange={(e) => setForm({ ...form, name: e.target.value })}
        required
        style={{ marginRight: 10 }}
      />
      <input
        type="number"
        placeholder="Price"
        value={form.price}
        onChange={(e) => setForm({ ...form, price: e.target.value })}
        required
        style={{ marginRight: 10 }}
      />
      <button type="submit">Add Product</button>
      <h2>Hello</h2>
      <h2>Hello</h2>
      <h2>Hello</h2>
      <h2>Hello</h2>
      <h2>Hello</h2>
     
    
    </form>
  );
}

export default ProductForm;
