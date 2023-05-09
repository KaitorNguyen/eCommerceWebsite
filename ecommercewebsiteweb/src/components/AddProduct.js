import { useEffect, useRef } from "react"
import { useState } from "react"
import { Button, Form } from "react-bootstrap"
import { useNavigate } from "react-router-dom"
import InputItem from "../layouts/InputItem"
import Spinner from "./Spinner"
import API, { authAPI, endpoints } from "../configs/API"
import ErrorAlert from "../layouts/ErrorAlert"

const AddProduct = () =>{
    const [categories, setCategories] = useState([])
    const [product, setProduct] = useState({
        "name": "",
        "price": "",
        "category": "",
        "description": ""
    })
    const image = useRef()
    const [selectedCategory, setSelectedCategory] = useState("")
    const [loading, setLoading] = useState(false)
    const [err, setErr] = useState("")
    const nav = useNavigate()

    useEffect(() => {
        const loadCategories = async () => {
            let res = await API.get(endpoints['categories'])
            setCategories(res.data)
        }
        loadCategories()
    }, [])

    const addProduct = (evt) => {
        evt.preventDefault()

        const process = async () => {
            try {
                let form = new FormData()
                form.append("name", product.name)
                form.append("price", product.price)
                form.append("description", product.description)
                form.append("category", selectedCategory)
                if (image.current.files.length > 0)
                    form.append("image", image.current.files[0])

                let res = await authAPI().post(endpoints['addProduct'], form, {
                    headers: {
                        'Content-Type': 'multipart/form-data'
                    }
                })
                if (res.status === 201)
                    nav("/")
                else
                    setErr("Hệ thống đang có lỗi! Vui lòng quay lại sau!")

            } catch (ex) {
                let msg = ""
                for (let e of Object.values(ex.response.data))
                    msg += `${e}`
                setErr(msg)
            } finally {
                setLoading(false)
            }
        }

        setLoading(true)
        process()
    }

    const setValue = e => {
        const { name, value } = e.target
        setProduct(current => ({...current, [name]:value}))
    }

    return (
        <>
            <h1 className="text-center text-success">TẠO SẢN PHẨM</h1>

            {err?<ErrorAlert err={err} />:""}

            <Form onSubmit={addProduct}>
                <InputItem label="Tên sản phẩm" type="text" value={product.name} 
                            name="name" setValue={setValue} />
                <InputItem label="Giá" type="number" value={product.price} 
                            name="price" setValue={setValue} />

                <Form.Group className="mb-3" controlId="formGridState">
                    <Form.Label>Loại sản phẩm</Form.Label>
                    <Form.Select value={selectedCategory} onChange={(e)=>setSelectedCategory(e.target.value)}>
                        {/* <option disabled>Lựa chọn ...</option> */}
                        {categories.map(c => {
                            return (
                                <option key={c.id} value={c.id}>{c.name}</option>
                            )
                        })}
                    </Form.Select>
                </Form.Group>

                <InputItem label="Ảnh sản phẩm" type="file" ref={image} name="image" />
                
                <InputItem label="Mô tả sản phẩm" type="text" value={product.description} 
                            name="description" setValue={setValue} />
            
                {loading?<Spinner />:<Button variant="primary" type="submit">Tạo</Button>}
            </Form>
        </>
    )
    
}

export default AddProduct