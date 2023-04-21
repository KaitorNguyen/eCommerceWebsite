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
            
            <div>            
                    <h2 class="title">
                        <span className="title-word title-word-1">Da</span>
                        <span className="title-word title-word-2">nh</span>
                        <span className="title-word title-word-3">M</span>
                        <span className="title-word title-word-4">ục</span>
                    </h2>
                    <Row>
                    {categories.map(c =>{
                        return(
                            <Col md={3} xs={12} className="p-2">
                                <Card >
                                <Card.Img variant="top" src="https://tinnhanhplus.com/wp-content/uploads/2020/11/hinh-anh-doremon-xin-chao.jpg" />
                                <Card.Body>
                                    <Card.Title className="text-center">{c.name}</Card.Title>                         
                                </Card.Body>
                                </Card>
                        </Col>
                        )
                    })}
                
                </Row>
            </div>
    )
}

export default Categories