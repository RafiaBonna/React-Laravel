import React, { useState } from "react";
import axios from "axios";
import { Link,useNavigate  } from "react-router-dom";

const Register = () => {
    const navigate = useNavigate();
  const [form, setForm] = useState({ name: "", email: "", password: "" });

  const handleChange = (e) => {
    setForm({ ...form, [e.target.name]: e.target.value });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
        //
        const res = await axios.post("http://127.0.0.1:8000/api/register", form);
        localStorage.setItem("token", res.data.token);
        alert("Registration Success! You can now log in.");
        navigate("/login");
    } catch (error) {
         alert("Registration Failed: " + (error.response?.data?.message || "An error occurred."));
    }
  };

  return (
    <div style={styles.container}>
      <div style={styles.card}>
        <h2 style={styles.heading}>New Account Setup</h2>
        <form onSubmit={handleSubmit} style={styles.form}>
          <div style={styles.formGroup}>
            <label htmlFor="name" style={styles.label}>Full Name:</label>
            <input
              type="text"
              id="name"
              name="name"
              style={styles.input}
              onChange={handleChange}
              required
            />
          </div>
          <div style={styles.formGroup}>
            <label htmlFor="email" style={styles.label}>Email Address:</label>
            <input
              type="email"
              id="email"
              name="email"
              style={styles.input}
              onChange={handleChange}
              required
            />
          </div>
          <div style={styles.formGroup}>
            <label htmlFor="password" style={styles.label}>Password:</label>
            <input
              type="password"
              id="password"
              name="password"
              style={styles.input}
              onChange={handleChange}
              required
            />
          </div>
          <button type="submit" style={styles.button}>Register</button>
        </form>
        <p style={styles.linkText}>
          Already have an account? <Link to="/login" style={styles.link}>Sign In</Link>
        </p>
      </div>
    </div>
  );
};

// স্টাইল অবজেক্ট (Login.jsx এর সাথে সামঞ্জস্যপূর্ণ)
const styles = {
    container: {
        display: 'flex',
        justifyContent: 'center',
        alignItems: 'center',
        minHeight: '100vh',
        backgroundColor: '#e6e8e6', // সফট ব্যাকগ্রাউন্ড
    },
    card: {
        backgroundColor: '#ffffff', 
        padding: '40px',
        borderRadius: '15px',
        boxShadow: '0 8px 30px rgba(0, 0, 0, 0.15)', 
        width: '100%',
        maxWidth: '450px',
        textAlign: 'center',
    },
    heading: {
        fontSize: '30px',
        marginBottom: '30px',
        color: '#1a4e95',
    },
    form: {
        display: 'flex',
        flexDirection: 'column',
        gap: '20px',
    },
    formGroup: {
        textAlign: 'left',
    },
    label: {
        display: 'block',
        marginBottom: '8px',
        fontSize: '14px',
        color: '#555',
        fontWeight: '600',
    },
    input: {
        width: 'calc(100% - 24px)', 
        padding: '12px',
        border: '1px solid #ccc',
        borderRadius: '8px',
        fontSize: '16px',
        boxSizing: 'border-box',
    },
    button: {
        backgroundColor: '#4a90e2', // নীল বাটন
        color: 'white',
        padding: '12px 20px',
        border: 'none',
        borderRadius: '8px',
        fontSize: '16px',
        cursor: 'pointer',
        marginTop: '10px',
        transition: 'background-color 0.3s ease',
        fontWeight: 'bold',
    },
    linkText: {
        marginTop: '25px',
        fontSize: '15px',
        color: '#666',
    },
    link: {
        color: '#1a4e95',
        textDecoration: 'none',
        fontWeight: 'bold',
    },
};

export default Register;