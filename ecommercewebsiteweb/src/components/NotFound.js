import { Link } from "react-router-dom"

const NotFound = () => {
    let homePageUrl = `/`
    return (

        <div className="pageNotFound">

            <body>
                <main>
                    <div className="main-wrapper">
                        <picture className="scarecrow-img">
                            <img src="https://raw.githubusercontent.com/nat-oku/devchallenges/main/Scarecrow.png" alt="scarecrow" />
                        </picture>
                        <div className="error-text">
                            <h2>Tin xấu đây..</h2>
                            <p>Sản phẩm bạn tìm có vẻ đã biến mất đâu đó...</p>
                            <span className="input-group-btn">
                                <Link to={homePageUrl}> <button className="btn btn-info" type="button">Trở về trang chủ</button></Link>
                            </span>
                        </div>
                    </div>
                </main>

            </body>
        </div>
    )

}
export default NotFound