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
import Register from './components/Register';
import moment from 'moment';
import 'moment/locale/vi';
import Purchase from './components/Purchase';
import AddShop from './components/AddShop';
import ListYourShop from './components/ListYourShop';
import AddProduct from './components/AddProduct';
moment().local("vi")

function App() {
  const [user, dispatch] = useReducer(MyUserReducer, cookie.load('current-user') || null)

  return (
    <MyUserContext.Provider value={[user, dispatch]}>
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
            <Route path='/products/:productsId/purchase' element={<Purchase />} />
            <Route path='/add-shop' element={<AddShop />}/>
            <Route path='/users/shops' element={<ListYourShop/>} />
            <Route path='/shops/:shopsId/add-product' element={<AddProduct/>} />
          </Routes>
        </Container>
        <Footer />
      </BrowserRouter>
    </MyUserContext.Provider>
  );
}

export default App;
