<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta name="format-detection" content="telephone=no" />
	<meta name="format-detection" content="email=no"/>
	<%@include file="../../header_v2.4.0.jsp"%>
	<link rel="stylesheet" href="<b:staticUrl>/res/css/entityCard/entityCard.css</b:staticUrl>">
</head>
<body>
    <div class="wrapPage">
    	<h2 class="entityCardTit">恭喜你</h2>
    	<p class="entityCardAtt">已获得一张 ￥${userCoupon.typeAmount/100}元
    		<c:if test="${userCoupon.type=='CASH'}">
    			 现金券
    		</c:if>
    		<c:if test="${userCoupon.type=='SINGLE'}">
    			兑换券
    		</c:if>
    		<c:if test="${userCoupon.type=='DISCOUNT'}">
    			打折券
    		</c:if>
    	 </p>
    	<!--卡片-->
    	<div class="cardContent">
    		<h3 class="conTitle">
	    		<c:if test="${userCoupon.type=='CASH'}">
	    			 现金券
	    		</c:if>
	    		<c:if test="${userCoupon.type=='SINGLE'}">
	    			兑换券
	    		</c:if>
	    		<c:if test="${userCoupon.type=='DISCOUNT'}">
	    			打折券
	    		</c:if> | 
	    		<c:choose>
	    			<c:when test="${userCoupon.businessType=='YEARCARD'}">
	    				VIP会员卡专场
	    			</c:when>
	    			<c:when test="${userCoupon.businessType=='COURSE'}">
	    				喵姐说专场
	    			</c:when>
	    			<c:when test="${userCoupon.businessType=='MIAOQA'}">
	    				1对1咨询专场
	    			</c:when>
	    			<c:when test="${userCoupon.businessType=='GODDESSACTIVITY'}">
	    				行动计划专场
	    			</c:when>
	    			<c:when test="${userCoupon.businessType=='ALL'}">
	    				全网通
	    			</c:when>
	    			<c:when test="${userCoupon.businessType=='OBJECT'}">
	    				实物
	    			</c:when>
	    			<c:when test="${userCoupon.businessType=='PREKINDERGARTEN'}">
	    				入园适应训练专用券
	    			</c:when>
	    		</c:choose></h3>
    		<!--左右圆-->
    		<div class="circular">
    			<div class="circularLeft"></div>
    			<div class="circularRight"></div>
    		</div>
    		<div class="costMon">
				<span class="costCur">￥</span>
				<span class="costNum">${userCoupon.typeAmount/100}</span>
				<span class="costOrig">/ 张 
					<c:if test="${not empty desc}">
						<span class="costVip">【${desc}用户专享】</span>
					</c:if>
				</span>
			</div>
			<p class="effective">有效期：<sapn class="starttime">2017.07.20</sapn> - <span class="endtime">2017.10.20</span></p>
			<div class="lineOrange"></div>
    	</div>
    	<!--使用规则-->
    	<h3 class="cardRule">使用方法：</h3>
    	<p class="ruleText">1、 点击下方“立即使用”报名家庭版入园适应训练；</p>
    	<p class="ruleText">2、 报名前须先测试宝宝入园适应能力，获取专属训练方案；</p>
    	<p class="ruleText">3、 测试结果页点击“马上报名”使用现金券支付成功即可开始训练。</p>
    	<a href="javascript:void(0);" class="shadoweBtn">立即使用</a>
    </div> 
    <script type="text/javascript">
    	$(function(){
    		var useState='${useState}';
        	if(useState=='true'){
        		toast('优惠券已领取');
        	}
    		$(".shadoweBtn").on("click",function(){
    			HH.href("/yzmm/account/activity/prekindergarten/index?id=5");
    		});
    		
    		var validStartTime='${userCoupon.validStartTime}';
        	if(validStartTime){
        		$(".starttime").html(fmtSecondyyyMMDDdot(validStartTime));
        	}
        	var validEndTime='${userCoupon.validEndTime}';
        	if(validEndTime){
        		$(".endtime").html(fmtSecondyyyMMDDdot(validEndTime));
        	}
    	})
    </script>
</body>
</html>