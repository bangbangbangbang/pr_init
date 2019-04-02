<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>喵姐早教说</title>
<%@include file="../../header_v2.0.jsp" %>
<link rel="stylesheet" href="<b:staticUrl>/res/css/package/course/share.css</b:staticUrl>">
</head>
<body class="shareBg"> 
<div class="shareSubjectInfo">
	<div class="tit">${vodCourse.name}</div>
	<div class="name">主讲人：${tcInfoNickName}</div>
	<div class="price">付费课程：${price }</div>
	<P>课程介绍</P>
	<p class="els3">${description}</p>
</div>
<div class="shaerOtherInfo">
	<div class="photo"><img src="${userInfo.albumUrl}" ></div>
	<div class="name">${userInfo.nickName} 赠送你一天VIP会员</div>
	<div class="code"><img src="<b:staticUrl>/res/img/share/code@2x.png</b:staticUrl>" ></div>
	<P>长按识别图中二维码，关注“喵姐早教说”</P>
	<p>回复“免费会员”，点击链接，点击链接立即成为VIP会员。</p>
</div>
<script type="text/javascript">
var courseId = "${courseId}";
$(".shareSubjectInfo").click(function(){
	window.location.href="/yzmm/account/course/jump/auth/"+courseId;
})
</script>
</body>
</html>
