<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta name="format-detection" content="email=no"/>
    <title>喵姐早教说</title>
	<%@include file="../header_v2.4.0.jsp" %>
 <link rel="stylesheet" href="<b:staticUrl>/res/css/vip.css</b:staticUrl>">
	</head>
	<body>
		<div class="wrapPage vipPage">
			<img src="<b:staticUrl>/res/img/vip-page/vip_01.png</b:staticUrl>" alt="" />
			<img src="<b:staticUrl>/res/img/vip-page/vip_02.png</b:staticUrl>" alt="" />
			<img src="<b:staticUrl>/res/img/vip-page/vip_03.png</b:staticUrl>" alt="" />
			<img src="<b:staticUrl>/res/img/vip-page/vip_04.png</b:staticUrl>" alt="" />
			<img src="<b:staticUrl>/res/img/vip-page/vip_05.png</b:staticUrl>" alt="" />
			<img src="<b:staticUrl>/res/img/vip-page/vip_06.png</b:staticUrl>" alt="" />
			<img src="<b:staticUrl>/res/img/vip-page/vip_07.png</b:staticUrl>" alt="" />
			<img src="<b:staticUrl>/res/img/vip-page/vip_08.png</b:staticUrl>" alt="" />
			<img src="<b:staticUrl>/res/img/vip-page/vip_09.png</b:staticUrl>" alt="" />
			<img src="<b:staticUrl>/res/img/vip-page/vip_10.png</b:staticUrl>" alt="" />
			<img src="<b:staticUrl>/res/img/vip-page/vip_11.png</b:staticUrl>" alt="" />
			<img src="<b:staticUrl>/res/img/vip-page/vip_12.png</b:staticUrl>" alt="" />
			<img src="<b:staticUrl>/res/img/vip-page/vip_13.png</b:staticUrl>" alt="" />
			<img src="<b:staticUrl>/res/img/vip-page/vip_14.png</b:staticUrl>" alt="" />
			<img src="<b:staticUrl>/res/img/vip-page/vip_15.png</b:staticUrl>" alt="" />
			<img src="<b:staticUrl>/res/img/vip-page/vip_16.png</b:staticUrl>" alt="" />
			<img src="<b:staticUrl>/res/img/vip-page/vip_17.png</b:staticUrl>" alt="" />
			<div class="vipFooter"></div>
			<a href="#joinFixed" class="joinFixed" onclick="pay();">立即支付（￥499）</a>
		</div>
<jsp:include page="../pay/coupon_new.jsp">
	<jsp:param value="YEARCARD" name="businessType"/>
	<jsp:param value="${money}" name="money"/>
	<jsp:param value="${relateId}" name="bizId"/>
</jsp:include>
<script src="<b:staticUrl>/res/js/wxmppay.js</b:staticUrl>"></script> 
<script>
var isWeixin = "${accessType == 'WEIXIN'}";
function pay(){
	showCoupon(vipCallback,".vipPage");
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
		var gotoUrl = "/yzmm/account/user/info";
		window.location.href="/yzmm/wxmppay/order/checkPay?type=VIPCARD&orderId="+orderId+"&toPage="+toPage+"&gotoUrl="+gotoUrl;
	  }else{
			window.history.back();
	  }
	  });
}
function renew(couponId){
	wxmppayrenew(couponId,function(orderId,result){
		if(result=="ok"){
			var toPage = "/yzmm/account/phoneRegProcess";
			var gotoUrl = "/yzmm/account/user/info";
			window.location.href="/yzmm/wxmppay/order/checkPay?type=VIPCARD&orderId="+orderId+"&toPage="+toPage+"&gotoUrl="+gotoUrl;
		}
	});
}
</script>
</body>
</html>