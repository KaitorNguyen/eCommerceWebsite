const AboutUs = () => {
    return(
        <div className="aboutus">
            <div class="responsive-container-block bigContainer">
                <div class="responsive-container-block Container">
                    <div class="imgContainer">
                    <img class="blueDots" src="https://workik-widget-assets.s3.amazonaws.com/widget-assets/images/aw3.svg"/>
                    <img class="mainImg" src="https://workik-widget-assets.s3.amazonaws.com/widget-assets/images/aw2.svg"/>
                        </div>
                    <div class="responsive-container-block textSide">
                    <p class="text-blk heading">
                        About Us
                    </p>
                    <p class="text-blk subHeading">
                       Trang web này được phát triển bởi Đoàn Tuấn Kiệt và Nguyễn Văn Phúc
                    </p>
                  
                    
                    <div class="responsive-cell-block wk-desk-6 wk-ipadp-6 wk-tab-12 wk-mobile-12">
                        <div class="cardImgContainer">
                        <img class="cardImg" src="/kaitor.jpg"/>
                        </div>
                        <div class="cardText">
                        <p class="text-blk cardHeading">
                           KaitorNguyen
                        </p>
                        <p class="text-blk cardSubHeading">
                            Trưởng nhóm thích ăn cơm hàn quốc
                        </p>
                        </div>
                    </div>
                    <div class="responsive-cell-block wk-desk-6 wk-ipadp-6 wk-tab-12 wk-mobile-12">
                        <div class="cardImgContainer">
                        <img class="cardImg" src="fate.jpg"/>
                        </div>
                        <div class="cardText">
                        <p class="text-blk cardHeading">
                            FateTheConqueror
                        </p>
                        <p class="text-blk cardSubHeading">
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