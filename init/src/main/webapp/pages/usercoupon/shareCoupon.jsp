<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head lang="en">
<meta charset="UTF-8">
<title>喵姐早教说</title>
<%@include file="../header_v2.1.jsp"%>
    <%@include file="../header_wxjsapi.jsp"%>
<style type="text/css">
		.share {
		    display:block;
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
		.mainDiv{
			padding: 15px 12px;
    		background-color: rgba(242, 242, 242, 1);
		}
		.mainDiv .headImg img{
			width: 100%;
		}
		.fengexian {
			width: 99%;
			height: 1px;
			background-repeat: repeat-x;
			background-image:url("<b:staticUrl>/res/img/cp/wd/onexuxian2.png</b:staticUrl>");
			margin: 10px;
		}
		.mainDiv .section{
			margin: 10px;
		    font-size: 12px;
		    background: white;
		    padding: 0 20px 10px 20px;
		    line-height:15px;
		}
		.mainDiv .section .title img{
			width:12px;
		}

		.mainDiv .section .title a{
			 color: #000;
		}
		.overdue .section .title a{
			 color: #868686;
		}
		.mainDiv .section .content2{
			font-size: 0.8rem;
			margin: 0.6rem 0px;
		}
		.mainDiv .section .content2 sup{
			font-size: 10px;
   			 margin-left: 5px;
		}
		.mainDiv .section .content2 span{
			font-size: 10px;
			margin-left: 12px;
		}
		.mainDiv .section .content2 label{
			font-size: 12px;
		}
		  
		.mainDiv .section .forgive{
			float:right;
			color:#0099ff;
			margin-right: -20px;
			margin-top: 13px;
		}
		.mainDiv .section .isoverday{
			float: right;
		    color: #000;
		    font-weight: 500;
		    margin-right: -15px;
		    margin-top: 13px;
		}
		.overdue .section {
			    border-bottom: 5px solid #979797;
			    box-shadow: 0 4px 0px #cccccc;
		}
		.mainDiv .section .foot{
			margin: 12px 0 0 0;
			color:#0099ff;
			font-weight: 500;
		}
		.mainDiv .section .foot .give{
			float:right;
		}
		.mainDiv .section .foot .time{
			color:#aeaeae;
		}
		.mainDiv .section .yuan{
			top: 30px;
		    left: -25px;
		    position: relative;
		}
		.mainDiv .section .yuan2{
			float: right;
		    position: relative;
		    top: 33px;
		    left: 25px;
		}
		.mainDiv .section .outdate{
		        float: right;
			    position: relative;
			    left: 20px;
		}
		.effectiveList .section{
			border-bottom: 5px solid rgba(255, 194, 28, 1);
			box-shadow: 0 4px 0px #cccccc;
		}
		.subtitle{
		text-align: center;
	    font-size: 17px;
	    line-height: 17px;
	   	margin-top: 20px;
		}
		.subtitle span:before{
			left: -100%;
		}
		.subtitle span:after{
			right:-100%;
		}
		.subtitle span{
			display: block;
		    width: 4.2rem;
		    position: relative;
		    margin: 0 auto;
		    text-align: center;
		    font-size: 0.3rem;
		    color: #979797;
		}
		.subtitle span:before,.subtitle span:after{
			    content: '';
			    width: 1.2rem;
			    height: 0;
			    position: absolute;
			    top: 50%;
			    border-top: 0.01333333rem solid #979797;
			    margin: 0 100px;
		}
		.overdue{
			    color: #868686;
		}
</style>
<script type="text/javascript">
	var shareId = '${id}';
	var wxfenxiangcb_dtl={
		title: '${wxshare.title}', // 分享标题
		desc : '${wxshare.desc}',
	    link: '${wxshare.link}', // 分享链接
	    imgUrl: '${wxshare.imgUrl}', // 分享图标
	    shareTimeline:function(bool){
	    	HH.ajax({
	    		waiting:false,
	    		data:{userCouponId:shareId},
	    		url:"/yzmm/account/usercoupon/giveUserCoupon",
	    		callback:function(data){
	    			HH.href("/yzmm/account/usercoupon/useCouponList");
	    		}
	    	});
	    },
	    shareAppMessage:function(bool){
	    	
	    	HH.ajax({
	    		waiting:false,
	    		data:{userCouponId:shareId},
	    		url:"/yzmm/account/usercoupon/giveUserCoupon",
	    		callback:function(data){
	    			HH.href("/yzmm/account/usercoupon/useCouponList");
	    		}
	    	});
	    }
	};
	initwxfxOnly(wxfenxiangcb_dtl);
</script>
</head>
<body>
	<section class="mainDiv">
				<div class="headImg">
					<img alt="" src="<b:staticUrl>/res/img/center/quan_header.jpg</b:staticUrl>">
				</div>
				<div class="effectiveList">
					<div class="section">
						<img class="yuan" src="<b:staticUrl>/res/img/center/u485.png</b:staticUrl>">
							<img class="yuan2" src="<b:staticUrl>/res/img/center/u485.png</b:staticUrl>">
							<div class="title">
								<c:choose>
									<c:when test="${userCoupon.type=='SINGLE'}">
										兑换券 |
									</c:when>
									<c:otherwise>
										现金券 |
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${userCoupon.businessType=='YEARCARD'}">
										<a href="/yzmm/account/VIPStatus"> VIP会员卡专场<img alt="" src="<b:staticUrl>/res/img/center/u519.png</b:staticUrl>"></a>
									</c:when>
									<c:when test="${userCoupon.businessType=='COURSE'||userCoupon.businessType=='COURSEPACKAGE'}">
										<a href="/yzmm/account/course/list"> 喵姐说专场<img alt="" src="<b:staticUrl>/res/img/center/u519.png</b:staticUrl>"></a>
									</c:when>
									<c:when test="${userCoupon.businessType=='MIAOQA'}">
										<a href="/yzmm/account/miaoqa/index"> 1对1咨询专场<img alt="" src="<b:staticUrl>/res/img/center/u519.png</b:staticUrl>"></a>
									</c:when>
									<c:when test="${userCoupon.businessType=='GODDESSACTIVITY'}">
										<a href="/yzmm/account/activitytype/list"> 行动计划专场<img alt="" src="<b:staticUrl>/res/img/center/u519.png</b:staticUrl>"></a>
									</c:when>
									<c:when test="${userCoupon.businessType=='ALL'}">
										<a href="/yzmm/index"> 全网通<img alt="" src="<b:staticUrl>/res/img/center/u519.png</b:staticUrl>"></a>
									</c:when>
									<c:when test="${userCoupon.businessType=='OBJECT'}">
										<a href="/yzmm/index"> 实物<img alt="" src="<b:staticUrl>/res/img/center/u519.png</b:staticUrl>"></a>
									</c:when>
									<c:otherwise>
										现金券 |
									</c:otherwise>
								</c:choose>
							</div>
							<div class="fengexian"></div>
							<div class="content2">
								<c:choose>
									<c:when test="${userCoupon.type=='SINGLE'}">
										<c:out value="${userCoupon.name}"></c:out><label>/张</label>
									</c:when>
									<c:when test="${userCoupon.type=='CASH'}">
										<i><sup>￥</sup><c:out value="${userCoupon.typeAmount/100}"></c:out></i>
										<c:if test="${not empty userCoupon.description}">
											<span><c:out value="${userCoupon.description}"></c:out></span>
										</c:if>
									</c:when>
								</c:choose>
							</div>
							<div class="foot">
								<div class="time">有效期：<c:out value=" ${startTime} - ${endTime}"></c:out></div>
						</div>
					</div>
				</div>
			</section>
	<div class="share">
		<div class="shareBox">
			<div class="sharearrow"></div>
			<p class="font15" style="margin-top: 40px;">独乐了不如众乐乐</p>
			<p class="font15">点击屏幕右上角分享给好友！</p>
		</div>
	</div>
<script type="text/javascript">
$(function(){
	$(".share").click(function(){
		$(".share").hide();
	});
})
</script>
</body>
</html>