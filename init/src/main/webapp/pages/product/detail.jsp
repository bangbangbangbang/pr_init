<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>喵姐早教说</title>
<%@include file="../header_b.jsp"%>
</head>
<body>
<header class="header">
	<div class="header-fixed">
		<div class="header-cont">
			<div class="ui-font16 header-C">支付订单</div>
		</div>
	</div>
</header>
<section class="ui-container">
	<div class="card-about">
		<div class="ui-font16 title">
			<span class="ui-font18"><i class="ui-font14">￥499</i>￥399</span>
			喵姐早教说会员包年卡
		</div>
		<div class="cont">
			<div class="img">
				<img src="<b:staticUrl>/res/img/card_no.png</b:staticUrl>" >
			</div>
			<div class="ui-font14 word">喵姐早教说平台会员权利12个月。包含喵姐全年36+早教说直播课程，三千问（智能答疑库）使用权限。</div>
		</div>
	</div>
	<div class="payStyle">
		<div class="ui-font14 title">有效期<span>从2016-06-15到2017-06-15</span></div>
		<div class="cont">
			<div class="icon"></div>
			<div class="word">
				<h2 class="ui-font16">微信支付</h2>
				<p class="ui-font14">推荐安装微信5.0及以上版本的用户使用</p>
			</div>
			<div class="checkbox"></div>
		</div>
	</div>
	<a href="javascript:void(0)" class="ui-font14 payBtn">确认支付  ￥399.00</a>
</section>
<script src="<b:staticUrl>/res/js/wxmppay.js</b:staticUrl>"></script> 
<script type="text/javascript">
$(function(){
	$('.payBtn').click(function(){
wxmppay(100,"orderDesc","1","BUY",function(orderId){
	alert(orderId);
});
	/*  
	window.location.href="/yzmm/account/course/buyvod?courseId=${courseId}&orderId="+orderId;
	*/
});
});
</script>
</body>
</html>