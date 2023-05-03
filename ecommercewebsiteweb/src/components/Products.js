import { useEffect, useState } from "react"
import { Button, ButtonGroup, Card, Col, Row } from "react-bootstrap"
import API, { endpoints } from "../configs/API"
import Spinner from "./Spinner"
import { Link, useSearchParams } from "react-router-dom"
import NotFound from "./NotFound"


const Products = () => {
    const [products, setProducts] = useState(null)
    const [page, setPage] = useState(1)
    const [q] = useSearchParams()
    const [minPrice, SetMinPrice] = useState(null)
    const [maxPrice, SetMaxPrice] = useState(null)

    useEffect(() => {
        const loadProducts = async () => {
            try {
                let e = `${endpoints['products']}?page=${page}`
                let k = q.get("kw")
                if (k !== null)
                    e += `&kw=${k}`


                if (minPrice !== null && maxPrice !== null) {
                    e += `&min_price=${minPrice}&max_price=${maxPrice}`
                }


                let cateId = q.get("category_id")
                if (cateId !== null)
                    e += `&category_id=${cateId}`

                let res = await API.get(e)
                setProducts(res.data.results)
            } catch (ex) {
                setPage(1)
            }

        }
        setProducts(null)
        loadProducts()
    }, [page, q, SetMinPrice, SetMaxPrice])

    const nextPage = () => setPage(current => current + 1)
    const prevPage = () => setPage(current => current - 1)

    if (products === null)
        return <Spinner />
    if (products.length === 0)
        return <NotFound />

    return (
        <div>
            <div>
                <h2 className="title">
                    <span className="title-word title-word-1">Danh </span>
                    <span className="title-word title-word-2">Sách </span>
                    <span className="title-word title-word-3">Sản </span>
                    <span className="title-word title-word-4">Phẩm</span>
                </h2>
                <div className="button_price_filter">
                    <ButtonGroup aria-label="Basic example" className="mt-2">
                        <Button className="prevNext" onClick={prevPage} variant="outline-primary">&lt;&lt;</Button>
                        <Button className="prevNext" onClick={nextPage} variant="outline-primary">&gt;&gt;</Button>
                    </ButtonGroup>
                    <div className="price_filter">
                        <div className="input-group">
                            <input value={minPrice} onChange={(e) => SetMinPrice(e.target.value)} type="number"/>                              
                        </div>
                        <div className="input-group">
                            <input value={maxPrice} onChange={(e) => SetMaxPrice(e.target.value)} type="number" />                                                          
                        </div>
                        <Button className="button_filter" onClick={() => setPage(2)}  variant="outline-primary">duyệt</Button>
                    </div>
                </div>
                <Row>
                    {products.map(c => {
                        let url = `/products/${c.id}`
                        return (

                            <Col md={3} xs={12} className="p-2">
                                <Link className="nav nav-link" to={url}>
                                    <Card className="" >
                                        <Card.Img variant="top" src={c.image} />
                                        <Card.Body>
                                            <Card.Title className="text-center ovf" key={c.id} >{c.name}</Card.Title>
                                            <h1 className="text-center ovf">{c.price}</h1>
                                        </Card.Body>
                                    </Card>
                                </Link>
                            </Col>
                        )
                    })}

                </Row>
            </div>
        </div>
    )

}
export default Products