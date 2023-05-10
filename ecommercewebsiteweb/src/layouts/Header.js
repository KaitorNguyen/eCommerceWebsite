import { useEffect, useState } from "react"
import { Button, Container, Dropdown, Form, Nav, NavDropdown, Navbar, Spinner } from "react-bootstrap"
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
    let addShop = `/add-shop`
    let listYourShop = `/users/shops`
    let profileUser = `/users/current-user`

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
                {/* <Link className="nav nav-link text-danger" to={homePageUrl}>
                            <img src={user.avatar} alt={user.username} width="40" className="rounded-circle" />
                            Chào {user.username}  
                </Link> */}
                <Dropdown>
                <Dropdown.Toggle variant="Secondary" id="dropdown-basic">
                    <img src={user.avatar} alt={user.username} width="40" className="rounded-circle" />
                    Chào {user.username}  
                </Dropdown.Toggle>

                <Dropdown.Menu variant="secondary">
                    <Dropdown.Item> <Link className="nav nav-link" to={profileUser}> Thông tin cá nhân </Link> </Dropdown.Item>
                    <Dropdown.Item> <Link className="nav nav-link" to={profileUser}> Đổi mật khẩu </Link> </Dropdown.Item>
                    {user.groups[0].name === "Seller" || user.groups[0].name === "Employee" ? 
                        <Dropdown.Item> <Link className="nav nav-link" to={listYourShop}> Cửa hàng của bạn </Link></Dropdown.Item> : null}
                    <Dropdown.Divider />
                    <Dropdown.Item>
                        <Button onClick={logout} className="btn btn-danger"> Đăng xuất </Button>
                    </Dropdown.Item>
                </Dropdown.Menu>
                </Dropdown>

                {/* <Button onClick={logout} className="btn btn-danger"> Đăng xuất </Button> */}
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
                            {user === null ? null : user.groups[0].name === "Seller" || user.groups[0].name === "Employee" ? 
                                <Link className="nav nav-link" to={addShop}> Tạo cửa hàng </Link> : null}
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
