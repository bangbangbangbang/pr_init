<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--忽略页面中的邮箱格式为邮箱-->
<meta name="format-detection" content="email=no"/>
 <%@include file="../../header_v2.0.jsp" %>
 <%@include file="../../header_wxjsapi.jsp"%>
<title>喵姐早教说</title>
<style type="text/css">
body {
	color: #000000;
	font-size: 0.32rem;
}

.section {
	position: relative;
	font-size: 0.32rem;
	font-weight: 400;
	font-style: normal;
	line-height: 0.5rem;
}

table {
	width: 100%;
	border: 0px;
	border-color: transparent;
	border-collapse: collapse;
	border-spacing: 0;
}

table td {
	position: relative;
	padding-top: 0.1rem;
}

.td1 {
	width: 1.7rem;
}

.td2 {
	
}
.toBtn{
	position: fixed;
	bottom:  0.6rem;
	right:  0.6rem;
}
.toBtn2{
	position: fixed;
    bottom: 0;
    width: 100%;
    height: 1.4rem;
    border: 1px solid #999;
    background: #fff;
    font-size: 0.40rem;
    line-height: 1.3rem;
}
.toBtn2 .right{
	float: right;
    width: 60%;
    background-color: rgba(255, 153, 0, 1);
    margin: 0 auto;
    text-align: center;
    color: #fff;
}
.toBtn div{
	border-radius: 1rem;
	background-color: #FF8319;
	line-height: 1rem;
	font-weight:bold;
	color:white;
	font-size:0.4rem;
	padding: 0 0.6rem;
	cursor: pointer;
}
</style>
</head>
<body>
<div class="mainWrap wrap">
<div class="section" style="min-height: 3rem;padding:0;">
	<img width="100%" src="${gl.img}">
	<div style="position: absolute;bottom: 0rem;color: white;padding: 0.32rem 0.32rem;  background: rgba(3,3,3,0.2); width: 100%;">
		<p style="font-size: 0.64rem;font-weight: bold;line-height: 0.8rem;">${gl.name}</p>
		<p style="font-size: 0.32rem;font-weight: bold;padding-top: 0.3rem;">${gl.remarks}</p>
	</div>
</div>
<%@include file="./index_content.jsp"%>
<div style="height: 2rem;">

</div>
<c:if test="${auth=='true'}">
	<div class="toBtn">
		<div onclick="toBtnClick();">立即订阅 ☞</div>
	</div>
</c:if>
<c:if test="${auth=='false'}">
	<div class="toBtn2">
		<c:if test="${payType=='VIP'}">
			<c:if test="${isVip=='true'}">
				<div class="payBtn right">订阅 :￥${vipPrice}<span style="font-size:0.28rem;">（  原价：￥${beginnerPrice}）</span></div>
			</c:if>
			<c:if test="${isVip=='false'}">
				<div class="payBtn right">订阅 :￥${beginnerPrice}<span style="font-size:0.28rem;">（ 会员5折）</span></div>
			</c:if>
		</c:if>
		<c:if test="${payType=='BEGINNER'}">
			<c:if test="${isVip=='false'}">
				<div class="payBtn right">订阅 :￥${beginnerPrice}<span style="font-size:0.28rem;">（ 会员免费）</span></div>
			</c:if>
		</c:if>
		<div style="text-align: center;" class="tryBtn">免费试听</div>
	</div>
</c:if>

<c:if test="${isShare}">
<jsp:include page="/pages/header_footer.jsp">
		<jsp:param value="2" name="menu"/>
</jsp:include>  
</c:if>
</div>
<script src="<b:staticUrl>/res/js/wxmppay.js</b:staticUrl>"></script>
<jsp:include page="../../pay/coupon.jsp">
	<jsp:param value="COURSEPACKAGE" name="businessType"/>
	<jsp:param value="${gl.img}" name="imgUrl"/>
	<jsp:param value="${gl.name}" name="name"/>
	<jsp:param value="0" name="count"/>
	<jsp:param value="${money}" name="money"/>
	<jsp:param value="${gl.id}" name="bizId"/>
</jsp:include>
<script type="text/javascript">
var isWeixin = '${isWeixin}';
$(function(){
	$(".payBtn").click(function(){
		 if(isWeixin!="true"){
			  toast("请您进入微信支付");
			  return false;
		 }
		showCoupon(callbackPay,".wrap");
	});
	
	$(".tryBtn").click(function(){
		HH.href("/yzmm/account/course/topic/toList?id=${id}");
	})
})

function callbackPay(id){
	var type = 'COURSEGROUPBUY';
	 var money = '${money}';
	 var body = "购买主题课包【￥"+money+"】";
	 var groupId = '${gl.relateId}';
	 if(!groupId){
		 return;
	 }
	 wxmpcoursegrouppay(money,body,groupId,id,type,function(orderId,result){
			 if(result=="ok"){
				 var tourl = "/yzmm/account/course/topic/toTopicCourseDetailByCgId";
			 	window.location.href="/yzmm/wxmppay/order/checkPay?couponId="+id+"&courseGroupId="+groupId+"&orderId="+orderId+"&toPage="+tourl;
			 }
		 });
	}
</script>
<script type="text/javascript">
function toBtnClick(){
	HH.href("/yzmm/account/course/topic/subscribeFree?id=${id}");
}
</script>
</body>
</html>