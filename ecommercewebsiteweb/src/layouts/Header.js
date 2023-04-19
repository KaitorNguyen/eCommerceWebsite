import { useEffect, useState } from "react"
import API, { endpoints } from "../configs/API"
import { Button, Container, Form, Nav, NavDropdown, Navbar } from "react-bootstrap"

const Header = ()=>{
    const [categories, setCategories] = useState([])

    useEffect(()=>{
        const loadCategories = async () =>{
            let res = await API.get(endpoints['categories'])
            setCategories(res.data)
        }

        loadCategories()
    }, [])

    return(
        <>
                <Navbar bg="light" expand="lg" >
            <Container>
                <Navbar.Brand href="#home">React-Bootstrap</Navbar.Brand>
                <Navbar.Toggle aria-controls="basic-navbar-nav" />
                <Navbar.Collapse id="basic-navbar-nav">
                <Nav className="me-auto">
                    <Nav.Link href="#home">Trang chủ</Nav.Link>
                    {/* {categories.map(c => <Nav.Link href="#link" key={c.id}>{c.name}</Nav.Link>)} */}
                </Nav>     
                <Form className="d-flex">
                    <Form.Control
                    type="search"
                    placeholder="Bạn tìm gì hôm nay"
                    className="me-2"
                    aria-label="Search"
                    
                    />
                    <Button variant="outline-success">Tìm Kiếm</Button>
                </Form>
                </Navbar.Collapse>              
            </Container>
            </Navbar>
            
        </>
       
    )
}
export default Header
