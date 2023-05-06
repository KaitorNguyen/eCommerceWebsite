import { useEffect, useState } from "react"
import Spinner from "./Spinner"
import API, { authAPI, endpoints } from "../configs/API"
import { Link, useParams } from "react-router-dom"
import Moment from "react-moment"
import { Button, Form } from "react-bootstrap"
import { useContext } from "react"
import { MyUserContext } from "../configs/MyContext"

const ProductsDetails = () => {
    const [productDetails, setProductDetails] = useState(null)
    const { productsId } = useParams()
    const [comments, SetComments] = useState(null)
    const [loading, setLoading] = useState(false)
    const [content, SetContent] = useState("")
    const [user,] = useContext(MyUserContext)

    useEffect(() => {
        const loadProductDetail = async () => {
            let res = await authAPI().get(endpoints['product-details'](productsId))
            setProductDetails(res.data)
            console.info(res.data)
        }
        loadProductDetail()


    }, [productsId])


    useEffect(() => {
        const loadComments = async () => {
            let res = await API.get(endpoints['comments'](productsId))
            SetComments(res.data)
        }
        loadComments()
    }, [productsId])

    const addComment = (evt) => {
        evt.preventDefault()

        const process = async () => {
            try {
                let res = await authAPI().post(endpoints['comments'](productsId), {
                    "content": content
                })
                SetComments(current => ([res.data, ...current]))
            } catch {

            } finally {
                SetContent("")
                setLoading(false)
            }

        }
        setLoading(true)
        process()

    }


    if (productDetails === null)
        return <Spinner />


    let url = `/shops/${productDetails.shop.id}/products`
    let homePageUrl = `/`
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
                                    <div className="button-like"><button className="btn btn-outline-danger" type="submit" style={{fontSize:"16px"}}>♥</button> </div>
                                    <Link to={`/products/${productsId}/purchase`}>   <button className="button-89" >Mua ngay</button></Link>
                                    <Link to={homePageUrl}>   <button className="button-89" >Thêm vào giỏ</button></Link>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <hr></hr>
            {user === null ? <Link className="login-comment" to="/login">Đăng nhập để bình luận</Link> : (<Form onSubmit={addComment}>
                <div className="card_comment p-3">

                    <div>
                        {/* <img src={comments.user.image}/>  */}
                        <div className="comment_tittle">Bình luận</div>
                        <input className="comment-input" type="text" value={content} onChange={e => SetContent(e.target.value)} placeholder="  nhập nội dung bình luận" />
                        {loading ? <Spinner /> : <button type="submit" className="comment-button"> Bình luận</button>}
                    </div>

                </div>
            </Form>)}

            <hr></hr>

            {comments === null ? <Spinner /> : (
                comments.map(c => (
                    <div className="card_comment p-3">
                        <div className="d-flex justify-content-between align-items-center">
                            <div className="user d-flex flex-row align-items-center">
                                <img src={c.user.image} alt={c.user.username} width="30" className="user-img rounded-circle mr-2" />
                                <span><small className="font-weight-bold text-primary">{c.user.username}</small> <small className="font-weight-bold">{c.content}</small></span>
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