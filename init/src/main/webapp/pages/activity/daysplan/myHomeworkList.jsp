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
	<%@include file="../../header_v2.1.jsp"%>
	<%@include file="../../header_wxjsapi.jsp"%>
	<script src="<b:staticUrl>/res/js/activity/daysplan/myHomeworkList.js</b:staticUrl>"></script>
	<title>我的作业本</title>
</head>
<body id="bgwhite">
	<div class="mywork">
	<h1 class="activityTitle">我的作业</h1>
	<ul class="workList myworkList">
		
	</ul>
</div>
	
<!--尾部-->
<jsp:include page="/pages/header_footer.jsp">
	<jsp:param value="3" name="menu"/>
</jsp:include>
<script>
	var id='${activityId}';
</script>
</body>
</html>