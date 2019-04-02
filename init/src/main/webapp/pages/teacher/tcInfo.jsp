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
	<title>喵姐早教说</title>
	<%@include file="../header_v14.jsp"%>
	<script src="<b:staticUrl>/res/js/scrollpaginationme.js</b:staticUrl>"></script>
	<script src="<b:staticUrl>/res/js/swiper-3.3.0.min.js</b:staticUrl>"></script>
</head>
<style>
</style>
<style>
.backlocal {
  width: 100%;
  height: 1.86666667rem;
  position: relative;
  z-index: 10;
}
.backlocal a {
  display: block;
  height: 1.2rem;
  line-height: 1.2rem;
  position: fixed;
  left: 63%;
  bottom: 1.70666667rem;
  z-index: 110;
  margin-left: -2.53333333rem;
  border-radius: 1.33333333rem;
  text-align: center;
}
</style>
<body id="bgwhite">
	<div class="expert" style="background-image:url(<b:staticUrl>/res/img/activity/BG-tutorimg.png</b:staticUrl>);">
		<div class="expert-info">
			<div class="photo"><img src="${tcAlbum}" ></div>
			<div class="font17 name"><c:out value="${tcName}"></c:out><i class="i-girl"></i></div>
			<p class="font12">0-6岁育儿江湖资深女侠</p>
			<p class="font12">超级辣妈</p>
			<p class="font12">气质女神</p>
			<p class="font12">著有育儿宝典无数</p>
		</div>
	</div>
	<div class="font15 expert-word">
	<p style="text-indent:26px;"><c:out value="${tcDeclaration}"></c:out> </p>
	</div>
	 <div class="font15 topic-btn backlocal">
		    <a href="javascript:void(0)" onclick="goBack()">返&nbsp回</a>
	</div>
<!--尾部-->
	<jsp:include page="/pages/header_footer.jsp">
		<jsp:param value="3" name="menu"/>
	</jsp:include>
	<script type="text/javascript">
//返回
function goBack(){
	history.back(-1);
}
</script>
</body>
</html>