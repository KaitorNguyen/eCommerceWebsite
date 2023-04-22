import { useEffect, useState } from "react"
import API, { endpoints } from "../configs/API"
import { Card, Col,  Row } from "react-bootstrap"
import { Link} from "react-router-dom"
import Spinner from "./Spinner"

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
            return <Spinner />
    return(
            
            <div>            
                    <h2 className="title">
                        <span className="title-word title-word-1">Da</span>
                        <span className="title-word title-word-2">nh </span>
                        <span className="title-word title-word-3">M</span>
                        <span className="title-word title-word-4">ục</span>
                    </h2>
                <Row>
                    {categories.map(c =>{
                        let url = `/categories/${c.id}/products`
                        return(
                            <Col md={3} xs={12} className="p-2">
                                <Link to={url}>
                                    <Card>
                                        <Card.Img variant="top" src="https://tinnhanhplus.com/wp-content/uploads/2020/11/hinh-anh-doremon-xin-chao.jpg" />
                                        <Card.Body>
                                            <Card.Title className="text-center"  key={c.id} >{c.name}</Card.Title>                         
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

export default Categories