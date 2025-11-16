import React from "react";
import axios from "axios";

function ProductList({ products, loadProducts }) {
  const handleDelete = async (id) => {
    if (!window.confirm("Are you sure you want to delete this product?")) return;
    try {
      await axios.delete(`http://localhost:8000/api/products/${id}`);
      loadProducts(); // Refresh list
    } catch (err) {
      console.error(err);
    }
  };

  return (
    <ul>
      {products.map((p) => (
        <li key={p.id} style={{ marginBottom: 10 }}>
          {p.name} – {p.price} tk{" "}
          <button onClick={() => handleDelete(p.id)} style={{ marginLeft: 10 }}>
            Delete
          </button>
        </li>
      ))}
    </ul>
  );
}

export default ProductList;
