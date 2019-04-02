<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head lang="en">
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta name="format-detection" content="email=no"/>
    <title>喵姐早教说</title>
    <%@include file="../header_v12_2.jsp" %>
    <link rel="stylesheet" href="<b:staticUrl>/res/css/style-v1.2.2.css</b:staticUrl>">
   <%@include file="../header_wxjsapi.jsp"%>
<link rel="stylesheet" type="text/css" href="<b:staticUrl>/res/css/common-v4.css</b:staticUrl>" />
 <style type="text/css">
 .item-cont{
 	padding: 0.1rem 0 0 0.4rem;
 }
 .item-cont h2{
 	color:#434343;
 }
 .item-cont p{
 	line-height: 0.45rem;
 	color:#AEAEAE;
 }
 .item-tit1{
	 width: 0rem;
	 margin-right: 0.48rem;
	 margin-top: -0.01rem;
 }
 .wrap-center .card {
    background: #fff;
}
 .card{
 	width:100%;
 	height: 4rem;
 	border: 0.02rem solid #EB3F42;
 	border-radius: 10px;
 	margin-top: 1rem;
 	position: relative;
 }
 .card p{
 	padding: 0 0 0 0.5rem;
 	text-align: left;
 	font-size:0.31rem;
 	line-height: 0.7rem;
 	color:#949494;
 }
 .card .txt{
 	font-family: 'HannotateSC-W5', 'Hannotate SC';
	font-size: 0.4rem;
	color:#EB3F42;
 }
 .card .favicon{
	width: 15%;
	-webkit-transform: rotate(335deg);
	-moz-transform: rotate(335deg);
	-ms-transform: rotate(335deg);
	transform: rotate(335deg);
	opacity: 0.3;
	position: absolute;
	bottom: 2%;
	right: 1.4%;
 } 
 .card .favicon img{
	width: 100%;
 }
 .txt span{
 	font-family: 'HannotateSC-W5', 'Hannotate SC';
	font-size: 0.5rem;
	text-align: right;
	padding: 0 0.5rem 0 0;
	color: #000000;
	position: relative;
	left: 23%;
 }
 .renew{
	position: absolute;
	bottom: 0%;
 }
 .renew a{
 	cursor:pointer;
 	color: #F28789;
 	text-decoration:underline;
 }
 .sharegift{
 	    font-size: 12px;
    line-height: 30px;
    color: rgba(255, 153, 0, 1);
    font-weight: 500;
    text-align: center;
 }
 #bgwhite {
    background: #FFC000;
}
 </style>
</head>
<body id="bgwhite">
<div class="wrap-center wrap2">
        <!-- VIP -->
		<c:choose>
			<c:when test="${isVip}">
				<div class="card">
					<c:if test="${vipOrigin == 'VIRTUAL_CARD'}">
						<p class="txt" >喵姐早教说 - VIP会员体验卡</p>
					</c:if>
					<c:if test="${vipOrigin != 'VIRTUAL_CARD'}">
						<p class="txt" >喵姐早教说 - VIP会员卡<span>￥${money}</span></p>
					</c:if>
					<c:if test="${not empty saYear}">
						<p class="font15">有效期：${saYear}年${saMonth}月${saDay}日 - ${enYear}年${enMonth}月${enDay}日</p>
						<c:if test="${not empty cardNo}">
							<p class="font15">卡号：${cardNo}</p>
						</c:if>
					</c:if>
					<p class="renew"><a onclick="pay()" class="font15">续&nbsp;&nbsp; 费</a></p>
					<div class="favicon"><img src="<b:staticUrl>/res/img/favicon.ico</b:staticUrl>" /></div>
				</div>
			</c:when>
			<c:otherwise>
				<div class="card">
					<p class="txt" >喵姐早教说 - VIP会员卡<span>￥${money}</span></p>
					<p class="renew"><a onclick="pay()" class="font15">购买VIP会员卡</a></p>
					<div class="favicon"><img src="<b:staticUrl>/res/img/favicon.ico</b:staticUrl>" /></div>
				</div>
			</c:otherwise>
		</c:choose>
		<c:if test="${canJoin=='true'}">
			<div class="sharegift">
				<p style="background-color: #e8e8e8;"><a>您有一份新用户专享礼未使用<span>></span></a></p>
			</div>
		</c:if>
		<ul class="center-info" style="display:none;">
			<li class="item">
				<div class="item-tit1"><span class="i-ku"></span></div>
				<div class="item-cont">
					<h2 class="font13">喵姐说</h2>
					<p class="font12">喵姐27年早教经验，打造家庭教育必听课程 让辣妈轻松学到最新、最权威的家庭教育专业课程</p>
				</div>
			</li>
			<li class="item">
				<div class="item-tit1"><span class="i-ke"></span></div>
				<div class="item-cont">
					<h2 class="font13">三千问</h2>
					<p class="font12">宝宝0-6岁所有遇见问题的权威答疑库 </p>
					<p class="font12">3分钟帮你解答一个育儿难题 </p>
					<p class="font12">2000万精英辣妈的育儿宝典 </p>
				</div>
			</li>
			<li class="item">
				<div class="item-tit1"><span class="i-wd"></span></div>
				<div class="item-cont">
					<h2 class="font13">育儿咨询</h2>
					<p class="font12">全年12次1对1个性化咨询</p>
					<p class="font12">喵姐量身定制，给出靠谱家庭教育建议</p>
				</div>
			</li>
			<!-- <li class="item" style="border-bottom: 0">
				<div class="item-tit1"><span class="i-hd"></span></div>
				<div class="item-cont">
					<h2 class="font13">女神行动计划</h2>
					<p class="font12">喵姐带你一起21天蜕变成长 ，21天，遇见一个更好的自己 </p>
					<p class="font12">详细方案、同伴学习、语音指导，导师点评</p>
				</div>
			</li> -->
		</ul>
	</div>
	<%@include file="shareToVipActivity.jsp"%>
<div class="wrap2">
	<jsp:include page="/pages/header_footer.jsp">
		<jsp:param value="4" name="menu"/>
	</jsp:include>
	<c:choose>
		<c:when test="${isVip}">
			<img style="width: 100%;" alt="" src="http://onlinefile.sevenkids.cn/uploadm/201705/19/1495200724470HH6M.jpg">
		</c:when>
		<c:otherwise>
			<img style="width: 100%;" alt="" src="http://onlinefile.sevenkids.cn/uploadm/201705/22/1495429513706q20a.jpg">
		</c:otherwise>
	</c:choose>
</div>
<jsp:include page="../pay/coupon.jsp">
	<jsp:param value="YEARCARD" name="businessType"/>
	<jsp:param value="${money}" name="money"/>
	<jsp:param value="${relateId}" name="bizId"/>
</jsp:include>
<script src="<b:staticUrl>/res/js/wxmppay.js</b:staticUrl>"></script> 
<script>
var isWeixin = "${accessType == 'WEIXIN'}";
function pay(){
	showCoupon(vipCallback,".wrap2");
}
function vipCallback(couponId){
	if(isWeixin!="true"){
		toast("请您进入微信支付");
		return false;
	}
	if("${status != 'ACTIVED'}" == "true"){
		toVip(couponId);
	}else{
		renew(couponId);
	}
}

function toVip(couponId){
  wxmppayfromfirstlogin(couponId,function(orderId,result){
	  if("ok"==result){
	  $("#back").val(1);
		//微信支付回调函数，指向本地ctl，进行判断
		var toPage = "/yzmm/account/phoneRegProcess";
		window.location.href="/yzmm/wxmppay/order/checkPay?type=VIPCARD&orderId="+orderId+"&toPage="+toPage;
	  }else{
			window.history.back();
	  }
	  });
}
function renew(couponId){
	wxmppayrenew(couponId,function(orderId,result){
		if(result=="ok"){
			var toPage = "/yzmm/account/phoneRegProcess";
			window.location.href="/yzmm/wxmppay/order/checkPay?type=VIPCARD&orderId="+orderId+"&toPage="+toPage;
		}
	});
}
</script>
</body>
</html>