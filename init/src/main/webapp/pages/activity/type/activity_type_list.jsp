<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta name="format-detection" content="telephone=no" />
	<meta name="format-detection" content="email=no"/>
	<title>活动</title>
	 <%@include file="../../header_v2.1.jsp" %>
	 <script src="<b:staticUrl>/res/js/activity/activity.js</b:staticUrl>"></script>
</head>
<body>
<div class="containerOther">
	<div class="tabtop">
		<a href="/yzmm/account/miao/topic/index">话题</a>
		<a href="javascript:void(0)" class="active">活动</a>
	</div>
	<ul class="actlist">
	<c:forEach items="${result}" var="m">
		<li class="actliteitem" style="cursor:pointer;" onclick="toActivityTypeDetailed('/yzmm/account/activitytype/detail?classifyId=${m.id }')"><a href="#">
			<img src="${m.img }" >
			<div class="tag">${m.name }</div>
			<div class="tit">${m.topicTitle }</div>
				<c:if test="${m.activityStatus =='CHECKIN'}">
					<div class="tagline taglineyellow">
						<span><i></i>热招中</span>
					</div>
				</c:if>
				<c:if test="${m.activityStatus =='DOING'}">
					<div class="tagline taglinegreen">
						<span><i></i>女神修炼中</span>
					</div>
				</c:if>
				<c:if test="${m.activityStatus =='DONE'||m.activityStatus =='RESULT'}">
					<div class="tagline" style="color:#999">
						<span><i></i>已结束</span>
					</div>
				</c:if>
				<c:if test="${m.activityStatus =='CHECKIN_OVER'}">
					<div class="tagline" style="color:#999">
						<span><i></i>人数已满</span>
					</div>
				</c:if>
		</a></li>
	 </c:forEach>
	</ul>
	<a href="javascript:void(0)" class="myactivity">我的活动</a>
</div>
<!-- 我参加的活动 -->
 <%@include file="../myjoinactivity/myjoinlist.jsp" %>
<jsp:include page="/pages/header_footer.jsp">
		<jsp:param value="3" name="menu"/>
</jsp:include>
</body>
</html>