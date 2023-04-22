import { useEffect, useState } from "react"
import { Button, ButtonGroup, Card, Col, Container, Row, Spinner } from "react-bootstrap"
import API, { endpoints } from "../configs/API"

const Products = () =>{
    const [products,setProducts] = useState(null)
    const [page, setPage] =useState(1)

    useEffect(()=> {
        const loadProducts = async()=>{
        try{
            let e = `${endpoints['products']}?page=${page}`
            let res = await API.get(e)
            setProducts(res.data.results)
        }catch(ex){
            setPage(1)
        }

        }
        setProducts(null)
        loadProducts()
    }, [page])

    const nextPage = () => setPage(current => current + 1)
    const prevPage = () => setPage(current => current - 1)
   

    if (products === null)
        return  <Spinner animation="border" variant="primary" />

    return (
        <>
             <ButtonGroup aria-label="Basic example" className="mt-2">
                <Button onClick={prevPage} variant="outline-primary">&lt;&lt;</Button>
                <Button onClick={nextPage} variant="outline-primary">&gt;&gt;</Button>
            </ButtonGroup>
            <Row>
                {products.map(c =>{
                    return(
                        <Col md={3} xs={12} className="p-2">
                            <Card >
                            <Card.Img variant="top" src="https://tinnhanhplus.com/wp-content/uploads/2020/11/hinh-anh-doremon-xin-chao.jpg" />
                            <Card.Body>
                                <Card.Title>{c.name}</Card.Title>
                            
                                <Button variant="primary">Mua Ngay</Button>
                            </Card.Body>
                            </Card>
                    </Col>
                    )
                })}
            
            </Row>
        </>
    )
}

export default Products