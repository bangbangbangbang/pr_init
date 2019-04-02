<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>喵姐早教说会员号</title>
    <%@include file="../header_v2.1.jsp" %>
    <script src="<b:staticUrl>/res/js/wxmppay.js</b:staticUrl>"></script>
    <script src="<b:staticUrl>/res/js/activity/activity.js</b:staticUrl>"></script>
    <style type="text/css">
	    .i-other {
		  display: block;
		  width: 11px;
		  height: 11px;
		  position: relative;
		  top: 50%;
		  margin-top: -5.5px;
		  background-image: url("../img/other@2x.png");
		  background-size: 11px 11px;
		}
		.centerLink .icon-coupon {
		    display: inline-block;
		    background: url("<b:staticUrl>/res/img/center/u443.png</b:staticUrl>") center center no-repeat;
		    background-size: 25px 20px;
		    background-position: left center;
		}
		.centerLink .icon-cpwd {
		    display: inline-block;
		    background: url("<b:staticUrl>/res/img/center/u234.png</b:staticUrl>") center center no-repeat;
		    background-size: 25px 20px;
		    background-position: left center;
		}
		.centerLink .icon-card {
		    display: inline-block;
		    background: url("<b:staticUrl>/res/img/center/l3@2x.png</b:staticUrl>") center center no-repeat;
		    background-size: 25px 23px;
		    background-position: left center;
		}
		.centerLink .icon-qa {
		    display: inline-block;
		    background: url("<b:staticUrl>/res/img/center/u186.png</b:staticUrl>") center center no-repeat;
		    background-size: 25px 20px;
		    background-position: left center;
		}
		.centerLink .icon-feed {
		    display: inline-block;
		    background: url("<b:staticUrl>/res/img/center/u196.png</b:staticUrl>") center center no-repeat;
		    background-size: 18px 20px;
		    background-position: left center;
		}
		
		.centerLink .icon-about {
		    display: inline-block;
		    background: url("<b:staticUrl>/res/img/center/u212.png</b:staticUrl>") center center no-repeat;
		    background-size: 25px 25px;
		    background-position: left center;
		}
		.centerMenu {
		    border-bottom: 0.12rem solid #efeff4;
		    border-top: 0.12rem solid #efeff4;
		}
		.userinfo{
			position: absolute;
		    top: 40px;
		    left: 110px;
		}
		.mebcenterTop:after {
		    content: '';
		    width: 100%;
		    height: 100%;
		    position: absolute;
		    left: 0;
		    top: 0;
		    background-color: #fff;
		}
		.mebcenterTop .name,.mebcenterTop .info {
		    color: #000;
		    text-align: left;
		}
		.centerMenu p {
		    font-size: 0.3rem;
		}
		.centerLink a {
		    font-size: 0.3333rem;
		}
		.centerMenu a {
		    padding-top: 0.3rem;
		}
		.centerMenu li {
		    padding-bottom: 0.26rem;
		}
		.centerLink li {
		    height: 1.26rem;
    		line-height: 1.26rem;
		}
		.centerLink .icon {
		    margin-right: 0.25rem;
		}

			.mebcenterTop .photo {
			    position: relative;
			    margin-left: 0.4rem;
			} 
			.mebcenterTop .photo .photoImg {
				width: 1.9rem;
			    height: 1.9rem;
			    border-radius: 50%;
			    border: 2px solid #F2F2F2;
			}
			.mebcenterTop .photo .crownImg {
				position: absolute;
			    top: 1.3rem;
			    left: 1.5rem;
			    width: 0.5rem;
			    z-index: 999;
			}
			.centerVip {
				width: 100%;
				max-width: 540px;
				position: relative;
				border-bottom: 0.12rem solid #efeff4;
			}
			.centerVip .vipImg {
				float: left;
				width: 10%;
				margin: 0.15rem 0.4rem 0.45rem;
			}
			.centerVip .vipImg img {
				width: 100%;	
			}
			.centerVip .vipText {
				float: left;
			}
			.centerVip .vipText :nth-child(1) {
				font-size: 0.38rem;
				color: #F0C960;
				padding: 0.4rem 0 0.2rem;
			}
			.centerVip .vipText :nth-child(2) {
				font-size: 0.3rem;
				color: #A1A1A1;
			}
			.centerVip .vipText :nth-child(2) span{
				font-size: 0.3rem;
				color: #F0C960;
			}
			.vipBuy {
				position: absolute;
				right: 0.4rem;
				top: -0.25rem;
			}
			.vipBuy  a{
				font-size: 0.38rem;
				color: #0099FF;
			}
    </style>
</head>
<body>
<div class="containerOther">
	 <div class="mebcenterTop">	
		<img  class="bigP" style="height: 140px;">
		<div class="mebcenterTopBox">
			<div class="cont">
				<div class="photo">
					<img src="${album}" alt="" class="photoImg">
					<c:if test="${isvip }">
						<img src="<b:staticUrl>/res/img/center/u10339.png</b:staticUrl>" alt="" class="crownImg">
					</c:if>
				</div>
				<div class="userinfo">
					<div class="name">${nickName}<span class="edit" onclick="window.location.href='/yzmm/account/user/infoDetail'"></span></div>
					<div class="info">
					<!-- <span class="icon-yun"></span>已怀孕  2周2天 -->
						<c:if test="${babyOrNot == 0}">
							<span class="i-other"></span>${babySex}
						</c:if>
						<c:if test="${babyOrNot == 1}">
							<span class="icon-yun"></span>${babyAge}
						</c:if>
						<c:if test="${babyOrNot == 2}">
							<c:if test="${babySex == '小公主'}">
								<span class="icon-girl"></span>${babySex}${babyAge}
							</c:if>
							<c:if test="${babySex == '小王子'}">
								<span class="icon-boy"></span>${babySex}${babyAge}
							</c:if>
						</c:if>
						<c:if test="${babyOrNot == 3}">
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
	<ul class="centerMenu">
		<li><a href="#"><div class="icon icon-road"></div><p>女神之路</p></a></li>
		<li><a href="/yzmm/account/sqwFoot/toFootmarkList"><div class="icon icon-step"></div><p>足迹</p></a></li>
		<li><a href="/yzmm/account/tip/tiplist"><div class="icon icon-order"></div><p>订单</p></a></li>
		<li><a href="/yzmm/account/user/collectList"><div class="icon icon-fav"></div><p>收藏</p></a></li>
	</ul>
	<c:if test="${isvip }">
		<!--会员进来看到的页面-->
		<ul class="centerVip clearfix" onclick="tovip()">
			<li class="vipImg">
				<img src="<b:staticUrl>/res/img/center/u10347.png</b:staticUrl>" alt="" />
			</li>	
			<li class="vipText">
				<p>VIP会员特权</p>
				<p>${enYear}.${enMonth}.${enDay}会员到期</p>
			</li>	
			<li class="vipBuy">
				<a href="#">续费  ></a>
			</li>	
		</ul>
	</c:if>
	<c:if test="${!isvip }">
		<!--小白进来看到的界面-->
		<ul class="centerVip clearfix" onclick="tovip()">
			<li class="vipImg">
				<img src="<b:staticUrl>/res/img/center/u10347.png</b:staticUrl>" alt="" />
			</li>	
			<li class="vipText">
				<p>VIP会员特权</p>
				<p>现在购买，可领价值<span>1100元</span>优惠券礼包</p>
			</li>	
			<li class="vipBuy">
				<a href="#">立即购买  ></a>
			</li>	
		</ul>
	</c:if>
	<ul class="centerLink">
		<!-- <li><a href="/yzmm/account/VIPStatus"><span class="icon icon-card"></span>VIP会员卡</a></li> -->
		<li><a href="/yzmm/account/miaoqa/tomiao"><span class="icon icon-qa"></span>我的提问</a></li>
		<li><a href="/yzmm/account/usercoupon/useCouponList"><span class="icon icon-coupon"></span>优惠券<img class="redpoint newcoupon" alt="redpoint.png" src="<b:staticUrl>/res/img/redpoint.png</b:staticUrl>"> </a></li>
		<li><a href="/yzmm/account/evaluation/list"><span class="icon icon-cpwd"></span>测评 </a></li>
		<li><a href="/yzmm/account/course/orderLiveList"><span class="icon icon-lesson"></span>最新直播课</a></li>
		<div style="border-top: 0.12rem solid #efeff4;"></div>
		<li><a href="/yzmm/account/feedback/index"><span class="icon icon-feed"></span>意见反馈</a></li>
		<li><a href="/yzmm/account/user/toAbout"><span class="icon icon-about"></span>关于</a></li>
	</ul>
	<c:if test="${isNotWeixin}">
		<div class="exitBtn"><a href="javascript:loginout()">退出登录</a></div>
	</c:if>
</div>
<div class="containerAct" style="display: none; top: 100%;">
	<h1 class="activityTitle">女神之路<span class="backBtn"></span></h1>
	<ul class="honorTag">
		<!-- 荣誉勋章内容 -->
	</ul>
	<ul class="workcardList">
		<li class="workcardItem">
			<div class="il">
				<div class="tit">作业补交卡</div>
				<div class="name">【第5期】手刃坏脾气，重做奶茶妈荣获优秀学员卡</div>
			</div>
			<div class="ir">
				<div class="tag"><span>未使用</span></div>
				<div class="date">有效期<br>2017.1.12-2017.9.12</div>
			</div>
		</li>
		<li class="workcardItem workcardItemGray">
			<div class="il">
				<div class="tit">作业补交卡</div>
				<div class="name">【第5期】手刃坏脾气，重做奶茶妈荣获优秀学员卡</div>
			</div>
			<div class="ir">
				<div class="tag tag1"><span>已使用（第5天使用）</span></div>
				<div class="date">有效期<br>2017.1.12-2017.9.12</div>
			</div>
			<div class="used"></div>
		</li>
		<li class="workcardItem workcardItemGray">
			<div class="il">
				<div class="tit">作业补交卡</div>
				<div class="name">【第5期】手刃坏脾气，重做奶茶妈荣获优秀学员卡</div>
			</div>
			<div class="ir">
				<div class="tag tag2"><span>已过期</span></div>
				<div class="date">有效期<br>2017.1.12-2017.9.12</div>
			</div>
			<div class="timed"></div>
		</li>
	</ul>
</div>
<jsp:include page="/pages/header_footer.jsp">
		<jsp:param value="4" name="menu"/>
</jsp:include>
<script type="text/javascript">
var isWeixin = "${accessType == 'WEIXIN'}";
function tovip(){
	HH.href('/yzmm/account/VIPStatus');
}
function loginout(){
	if(typeof jsapp !='undefined'){
		jsapp.logout();
		window.location.href="/yzmm/index";
		return;
	}
	var url = '/yzmm/account/ajaxLogout';
	HH.ajax({
		waiting:false,
		data:{},
		url:url,
		success:function(data){
			if(data.success){				
				window.location.href="/yzmm/index";
			}
		},
	});
}

</script>
</body>
</html>