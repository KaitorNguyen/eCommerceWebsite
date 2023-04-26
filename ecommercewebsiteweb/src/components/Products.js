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

    useEffect(() => {
        const loadProducts = async () => {
            try {
                let e = `${endpoints['products']}?page=${page}`
                let k = q.get("kw")
                if (k !== null)
                    e += `&kw=${k}`


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
    }, [page, q])

    const nextPage = () => setPage(current => current + 1)
    const prevPage = () => setPage(current => current - 1)

    if (products === null)
        return <Spinner />
    if (products.length === 0)
        return <NotFound />

    return (
        <div>
            <h2 className="title">
                <span className="title-word title-word-1">Danh </span>
                <span className="title-word title-word-2">Sách </span>
                <span className="title-word title-word-3">Sản </span>
                <span className="title-word title-word-4">Phẩm</span>
            </h2>
            <ButtonGroup aria-label="Basic example" className="mt-2">
                <Button className="prevNext" onClick={prevPage} variant="outline-primary">&lt;&lt;</Button>
                <Button className="prevNext" onClick={nextPage} variant="outline-primary">&gt;&gt;</Button>
            </ButtonGroup>
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
                                    </Card.Body>
                                </Card>
                            </Link>
                        </Col>
                    )
                })}

            </Row>
        </div>
    )
}
export default Products