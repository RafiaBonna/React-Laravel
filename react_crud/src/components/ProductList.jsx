// src/Components/ProductList.jsx

import React, { useState, useEffect } from 'react';
import { NavLink } from 'react-router-dom';
import axios from 'axios'
 
const API_URL = "http://127.0.0.1:8000/api/products"; 

const ProductList = () => {
    // 🎯 ডেটা স্টেটের নাম পরিবর্তন করা হলো
    const [productData, setProductData] = useState([]); 

    useEffect(() => {
        fetchData();
    }, [])
 
    const fetchData = async () => {
        try {
            // 🎯 /api/products এ রিকোয়েস্ট করা হলো
            const result = await axios(API_URL); 
            
            // 🎯 ProductController::index() সরাসরি অ্যারে রিটার্ন করে, তাই result.data ব্যবহার করা হলো
            setProductData(result.data); 
            
        } catch (err) {
            console.error("Error fetching product data:", err);
            // console.log("somthing Wrong"); // List.jsx এ ছিল
        }
    }
 
    const handleDelete = async (id) => {
        if (!window.confirm(`Are you sure you want to delete Product ID: ${id}?`)) {
            return; 
        }

        try {
            // 🎯 সঠিক DELETE রুট ব্যবহার করা হলো: /api/products/{id}
            await axios.delete(`${API_URL}/${id}`); 
            
            // সফল হলে স্টেট আপডেট করা হলো
            const newProductData = productData.filter((item) => item.id !== id);
            setProductData(newProductData);
            alert(`Product ID: ${id} deleted successfully!`);

        } catch (error) {
            console.error("Error deleting product:", error);
            alert("Error deleting product! Check console for details.");
        }
    }
 
    return(
        <div className="container">
        {/* 🎯 হেডার পরিবর্তন করা হলো */}
        <h3>Product Details (from {API_URL})</h3>
        
        {productData.length === 0 ? (
             <p>No products found. (Please ensure your Laravel server is running and database has data).</p>
        ) : (
             <table className="table table-bordered">
                <thead>
                    <tr>
                        <th>S No.</th>
                        <th>ID</th> 
                        {/* 🎯 হেডার পরিবর্তন করা হলো */}
                        <th>Product Name</th>
                        <th>Price</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    {
                        // 🎯 product ডেটা ম্যাপ করা হলো
                        productData.map((product, i) => { 
                            return (
                                <tr key={i}>
                                    <td>{i + 1}</td>
                                    <td>{product.id}</td> 
                                    {/* 🎯 প্রোডাক্ট ফিল্ড ব্যবহার করা হলো */}
                                    <td>{product.name} </td> 
                                    <td>{product.price} </td>
                                    {/* ❌ Description ডেটা বাদ দেওয়া হলো */}
                                    <td>
                                        {/* 🎯 NavLink রুটগুলো আপনার App.jsx এর সাথে মেলানো হলো */}
                                        <NavLink to={`/view/${product.id}`} className="btn btn-success mx-2">View</NavLink>
                                        <NavLink to={`/edit/${product.id}`} className="btn btn-info mx-2">Edit</NavLink>
                                        <button onClick={() => handleDelete(product.id)} className="btn btn-danger">Delete</button>
                                    </td>
                                </tr>
                            )
                        })
                    }
                </tbody>
            </table>
        )}
        </div>
    );
};
 
export default ProductList;