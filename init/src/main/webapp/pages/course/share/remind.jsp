<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>喵姐早教说</title>
<%@include file="../../header_v2.0.jsp" %>
<link rel="stylesheet" href="<b:staticUrl>/res/css/package/course/share.css</b:staticUrl>">
</head>
<body> 
<body>
<div class="shareEmpty">
	<div class="emptyIcon"></div>
	<div class="emptyWord">${emptyWord }</div>
	<div class="emptyWord2">分享喵姐说海报，每邀请1人体验，新增1天会期</div>
</div>
<a href="javascript:void(0)" class="shareBtnRed">邀请好友学习</a>
<a href="javascript:void(0)" class="shareBtnBorder">去首页</a>
<script type="text/javascript">
var courseId = "${courseId}";
$(".shareBtnRed").click(function(){
	if(courseId.length > 0){
		top.window.location.href = "/yzmm/account/course/share/placard?courseId="+courseId;
	}else{
		top.window.location = "/yzmm/account/course/list?timestamp="
			+ new Date().getTime();
	}
})
$(".shareBtnBorder").click(function(){
	top.window.location = "/yzmm/account/knowledge/index?timestamp="
		+ new Date().getTime();
})
</script>
</body>
</html>
