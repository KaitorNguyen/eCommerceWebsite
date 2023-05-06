import { useRef, useState } from "react"
import { Button, Form, Spinner } from "react-bootstrap"
import API, { endpoints } from "../configs/API"
import ErrorAlert from "../layouts/ErrorAlert"
import { useNavigate } from "react-router-dom"

const Register = () => {

   const [user, setUser] = useState({
      "firstName": "",
      "lastName": "",
      "username": "",
      "password": "",
      "confirmPassword": "",
      "role": "",
   })

   const avatar = useRef()
   const [loading, setLoading] = useState(false)
   const [err, setErr] = useState("")
   const nav = useNavigate()

   const register = (evt) => {
      evt.preventDefault()

      const process = async () => {
         try {
            let form = new FormData()
            form.append("first_name", user.firstName)
            form.append("last_name", user.lastName)
            form.append("username", user.username)
            form.append("password ", user.password)
            form.append("role", user.role)
            if (avatar.current.files.length > 0)
               form.append("avatar", avatar.current.files[0])

            let res = await API.post(endpoints['register'], form, {
               headers: {
                  'Content-Type': 'multipart/form-data'
               }
            })
            if (res.status === 201)
               nav("/login")
            else
               setErr("Đăng ký thất bại, vui lòng quay lại sau")
         } catch (ex) {
            let msg = ""
            for (let e in Object.values(ex.response.data))
               msg += `${e}`

            setErr(msg)

         } finally {
            setLoading(false)
         }

      }

      if (user.username === "" || user.password === "")
         setErr("Tài khoản và mật khẩu không được rỗng")
      else if (user.password !== user.confirmPassword)
         setErr("Mật khẩu không khớp")

      else {
         setLoading(true)
         process()
      }
   }
   return (
      <>
         {err ? <ErrorAlert err={err} /> : ""}
         <Form onSubmit={register}>
            <div className="login_center">
               <div className='bold-line'>
               </div>
               <div className='window'>
                  <div className='overlay'>

                  </div>
                  <div className='content'>
                     <div className='welcome'>Đăng ký</div>

                     <div className='input-fields'>
                        <input onChange={e => setUser({ ...user, "firstName": e.target.value })} type='text' value={user.firstName} placeholder='Tên người dùng' className='input-line full-width'></input>
                        <input onChange={e => setUser({ ...user, "lastName": e.target.value })} type='text' value={user.lastName} placeholder='Họ và tên lót' className='input-line full-width'></input>
                        <input onChange={e => setUser({ ...user, "username": e.target.value })} type='text' value={user.username} placeholder='Tên đăng nhập' className='input-line full-width'></input>
                        <input onChange={e => setUser({ ...user, "password": e.target.value })} type='password' value={user.password} placeholder='Mật khẩu' className='input-line full-width'></input>
                        <input onChange={e => setUser({ ...user, "confirmPassword": e.target.value })} type='password' value={user.confirmPassword} placeholder='Xác nhận mật khẩu' className='input-line full-width'></input>
                        <select className='input-line full-width' >Bạn là
                           <option value={user.role = "C"} selected>Khách hàng</option>
                           <option value={user.role = "S"}>Nhà cung cấp</option>
                        </select>
                        <input ref={avatar} type='file' className='input-line full-width'></input>
                     </div>
                     {loading ? <Spinner /> : <button type="submit" className="ghost-round full-width">Đăng ký </button>}
                  </div>
               </div>
            </div>
         </Form>
      </>
   )
}
export default Register