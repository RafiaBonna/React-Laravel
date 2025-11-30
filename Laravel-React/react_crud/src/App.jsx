import {BrowserRouter as Router,Route,Routes} from 'react-router-dom';
import ProductList from './components/ProductList'; 
import View from "./components/View";
import Edit from "./components/Edit";
// import Home from './Components/Home'; // Home আর দরকার নেই

function App() {
  
  return (
    <div className='App'>
      <Router>
        <Routes>
            {/* ProductList কে Home রুট (/) এ ব্যবহার করা হলো */}
            <Route exact path='/' element = {<ProductList/>}/> 
            <Route exact path="/view/:id" element={<View/>}/> 
            <Route exact path="/edit/:id" element={<Edit/>}/> 
        </Routes>
      </Router>
    </div>
  )
}

export default App