<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta name="format-detection" content="telephone=no" />
	<meta name="format-detection" content="email=no"/>
	<%@include file="../header_v15.jsp"%>
	<script src="<b:staticUrl>/res/js/process/phoneReg.js</b:staticUrl>"></script>
</head>
<body id="bgwhite" class="hidden">
<form id="activeForm" action="/yzmm/account/phoneReg" onSubmit="return sub()">
	<input type="hidden" name="validId" id="validId" value="" />
	<input type="hidden" name="hUrl" id="hUrl" value="${hUrl }" />
	<div class="font15 regTit"><span class="i-note"></span>绑定手机号，第一时间获取更多育儿新资讯</div>
	<div class="font15 form">
		<div class="item form-item">
			<div class="item-tit">姓名：</div>
			<div class="item-cont"><input name="realName" id="realName" placeholder="请输入姓名" onkeyup=nameRegular(this)  onafterpaste=nameRegular(this) maxlength="20" class="font15" ></div>
			<span class="i-arrow"></span>
		</div>
		<div class="item form-item">
			<div class="item-tit">手机号：</div>
			<div class="item-cont"><input name="telephone" id="telephone" placeholder="请输入手机号" class="font15" ></div>
			<span class="i-arrow"></span>
		</div>	
		<div class="item form-item">
			<div class="item-tit">验证码：</div>
			<div class="item-cont"><input type="text" name="validCode" id="validCode" placeholder="请输入验证码" class="font15" ></div>
			<div class="item-tit send">获取验证码</div>
			<span class="i-arrow"></span>
		</div>
	</div>
	</form>
	<div class="btn"><a href="javascript:void(0)" class="font18 submit" onclick="active()">下一步</a></div>
	<div class="btn btn2"><a href="javascript:void(0)" class="font18 submit" onclick="cancelSubmit()">取消</a></div>
<!--尾部-->
<jsp:include page="/pages/header_footer.jsp">
	<jsp:param value="4" name="menu"/>
</jsp:include>
<script type="text/javascript">
//跳转url
var toUrl='${toUrl}';
var noToast='${noToast}';
if(noToast){
	toast('请先完善用户信息');
}
</script>
</body>
</html>