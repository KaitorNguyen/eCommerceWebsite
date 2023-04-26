import axios from "axios";

export const endpoints = {
    "categories":"/categories/",
    "products": "/products/",
    "product-details":(productsId) => `/products/${productsId}/`,
    "shops":(shopsId) => `/shops/${shopsId}/products/`,
    "login":"/o/token/",
    "current-user":"/users/current-user/"

}

export default axios.create({
    baseURL:"http://127.0.0.1:8000/"
})