import { useEffect, useState } from "react"
import Spinner from "./Spinner"
import API, { endpoints } from "../configs/API"
import { Link, useParams } from "react-router-dom"
import { Card, Col, Row } from "react-bootstrap"

const ProductsDetails = () =>{
        const[productDetails,setProductDetails] = useState(null)
        const {productsId} = useParams()

        useEffect(() =>{
            const loadProductDetail = async() => {
                let res = await API.get(endpoints['product-details'](productsId))
                setProductDetails(res.data)
            }
            loadProductDetail()
        })

        if (productDetails === null)
            return <Spinner/>
              
        return(
            <div>
                 <h1> {productDetails.price}</h1>
            </div>
        )
}
export default ProductsDetails