import { useEffect, useState } from "react"
import API, { endpoints } from "../configs/API"
import { Card, Col, Row } from "react-bootstrap"
import { Link, useParams } from "react-router-dom"
import Spinner from "./Spinner"

const Shop = () => {
  const [shops, setShops] = useState(null)
  const { shopsId } = useParams()

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
      <div>
        <span className="shop_name">{shops.name}</span>
        <div className="_p-features" dangerouslySetInnerHTML={{ __html: shops.description }}></div>
      </div>
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