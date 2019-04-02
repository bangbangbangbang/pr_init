<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head lang="en">
<meta charset="UTF-8">
<title>喵姐早教说</title>
<%@include file="../header_v2.0.jsp"%>
<link rel="stylesheet"
	href="<b:staticUrl>/res/css/footer-v2.css</b:staticUrl>">
<style type="text/css">
</style>
</head>
<body>
	<div class="resultEmpty">
		<div class="icon"></div>
		<div class="txt"></div>
	<div class="backBtn"><a href="javascript:void(0)">返回</a></div>
	</div>
	<!-- 底脚 -->
	<jsp:include page="/pages/header_footer.jsp">
		<jsp:param value="1" name="menu" />
	</jsp:include>
	<script type="text/javascript">
	var backBefore = "${backBefore}";
	var indexPath = "${indexPath}";
	var description = "${description}";
	$(".txt").text(description);
	$(".backBtn").click(function(){
		if(backBefore=="true"){
			history.go(-1);
		}else{
			window.location.href=indexPath;
		}
	})
	</script>
</body>
</html>