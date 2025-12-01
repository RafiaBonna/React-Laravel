import React from 'react';
import { useNavigate } from 'react-router-dom';

const Home = () => {
  const navigate = useNavigate();
  
  // লগআউট ফাংশন: টোকেন রিমুভ করে লগইন পেজে নিয়ে যাবে
  const handleLogout = () => {
    localStorage.removeItem('token');
    alert('Logged out successfully!');
    navigate('/login');
  };

  return (
    <div style={styles.container}>
      <div style={styles.card}>
        <h1 style={styles.heading}>✨ Welcome to Your Dashboard! ✨</h1>
        <p style={styles.message}>You have successfully authenticated using our API.</p>
        <div style={styles.detailsBox}>
            <h3 style={styles.subHeading}>Next Step</h3>
            <p>You can now fetch protected user data from the <code>/api/user</code> endpoint using your stored token.</p>
        </div>
        <button 
            onClick={handleLogout} 
            style={styles.button}
        >
            Logout
        </button>
      </div>
    </div>
  );
};

// স্টাইল অবজেক্ট
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
    padding: '50px',
    borderRadius: '15px',
    boxShadow: '0 8px 30px rgba(0, 0, 0, 0.1)',
    width: '100%',
    maxWidth: '550px',
    textAlign: 'center',
  },
  heading: {
    fontSize: '32px',
    color: '#1a4e95', // গাঢ় নীল
    marginBottom: '20px',
  },
  message: {
    fontSize: '18px',
    color: '#555',
    marginBottom: '30px',
  },
  detailsBox: {
    backgroundColor: '#f5f8ff',
    borderLeft: '4px solid #4a90e2',
    padding: '20px',
    borderRadius: '8px',
    marginBottom: '30px',
    textAlign: 'left',
  },
  subHeading: {
    fontSize: '20px',
    color: '#4a90e2',
    marginTop: '0',
    marginBottom: '10px',
  },
  button: {
    backgroundColor: '#e74c3c', // লাল বাটন
    color: 'white',
    padding: '12px 25px',
    border: 'none',
    borderRadius: '8px',
    fontSize: '16px',
    cursor: 'pointer',
    transition: 'background-color 0.3s ease',
  },
};

export default Home;