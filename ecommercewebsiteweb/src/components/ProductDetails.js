import { useEffect, useState } from "react"
import Spinner from "./Spinner"
import API, { endpoints } from "../configs/API"
import { Link, useParams } from "react-router-dom"

const ProductsDetails = () =>{
        const[productDetails,setProductDetails] = useState(null)
        const {productsId} = useParams()

        useEffect(() =>{
            const loadProductDetail = async() => {
                let res = await API.get(endpoints['product-details'](productsId))
                setProductDetails(res.data)
            }
            loadProductDetail()

            
        })

        if (productDetails === null)
            return <Spinner/>
        
        let url =`/shops/${productDetails.shop.id}/products`
        return(
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
                                        <div className  ="p-list">
                                            <span> Giá : </span>
                                            <span className="price"> {productDetails.price} <i>VND</i></span>
                                        </div>
                                        <div className="_p-features" dangerouslySetInnerHTML={{__html: productDetails.description}}>  
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
            </div>
        )
}
export default ProductsDetails