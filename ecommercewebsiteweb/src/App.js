import './App.css';
import Categories from './components/Categories';
import Products from './components/Products';
import Header from './layouts/Header';
import Footer from './layouts/Footer';
import { BrowserRouter, Route, Routes } from 'react-router-dom';
import { Container } from 'react-bootstrap';

function App() {
  return (
    <BrowserRouter>
        <Header/>
        <Container>
          <Routes>
            <Route path='' element={<Categories />} />
            <Route path='/categories/:categoryId/products' element={<Products />}/>
          </Routes>
        </Container>
        <Container>
         <Routes>
            <Route path='' element={<Products/>} />
         </Routes>
        </Container>
        <Footer/>
    </BrowserRouter>
  );
}

export default App;
