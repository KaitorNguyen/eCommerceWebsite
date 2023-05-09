import { useEffect, useState } from "react"
import API, { endpoints } from "../configs/API"
import { Card, Col, Row } from "react-bootstrap"
import { Link, useParams } from "react-router-dom"
import Spinner from "./Spinner"
import cookie from "react-cookies"

const ListYourShop = () => {
    const [shops, setShops] = useState(null)

    useEffect(() => {
        const loadListShops = async () => {
            let res = await API.get(endpoints['your-shop'], {
                headers: {
                    "Authorization": `Bearer ${cookie.load("access-token")}`,
                }
            })
            setShops(res.data)
        }

        loadListShops()
    }, [])

    if (shops === null)
        return <Spinner/>

    return (
        <>
            <h2 className="title">
                <span className="title-word title-word-1">Danh </span>
                <span className="title-word title-word-2">Sách </span>
                <span className="title-word title-word-3">Cửa </span>
                <span className="title-word title-word-4">Hàng</span>
            </h2>
            <Row>
                {shops.map(s => {
                    let url = `/shops/${s.id}/products`
                    return (
                        <Col md={3} xs={12} className="p-2">
                        <Link className="nav nav-link" to={url}>
                            <Card>
                                <Card.Img variant="top" src={s.avatar} />
                                <Card.Body>
                                    <Card.Title className="text-center" key={s.id} >{s.name}</Card.Title>
                                </Card.Body>
                            </Card>
                        </Link>
                        </Col>
                    )
                })}
            </Row>
        </>
    )
}
export default ListYourShop