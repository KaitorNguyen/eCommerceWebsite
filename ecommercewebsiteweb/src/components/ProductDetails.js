import { useEffect, useState } from "react"
import Spinner from "./Spinner"
import API, { authAPI, endpoints } from "../configs/API"
import { Link, useNavigate, useParams } from "react-router-dom"
import Moment from "react-moment"
import { Button, Form } from "react-bootstrap"
import { useContext } from "react"
import { MyCartContext, MyUserContext } from "../configs/MyContext"
import Rating from "react-rating"
import Products from "./Products"

const ProductsDetails = () => {
    const [productDetails, setProductDetails] = useState(null)
    const { productsId } = useParams()
    const [comments, SetComments] = useState(null)
    const [loading, setLoading] = useState(false)
    const [contentComment, SetContentComment] = useState("")
    const [contentReview, SetContentReview] = useState("")
    const [user,] = useContext(MyUserContext)
    const [reviews, SetReviews] = useState(null)
    const [rate, SetRate] = useState(0)
    // const [cart, setCart] = useState({
    //     "product": {
    //         "name": "",
    //         "price": ""
    //     },
    //     "unit_price": "",
    //     "quantity": 0
    // });
    const [cart, setCart] = useContext(MyCartContext)


    const [err, setErr] = useState("")
    const nav = useNavigate()

    useEffect(() => {
        const loadProductDetail = async () => {
            let res = await authAPI().get(endpoints['product-details'](productsId))
            setProductDetails(res.data)

        }
        loadProductDetail()


    }, [productsId])

    const addToCart = (evt) => {
        evt.preventDefault();

        let form = new FormData();
        form.append("name", productDetails.name)
        form.append("unit_price", productDetails.price);
        form.append("price", parseInt(cart.price * cart.quantity))
        form.append("quantity", cart.quantity + 1)
        const process = async () => {
            try {
                let res = await authAPI().post(endpoints['addToCart'](productsId), form, {
                    headers: {
                        'Content-Type': 'multipart/form-data'
                    }
                })
                if (res.status === 201) {
                    setCart({
                        "name": productDetails.name,
                        "price": (cart.price * cart.quantity),
                        "quantity": cart.quantity + 1,
                        "unit_price": (productDetails.price)
                    });
                }

                else
                    setErr("Hệ thống đang có lỗi! Vui lòng quay lại sau!")
            } catch (ex) {
                let msg = ""
                for (let e of Object.values(ex.response.data))
                    msg += `${e} `

                setErr(msg)
            } finally {
                setLoading(false)
            }
        }
        setLoading(true)
        process()
       

    }





    const addReview = (evt) => {
        evt.preventDefault()

        const process = async () => {
            try {
                let res = await authAPI().post(endpoints['reviews'](productsId), {
                    "content": contentReview,
                    "rate": rate
                })
                SetReviews(current => ([res.data, ...current]))

            } catch {

            } finally {
                SetContentReview("")
                SetRate()
                setLoading(false)

            }
        }
        setLoading(true)
        process()
    }

    useEffect(() => {
        const loadReviews = async () => {
            let res = await API.get(endpoints['reviews'](productsId))
            SetReviews(res.data)
        }
        loadReviews()
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
                    "content": contentComment
                })
                SetComments(current => ([res.data, ...current]))
            } catch {

            } finally {
                SetContentComment("")
                setLoading(false)
            }

        }
        setLoading(true)
        process()

    }




    const rating = (value) => {
        SetRate(value)

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

                                    <div className="mt-2">
                                        {loading ? <Spinner /> : <Button variant="primary" onClick={addToCart}>Add To Cart</Button>}
                                        <Link to={homePageUrl}>   <button className="button-89" >hihi</button></Link>
                                    </div>

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
                        <input className="comment-input" type="text" value={contentComment} onChange={e => SetContentComment(e.target.value)} placeholder="  nhập nội dung bình luận" />
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
                                <img src={c.user.avatar} alt={c.user.username} width="30" className="user-img rounded-circle mr-2" />
                                <span><small className="font-weight-bold text-primary">{c.user.username}</small> <small className="font-weight-bold">{c.content}</small></span>
                            </div>
                            <small><Moment fromNow>{c.created_date}</Moment></small>
                        </div>

                    </div>
                ))
            )}
            <hr></hr>
            {user === null ? <Link className="login-comment" to="/login">Đăng nhập để đánh giá sản phẩm</Link> : (<Form onSubmit={addReview}>
                <div className="card_comment p-3">

                    <div>
                        {/* <img src={comments.user.image}/>  */}
                        <div className="comment_tittle">Đánh giá sản phẩm</div>
                        <div>
                            <Rating emptySymbol="fa fa-star-o fa-2x"
                                fullSymbol="fa fa-star fa-2x"
                                initialRating={rate}
                                onChange={rating}
                            />
                        </div>
                        <input className="comment-input" type="text" value={contentReview} onChange={e => SetContentReview(e.target.value)} placeholder="  nhập nội dung review " />
                        {loading ? <Spinner /> : <button type="submit" className="comment-button"> Đánh giá</button>}
                    </div>

                </div>
            </Form>)}
            <hr></hr>
            {/* Review */}
            {reviews === null ? <Spinner /> : (
                reviews.map(c => (
                    <div className="card_comment p-3">
                        <div className="d-flex justify-content-between align-items-center">
                            <div className="user d-flex flex-row align-items-center">
                                <img src={c.user.avatar} alt={c.user.username} width="30" className="user-img rounded-circle mr-2" />
                                <span><small className="font-weight-bold text-primary">{c.user.username}</small> <small className="font-weight-bold">{c.content}</small></span>
                            </div>
                            <small><Moment fromNow>{c.created_date}</Moment></small>
                            <div>
                                <Rating emptySymbol="fa fa-star-o fa-2x"
                                    fullSymbol="fa fa-star fa-2x"
                                    initialRating={c.rate ? c.rate : 0}

                                    onClick={rating}
                                />
                            </div>

                        </div>

                    </div>
                ))
            )}

        </div>
    )
}
export default ProductsDetails
