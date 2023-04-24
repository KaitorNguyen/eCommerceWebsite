import './App.css';
import Products from './components/Products';
import Header from './layouts/Header';
import Footer from './layouts/Footer';
import { BrowserRouter, Route, Routes } from 'react-router-dom';
import { Container } from 'react-bootstrap';
import ProductsDetail from './components/ProductDetails';
import AboutUs from './components/AboutUs';
import Shops from './components/Shops';

function App() {
  return (
    <BrowserRouter>
        <Header/>
        <Container>
         <Routes>
            <Route path='' element={<Products/>} />
            <Route path='/products/:productsId' element={<ProductsDetail/>}/>
            <Route path='/aboutus' element={<AboutUs/>}/>
            <Route path='/shops/:shopsId/products' element={<Shops/>}/>
         </Routes>
        </Container>
        <Footer/>
    </BrowserRouter>
  );
}

export default App;
