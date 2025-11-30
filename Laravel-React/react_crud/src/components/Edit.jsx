// src/Components/Edit.jsx (Bootstrap Updated)

import React, { useState, useEffect } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import axios from 'axios';

const API_URL = "http://127.0.0.1:8000/api/products"; 

const Edit = () => {
    const { id } = useParams(); 
    const [product, setProduct] = useState({ name: '', price: '' });
    const navigate = useNavigate();

    // বর্তমান ডেটা লোড করা (GET /api/products/{id})
    useEffect(() => {
        const fetchProductData = async () => {
            try {
                const response = await axios.get(`${API_URL}/${id}`); 
                setProduct(response.data); 
            } catch (error) {
                console.error("Error fetching product data for edit:", error);
            }
        };

        if (id) {
            fetchProductData();
        }
    }, [id]);

    const handleChange = (e) => {
        setProduct({
            ...product,
            [e.target.name]: e.target.value
        });
    };

    // ডেটা আপডেট করা (PUT /api/products/{id})
    const handleSubmit = async (e) => {
        e.preventDefault();
        try {
            await axios.put(`${API_URL}/${id}`, product); 
            alert(`Product ID ${id} updated successfully!`);
            navigate('/'); 
            
        } catch (error) {
            console.error("Error updating product:", error);
            alert("Error updating product! Check console for details.");
        }
    };

    return (
        // 🎯 mt-5 (মার্জিন টপ), row justify-content-center, col-md-8
        <div className="container mt-5"> 
            <div className="row justify-content-center">
                <div className="col-md-8">
                    
                    <button 
                        onClick={() => navigate('/')} 
                        className="btn btn-secondary mb-4" 
                    >
                        ← Back to List
                    </button>
                    
                    {/* 🎯 pb-2 mb-4 border-bottom */}
                    <h3 className="pb-2 mb-4 border-bottom">
                        ✏️ Edit Product ID: **{id}**
                    </h3>
                    
                    {/* 🎯 card, shadow-sm, p-4 (প্যাডিং) */}
                    <div className="card shadow-sm p-4"> 
                        <form onSubmit={handleSubmit}>
                            <div className="mb-3">
                                <label htmlFor="name" className="form-label">Product Name</label>
                                <input 
                                    type="text" 
                                    className="form-control" // 🎯 form-control ক্লাস ইনপুটকে পুরো প্রস্থ দেবে
                                    id="name" 
                                    name="name"
                                    value={product.name || ''}
                                    onChange={handleChange}
                                    required
                                />
                            </div>
                            <div className="mb-3">
                                <label htmlFor="price" className="form-label">Price (Taka)</label>
                                <input 
                                    type="number" 
                                    className="form-control" // 🎯 form-control ক্লাস ইনপুটকে পুরো প্রস্থ দেবে
                                    id="price" 
                                    name="price"
                                    value={product.price || ''}
                                    onChange={handleChange}
                                    required
                                />
                            </div>
                            
                            <button type="submit" className="btn btn-primary mt-3">Update Product</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    );
};

export default Edit;