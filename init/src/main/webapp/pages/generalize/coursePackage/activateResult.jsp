<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="/commons/header-static.jsp" %>
<%@include file="../../header_wxjsapi.jsp"%>
<html>
<head>
<meta charset="UTF-8">
<title>喵姐早教说</title>
	<script src="<b:staticUrl>/res/js/jquery-2.1.1.min.js</b:staticUrl>"></script> 
	<script type="text/javascript">
	var redirectUrl = "$redirectUrl";
	var i = 5;
	$(function(){
          setInterval(function(){
        	  	i--
        	  	if(i>0){	
        	  		$("#closeDiv").html(i+"秒后自动关闭");
        	  	}
          },1000);
	});
	var wxfenxiangcb={
		ready:function(){
			setTimeout(function(){
				//wx.closeWindow();
			},5000);
		}
	}
	initwxfx(wxfenxiangcb);
	
	var errorMsg = "${errorMsg}";
	</script>
</head>
<body>
	<div>
		<img style="width: 100%" src="<b:staticUrl>/res/img/weixin_subscribe_page.jpg</b:staticUrl>">
		<span id="closeDiv" style="position: absolute;left:70px;top: 20px;font-size: 40px;color: rgba(0, 0, 0, 0.5);">
			5秒后自动关闭
		</span>
	</div>
</body>
</html>