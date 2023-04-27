import './App.css';
import Products from './components/Products';
import Header from './layouts/Header';
import Footer from './layouts/Footer';
import { BrowserRouter, Route, Routes } from 'react-router-dom';
import { Container } from 'react-bootstrap';
import ProductsDetail from './components/ProductDetails';
import AboutUs from './components/AboutUs';
import Shops from './components/Shops';
import { MyUserContext } from './configs/MyContext';
import Login from './components/Login';
import { useReducer } from 'react';
import MyUserReducer from './reducers/MyUserReducer';
import cookie from "react-cookies";

function App() {
  const [user, dispatch] = useReducer(MyUserReducer,cookie.load('current-user') || null )

  return (
    <MyUserContext.Provider value={[user,dispatch]}>
      <BrowserRouter>
        <Header />
        <Container>
          <Routes>
            <Route path='' element={<Products />} />
            <Route path='/products/:productsId' element={<ProductsDetail />} />
            <Route path='/aboutus' element={<AboutUs />} />
            <Route path='/login' element={<Login />} />
            <Route path='/shops/:shopsId/products' element={<Shops />} />
          </Routes>
        </Container>
        <Footer />
      </BrowserRouter>
    </MyUserContext.Provider>
  );
}

export default App;
