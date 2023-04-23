import './App.css';
import Categories from './components/Categories';
import Products from './components/Products';
import Header from './layouts/Header';
import Footer from './layouts/Footer';
import { BrowserRouter, Route, Routes } from 'react-router-dom';
import { Container } from 'react-bootstrap';
import ProductsDetail from './components/ProductDetails';

function App() {
  return (
    <BrowserRouter>
        <Header/>
        <Container>
         <Routes>
            <Route path='' element={<Products/>} />
            <Route path='/products/:productsId' element={<ProductsDetail/>}/>
         </Routes>
        </Container>
        <Footer/>
    </BrowserRouter>
  );
}

export default App;
