import './App.css';
import Products from './components/Products';
import Header from './layouts/Header';
import Footer from './layouts/Footer';
import { BrowserRouter, Route, Routes } from 'react-router-dom';
import { Container } from 'react-bootstrap';
import ProductsDetail from './components/ProductDetails';
import AboutUs from './components/AboutUs';
import Shops from './components/Shops';
import { MyCartContext, MyUserCartContext, MyUserContext } from './configs/MyContext';
import Login from './components/Login';
import { useReducer } from 'react';
import MyUserReducer from './reducers/MyUserReducer';
import cookie from "react-cookies";
import Register from './components/Register';
import moment from 'moment';
import 'moment/locale/vi';

import AddShop from './components/AddShop';
import ListYourShop from './components/ListYourShop';
import AddProduct from './components/AddProduct';
import ProfileUser from './components/ProfileUser';
import { useState } from 'react';
import ListUserRegister from './components/ListUserRegister';
moment().local("vi")

function App() {
  const [user, dispatch] = useReducer(MyUserReducer, cookie.load('current-user') || null)
  const [userCart, setUserCart] = useState([]);

  const updateCart = (newItem) => {
    setCart([...userCart, newItem]);
  }
  const [cart, setCart] = useState({
    "product": {
      "name": "",
      "price": ""
    },
    "unit_price": "",
    "quantity": 0
  });
  return (

    <MyUserContext.Provider value={[user, dispatch]}>
      <MyUserCartContext.Provider value={[userCart, updateCart]}>
        <MyCartContext.Provider value={[cart, setCart]}>
          <BrowserRouter>
            <Header />
            <Container>
              <Routes>
                <Route path='' element={<Products />} />
                <Route path='/products/:productsId' element={<ProductsDetail />} />
                <Route path='/aboutus' element={<AboutUs />} />
                <Route path='/login' element={<Login />} />
                <Route path='/register' element={<Register />} />
                <Route path='/shops/:shopsId/products' element={<Shops />} />
                <Route path='/add-shop' element={<AddShop />} />
                <Route path='/users/shops' element={<ListYourShop />} />
                <Route path='/users/current-user' element={<ProfileUser />} />
                <Route path='/shops/:shopsId/add-product' element={<AddProduct />} />

                <Route path='/users/confirm-register' element={<ListUserRegister/>} />

              </Routes>
            </Container>
            <Footer />
          </BrowserRouter>
        </MyCartContext.Provider>
      </MyUserCartContext.Provider>
    </MyUserContext.Provider>
  );
}

export default App;
