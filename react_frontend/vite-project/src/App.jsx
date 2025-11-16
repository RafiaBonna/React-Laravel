import React, { useEffect, useState } from "react";
import axios from "axios";
import ProductForm from "./components/ProductForm";
import ProductList from "./components/ProductList";

function App() {
  const [products, setProducts] = useState([]);

  // ESLint safe way to load products
  useEffect(() => {
    const fetchProducts = async () => {
      try {
        const res = await axios.get("http://localhost:8000/api/products");
        setProducts(res.data);
      } catch (err) {
        console.error(err);
      }
    };
    fetchProducts();
  }, []);

  // loadProducts function to pass to child components
  const loadProducts = async () => {
    try {
      const res = await axios.get("http://localhost:8000/api/products");
      setProducts(res.data);
    } catch (err) {
      console.error(err);
    }
  };

  return (
    <div style={{ padding: 30 }}>
      <h2>React + Laravel CRUD (Component Based)</h2>
      <ProductForm loadProducts={loadProducts} />
      <hr />
      <ProductList products={products} loadProducts={loadProducts} />
    </div>
  );
}

export default App;
