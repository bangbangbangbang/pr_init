<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <%@include file="../header.jsp" %>
    <title>喵姐早教说</title>
</head>
<body>
<input type="hidden" id="back" value="0">
<script src="<b:staticUrl>/res/js/wxmppay.js</b:staticUrl>"></script>
<script type="text/javascript">
$(function(){
	if($("#back").val()!=0){
		window.location.href="/yzmm/index";
	}
		
	  document.addEventListener("WeixinJSBridgeReady", function () { 
		  wxmppayfromfirstlogin(function(orderId,result){
			  if("ok"==result){
			  $("#back").val(1);
				//微信支付回调函数，指向本地ctl，进行判断
				window.location.href="/yzmm/wxmppay/newbie/checkPay?orderId="+orderId;
			  }else{
					window.history.back();
			  }
			  });
	    }, false); 
});
</script>
</body>
</html>