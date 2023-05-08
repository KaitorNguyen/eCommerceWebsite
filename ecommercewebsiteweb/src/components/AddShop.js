import { useState } from "react"
import { useEffect } from "react"
import { Link, useNavigate } from "react-router-dom"
import API, { authAPI, endpoints } from "../configs/API"
import { Form, Spinner } from "react-bootstrap"
import { useContext } from "react"
import { MyUserContext } from "../configs/MyContext"
import ErrorAlert from "../layouts/ErrorAlert"

const AddShop = () => {
    const [shop, SetShop] = useState({
        "name": "",
        "description": "",
        "user": [{ "username": "", "password": "" }]

    })
    const [user,] = useContext(MyUserContext)
    const [loading, setLoading] = useState(false)
    const [err, setErr] = useState("")
    const [categories, SetCategories] = useState([])
    const nav = useNavigate()


    useEffect(() => {
        const loadCategories = async () => {
            let res = await API.get(endpoints['categories'])
            SetCategories(res.data)
        }
        loadCategories()
    }, [])
    const addShop = (evt) => {
        evt.preventDefault()

        const process = async () => {
            try {
                let form = new FormData()
                form.append("name", shop.name)
                form.append("description", shop.description)
                form.append("user[0][username]", shop.user[0].username)
                form.append("user[0][password]", shop.user[0].password)
        
                let res = await authAPI.post(endpoints['addShops'], form, {
                    headers: {
                        'Content-Type': 'multipart/form-data'
                    }
                })
                if (res && res.status === 201)
                    nav("/login")
                else
                    setErr("Tạo thất bại")
            } catch (ex) {
                let msg = ""
                for (let e in Object.values(ex.response.data))
                    msg += `${e}`
        
                setErr(msg)
            } finally {
                setLoading(false)
            }
        }
        
        if (shop.name === "" || shop.description === "")
            setErr("tên hoặc mô tả không được rỗng")
        else {
           
            setLoading(true)
            process()
            
        }

    }







    return (

        <>
            
            {err ? <ErrorAlert err={err} /> : ""}
            {user !== null ? <Form onSubmit={addShop}>
                <div className="login_center">
                    <div className='bold-line'>
                    </div>
                    <div className='window'>
                        <div className='overlay'>
                        </div>
                        <div className='content'>
                            <div className='welcome'>Tạo cửa hàng cá nhân</div>

                            <div className='input-fields'>
                                <input value={shop.name} onChange={e => SetShop({ ...shop, "name": e.target.value })} type='text' placeholder='Tên shop' className='input-line full-width'></input>
                                <input value={shop.description} onChange={e => SetShop({ ...shop, "description": e.target.value })} type='password' placeholder='Mô tả ' className='input-line full-width'></input>
                                <input value={shop.user[0].username} onChange={e => SetShop({ ...shop, "user": [{ ...shop.user[0], "username": e.target.value }] })} type='text' placeholder='Username' className='input-line full-width'></input>
<input value={shop.user[0].password} onChange={e => SetShop({ ...shop, "user": [{ ...shop.user[0], "password": e.target.value }] })} type='password' placeholder='Password ' className='input-line full-width'></input>
                            </div>
                            <select className='input-line full-width' value={shop} onChange={(e) => SetShop(e.target.value)} >Bạn là
                                {categories.map(c => {
                                    return (
                                        <option value={c.name} selected>{c.name}</option>
                                    )
                                })}
                            </select>
                            {loading ? <Spinner /> : <button type="submit" className="ghost-round full-width">Tạo </button>}
                        </div>
                    </div>
                </div>
            </Form> : <Link className="login-comment" to="/login">Đăng nhập để tạo</Link>}
        </>
    )
}
export default AddShop