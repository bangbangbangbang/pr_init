<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head lang="en">
<meta charset="UTF-8">
<title>${title}</title>
<%@include file="../../header_v14.jsp"%>
<script src="<b:staticUrl>/res/js/scrollpaginationme.js</b:staticUrl>"></script>
</head>
<body id="bgbanner">
	<div class="wrapper">
		<div class="bar"></div>
		<div class="b1"></div>
		<div class="b2"></div>
		<div class="b3"></div>
		<div class="b4"></div>
		<div class="wrapperBg">
			<div class="font15 word2">
				<p class="font17">活动细则：</p>
				${detailRules}
				<!-- <p>1：每天按照主题提交作业</p>
				<p>2：发送朋友圈</p>
				<p>3：发送朋友圈</p>
				<p>4：发送朋友圈</p> -->
			</div>
			<div class="line"></div>
			<div class="font15 word">
				<p class="font17">活动介绍：</p>
				${titleDescription}
			</div>
			<div class="font17 handleBtn">
				<a href="/yzmm/account/activity/daysPlan/index?id=${activityId}">返回</a>
				<c:if test="${attend==false}">
				  		<a class="button" href="/yzmm/account/activity/daysPlan/confirmInfo?activityId=${activityId}">立即参与</a>
				</c:if>
				<c:if test="${attend==true}">
				  		<a class="button" href="/yzmm/account/activity/daysPlan/everyDayList?activityId=${activityId}">立即进入</a>
				</c:if>
			</div>
			
		</div>
	</div>
<!--尾部-->
	<jsp:include page="/pages/header_footer.jsp">
		<jsp:param value="3" name="menu"/>
	</jsp:include>
	
<script type="text/javascript">
	//三千问
	function tosqw() {
		window.location = "/yzmm/account/knowledge/index?timestamp="
				+ new Date().getTime();
	}
	
	//喵姐说
	function tocourse() {
		window.location = "/yzmm/account/course/list?timestamp="
				+ new Date().getTime();
	}
	
	//我
	function tome() {
		window.location = "/yzmm/account/user/info?timestamp="
				+ new Date().getTime();
	}
</script>
</body>
</html>