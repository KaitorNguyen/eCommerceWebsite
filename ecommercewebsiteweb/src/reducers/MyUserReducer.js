import cookie from "react-cookies"


const MyUserReducer = (state, action) => {
    switch (action.type) {
        case "login":
            return action.payload
        case "logout":
            return null
            cookie.remove('access_token')
            cookie.remove('current-user')
        default:
    }       return state
}
export default MyUserReducer