<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--忽略页面中的邮箱格式为邮箱-->
<meta name="format-detection" content="email=no"/>
 <%@include file="../../header_v2.0.jsp" %>
 <%@include file="../../header_wxjsapi.jsp"%>
     <title>520喵女神节</title>
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <!-- Link Swiper's CSS -->
    <link rel="stylesheet" href="<b:staticUrl>/res/css/anniversary/swiper-3.4.2.min.css</b:staticUrl>">
    <link rel="stylesheet" href="<b:staticUrl>/res/css/anniversary/animate.min.css</b:staticUrl>">
    <link rel="stylesheet" href="<b:staticUrl>/res/css/anniversary/index.css</b:staticUrl>">
    <link rel="stylesheet" href="<b:staticUrl>/res/css/anniversary/page_one/page_one.css</b:staticUrl>">
    <link rel="stylesheet" href="<b:staticUrl>/res/css/anniversary/page_two/page_two.css</b:staticUrl>">
    <link rel="stylesheet" href="<b:staticUrl>/res/css/anniversary/page_three/page_three.css</b:staticUrl>">
    <link rel="stylesheet" href="<b:staticUrl>/res/css/anniversary/page_four/page_four_welfare_one.css</b:staticUrl>">
    <link rel="stylesheet" href="<b:staticUrl>/res/css/anniversary/page_five/page_five.css</b:staticUrl>">
    <script type="text/javascript" src="<b:staticUrl>/res/js/anniversary/adaptationScreen.js</b:staticUrl>"></script>   
    <script  type="text/javascript" src="<b:staticUrl>/res/js/anniversary/swiper-3.4.2.min.js</b:staticUrl>"></script>
    <script  type="text/javascript" src="<b:staticUrl>/res/js/anniversary/swiper.animate1.0.2.min.js</b:staticUrl>"></script> 

    <style>
        html, body {
            position: relative;
            height: 100%;
        }
        body {
            background: #eee;
            font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
            font-size: 14px;
            color:#000;
            margin: 0;
            padding: 0;
        }
        .swiper-container {
            width: 100%;
            height: 100%;
            margin-left: auto;
            margin-right: auto;
        }
        .swiper-slide {
            text-align: center;
            font-size: 18px;
            background: #fff;

            /* Center slide text vertically */
            display: -webkit-box;
            display: -ms-flexbox;
            display: -webkit-flex;
            display: flex;
            -webkit-box-pack: center;
            -ms-flex-pack: center;
            -webkit-justify-content: center;
            justify-content: center;
            -webkit-box-align: center;
            -ms-flex-align: center;
            -webkit-align-items: center;
            align-items: center;
        }
        .swiper-pagination-bullet {
            background-color: #dd3e40;
        }
        
        
        .share {
		    display:none;
		    width: 100%;
		    max-width: 540px;
		    margin: 0 auto;
		    height: 100%;
		    position: fixed;
		    top: 0;
		    z-index: 100;
		    background-color: rgba(0, 0, 0, 0.8);
		}
		.share .shareBox {
		    width: 100%;
		    padding-top: 1.12rem;
		    position: relative;
		}
		.share .sharearrow {
		    display: block;
		    width: 75px;
		    height: 84px;
		    position: absolute;
		    right: 0.48rem;
		    top: 0.21333333rem;
		    background-image: url(<b:staticUrl>/res/img/share/share.png</b:staticUrl>);
		    background-position: right top;
		    background-repeat: no-repeat;
		    background-size: 78px 72px;
		}
		.share p {
		    margin-bottom: 0.26666667rem;
		    text-align: center;
		    color: #f8e71c;
		}
		.font15{
			font-size:15px;
			line-height:15px;
		}
    </style>
    <script type="text/javascript">
	var wxfenxiangcb_dtl={
				title: '喵姐早教说1周岁啦！“520喵女神节”福利连连惊喜不断，以爱的名义，搞事情！', // 分享标题
				desc : '${wxshare.desc}',
			    link: '${wxshare.link}', // 分享链接
			    imgUrl: '${wxshare.imgUrl}', // 分享图标
			    shareTimeline:function(bool){
			    	HH.href('/yzmm/account/generalizeactivity/index/ec109ffffe5e41ea9282952b7ad0659e');
			    },
			    shareAppMessage:function(bool){
			    	HH.href('/yzmm/account/generalizeactivity/index/ec109ffffe5e41ea9282952b7ad0659e');
			    }
			};
	
			 initwxfx(wxfenxiangcb_dtl);
			
	</script>
</head>
<body>
    <!-- Swiper -->
    <div class="swiper-container">
        <div class="swiper-wrapper">
            <div class="swiper-slide">
                <!--第一张图-->
                <div class="wrap">
                <!--背景图-->
                    <div class="homepage_bg">
                        <!--顶部的图标-->
                        <div class="header ani"  swiper-animate-effect="fadeInUp" swiper-animate-duration="0.5s" swiper-animate-delay="0.3s">
                            <img src="<b:staticUrl>/res/img/anniversary/homepage/top.png</b:staticUrl>" alt="">
                        </div>
                        <!--中间的520、喵女神、周年回馈等-->
                        <div class="conter ani"  swiper-animate-effect="fadeInUp" swiper-animate-duration="0.5s" swiper-animate-delay="0.3s">
                            <img src="<b:staticUrl>/res/img/anniversary/homepage/520.png</b:staticUrl>" alt="" class="love">
                            <img src="<b:staticUrl>/res/img/anniversary/homepage/c_bg.png</b:staticUrl>" alt="" class="content_bg">
                            <img src="<b:staticUrl>/res/img/anniversary/homepage/nv_img.png</b:staticUrl>" alt="" class="goddess">
                            <div class="line_top"></div>
                            <img src="<b:staticUrl>/res/img/anniversary/homepage/zn_img.png</b:staticUrl>" alt="" class="year">
                            <div class="line_bottom"></div>
                            <img src="<b:staticUrl>/res/img/anniversary/homepage/num.png</b:staticUrl>" alt="" class="num">
                            <img src="<b:staticUrl>/res/img/anniversary/homepage/heart_1.png</b:staticUrl>" alt="" class="heart_one">
                            <div class="text">
                                <img src="<b:staticUrl>/res/img/anniversary/homepage/font_02.png</b:staticUrl>" alt="" class="text_img">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--第二张图-->
            <div class="swiper-slide">
                <div class="w_page_one">
                <!--背景图-->
                    <div class="page_bg">
                        <!--页面上方的视频-->
                        <div class="page_top">
                            <!--autoplay controls loop-->
                            <video id="audio" webkit-playsinline="true" x-webkit-airplay="true" x5-video-player-type="h5" playsinline preload="none" controls="controls" width="100%" poster="<b:staticUrl>/res/img/activity/shareplay.png</b:staticUrl>">
			                   <source src="http://free.vod.aliyun.sevenkids.cn/oneyearanniversary.mp4" type="video/mp4">
			               </video>
                        </div>
                        <!--页面下面的文字图片-->
                        <div class="page_content">
                            <img src="<b:staticUrl>/res/img/anniversary/one/font_btm.png</b:staticUrl>" alt="">
                        </div>
                    </div>     
                </div>
            </div>

            <!--第三张图-->
            <div class="swiper-slide">
                <div class="w_page_two">
                    <!--背景图-->
                    <div class="page_bgtwo">
                        <!--顶部上的这一年，我们-->
                        <div class="page_two_top ani"  swiper-animate-effect="slideInleft" swiper-animate-duration="0.5s" swiper-animate-delay="0.3s">
                            <img src="<b:staticUrl>/res/img/anniversary/two/top.png</b:staticUrl>" alt="">
                            <div class="line_w"></div>
                        </div>   
                        <!--中间的内容-->
                        <div class="page_two_content">
                            <!--左侧的竖线和原点-->
                            <div class="content_left">
                                <img src="<b:staticUrl>/res/img/anniversary/two/line.png</b:staticUrl>" alt="">
                                <ul>
                                    <li class="ani" swiper-animate-effect="fadeInUp" swiper-animate-duration="0.5s" swiper-animate-delay="0.3s"></li>
                                    <li class="ani" swiper-animate-effect="fadeInUp" swiper-animate-duration="0.6s" swiper-animate-delay="0.3s"></li>
                                    <li class="ani" swiper-animate-effect="fadeInUp" swiper-animate-duration="0.7s" swiper-animate-delay="0.3s"></li>
                                    <li class="ani" swiper-animate-effect="fadeInUp" swiper-animate-duration="0.8s" swiper-animate-delay="0.3s"></li>
                                    <li class="ani" swiper-animate-effect="fadeInUp" swiper-animate-duration="0.9s" swiper-animate-delay="0.3s"></li>
                                    <li class="ani" swiper-animate-effect="fadeInUp" swiper-animate-duration="0.10s" swiper-animate-delay="0.3s"></li>
                                    <li class="ani" swiper-animate-effect="fadeInUp" swiper-animate-duration="0.11s" swiper-animate-delay="0.3s"></li>
                                </ul>
                            </div>
                            <!--右侧的文字图片-->
                            <div class="content_right ani" swiper-animate-effect="slideInRight" swiper-animate-duration="0.5s" swiper-animate-delay="0.3s">
                                <ul>
                                    <li>
                                        <img src="<b:staticUrl>/res/img/anniversary/two/font1.png</b:staticUrl>" alt="" class="font_one">
                                    </li>
                                    <li>
                                        <img src="<b:staticUrl>/res/img/anniversary/two/font2.png</b:staticUrl>" alt="" class="font_two">
                                    </li>
                                    <li>
                                        <img src="<b:staticUrl>/res/img/anniversary/two/font3.png</b:staticUrl>" alt="" class="font_three">
                                    </li>
                                    <li>
                                        <img src="<b:staticUrl>/res/img/anniversary/two/font4.png</b:staticUrl>" alt="" class="font_four">
                                    </li>
                                    <li>
                                        <img src="<b:staticUrl>/res/img/anniversary/two/font5.png</b:staticUrl>" alt="" class="font_five">
                                    </li>
                                    <li>
                                        <img src="<b:staticUrl>/res/img/anniversary/two/font6.png</b:staticUrl>" alt="" class="font_six">
                                    </li>
                                    <li>
                                        <img src="<b:staticUrl>/res/img/anniversary/two/font7.png</b:staticUrl>" alt="" class="font_seven">
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!--第四张福利的第一张图-->
            <div class="swiper-slide">
                <div class="w_page_four">
                    <div class="page_bgfour">
                        <!--顶部上的三大福利-->
                        <div class="page_four_top ani" swiper-animate-effect="slideInDown" swiper-animate-duration="0.5s" swiper-animate-delay="0.3s">
                            <img src="<b:staticUrl>/res/img/anniversary/four/welfare.png</b:staticUrl>" alt="">
                            <div class="line_w"></div>
                        </div>
                        <!--福利一-->
                        <div class="welfare">
                            <img src="<b:staticUrl>/res/img/anniversary/four/welfare1.png</b:staticUrl>" alt="" class="welfare_one ani" swiper-animate-effect="rotateIn" swiper-animate-duration="0.5s" swiper-animate-delay="0.3s">
                            <!--活动时间和详情-->
                            <div class="text">
                                <img src="<b:staticUrl>/res/img/anniversary/four/data.png</b:staticUrl>" alt="" class="activity_time ani" swiper-animate-effect="lightSpeedIn" swiper-animate-duration="0.5s" swiper-animate-delay="0.3s">
                                <img src="<b:staticUrl>/res/img/anniversary/four/details.png</b:staticUrl>" alt="" class="activity_details ani" swiper-animate-effect="lightSpeedIn" swiper-animate-duration="0.5s" swiper-animate-delay="0.3s">
                            </div>
                            <!--福利图片展示-->
                            <div class="welfare_exhibition">
                                <ul class="clearfix exhibition_img  ani" swiper-animate-effect="slideInRight" swiper-animate-duration="0.5s" swiper-animate-delay="0.3s">
                                    <li>
                                        <img src="<b:staticUrl>/res/img/anniversary/four/book.png</b:staticUrl>" alt="" class="ex_img">
                                    </li>
                                    <li>
                                        <img src="<b:staticUrl>/res/img/anniversary/four/add.png</b:staticUrl>" alt="" class="add">
                                    </li>
                                    <li>
                                        <img src="<b:staticUrl>/res/img/anniversary/four/voucher.png</b:staticUrl>" alt="" class="ex_img">
                                    </li>
                                    <li>
                                        <img src="<b:staticUrl>/res/img/anniversary/four/add.png</b:staticUrl>" alt="" class="add">
                                    </li>
                                    <li>
                                        <img src="<b:staticUrl>/res/img/anniversary/four/umbrella.png</b:staticUrl>" alt="" class="ex_img">
                                    </li>
                                </ul>
                                <ul class="clearfix exhibition_text  ani" swiper-animate-effect="slideInleft" swiper-animate-duration="0.5s" swiper-animate-delay="0.3s">
                                    <li>
                                        <img src="<b:staticUrl>/res/img/anniversary/four/lm.png</b:staticUrl>" alt="" class="text_lm">
                                    </li>
                                    <li>
                                        <img src="<b:staticUrl>/res/img/anniversary/four/yhq.png</b:staticUrl>" alt="" class="text_yhq">
                                    </li>
                                    <li>
                                        <img src="<b:staticUrl>/res/img/anniversary/four/ys.png</b:staticUrl>" alt="" class="text_ys">
                                    </li>
                                </ul>
                            </div>
                        </div>  
                        <!--背景图的下面的曲线-->
                        <div class="page_two_footer">
                            <img src="<b:staticUrl>/res/img/anniversary/homepage/img_1_02.png</b:staticUrl>" alt="">
                        </div>
                    </div>
                </div>
            </div>

            <!--第四张福利的第二张图-->
            <div class="swiper-slide">
                <div class="w_page_four">
                    <div class="page_bgfour">
                        <!--顶部上的三大福利-->
                        <div class="page_four_top ani" swiper-animate-effect="slideInDown" swiper-animate-duration="0.5s" swiper-animate-delay="0.3s">
                            <img src="<b:staticUrl>/res/img/anniversary/four/welfare.png</b:staticUrl>" alt="">
                            <div class="line_w"></div>
                        </div>
                        <!--福利一-->
                        <div class="welfare">
                            <img src="<b:staticUrl>/res/img/anniversary/four/welfare2.png</b:staticUrl>" alt="" class="welfare_one ani" swiper-animate-effect="rotateIn" swiper-animate-duration="0.5s" swiper-animate-delay="0.3s">
                            <!--活动时间和详情-->
                            <div class="text">
                                <img src="<b:staticUrl>/res/img/anniversary/four/fl2.png</b:staticUrl>" alt="" class="activity_time ani" swiper-animate-effect="lightSpeedIn" swiper-animate-duration="0.5s" swiper-animate-delay="0.3s">
                                <img src="<b:staticUrl>/res/img/anniversary/four/fl2_text.png</b:staticUrl>" alt="" class="activity_details ani" swiper-animate-effect="lightSpeedIn" swiper-animate-duration="0.5s" swiper-animate-delay="0.3s">
                            </div>
                            <!--福利图片展示-->
                            <div class="welfare_exhibition">
                                <ul class="clearfix exhibition_img ani"  swiper-animate-effect="slideInRight" swiper-animate-duration="0.5s" swiper-animate-delay="0.3s">
                                    <li>
                                        <img src="<b:staticUrl>/res/img/anniversary/four/book.png</b:staticUrl>" alt="" class="ex_img">
                                    </li>
                                    <li>
                                        <img src="<b:staticUrl>/res/img/anniversary/four/add.png</b:staticUrl>" alt="" class="add">
                                    </li>
                                    <li>
                                        <img src="<b:staticUrl>/res/img/anniversary/four/voucher.png</b:staticUrl>" alt="" class="ex_img">
                                    </li>
                                    <li>
                                        <img src="<b:staticUrl>/res/img/anniversary/four/add.png</b:staticUrl>" alt="" class="add">
                                    </li>
                                    <li>
                                        <img src="<b:staticUrl>/res/img/anniversary/four/100coupon.png</b:staticUrl>" alt="" class="ex_img">
                                    </li>
                                </ul>
                                <ul class="clearfix exhibition_text ani" swiper-animate-effect="slideInleft" swiper-animate-duration="0.5s" swiper-animate-delay="0.3s">
                                    <li>
                                        <img src="<b:staticUrl>/res/img/anniversary/four/lm.png</b:staticUrl>" alt="" class="text_lm">
                                    </li>
                                    <li>
                                        <img src="<b:staticUrl>/res/img/anniversary/four/yhq.png</b:staticUrl>" alt="" class="text_yhq">
                                    </li>
                                    <li>
                                        <img src="<b:staticUrl>/res/img/anniversary/four/100coupon2.png</b:staticUrl>" alt="" class="text_ys">
                                    </li>
                                </ul>
                            </div>
                        </div>  
                        <!--背景图的下面的曲线-->
                        <div class="page_two_footer">
                            <img src="<b:staticUrl>/res/img/anniversary/homepage/img_1_02.png</b:staticUrl>" alt="">
                        </div>
                    </div>
                </div>
            </div>

            <!--第四张福利的第三张图-->
            <div class="swiper-slide">
                <div class="swiper-slide">
                    <div class="w_page_four">
                        <div class="page_bgfour">
                            <!--顶部上的三大福利-->
                            <div class="page_four_top ani" swiper-animate-effect="slideInDown" swiper-animate-duration="0.5s" swiper-animate-delay="0.3s">
                                <img src="<b:staticUrl>/res/img/anniversary/four/welfare.png</b:staticUrl>" alt="">
                                <div class="line_w"></div>
                            </div>
                            <!--福利一-->
                            <div class="welfare">
                                <img src="<b:staticUrl>/res/img/anniversary/four/welfare3.png</b:staticUrl>" alt="" class="welfare_one ani" class="welfare_one ani" swiper-animate-effect="rotateIn" swiper-animate-duration="0.5s" swiper-animate-delay="0.3s">
                                <!--活动时间和详情-->
                                <div class="text">
                                    <img src="<b:staticUrl>/res/img/anniversary/four/fl3.png</b:staticUrl>" alt="" class="activity_time ani" swiper-animate-effect="lightSpeedIn" swiper-animate-duration="0.5s" swiper-animate-delay="0.3s">
                                    <img src="<b:staticUrl>/res/img/anniversary/four/fl3_text.png</b:staticUrl>" alt="" class="activity_details ani" swiper-animate-effect="lightSpeedIn" swiper-animate-duration="0.5s" swiper-animate-delay="0.3s">
                                </div>
                                <!--福利图片展示-->
                                <div class="welfare_exhibition">
                                    <ul class="clearfix exhibition_img exhibition_img_three ani"   swiper-animate-effect="slideInRight" swiper-animate-duration="0.5s" swiper-animate-delay="0.3s">
                                        <li>
                                            <img src="<b:staticUrl>/res/img/anniversary/four/book.png</b:staticUrl>" alt="" class="ex_img  ex_img_three">
                                        </li>
                                        <li>
                                            <img src="<b:staticUrl>/res/img/anniversary/four/add.png</b:staticUrl>" alt="" class="add add_three">
                                        </li>
                                        <li>
                                            <img src="<b:staticUrl>/res/img/anniversary/four/voucher.png</b:staticUrl>" alt="" class="ex_img   ex_img_three">
                                        </li>
                                    </ul>
                                    <ul class="clearfix exhibition_text ani"  swiper-animate-effect="slideInleft" swiper-animate-duration="0.5s" swiper-animate-delay="0.3s">
                                        <li>
                                            <img src="<b:staticUrl>/res/img/anniversary/four/lm.png</b:staticUrl>" alt="" class="text_lm text_three_lm">
                                        </li>
                                        <li>
                                            <img src="<b:staticUrl>/res/img/anniversary/four/yhq.png</b:staticUrl>" alt="" class="text_yhq text_three_yhq">
                                        </li>
                                    </ul>
                                </div>
                            </div>  
                            <!--背景图的下面的曲线-->
                            <div class="page_two_footer">
                                <img src="<b:staticUrl>/res/img/anniversary/homepage/img_1_02.png</b:staticUrl>" alt="">
                            </div>          
                        </div>
                    </div>
                </div>
            </div>

            <!--第五张图-->
            <div class="swiper-slide">
                <div class="w_page_five">
                    <div class="page_bgfive">
                        <!--顶部上的vip-->
                        <div class="page_five_top ani" swiper-animate-effect="fadeInUp" swiper-animate-duration="0.5s" swiper-animate-delay="0.3s">
                            <img src="<b:staticUrl>/res/img/anniversary/five/title.png</b:staticUrl>" alt="">
                            <div class="line_w"></div>
                        </div>  
                        <div class="welfare_five">   
                                <img src="<b:staticUrl>/res/img/anniversary/five/peop.png</b:staticUrl>" alt="" class="welfare_one ani" swiper-animate-effect="rotateIn" swiper-animate-duration="0.5s" swiper-animate-delay="0.3s">
                                <!--活动时间和详情-->
                                <div class="text">
                                    <img src="<b:staticUrl>/res/img/anniversary/five/font.png</b:staticUrl>" alt="" class="ani" swiper-animate-effect="lightSpeedIn" swiper-animate-duration="0.5s" swiper-animate-delay="0.3s">
                                </div>
                                <div class="luck">
                                    <a href="#">
                                        <img src="<b:staticUrl>/res/img/anniversary/five/luck.png</b:staticUrl>" alt="" class="ani" swiper-animate-effect="zoomIn" swiper-animate-duration="0.5s" swiper-animate-delay="0.3s">
                                    </a>
                                </div>
                            </div> 
                        <!--背景图的下面的曲线-->
                        <div class="page_two_footer">
                            <img src="<b:staticUrl>/res/img/anniversary/homepage/img_1_02.png</b:staticUrl>" alt="">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<div class="share">
		<div class="shareBox">
			<div class="sharearrow"></div>
			<p class="font15" style="margin-top: 40px;">分享本链接可获得一次抽奖机会，100%中奖</p>
			<p class="font15">点击屏幕右上角分享到朋友圈吧！</p>
		</div>
	</div>
<script type="text/javascript">
$(function(){
	$(".share").click(function(){
		$(".share").hide();
	});
	$('.luck').on('click',function(){
		$(".share").show();
	});
	
	//定时器
	var timer=null;
	clearInterval(timer);
	timer = setInterval(function() {
		var video=$('.swiper-slide-active').find('video');
		if(video.length>0){
			video[0].play();
			clearInterval(timer);
		}
	}, 1000);
})
</script>
    <script>
        var swiper = new Swiper('.swiper-container', {
            pagination: '.swiper-pagination',
            direction: 'vertical',
            slidesPerView: 1,
            paginationClickable: true,
            spaceBetween: 30,
            mousewheelControl: true,
            onInit: function(swiper){ //Swiper2.x的初始化是onFirstInit
                swiperAnimateCache(swiper); //隐藏动画元素 
                swiperAnimate(swiper); //初始化完成开始动画
            }, 
            onSlideChangeEnd: function(swiper){ 
                // alert(swiper.activeIndex) //切换结束时，告诉我现在是第几个slide
                swiperAnimate(swiper); //每个slide切换结束时也运行当前slide动画
            } 
        });

    </script>
</body>
</html>