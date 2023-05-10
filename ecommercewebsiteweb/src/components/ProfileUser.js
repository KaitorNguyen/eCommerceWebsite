import { useEffect } from "react"
import { useState } from "react"
import { authAPI, endpoints } from "../configs/API"
import Spinner from "./Spinner"
import { Button, Col, Container, Form, Image, Modal, Row, Table } from "react-bootstrap"
import InputItem from "../layouts/InputItem"
import { useRef } from "react"
import { useNavigate } from "react-router-dom"
import ErrorAlert from "../layouts/ErrorAlert"

const ProfileUser = () => {
    const [profileUser, setProfileUser] = useState([])

    const [updateUser, setUpdateUser] = useState({
        "firstName": profileUser.first_name,
        "lastName": profileUser.last_name,
        "email": profileUser.email
     })
     const avatar = useRef()

    const [loading, setLoading] = useState(false)
    const [err, setErr] = useState("")
    const nav = useNavigate()

    const [show, setShow] = useState(false);

    const handleClose = () => setShow(false);
    const handleShow = () => setShow(true);

    useEffect(() => {
        const loadProfileUser = async () => {
            let res = await authAPI().get(endpoints['current-user'])
            setProfileUser(res.data)
            console.info(res.data)
        }
        loadProfileUser()
    }, [])

    const editUser = (evt) => {
        evt.preventDefault()

        const process = async () => {
            try {
                let form = new FormData()
                form.append("first_name", updateUser.firstName)
                form.append("last_name", updateUser.lastName)
                form.append("email", updateUser.email)
                if (avatar.current.files.length > 0)
                    form.append("avatar", avatar.current.files[0])
                
                let res = await authAPI().put(endpoints['current-user'], form, {
                    headers: {
                        'Content-Type': 'multipart/form-data'
                    }
                })
                if (res.status === 200)
                    setProfileUser(res.data)
                else
                    setErr("Cập nhật thất bại, vui lòng quay lại sau")
            } catch (ex) {
                let msg = ""
                for (let e in Object.values(ex.response.data))
                   msg += `${e}`
    
                setErr(msg)
    
            } finally {
                setLoading(false)
            }
        }
        setLoading(true)
        process()
    }

    if (profileUser === null)
        return <Spinner />


    const setValue = e => {
        const { name, value } = e.target
        setUpdateUser(current => ({...current, [name]:value}))
    }

    return (
        <>
            <h1 className="text-center text-success">
                Thông tin cá nhân của {profileUser.first_name === "" && profileUser.last_name === "" ? <h1>của bạn</h1> : <h1>{profileUser.first_name}{profileUser.last_name}</h1>}
            </h1>
            <Row className="mt-7">
                <Col xs={4}>
                    <Image src={profileUser.avatar} rounded style={{ width: '50%' }}/>
                </Col>
                <Col xs={8}>
                    <Row >
                        <Col> <h3>First name</h3> </Col>
                        <Col> <h3>{profileUser.first_name}</h3> </Col>
                    </Row>
                    <Row>
                        <Col> <h3>Last name</h3> </Col>
                        <Col> <h3>{profileUser.last_name}</h3> </Col>
                    </Row>
                    <Row>
                        <Col> <h3>Username</h3> </Col>
                        <Col> <h3>{profileUser.username}</h3> </Col>
                    </Row>
                    <Row>
                        <Col> <h3>Email</h3> </Col>
                        <Col> <h3>{profileUser.email}</h3> </Col>
                    </Row>
                    <Row>
                        <Button variant="primary" onClick={handleShow}>
                            Cập nhật
                        </Button>
                    </Row>
                </Col>
            </Row>

            {err?<ErrorAlert err={err} />:""}


            <Modal show={show} onHide={handleClose}>
                <Modal.Header closeButton>
                    <Modal.Title>Chỉnh sửa thông tin cá nhân</Modal.Title>
                </Modal.Header>
                <Modal.Body>
                    <Form onSubmit={editUser}>
                        <InputItem label="First name" type="text" value={updateUser.firstName} 
                                    name="firstName" setValue={setValue} />
                        <InputItem label="Last name" type="text" value={updateUser.lastName} 
                                    name="lastName" setValue={setValue} />
                        <InputItem label="Email" type="email" value={updateUser.email} 
                                    name="email" setValue={setValue} />

                        <InputItem label="Ảnh của bạn" type="file" ref={avatar} name="image" />
                        {loading?<Spinner />:<Button variant="primary" type="submit" onClick={handleClose}>Save Changes</Button>}
                    </Form>
                </Modal.Body>
                <Modal.Footer>
                    <Button variant="secondary" onClick={handleClose}>
                        Close
                    </Button>
                </Modal.Footer>
            </Modal>

        </>
    );

}

export default ProfileUser