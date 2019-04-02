<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta name="format-detection" content="telephone=no" />
	<meta name="format-detection" content="email=no"/>
	<title>个人完善信息</title>
	<%@include file="../header_v12_2.jsp"%>
	<link rel="stylesheet" type="text/css" href="<b:staticUrl>/res/css/common-v4.css</b:staticUrl>" />
</head>
<body id="bgwhite">
	<div class="cardinfo">
		<h2 class="font20"><span class="font16">${price } <i>x1</i></span>普通会员包年卡</h2>
		<div class="cardinfo-cont">
			<div class="photo"><img src="<b:staticUrl>/res/img/2.png</b:staticUrl>" ></div>
			<div class="font15 word">
				${description }..
			</div>
		</div>
	</div>
	<div class="font14">
		<div class="item form-item">
			<div class="item-tit txtgray">有效期:</div>
			<div class="item-cont txtright">${validStartTime }-${validEndTime }</div>
		</div>
	</div>
	<div class="font14 paystyle">
		<div class="item form-item">
			<div class="item-tit"><span class="i-wx"></span></div>
			<div class="item-cont">
				<h2 class="font16">微信支付</h2>
				<p class="font12">推荐安装微信5.0及以上版本的用户使用</p>
			</div>
			<span class="i-radioactive"></span>
			<div class="line"></div>
		</div>
	</div>
	<div class="btn"><input type="submit" id="toPay" class="font18 submit" value="支付  ￥499.00" ></div>
	<script type="text/javascript">
		$("#toPay").click(function(){
			window.location.href="/yzmm/wxmppay/newbie";
		});
	</script>
</body>
</html>