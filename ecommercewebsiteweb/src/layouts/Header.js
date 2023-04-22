import { useEffect, useState } from "react"
import { Button, Container, Form, Nav, Navbar } from "react-bootstrap"
import { Link,useNavigate } from "react-router-dom"

const Header = ()=> {
    const [q, setQ] = useState("")
    const nav = useNavigate()


    const search = (evt) => {
        evt.preventDefault()
        nav(`/?kw=${q}`) 
    }

    let homePageUrl = `/`
    return(
        <>
                <Navbar bg="light" expand="lg" >
            <Container>                
                <Link to={homePageUrl}> <img className="logo" src="/fukilogo.png"/></Link>
                <Navbar.Toggle aria-controls="basic-navbar-nav" />
                <Navbar.Collapse id="basic-navbar-nav">
                <Nav className="me-auto">
                   <Link to={homePageUrl}>Trang Chủ</Link>
                    <Nav.Link href="#home">About Us</Nav.Link>
                </Nav>     
                <Form onSubmit={search} className="d-flex w-100">
                    <Form.Control
                    type="search"
                    placeholder="Bạn tìm gì hôm nay"
                    className="me-2 w-1"
                    aria-label="Search"
                    value={q}
                    onChange={e => setQ(e.target.value)}
                    />
                    <Button className="search_button" type="submit" variant="outline-success">Tìm Kiếm</Button>
                </Form>
                </Navbar.Collapse>              
            </Container>
            </Navbar>
            
        </>
       
    )
}
export default Header
