<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="j" uri="/jsputil" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head lang="en">
<meta charset="UTF-8">
<title>喵姐女神团</title>
<%@include file="../../header_v14.jsp"%>
<script src="<b:staticUrl>/res/js/scrollpaginationme.js</b:staticUrl>"></script>
<style type="text/css">
	.bigTitle div {
     border-bottom: 0px solid #ccc; 
	}
	.bangTit div {
    border-bottom: 0px solid #ccc;
	}
</style>
</head>

<body id="bgwhite">
	<div class="font17 bigTitle"><div>行动女神团</div></div>
	<div class="font15 bangTit"><div><i class="i-bang"></i>当日作业达人榜</div></div>
	<ul class="font12 bang-list">
		<c:forEach items="${goddessList}" var="goddess" begin="0" end="3" varStatus="status">
			<li>
				<span class="font18"><c:out value="${status.index+1}"></c:out></span><img src="${goddess.userAlumb}" ><c:out value="${goddess.userName}"></c:out>
			</li>
		</c:forEach>
	</ul>
	<div class="memlist">
		<ul>
			<c:forEach items="${goddessList}" var="goddess" begin="4" >
				<li><img src="${goddess.userAlumb}"><p class="font12">${goddess.userName}</p></li>
			</c:forEach>
		</ul>
	</div>
<!--尾部-->
	<jsp:include page="/pages/header_footer.jsp">
		<jsp:param value="3" name="menu"/>
	</jsp:include>
</body>
</html>