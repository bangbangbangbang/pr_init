<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="j" uri="/jsputil" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head lang="en">
<meta charset="UTF-8">
<title>${title}</title>
<%@include file="../../header_v14.jsp"%>
<%@include file="../../header_wxjsapi.jsp"%>
</head>
<body>
	<div class="bigTitle"><h2 class="font17">${title}</h2></div>
	
	<div class="object object2">
		<div class="object-cont">
			<div class="photo"><img src="${tcablumUrl}"></div>
			<div class="info">
				<h3 class="font15 name">指导老师-<c:out value="${tcName}"></c:out></h3>
				<p class="font12 els3">${tcDescription}</p>
				<a href="/yzmm/account/activity/daysPlan/tutor/teacherPage?uid=${tcId}" class="font12 more"><i class="i-arrow"></i>查看详情</a>
			</div>
		</div>
	</div>
	
	<div class="teamlist">
		<h2 class="font15">行动女神团</h2>
		<div class="teamimg">
			<c:forEach items="${goddessList}" var="goddess" begin="0" end="5">
				<span><img src="${goddess.userAlumb}" ></span>
			</c:forEach>
				<a onclick="toTuan()" ><i class="i-arrow"></i></a>
		</div>
	</div>
	
	<div class="bigTitle"><h2 class="font15 border0">活动介绍</h2></div>
	<div class="font12 content">
	        <p>${activityIntroduce}</p>
			<div class="font15 topic-btn backlocal">
		    	<a href="/yzmm/account/activity/list" >返&nbsp;回</a>
			</div>
	</div>
	
    <jsp:include page="/pages/header_footer.jsp">
		<jsp:param value="3" name="menu"/>
	</jsp:include>
	<script type="text/javascript">
		var wxfenxiangcb={
				title: '${wxshare.title}', // 分享标题
				desc : '${wxshare.desc}',
			    link: '${wxshare.link}', // 分享链接
			    imgUrl: '${wxshare.imgUrl}', // 分享图标
			    shareTimeline:function(bool){
			    },
			    shareAppMessage:function(bool){
			    }
		};
	</script>
	<script type="text/javascript">
		function toTuan(){
			var activityId = "${activityId}";
			if('${activityId}'){
				window.location = "/yzmm/account/activity/daysPlan/allGoddessTuan?activityId="+activityId;
			}
		}
	</script>	
</body>
</html>
