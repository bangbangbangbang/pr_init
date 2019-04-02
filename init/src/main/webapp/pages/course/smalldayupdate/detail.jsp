<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--忽略页面中的邮箱格式为邮箱-->
<meta name="format-detection" content="email=no"/>
 <%@include file="../../header_v2.2.jsp" %>
 <%@include file="../../header_wxjsapi.jsp"%>
 <script src="<b:staticUrl>/res/js/home/course/microcamp.js</b:staticUrl>"></script>
 <script src="<b:staticUrl>/res/js/home/course/carousel.js</b:staticUrl>"></script>
 <link rel="stylesheet" href="<b:staticUrl>/res/css/course/page/details.css</b:staticUrl>">
 <link rel="stylesheet" href="<b:staticUrl>/res/css/course/audio.css</b:staticUrl>">
 <link rel="stylesheet" href="<b:staticUrl>/res/css/navigator.css</b:staticUrl>">
<title>喵姐早教说</title>
    <link rel="stylesheet" href="<b:staticUrl>/res/css/base.css</b:staticUrl>">
    <link rel="stylesheet" href="<b:staticUrl>/res/css/banner.css</b:staticUrl>">
<style type="text/css">
.share1 {
		    display: none;
		    width: 100%;
		    max-width: 540px;
		    margin: 0 auto;
		    height: 100%;
		    position: fixed;
		    top: 0;
		    z-index: 100;
		    background-color: rgba(0, 0, 0, 0.8);
		}
		.share1 .shareBox {
		    width: 100%;
		    padding-top: 1.12rem;
		    position: relative;
		}
		.share1 .sharearrow {
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
		.share1 p {
		    margin-bottom: 0.26666667rem;
		    text-align: center;
		    color: #f8e71c;
		}
		.showname{
			font-size: 0.5rem;
			padding: 0.1rem 0.1rem 0rem;
			color: #000;
			line-height: 0.9rem;
			font-weight: bold;
		}
    </style>
    <script type="text/javascript">
    var id = "${id}";
    var mywxfenxiangcb={
    		title: '${wxshare.title}', // 分享标题
    		desc : '${wxshare.desc}',
    	    link: '${wxshare.link}', // 分享链接
    	    imgUrl: '${wxshare.imgUrl}', // 分享图标
    	    shareTimeline:function(bool){
    	    	if('${isAuth}'=='true'){
    	    		HH.ajax({
        	    		waiting:false,
        	    		data:{shareType:"DAYUPDATE",shareRelateId:id},
        	    		url:"/yzmm/account/sharetofriend/createShare",
        	    		callback:function(data){
        	    			$(".share1").hide();
        	    		}
        	    	});
    	    	}
    	    },
    	    shareAppMessage:function(bool){
    	    	if('${isAuth}'=='true'){
    	    		HH.ajax({
        	    		waiting:false,
        	    		data:{shareType:"DAYUPDATE",shareRelateId:id},
        	    		url:"/yzmm/account/sharetofriend/createShare",
        	    		callback:function(data){
        	    			$(".share1").hide();
        	    		}
        	    	});
    	    	}
    	    }
    };
	initwxfx(mywxfenxiangcb);
	</script>
</head>
<body>
	<c:if test="${not empty comeinNumber}">
		<!--改版banner 开始-->
		<div class="banner">       
		    <div class="banner_top">
		        <a href="javascript:void(0)">关注&nbsp;<font>"喵姐早教说"</font>&nbsp;育儿顾问领回家</a>
		    </div>
			<!--<div>-->
				<img src="<b:staticUrl>/res/img/redpage/u402.png</b:staticUrl>" alt="" class="line">
			<!--</div>-->
			<p class="banner_con">恭喜，你是第 ${comeinNumber} 个抢到的</p>
		    <div class="banner_bottom clearfix">
		        <div class="banner_bottom_l">
					<img src="<b:staticUrl>/res/img/redpage/u406.png</b:staticUrl>" alt="">
				</div>
		        <div class="banner_bottom_r">
					<img src="<b:staticUrl>/res/img/redpage/u404.png</b:staticUrl>" alt="">
				</div>
		    </div>
		</div>
		<!--改版banner 结束-->
	</c:if>
    <div class="details_page">
        <!--详情页的标题开始-->
        <div class="details_header">
            <a href="#">
                <p class="showname">${joinCourseResp.themeContent }</p>
                <div style="color: #A1A1A1; padding: 0rem 0.1rem 0.1rem; font-size: 0.30rem;">#&nbsp;${joinCourseResp.themeName } &nbsp;&nbsp;•&nbsp;&nbsp;${joinCourseResp.tcUid }&nbsp;#</div>
            </a>
        </div>
        <!--详情页的标题结束-->

       <div class="section">
	    <div class="audioCont topaudio">
	        <!--音频标签-->
	        <audio preload="auto" id="audio" src=""></audio>
	        <!--上面的进度条，时间-->
	        <div class="topaudioBox">
	            <!--开始时间-->
	            <span class="txt">00:00</span>
	            <div class="audioLine">
	                <!--进度条上的小圆点-->
	                <span class="lineaft"></span>
	                <div class="active"></div>
	                <!--进度条上的小圆点-->
	                <a href="javascript:void(0);" class="circle" id="drag"></a>
	            </div>
	            <!--结束时间-->
	            <span class="txt2" data-sec="0">${playTimeLen }</span>
	        </div>
	        <!--下面的暂停播放按钮-->
	        <div>
	            <table class="canplay">
	                <tbody>
	                <tr>
	                    <!--喜欢-->
	                    <td onclick="like1()">
	                        <span class="like" style="background: url('<b:staticUrl>/res/img/u1757.png</b:staticUrl>') no-repeat;background-size: 30%;padding-left: 30px;">喜 欢</span>
	                    </td>
	                    <!--中间的暂停播放按钮-->
	                    <td>
	                        <!--默认的是：在不是会员的情况下，显示的是会员专享-->
	                        <img class="viponly" src="<b:staticUrl>/res/img/bofang.png</b:staticUrl>">
	                        <!--成为会员后，此处是点击播放的切换-->
	                        <div class="playBtn ui-play play"></div>
	                    </td>
	                    <!--最右侧的分享-->
	                    <td onclick="$('.share1').show()">
	                    	<c:choose>
	                    		<c:when test="${isAuth}">
	                    			 <span class="share" style="background: url('<b:staticUrl>/res/img/u35.png</b:staticUrl>') no-repeat;background-size: 25%;padding-left: 30px;">请朋友听</span>
	                    		</c:when>
	                    		<c:otherwise>
	                    			<span class="share" style="background: url('<b:staticUrl>/res/img/u1755.png</b:staticUrl>') no-repeat;background-size: 30%;padding-left: 30px;">分 享</span> 
	                    		</c:otherwise>
	                    	</c:choose>
	                  
	                    </td>
	                </tr>
	                </tbody>
	            </table>
	        </div>
	    </div>
	</div>
       <!--暂停播放的audio结束-->



       <!--底部的图片-->
       <div class="footer_img">
			<c:forEach items="${imgs }" var="item">
	            <img src="${item }" alt="">
			</c:forEach>
       </div>
    </div>
    <div class="share1">
		<div class="shareBox">
			<div class="sharearrow"></div>
			<c:choose>
               		<c:when test="${isAuth}">
               			<p class="font15" style="margin-top: 40px;">可免费邀请5位好友一起学习</p>
					<p class="font15">好知识值得分享！</p>
               		</c:when>
               		<c:otherwise>
               			<p class="font15" style="margin-top: 40px;">独乐了不如众乐乐</p>
					<p class="font15">点击屏幕右上角分享给好友！</p>
				</c:otherwise>
               	</c:choose>
			
		</div>
	</div>
    <script type="text/javascript">
    var topicCid = "${joinCourseResp.courseId }";
    var playUrl='${joinCourseResp.playUrl }';
    var timeLen=parseInt('${joinCourseResp.timeLen}');
    var isplay=false;
   	function like1(){
			toast("喜欢 +1 ~")
	}
    $(function(){
    	 var playImg='<b:staticUrl>/res/img/bofang.png</b:staticUrl>';
 		var pauseImg='<b:staticUrl>/res/img/zanting.png</b:staticUrl>';
 		$("#toDayMiao img").on('click',function(){
 			var img=$(".con_suspend");
 			var src=$(".con_suspend").attr('src');
 			if(src==playImg){
 				$(".con_suspend").attr('src',pauseImg);
 			}else{
 				$(".con_suspend").attr('src',playImg);
 			}
 		})
 		$(".share1").click(function(){
 			$(".share1").hide();
 		});
 		$('.playBtn').on('click',function(){
 			if(playUrl==""){
				toast('会员专享');
				throw '会员专享';
 			}else{
 				if(!isplay){
 					isplay=true;
		 			$('#audio').attr('src',playUrl);
 				}
 			}
 		});
    })
	</script>
	<script src="<b:staticUrl>/res/js/streamAudio_smalldayupdate_heartbeat.js</b:staticUrl>"></script>
</body>
</html>