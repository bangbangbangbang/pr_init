<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>砸金蛋</title>
<!--忽略页面中的数字识别为电话号码-->  
<meta name="format-detection" content="telephone=no" />
<!--忽略页面中的邮箱格式为邮箱-->
<meta name="format-detection" content="email=no"/>
<%@include file="../header_v17.jsp"%>
<script src="<b:staticUrl>/res/js/luckdraw/receiveAward.js</b:staticUrl>"></script>
<style>
.prizeLayer{
	display:block;
	background:none;
}
.prizeLayer:before{
	background-image:url(../../../res/img/luckdraw/tit5.png);
	background-size: 10rem 4.93333333rem;
}
.prizeLayer .prizeLayerBox{
	margin-top:3.2rem;
	background:none;
}
.prizeLayer .close{
	display:none;
}
.prizeLayer .prizeRecodeList li{
	background:url(../../../res/img/luckdraw/icon3.png) left center no-repeat;
	background-size:10px 10px;
	font-size:15px;
	color:#faee00;
}
</style>
</head>

<body>
<div id="canvas-box" class="canvas-box">
	<div class="prizeLayer" style=" width: 100%;
  height: 100%;
  overflow: hidden;
  background: url(../../../res/img/luckdraw/bg.jpg) no-repeat;
  background-size: 100% 100%;">
		<div class="prizeLayerBox">
			<div class="count">
				<!-- <p>19:00</p>
				<p>您成功领奖一次</p> -->
			</div>
			<div class="prizeRecodeTit2"></div>
		    <ul class="prizeRecodeList">
		    </ul>
		</div>
	</div>
</div>
</body>
</html>