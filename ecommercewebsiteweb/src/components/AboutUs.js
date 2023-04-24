const AboutUs = () => {
    return(
        <div className="aboutus">
            <div className="responsive-container-block bigContainer">
                <div className="responsive-container-block Container">
                    <div className="imgContainer">
                    <img className="blueDots" src="https://workik-widget-assets.s3.amazonaws.com/widget-assets/images/aw3.svg"/>
                    <img className="mainImg" src="https://workik-widget-assets.s3.amazonaws.com/widget-assets/images/aw2.svg"/>
                        </div>
                    <div className="responsive-container-block textSide">
                    <p className="text-blk heading">
                        About Us
                    </p>
                    <p className="text-blk subHeading">
                       Trang web này được phát triển bởi Đoàn Tuấn Kiệt và Nguyễn Văn Phúc
                    </p>
                  
                    
                    <div className="responsive-cell-block wk-desk-6 wk-ipadp-6 wk-tab-12 wk-mobile-12">
                        <div className="cardImgContainer">
                        <img className="cardImg" src="/kaitor.jpg"/>
                        </div>
                        <div className="cardText">
                        <p className="text-blk cardHeading">
                           KaitorNguyen
                        </p>
                        <p className="text-blk cardSubHeading">
                            Trưởng nhóm thích ăn cơm hàn quốc
                        </p>
                        </div>
                    </div>
                    <div className="responsive-cell-block wk-desk-6 wk-ipadp-6 wk-tab-12 wk-mobile-12">
                        <div className="cardImgContainer">
                        <img className="cardImg" src="fate.jpg"/>
                        </div>
                        <div className="cardText">
                        <p className="text-blk cardHeading">
                            FateTheConqueror
                        </p>
                        <p className="text-blk cardSubHeading">
                            có vẻ hắn ta đang ở đâu đó...
                        </p>
                        </div>
                    </div>                 
                    </div>                  
                </div>
            </div>
        </div>
    )
}

export default AboutUs