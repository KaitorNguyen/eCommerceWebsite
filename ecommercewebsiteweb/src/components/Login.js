import { useState } from "react"
import { Button, Form, Spinner } from "react-bootstrap"
import API, { authAPI, endpoints } from "../configs/API"
import cookie from "react-cookies"
import { useContext } from "react"
import { MyUserContext } from "../configs/MyContext"
import { Navigate } from "react-router-dom"



const Login = () => {
    const [username, setUsername] = useState("")
    const [password, setPassword] = useState("")
    const [loading, setLoading] = useState(false)
    const [err,setErr] = useState()
    const [user, dispatch] = useContext(MyUserContext)

    const login = (evt) => {
        evt.preventDefault()

        const process = async () => {

            try{
                let res = await API.post(endpoints['login'], {
                    "username": username,
                    "password": password,
                    "client_id": "EYOSgsLsHyfqNgxnR6lNJWcdQlNB1Ub5F36SSXVo",
                    "client_secret": "dvYWxEYpJvoQ77bJrISUwGc3Rej9wYbdwtLTH6dl15kw40bzWULB2RaQsDHVlSvTVS2sUjWkdlkc2GbnpmZirvJalqLhyuekbSBe2pwjy3aF251bM9ZUpKl28WXORpj4",
                    "grant_type": "password"
    
                })
    
                cookie.save('access-token', res.data.access_token)
    
                let user = await authAPI().get(endpoints['current-user'])
                cookie.save('current-user', user.data)
    
                dispatch({
                    "type": "login",
                    "payload": user.data
                })
            }catch(ex){
                console.error(ex)
                setErr('Tài khoảng hoặc mật khẩu không hợp lệ!')
            }finally{
                setLoading(false)
            }
           

            setLoading(false)
        }

        if (username === ""){
            setErr("Bạn phải nhập tài khoản!")
        }
        else if(password === ""){
            setErr("Bạn phải nhập mật khẩu!")
        }
        else{
            setLoading(true)
            process()
        }
   
    }
    if (user !== null)
    return <Navigate to="/" />

    
    return (
        <>
            {/* <div className="text-center text-success">Đăng nhập người dùng</div>
            <Form onSubmit={login}>
                <Form.Group className="mb-3" controlId="formBasicEmail">
                    <Form.Label>Tên đăng nhập</Form.Label>
                    <Form.Control value={username} onChange={e => setUsername(e.target.value)} type="text" placeholder="nhập tài khoản..." />
                </Form.Group>

                <Form.Group className="mb-3" controlId="formBasicPassword">
                    <Form.Label>Mật khẩu</Form.Label>
                    <Form.Control value={password} onChange={e => setPassword(e.target.value)} type="password" placeholder="nhập mật khẩu..." />
                </Form.Group>
                {loading ? <Spinner /> : <Button variant="primary" type="submit">
                    Đăng nhập
                </Button>}

            </Form> */}
            {err?<div className="alert alert-danger">{err}</div>:""}
            
            <Form onSubmit={login}>
            <div className="login_center">
                <div className='bold-line'>
                </div>
                    <div className='window'>
                        <div className='overlay'>

                        </div>
                        <div className='content'>
                            <div className='welcome'>Xin chào !!!</div>
                            
                            <div className='input-fields'>
                                <input  value={username}  onChange={e => setUsername(e.target.value)} type='text' placeholder='Tên đăng nhập' className='input-line full-width'></input>
                                <input  value={password} onChange={e => setPassword(e.target.value)} type='password' placeholder='Mật khẩu' className='input-line full-width'></input>

                            </div>
                            {loading ? <Spinner/>: <button  type="submit" className="ghost-round full-width">Đăng nhập </button>}
                        </div>
                    </div>
            </div>
            </Form>
        </>
    )
}
export default Login