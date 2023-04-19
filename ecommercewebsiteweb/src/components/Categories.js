import { useEffect, useState } from "react"
import API, { endpoints } from "../configs/API"
import { Button, Card, Col, Container, Row, Spinner } from "react-bootstrap"

const Categories = () =>{
    const[categories,setCategories] = useState(null)

    useEffect(()=>{
        const loadCategories =async()=>{
            let res = await API.get(endpoints['categories'])
            setCategories(res.data)
        }
        loadCategories()
    }, [])

    if(categories === null)
            return <Spinner animation="border" variant="primary" />
    return(
    <Container>
        <Row>
            {categories.map(c =>{
                return(
                    <Col md={2} xs={12}>
                        <a href="https://lienminh.vnggames.com/vi-vn/">
                            <Card >
                            <Card.Img variant="top" src="" />
                            <Card.Body>
                                <Card.Title>{c.name}</Card.Title>
                                <Button variant="primary">Xem sản phẩm</Button>
                            </Card.Body>
                            </Card>
                        </a>
                </Col>
                )
            })}
        
        </Row>
    </Container>
    )
}

export default Categories