import { useEffect, useState } from "react"
import Spinner from "./Spinner"
import API, { endpoints } from "../configs/API"
import { Link, useParams } from "react-router-dom"
import { Button, Col, Image, Row } from "react-bootstrap"
import Moment from "react-moment"

const ProductsDetails = () => {
    const [productDetails, setProductDetails] = useState(null)
    const { productsId } = useParams()
    const [comments, SetComments] = useState(null)

    useEffect(() => {
        const loadProductDetail = async () => {
            let res = await API.get(endpoints['product-details'](productsId))
            setProductDetails(res.data)
        }
        loadProductDetail()


    }, [productsId])


    useEffect(() => {
        const loadComments = async () => {
            let res = await API.get(endpoints['comments'](productsId))
            SetComments(res.data)
        }
        loadComments()
    }, [])



    if (productDetails === null)
        return <Spinner />


    let url = `/shops/${productDetails.shop.id}/products`
    return (
        <div>
            <section id="services" className="services section-bg">
                <div className="container-fluid">

                    <div className="row row-sm">
                        <div className="col-md-6 _boxzoom">
                            <div className="zoom-thumb">
                            </div>
                            <div className="_product-images">
                                <div className="img_center">
                                    <img className="my_img" src={productDetails.image} alt="" />
                                </div>
                            </div>
                        </div>
                        <div className="col-md-6">
                            <div className="_product-detail-content">
                                <p className="_p-name">{productDetails.name} </p>
                                <div className="_p-price-box">
                                    <div className="p-list">
                                        <span > SHOP CUNG CẤP : </span>
                                        <Link className="nav nav-link shop_name_display" to={url}> <span className="shop_name">{productDetails.shop.name}</span></Link>
                                    </div>
                                    <div className="p-list">
                                        <span> Giá : </span>
                                        <span className="price"> {productDetails.price} <i>VND</i></span>
                                    </div>
                                    <div className="_p-features" dangerouslySetInnerHTML={{ __html: productDetails.description }}>
                                    </div>

                                    <form action="" method="post" acceptCharset="utf-8">
                                        <ul className="spe_ul"></ul>
                                        <div className="_p-qty-and-cart">
                                            <div className="_p-add-cart">
                                                <button className="btn-theme btn buy-btn" tabIndex="0">
                                                    <i className="fa fa-shopping-cart"></i> Buy Now
                                                </button>
                                                <button className="btn-theme btn btn-success" tabIndex="0">
                                                    <i className="fa fa-shopping-cart"></i> Add to Cart
                                                </button>
                                                <input type="hidden" name="pid" value="18" />
                                                <input type="hidden" name="price" value="850" />
                                                <input type="hidden" name="url" value="" />
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <hr></hr>
            <div class="card_comment p-3">
                        <div>
                            {/* <img src={comments.user.image}/>  */}
                            <div className="comment_tittle">Bình luận</div>                       
                            <input className="comment-input" type="text" placeholder="  nhập nội dung bình luận"/> 
                            <Button variant="secondary" className="mt-1">Bình luận</Button>                      
                        </div>                     
                    </div>

            <hr></hr>

            {comments === null ? <Spinner /> : (
                comments.map(c => (
                    <div class="card_comment p-3">
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="user d-flex flex-row align-items-center">
                                <img src={c.user.image} alt={c.user.username} width="30" class="user-img rounded-circle mr-2"/>
                                    <span><small class="font-weight-bold text-primary">{c.user.username}</small> <small class="font-weight-bold">{c.content}</small></span>
                            </div>
                            <small><Moment fromNow>{c.created_date}</Moment></small>
                        </div>
                       
                    </div>
                ))
            )}


        </div>
    )
}
export default ProductsDetails

{/* <Row>
                        <Col xs={3} md={1}>
                            <Image src={c.user.image} alt={c.user.username} rounded />
                        </Col>
                        <Col xs={9} md={11}>
                            <p>{c.content}</p>
                            <small>Được bình luận bởi {c.user.username} vào {c.created_date}</small>
                        </Col>
                    </Row> */}