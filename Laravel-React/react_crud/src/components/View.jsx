// src/Components/View.jsx (Bootstrap Updated)

import React, { useState, useEffect } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import axios from 'axios';

const API_URL = "http://127.0.0.1:8000/api/products"; 

const View = () => {
    const { id } = useParams(); 
    const [product, setProduct] = useState({});
    const navigate = useNavigate();

    // READ Single Product Logic
    useEffect(() => {
        const fetchProductData = async () => {
            try {
                const response = await axios.get(`${API_URL}/${id}`); 
                setProduct(response.data); 
            } catch (error) {
                console.error("Error fetching single product data:", error);
            }
        };

        if (id) {
            fetchProductData();
        }
    }, [id]);

    return (
        // 🎯 row justify-content-center, col-md-8
        <div className="container mt-5">
            <div className="row justify-content-center">
                <div className="col-md-8">
                    
                    <button 
                        onClick={() => navigate('/')} 
                        className="btn btn-secondary mb-4" // 🎯 mb-4: নিচের কন্টেন্ট থেকে দূরত্ব বাড়ানো হলো
                    >
                        ← Go Back to List
                    </button>
                    
                    {/* 🎯 pb-2 mb-4 border-bottom */}
                    <h3 className="pb-2 mb-4 border-bottom">
                        🔍 Viewing Product ID: **{id}**
                    </h3>
                    
                    {product.id ? (
                        // 🎯 card, shadow-sm, p-4: ডেটা ডিসপ্লে করার জন্য কার্ড ব্যবহার
                        <div className="card shadow-sm p-4">
                            <h5 className="card-title mb-3">Product Details</h5>
                            {/* 🎯 list-group: ডেটাগুলো তালিকা আকারে দেখানো হলো */}
                            <ul className="list-group list-group-flush"> 
                                <li className="list-group-item"><strong>ID:</strong> {product.id}</li>
                                <li className="list-group-item"><strong>Product Name:</strong> {product.name}</li>
                                <li className="list-group-item"><strong>Price (Taka):</strong> {product.price}</li>
                                <li className="list-group-item"><strong>Created At:</strong> {new Date(product.created_at).toLocaleString()}</li>
                                <li className="list-group-item"><strong>Last 1 Updated:</strong> {new Date(product.updated_at).toLocaleString()}</li>
                            </ul>
                            
                            <button 
                                className="btn btn-info mt-3" 
                                onClick={() => navigate(`/edit/${product.id}`)}
                            >
                                Edit This Product
                            </button>
                        </div>
                    ) : (
                         <p>Loading product details, or product not found...</p>
                    )}
                </div>
            </div>
        </div>
    );
};

export default View;