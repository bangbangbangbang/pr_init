<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>喵圈</title>
	<%@include file="../header_v13.jsp"%>
<style type="text/css">
.imgdiv{
height: 100%;
width: 100%;
text-align: center;
margin: auto auto;
position: fixed;
top: 20%
}

</style>
</head>
<body>
<div class="font15 tabtit">
			<a href="/yzmm/account/miao/topic/index" class="active">话题</a>
			<a href="/yzmm/account/activity/list" >活动</a>
		</div>
<div class="imgdiv">
	<img alt="" width="100%" style="margin: auto auto;" src="<b:staticUrl>/res/img/miaoquanbdz.png</b:staticUrl>">
</div>
	<jsp:include page="/pages/header_footer.jsp">
		<jsp:param value="3" name="menu"/>
	</jsp:include>
</body>
</html>