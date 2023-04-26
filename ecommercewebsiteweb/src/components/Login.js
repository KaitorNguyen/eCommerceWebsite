import { useState } from "react"
import { Button, Form } from "react-bootstrap"
import API, { endpoints } from "../configs/API"
import Spinner from "./Spinner"

const Login = () => {
    const [username, setUsername] = useState()
    const [password, setPassword] = useState()

    const login = (evt) =>{
        evt.preventDefault()

        const process = async()=> {
            let res = await API.post(endpoints['login'],{
                "username": username,
                 "password": password,
                 "client_secret": "EYOSgsLsHyfqNgxnR6lNJWcdQlNB1Ub5F36SSXVo",
                 "client_secret":"dvYWxEYpJvoQ77bJrISUwGc3Rej9wYbdwtLTH6dl15kw40bzWULB2RaQsDHVlSvTVS2sUjWkdlkc2GbnpmZirvJalqLhyuekbSBe2pwjy3aF251bM9ZUpKl28WXORpj4",
                 "grant_type": "password"

            })

            console.info(res.data)
        }

        process()
    }
    return (
        <>
            <div className="text-center text-success">Đăng nhập người dùng</div>
            <Form onSubmit={login}>
                <Form.Group className="mb-3" controlId="formBasicEmail">
                    <Form.Label>Tên đăng nhập</Form.Label>
                    <Form.Control value={username} onChange={e => setUsername(e.target.value)} type="text" placeholder="nhập tài khoản..." />
                </Form.Group>

                <Form.Group className="mb-3" controlId="formBasicPassword">
                    <Form.Label>Mật khẩu</Form.Label>
                    <Form.Control value={password} onChange={e => setPassword(e.target.value)} type="password" placeholder="nhập mật khẩu..." />
                </Form.Group>
                <Button variant="primary" type="submit">
                    Đăng nhập
                </Button>
            </Form>
        </>
    )
}
export default Login