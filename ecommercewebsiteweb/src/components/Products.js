import { useEffect, useState } from "react"
import { Button, ButtonGroup, Card, Col, Container, Row, Spinner } from "react-bootstrap"
import API, { endpoints } from "../configs/API"

const Products = () =>{
    const [products,setProducts] = useState(null)

    useEffect(()=> {
        const loadProducts = async()=>{
            let res = await API.get(endpoints['products'])
            setProducts(res.data.results)
        }
        loadProducts()
    }, [])

    if (products === null)
        return  <Spinner animation="border" variant="primary" />

    return (
        <Container>
            <ButtonGroup aria-label="Basic example">
                <Button variant="secondary">Left</Button>
                <Button variant="secondary">Right</Button>
            </ButtonGroup>
            <Row>
                {products.map(c =>{
                    return(
                        <Col md={3} xs={12} className="p-2">
                            <Card >
                            <Card.Img variant="top" src={c.image} />
                            <Card.Body>
                                <Card.Title>{c.name}</Card.Title>
                            
                                <Button variant="primary">Xem sản phẩm</Button>
                            </Card.Body>
                            </Card>
                    </Col>
                    )
                })}
            
            </Row>
        </Container>
    )
}

export default Products