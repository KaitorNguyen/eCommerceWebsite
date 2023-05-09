import { useEffect, useState } from "react"
import API, { endpoints } from "../configs/API"
import { Card, Col, Row } from "react-bootstrap"
import { Link, useParams } from "react-router-dom"
import { useContext } from "react"
import { MyUserContext } from "../configs/MyContext"
import Spinner from "./Spinner"

const Shop = () => {
  const [shops, setShops] = useState(null)
  const { shopsId } = useParams()
  const [user,] = useContext(MyUserContext)

  useEffect(() => {
    const loadShops = async () => {
      try {
        let res = await API.get(endpoints['shops'](shopsId))
        setShops(res.data)
      }
      catch (ex) {
      }
    }

    setShops(null)
    loadShops()
  }, [shopsId])

  if (shops === null)
    return <Spinner />
  return (
    <div>
      <Row className="m-2">
        <Col>
          <div>
            <span className="shop_name">{shops.name}</span>
            <div className="_p-features" dangerouslySetInnerHTML={{ __html: shops.description }}></div>
          </div>
        </Col>
        <Col>
          {user.groups[0].name === "Seller" || user.groups[0].name === "Employee" ? 
            <Link to={`/shops/${shops.id}/add-product`}> 
              <button className="button-89" >Thêm sản phẩm</button>
            </Link> : null}
        </Col>
      </Row>
      
      <h2 className="title">
        <span className="title-word title-word-1">Danh </span>
        <span className="title-word title-word-2">Sách </span>
        <span className="title-word title-word-3">Sản </span>
        <span className="title-word title-word-4">Phẩm</span>
      </h2>

      <Row>
        {shops.proshop.map(c => {
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
export default Shop