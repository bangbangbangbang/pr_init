<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <%@include file="../../header_v13.jsp" %>
    <title>喵姐早教说</title>
</head>
<body>
<div class="wrap"></div>
<jsp:include page="../../pay/coupon.jsp">
	<jsp:param value="GODDESSACTIVITY" name="businessType"/>
	<jsp:param value="${baozhengjin}" name="baozhengjin"/>
	<jsp:param value="0" name="count"/>
	<jsp:param value="${money}" name="money"/>
	<jsp:param value="${id}" name="activityId"/>
</jsp:include>
<input type="hidden" id="t" value="0">
<script src="<b:staticUrl>/res/js/wxmppay.js</b:staticUrl>"></script>
<script type="text/javascript">
var isWeixin = '${isWeixin}';
$(function(){
	//当付过款重新进入该页面跳到列表
	if($("#t").val()!=0){
		window.location.href="/yzmm/account/activity/list";
	}
	  document.addEventListener("WeixinJSBridgeReady", function () {
		  onpay()
	  }, false); 
	 
});
function onpay(){
	 if(isWeixin!="true"){
		  toast("请您进入微信支付");
		  return false;
	 }
	showCoupon(callbackPay,".wrap");
}
function callbackPay(id){
	if(isWeixin!="true"){
		toast("请您进入微信支付");
		return false;
	}
	var activityId = "${id}";
	  wxmppayactivity(activityId,"${activityType}",id,function(orderId,result){
		  if("ok"==result){
			  var id = "${id}";
			  //付款后改变该页面默认值,防止重复支付
			  $("#t").val(1);
			//微信支付回调函数，指向本地ctl，进行判断
			var tourl = "/yzmm/account/activity/goddessplan/detail/statusSeleter";
			window.location.href="/yzmm/wxmppay/order/checkPay?couponId="+id+"&orderId="+orderId+"&toPage="+tourl+"&activityId=" + activityId ;
		  }else{
				window.history.back();
		  }
		});
}
</script>
</body>
</html>