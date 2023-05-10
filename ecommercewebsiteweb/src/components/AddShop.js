import { useState } from "react"
import { useNavigate } from "react-router-dom"
import API, { authAPI, endpoints } from "../configs/API"
import { Button, Form, Spinner } from "react-bootstrap"
import ErrorAlert from "../layouts/ErrorAlert"
import InputItem from "../layouts/InputItem"
import cookie from "react-cookies"
import { useRef } from "react"

const AddShop = () => {
    const [shop, setShop] = useState({
        "name": "",
        "description": "",

    })
    const image = useRef()
    const [loading, setLoading] = useState(false)
    const [err, setErr] = useState("")
    const nav = useNavigate()

    const addShop = (evt) => {
        evt.preventDefault()

        const process = async () => {
            try {
                let form = new FormData()
                form.append("name", shop.name)
                form.append("description", shop.description)
                if (image.current.files.length > 0)
                    form.append("avatar", image.current.files[0])
    
                let res = await authAPI().post(endpoints['addShops'], form, {
                    headers: {
                        // "Authorization": `Bearer ${cookie.load("access-token")}`,
                        'Content-Type': 'multipart/form-data'
                    }
                })
                if (res.status === 201)
                    nav("/users/shops")
                else
                    setErr("Hệ thống đang có lỗi! Vui lòng quay lại sau!")
            } catch (ex) {
                let msg = ""
                for (let e of Object.values(ex.response.data))
                    msg += `${e} `

                setErr(msg)
            } finally {
                setLoading(false)
            }
        }
        
        if (shop.name === "")
            setErr("Tên cửa hàng không được phép để trống")
        else {
            setLoading(true)
            process() 
        }
    }


    const setValue = e => {
        const { name, value } = e.target
        setShop(current => ({...current, [name]:value}))
    }

    return (

        <>
            <h1 className="text-center text-success">TẠO CỬA HÀNG</h1>

            {err?<ErrorAlert err={err} />:""}

            <Form onSubmit={addShop}>
                <InputItem label="Tên cửa hàng" type="text" value={shop.name} 
                            name="name" setValue={setValue} />
                <InputItem label="Mô tả cửa hàng" type="text" value={shop.description} 
                            name="description" setValue={setValue} />
                <InputItem label="Ảnh cửa hàng" type="file" ref={image} name="image" />
            
                {loading?<Spinner />:<Button variant="primary" type="submit">Tạo</Button>}
            </Form>
        </>
    )
}
export default AddShop