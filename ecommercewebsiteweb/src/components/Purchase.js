import { useContext } from "react"
import { MyUserContext } from "../configs/MyContext"
import { useParams } from "react-router-dom"

const Purchase = () =>{
    
        const [user,] = useContext(MyUserContext)
        const { productsId } = useParams()
        return(
        
        <div>xin chào </div>
    )
}
export default Purchase