<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <%@include file="../../header_v13.jsp" %>
    <title>喵姐早教说</title>
</head>
<body>
<script src="<b:staticUrl>/res/js/wxmppay.js</b:staticUrl>"></script>
<script type="text/javascript">
var isWeixin = '${isWeixin}';
$(function(){
	  document.addEventListener("WeixinJSBridgeReady", function () {
		  onpay()
	  }, false); 
	 
});
function onpay(){
	if(isWeixin!="true"){
		toast("请您进入微信支付");
		return false;
	}
	var obj = $(this);
	var id = '${id}';
	wxmppayvirtualcard(id,function(orderId,result){
	if(result=="ok"){
		window.location.href="/yzmm/wxmppay/virtualcard/checkPay?orderId="+orderId;
	}
	});
}

</script>
</body>
</html>