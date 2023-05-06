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
    })
    const [user,] = useContext(MyUserContext)
    const [loading, setLoading] = useState(false)
    const [err, setErr] = useState("")
    const nav = useNavigate()

    const addShop = (evt) => {
        evt.preventDefault()


        const process = async () => {
           if(user !== null){
            if(user.groups[0].name === "Seller"){
                try {
                    let form = new FormData()
                    form.append("name", shop.name)
                    form.append("description", shop.description)
    
                    let res = await authAPI().post(endpoints['addShops'], form, {
                        headers: {
                            'Content-Type': 'multipart/form-data'
                        }
                    })
                    if (res.status === 201)
                        nav("/")
                    else setErr("Tạo cửa hàng thất bại")
                } catch (ex) {
                    let msg = ""
                    for (let e in Object.values(ex.response.data))
                        msg += `${e}`
    
                    setErr(msg)
                } finally {
                    setLoading(false)
                }
            }
            else{
                setErr("bạn phải là nhà cung cấp")
            }
           }
           else{
            setErr("bạn phải đăng nhập")
           }
        }
        setLoading(true)
        process()

        // if (user !== null) {
        //     if (user.groups[0].name === "Seller") {
        //         setLoading(true)
        //         process()
        //     }

        //     else {
        //         setErr("bạn cần phải là nhà cung cấp mới thực hiện chức năng này")
        //     }

        // }
        // else {
        //     setErr("bạn cần phải đăng nhập")
        // }
    }




    return (

        <>
            {err ? <ErrorAlert err={err} /> : ""}
           {user !== null? <Form onSubmit={addShop}>
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

                            </div>
                            {loading ? <Spinner /> : <button type="submit" className="ghost-round full-width">Tạo </button>}
                        </div>
                    </div>
                </div>
            </Form>:<Link className="login-comment" to="/login">Đăng nhập để bình luận</Link> }
        </>
    )
}
export default AddShop