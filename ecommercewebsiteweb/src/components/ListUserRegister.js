import { useEffect } from "react"
import { useState } from "react"
import { authAPI, endpoints } from "../configs/API"
import Spinner from "./Spinner"
import { Button, Modal, Table } from "react-bootstrap"
import { useParams } from "react-router-dom"

const ListUserRegister = () => {
    const [userRegister, setUserRegister] = useState(null)
    const [confirm, setConfirm] = useState()
    const [loading, setLoading] = useState(false)
    const [err, setErr] = useState("")

    const [show, setShow] = useState(false);

    const handleClose = () => setShow(false);
    const handleShow = () => setShow(true);

    useEffect(() => {
        const loadListUserRegister = async () => {
            let res = await authAPI().get(endpoints['list-user-register'])
            setUserRegister(res.data)
        }
        loadListUserRegister()
    }, [userRegister])


    const confirmUser = (id, evt) => {
        evt.preventDefault();

        const process = async () => {
            try {
                let res = await authAPI().patch(endpoints['confirm-user'](id))
                setConfirm(res.data)
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

    if (userRegister === null)
        return <Spinner/>

    return (
        <>
            <h2 className="title">
                <span className="title-word title-word-1">Danh </span>
                <span className="title-word title-word-2">Sách </span>
                <span className="title-word title-word-3">Xác </span>
                <span className="title-word title-word-4">Nhận </span>
                <span className="title-word title-word-1">Tài </span>
                <span className="title-word title-word-2">Khoản </span>
            </h2>   

            <Table striped bordered hover>
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Username</th>
                        <th>Is Verified</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    {userRegister.map(u => {
                        return (
                            <tr>
                                <td>{u.id}</td>
                                <td>{u.username}</td>
                                <td>
                                    {u.is_verified === false ? <td>Chưa xác nhận</td> : null}
                                </td>
                                <td>
                                    <Button variant="primary" onClick={handleShow}>
                                        Xác nhận
                                    </Button>
                                </td>

                                <Modal show={show} onHide={handleClose}>
                                    <Modal.Header closeButton>
                                        <Modal.Title>Xác nhận tài khoản</Modal.Title>
                                    </Modal.Header>
                                    <Modal.Body>
                                        {loading?<Spinner />:<Button variant="primary" onClick={(evt)=>confirmUser(u.id, evt)}>Save Changes</Button>}
                                    </Modal.Body>
                                    <Modal.Footer>
                                        <Button variant="secondary" onClick={handleClose}>
                                            Close
                                        </Button>
                                    </Modal.Footer>
                                </Modal>
                            </tr>
                      )
                    })}
                </tbody>
            </Table>         
        </>
    )

}
export default ListUserRegister