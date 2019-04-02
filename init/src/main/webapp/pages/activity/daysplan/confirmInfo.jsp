<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head lang="en">
<meta charset="UTF-8">
<title>${title}</title>
<%@include file="../../header_v15.jsp"%>
<script src="<b:staticUrl>/res/js/scrollpaginationme.js</b:staticUrl>"></script>
<style type="text/css">
	.i-other,
	.i-boy,
	.i-girl,
	.i-yun{
	    display: inline-block;
	}
</style>
</head>
<body>
	<div class="wrapper">
		<div class="bar"></div>
		<div class="b1"></div>
		<div class="b2"></div>
		<div class="b3"></div>
		<div class="b4"></div>
		<div class="wrapperBg">
			<div class="font18 greet">亲爱的 <span><c:out value="${realName}"></c:out>：</span></div>
			<h2 class="font15">为保证活动正常进行，请您核实以下信息：</h2>
			<div class="font15 info">
				<p>手机号：<c:out value="${telephone}"></c:out></p>
				<c:if test="${not empty userIdentity}">
					<c:choose>
						<c:when test="${userIdentity == 'GRAVIDA'}">
							<p>已怀孕：
								<i class="i-yun"></i>
								<c:out value="${birthdayString}">
								</c:out>
							</p>
						</c:when>
						<c:when test="${userIdentity == 'MOM'}">
							<p>宝宝：
								<c:if test="${sex==2}">
								<i class="i-girl"></i>
								</c:if>
								<c:if test="${sex==1}">
								<i class="i-boy"></i>
								</c:if>
								<c:out value="${birthdayString}">
								</c:out>
							</p>
						</c:when>
						<c:when test="${userIdentity == 'HELPER'}">
							<p>身份：
								<i class="i-other"></i>
								<c:out value="喵星人">
								</c:out>
							</p>
						</c:when>
					</c:choose>
				</c:if>
				
			</div>
			<div class="font18 activityTit"><span class="i-money"></span>活动付费</div>
			<div class="font15 word">费用由【保证金】+【报名费】两部分组成，保证金${depositMoney}元，活动报名费 
			<c:if test="${isVip==true}">
				${vipfeeDetail}
			</c:if>
			<c:if test="${isVip==false}">
				${feeDetail}
			</c:if>
			元，顺利完【${title}】的用户，活动结束后保证金全额返还，中途退出或每日任务没有完成，保证金将会扣除，当成红包发放给本次参与活动的各位用户，作为奖励。</div>
			
		<c:if test="${isVip==true}">
				<!-- 会员 -->
				<div class="font12 price">
					<p>非会员价：<span class="money">￥${totalFee}</span></p>
					<div class="txtyellow moneynew">
						<span class="unit">￥</span>
						<span class="font32 num">${viptotalFee}</span>
						<span class="tag">会员价</span>
					</div>
				</div>
		</c:if>
			
		<c:if test="${isVip==false}">
			<!-- 非会员 -->
			<div class="font12 price">
				<p>会员价：<span class="money">￥${viptotalFee}</span><a href="${urlBuyVip}" class="txtyellow">我要成为会员</a></p>
				<div class="txtyellow moneynew">
					<span class="unit">￥</span>
					<span class="font32 num">${totalFee}</span>
					<span class="tag">非会员价</span>
				</div>
			</div>
		</c:if>
			
			<div class="font17 handleBtn">
				<c:if test="${fee==false}">
		  			<a class="attend">立即进入</a>
				</c:if>
				<c:if test="${fee==true}">
			  		<a onclick="toActivity('${data}')">立即参与</a>
				</c:if>
				<a onclick="toIndex()">暂不参与</a>
			</div>
		</div>
	</div>
	<!--尾部-->
	<jsp:include page="/pages/header_footer.jsp">
		<jsp:param value="3" name="menu"/>
	</jsp:include>
	
<script type="text/javascript">
	function toActivity(data){
		if("${accessType}" != "WEIXIN"){
			toast("请您进入微信支付");
			return false;
		}
		
		window.location = "/yzmm/wxmppay/activity?data="+data;
	}
	
	function toIndex(){
		window.location = "/yzmm/account/activity/list";
	}
	
	$(function(){
		$(".attend").click(function(){
		 HH.ajax({
				url:'/yzmm/account/activity/daysPlan/attend', 
				data:{activityId:'${activityId}'}, 
				callback:function(data){
					//判断发送是否成功
					if(data.success) {
						 toast(data.msg);
						 window.location = "/yzmm/account/activity/daysPlan/index?id=${activityId}";
	                } else {
	                	  toast(data.msg);
	                }
				}
			});
		});
	});
</script>
</body>
</html>