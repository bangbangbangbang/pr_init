<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>喵姐早教说</title>
<%@include file="header.jsp" %>
</head>
<body>
<a href="/yzmm/account/logout">退出</a>
<hr>
<a href="/login">登录</a>
<hr>
<a href="/yzmm/account/user/info">用户信息</a>
<hr>
<a href="/yzmm/account/feedback/index">用户反馈</a>
<hr>
<a href="/yzmm/account/course/list">课程列表</a>
<hr>
<a href="/test/www/zxk">刷zxkcookie</a>
<hr>
<a href="/weixin">微信登录标志</a>
<hr>
<a href="/test/cleancookie">清除cookie</a>
<hr>
<a href="/test/initCache">initCache</a>
<hr>
<a href="testiframe.jsp">testiframe</a>
<hr>
<%
Cookie[] list = request.getCookies();
if(list!=null&&list.length>0){
	if(list!=null&&list.length>0){
        for(Cookie c:list){
        String s = "<textarea style='width: 100%;height: 200px;'>"+com.sevenchildren.framework.util.JacksonUtils.toJson(c)+"</textarea>"+"<hr>";
        out.print(s);
        }
	}
}
%>
<hr>
</body>
</html>
