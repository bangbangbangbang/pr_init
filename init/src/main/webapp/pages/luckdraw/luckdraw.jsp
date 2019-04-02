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
<script src="<b:staticUrl>/res/js/luckdraw/index.js</b:staticUrl>"></script>
</head>

<body>
<div id="canvas-box" class="canvas-box">
    <div class="topbar">
    	<div class="endTime">
    	<!-- 倒计时 -->
    	</div>
    	<a href="#" class="logo"><img src="../../../res/img/luckdraw/logo2.png" ></a>
    </div>
    <div class="egg">
        <div class="eggbox"></div>
        <div class="eggPrize"></div>
        <div class="eggEmpty"></div>
        <div class="beat"></div>
        <div class="gash"></div>
        <div class="start"></div>
        <div class="guang"></div>
        <div class="gift"></div>
        <div class="title"></div>
        <div class="emptyTitle"></div>
    </div>
    <div class="otherinfo">
	    <div class="layerTit">
	    	<img src="../../../res/img/luckdraw/tit.png"  class="viewRecode">
	    	<img src="../../../res/img/luckdraw/ruleTit.png"  class="ruleTit">
	    </div>
	    <div class="prizeRecodeTit3"></div>
	    <div class="rulelist">
	    	<p><span>1、 </span><span>10:00-21:00每个整点开放抽奖，每次开放10分钟</span></p>
	    	<p><span>2、</span><span>中奖者需在21:30之前至礼品台验证后选择奖品，
     领取后概不退换</span></p>
     		<p><span>3、</span><span>中奖者需兑换奖品后方能参加下场抽奖</span></p>
	    </div>
    </div>
</div>
<div class="prizeLayer">
	<div class="prizeLayerBox">
		<span class="close"></span>
	    <ul class="prizeRecodeList" id="prizeRecodeListIsNullFalse">
	    </ul>
	</div>
</div>
<div class="prizeLayer ruleLayer">
	<div class="prizeLayerBox">
		<span class="close"></span>
	    <div class="rulelist2">
	        <p><span>1、</span><span>本活动自2016年12月10日10：00-21：00每个整点开放抽奖，每次开放10分钟;</span></p>
	        <p><span>2、</span><span>本次奖项设置为价值50-1000元不等奖品，中奖者自选礼盒（内含奖品），领取后概不退换;</span></p>
	        <p><span>3、</span><span>兑奖需在当日活动现场由主办方工作人员验证后领取，未在活动现场验证或超出兑奖时间（兑奖时间10：00-21：30）均视为无效;</span></p>
	        <p><span>4、</span><span>中奖者需兑换奖品后方能参加下场抽奖;</span></p>
	        <p><span>5、</span><span>一旦发现作弊行为，主办方有权取消其中 奖资格，同时中奖奖品不予发放。</span></p>
	    </div>
	    <div class="note">本活动最终解释权归“喵姐早教说”所有</div>
	</div>
</div>
</body>
</html>