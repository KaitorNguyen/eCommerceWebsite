import { useEffect, useState } from "react"
import { Button, Container, Form, Nav, NavDropdown, Navbar, Spinner } from "react-bootstrap"
import { Link, useNavigate } from "react-router-dom"
import API, { endpoints } from "../configs/API"
import { useContext } from "react"
import { MyUserContext } from "../configs/MyContext"

const Header = () => {
    const [categories, setCategories] = useState([])
    const [q, setQ] = useState("")
    const nav = useNavigate()
    const [user, dispatch] = useContext(MyUserContext)

    useEffect(() => {
        const loadCategories = async () => {
            let res = await API.get(endpoints['categories'])
            setCategories(res.data)
        }
        loadCategories()
    }, [])
    let homePageUrl = `/`
    let aboutUs = `/aboutus`
    let shop = `/shops`

    const search = (evt) => {
        evt.preventDefault()
        nav(`/?kw=${q}`)
    }

    const logout = () => {
        dispatch({
            "type": "logout"
        })
    }

    let userInfo = (
        <>
            <Link className="nav nav-link text-warning" to='/login'> Đăng nhập </Link>
            <Link className="nav nav-link text-warning" to='/register'> Đăng ký </Link>
        </>
    )


    if (user !== null)
        userInfo = (
            <>
                <Link className="nav nav-link text-danger" to={homePageUrl}>
                    <img src={user.avatar} alt={user.username} width="40" className="rounded-circle" />
                    Chào {user.username}  </Link>
                <Button onClick={logout} className="btn btn-danger"> Đăng xuất </Button>
            </>
        )

               
    return (
        <>
            <Navbar bg="light" expand="lg">
                <Container>
                    <Link to={homePageUrl}> <img className="logo" src="/fukilogo.png" /></Link>
                    <Navbar.Toggle aria-controls="basic-navbar-nav" />
                    <Navbar.Collapse id="basic-navbar-nav">
                        <Nav className="me-auto">
                            <Link className="nav nav-link" to={homePageUrl}> Trang Chủ </Link>
                            <Link className="nav nav-link" to={aboutUs}> About Us </Link>
                            {user === null?null:user.groups[0].name === "Seller"?  <Link className="nav nav-link" to={shop}> Tạo cửa hàng </Link>:null}
                            <NavDropdown title="Danh mục" id="basic-nav-dropdown">
                                {categories.map(c => {

                                    let url = `/?category_id=${c.id}`
                                    return <Link className="nav nav-link" to={url} key={c.id}>{c.name}</Link>
                                })}
                                <NavDropdown.Divider />
                            </NavDropdown>
                            {userInfo}
                        </Nav>
                        <Form onSubmit={search} className="d-flex w-40">
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
