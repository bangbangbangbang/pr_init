<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta name="format-detection" content="telephone=no" />
	<meta name="format-detection" content="email=no"/>
	<title>喵姐早教说</title>
	<%@include file="header_v15.jsp" %>
	<script src="<b:staticUrl>/res/js/jquery.cookie.js</b:staticUrl>"></script>
	<script src="<b:staticUrl>/res/js/login/login.js</b:staticUrl>"></script>
	<script>
	if(self.parent && self.parent!=self)self.parent.location.href=self.location.href;
	</script>
</head>

<body>
<img src="/res/img/login/tit.png" class="titlogo">
<div class="formLogin">
	<div class="inputitem inputphone">
		<input type="tel" id='tel' placeholder="请输入手机号">
		<a class="clear"></a>
	</div>
	<div class="inputitem inputcode">
	<input type='hidden' id='validId'/>
		<input type="tel" id='pwd' placeholder="请输入动态密码">
		<a id='hqcode' style='cursor:pointer' class="getCode send" >获取动态密码</a>
	</div>
	<div class="drag" style='display:none'>
		<span class="right"></span>
		<div class="dragBg"></div>
		<div class="dragTxt">拖动滑块验证</div>
		<div class="dragBlock"></div>
	</div>

	<div class="formTxt"></div>
	<!-- <div class="formTxt">密码错误，请重新输入</div>
	<div class="formTxt">账号格式不正确，请重新输入</div> -->
	<a id='submit' style='cursor:pointer' class="loginBtn">登 录</a>
	<a onclick='cancel()' style='cursor:pointer' class="cancleBtn">取消</a>
</div>
<div class="loginOther">
	<div class="loginOtherBox">
		<span>第三方登录</span>
		<a href="/yzmm/weixin/open/login" class="loginWx">微信登录</a>
	</div>
</div>
<a href="/pages/wxFollow.jsp" class="more">了解更多</a>
<script>
var loginReferer = "${loginReferer}";
$(".dragBlock").slide();
if(typeof jsapp !='undefined'){
	$(".loginWx").attr("href","javascript:void(0)");
	$(".loginWx").click(function(){
		toastWaiting();
		jsapp.wxLogin();
		window.setTimeout(function(){
			toastWaitingColse();
		},10000)
	});
}
</script>
</body>
</html>