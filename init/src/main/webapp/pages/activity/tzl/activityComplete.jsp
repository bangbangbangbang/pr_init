<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta name="format-detection" content="telephone=no" />
	<meta name="format-detection" content="email=no"/>
	<title>${activityTitle}</title>
	
	 <%@include file="../../header_v13.jsp" %>
	 <script src="<b:staticUrl>/res/js/scrollpaginationme.js</b:staticUrl>"></script> 
	 <link rel="stylesheet" href="<b:staticUrl>/res/css/activity_tzl/activity.css</b:staticUrl>"> 
	 <link rel="stylesheet" href="<b:staticUrl>/res/css/activity_tzl/common.css</b:staticUrl>"> 
	 <link rel="stylesheet" href="<b:staticUrl>/res/css/activity_tzl/group.css</b:staticUrl>"> 
	 <script src="<b:staticUrl>/res/js/custom/lightbox/lightbox.js</b:staticUrl>"></script> 
	
	<style type="text/css">
		.endDate{
			text-align:right;
		}
		.rule{
			border-bottom: 0 solid #efeff4;
		}
		.contword img{
			 width: 9rem;
			 height: 4rem;
		}
		.note{
			margin-top: 0.5rem;
		}
		.topic-list .rightcont .img{
			border-bottom: 0px solid #ccc;
		}
		.font12 {
		    line-height: 18px;
		}
		.menu{
			text-align:right;
		}
	</style>
</head>
<body id="bgwhite">
	<div class="bigTitle2">
	<div class="font17">
		${activityTitle }</div>
	</div>
	<div class="font12 contword">
		<img alt="" src="${activityTitleImg }">
		<div class="font15 tit note">活动说明：</div>
		<p>${titleDescription }</p>
	</div>
	<div class="font12 contword">
		<div class="font15 tit">活动内容：</div>
		<div class="case"><i class="i-clock"></i>
		${activityContent }
		</div>
		<c:if test="${not empty activityImg }">
			<img alt="" src="${activityImg }">
		</c:if>
	</div>
	<div class="font12 contword rule">
		<div class="font15 tit">游戏规则：</div>
		${activityRule }
	</div>
	<div class="font12 contword endDate">
		<span>
			<c:if test="${empty activityEndTime }"> ${activityStartTime }</c:if>
			<c:if test="${empty not activityEndTime }">结束时间： ${activityEndTime }</c:if>
		</span>
	</div>
	<c:if test="${not empty endingText }">
		<div class="font12 contword end">
			<div class="font15 tit">活动结束：</div>
			<div class="case">
			<c:if test="${not empty endingText }">${endingText}</c:if>
			</div>
			<c:if test="${not empty endingImg }">
			<img alt="" src="${endingImg }">
			</c:if>
			
			<c:if test="${notAward == false }">
				<div class="font15 tit menu" onclick="toAwardList()">查看获奖名单</div>
			</c:if>
			
		</div>
	</c:if>
    <div class="font15 topic-btn">
		    <a href="javascript:void(0)" onclick="goBack()">返&nbsp回</a>
	</div>
<!--尾部-->
	<jsp:include page="/pages/header_footer.jsp">
		<jsp:param value="3" name="menu"/>
	</jsp:include>
<script type="text/javascript">
function toAwardList(){
	window.location =  "/yzmm/account/activity/tzl/reply/toAwardList?activityId="+${id};
}
//返回
function goBack(){
	history.back(-1);
}
</script>
</body>
</html>