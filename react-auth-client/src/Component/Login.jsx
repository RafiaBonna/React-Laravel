import React, { useState } from 'react';
import axios from 'axios';
import { Link, useNavigate } from 'react-router-dom';
import styles from './loginStyles'; // <-- styles imported

const Login = () => {
  const navigate = useNavigate();
  const [form, setForm] = useState({ email: '', password: '' });

  const handleChange = (e) => {
    setForm({ ...form, [e.target.name]: e.target.value });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      const res = await axios.post("http://127.0.0.1:8000/api/login", form);
      localStorage.setItem("token", res.data.token);
      alert("Login successful!");
      navigate("/home");
    } catch (error) {
      alert("Login Failed: " + (error.response?.data?.message || "Please check your credentials."));
    }
  };

  return (
    <div style={styles.container}>
      <div style={styles.card}>
        <h2 style={styles.heading}>Welcome Back!</h2>

        <form onSubmit={handleSubmit} style={styles.form}>

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

          <button type="submit" style={styles.button}>Login</button>
        </form>

        <p style={styles.registerLink}>
          Don't have an account? <Link to="/" style={styles.link}>Sign Up</Link>
        </p>
      </div>
    </div>
  );
};

export default Login;
