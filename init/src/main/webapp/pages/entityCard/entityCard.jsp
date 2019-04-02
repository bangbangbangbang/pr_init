<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta name="format-detection" content="telephone=no" />
	<meta name="format-detection" content="email=no"/>
	<%@include file="../header_v2.4.0.jsp"%>
	<link rel="stylesheet" href="<b:staticUrl>/res/css/entityCard/entityCard.css</b:staticUrl>">
	<title>喵姐早教说</title>
</head>
<body>
 	<div class="wrapPage">
    	<h2 class="entityCardTit">恭喜你</h2>
    	<p class="entityCardAtt">获得价值 ￥99 元兑换券一张</p>
    	<!--卡片-->
    	<div class="cardContent">
    		<h3 class="conTitle">兑换券 | 入园适应训练专用券</h3>
    		<!--左右圆-->
    		<div class="circular">
    			<div class="circularLeft"></div>
    			<div class="circularRight"></div>
    		</div>
    		<div class="costMon">
				<span class="costCur">￥</span>
				<span class="costNum">99</span>
				<span class="costOrig">/ 张</span>
			</div>
			<p class="effective">有效期：<span id="startTime">2017.07.20</span> - <span id="endTime">2017.10.20</span></p>
			<div class="lineOrange"></div>
    	</div>
    	<!--使用规则-->
    	<h3 class="cardRule">优惠券使用规则：</h3>
    	<p class="ruleText">1. 点击下方“立即使用”按钮进入入园适应训练，</p>
    	<p class="ruleText">2. 填写宝宝基本信息，完成入园适应能力测试，</p>
    	<p class="ruleText">3. 提交测试结果，获取测试分析报告，</p>
    	<p class="ruleText">4. 测试分析报告页面点击“马上报名”，</p>
    	<p class="ruleText">5. 付费时使用该优惠券，支付 0 元即可参加。</p>
    	<a href="javascript:void(0);" class="shadoweBtn">立即使用</a>
    </div>
    <script type="text/javascript">
    	var useState='${useState}';
    	if(useState=='true'){
    		toast('优惠券已领取');
    	}
    	
    	var errMsg='${errMsg}';
    	if(errMsg){
    		toast(errMsg);
    	}
    	var validStartTime='${userCoupon.validStartTime}';
    	if(validStartTime){
    		var startTime=fmtSecondyyyMMDDdot(validStartTime);
    		$('#startTime').html(startTime);
    	}
    	var validEndTime='${userCoupon.validEndTime}';
    	if(validEndTime){
    		var endTime=fmtSecondyyyMMDDdot(validEndTime);
    		$('#endTime').html(endTime);
    	}
    	$(".shadoweBtn").on("click",function(){
    	       HH.href("/yzmm/account/activity/prekindergarten/index?id=5");
    	});
    </script>
</body>
</html>