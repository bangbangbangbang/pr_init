<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="background: #fff;">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@include file="../header.jsp"%>
<title>喵姐早教说</title>
<style type="text/css">
.vip_card_con{
background-image: url("<b:staticUrl>/res/img/card.png</b:staticUrl>");
}
.vip_card_con p{
	font-family: 微软雅黑;
}
.vip_card_con span{
	right: auto;
	left: 0rem;
	text-shadow:none;
	text-indent:0.4rem;
	font-size:0.3rem;
	bottom: 0.2rem;
}

</style>
</head>
<body style="background: #fff;">
<section class="vip_card_wrap">
	<c:if test="${empty list}">
		<div class="noneData">
			<span>您还没有办理会员卡 @^@</span>
		</div>
	</c:if>
	<c:forEach items="${list}" var="mem">		
			<div class="vip_card_con">
					<p><span>NO:${mem.productId}</span>	</p>			
			</div>
			<div class="business_list_con">
				<h6 class="cf">
					${mem.validStartTime} -- ${mem.validEndTime}
				</h6>
			</div>
		</c:forEach>
	</section>


</body>




</html>
