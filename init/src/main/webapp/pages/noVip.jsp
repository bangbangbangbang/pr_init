<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>喵姐早教说</title>
<%@include file="header_v12.jsp"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<!--忽略页面中的数字识别为电话号码-->
<meta name="format-detection" content="telephone=no" />
<!--忽略页面中的邮箱格式为邮箱-->
<meta name="format-detection" content="email=no" />
<link rel="stylesheet" href="<b:staticUrl>/res/css/style-v1.2.css</b:staticUrl>">
<script type="text/javascript" src="<b:staticUrl>/res/js/flexiblev1.2.js</b:staticUrl>"></script>

</head>
<body>
	<section class="result">
	<div class="vipnot"></div>
	<!-- <a href="http://mp.weixin.qq.com/s?__biz=MzIzNDI2MTk5OA==&mid=100000032&idx=1&sn=a0387c939098b169dd70c023f2d8faf0&scene=18#wechat_redirect" class="font18 resultBtn">
	我要成为会员</a> -->
	<br>
	<a href="/yzmm/account/toPhoneReg" class="font18 resultBtn">自助注册</a>
	<br>
	<a href="javascript:void(0)" onclick="flush()" class="font18 resultBtn">点击刷新</a>
    </section>
    <script type="text/javascript">
    	function flush(){
    		$.get("/userSession/update",
    				  function(data){
    					window.location = "/yzmm/account/knowledge/index?timestamp="
    				+ new Date().getTime();
    				  });
    	}
    </script>
</body>
</html>