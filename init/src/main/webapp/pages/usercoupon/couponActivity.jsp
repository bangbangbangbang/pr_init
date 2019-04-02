<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head lang="en">
<meta charset="UTF-8">
<title>喵姐早教说</title>
<%@include file="../header_v2.1.jsp"%>
<style type="text/css">
.font16 {
    font-size: 16px;
}
.submitBtn {
        display: block;
    width: 82%;
    height: 1.04rem;
    line-height: 1.04rem;
    background-color: rgba(255, 85, 0, 1);
    text-align: center;
    text-decoration: none;
    color: #fff;
    border-radius: 100px;
    margin: -3rem auto 0 auto;
    z-index: 99999;
    position: relative;
}
</style>
</head>
<body>
<div>
	<img style="width: 100%;" alt="" src="${img}">
	<div>
	<c:if test="${isVip=='true'}">
		<a href="/yzmm/account/usercoupon/useCouponList?showToast=true" class="font16 submitBtn">
			<i>领取</i>
		</a>
	</c:if>
	<c:if test="${isVip=='false'}">
		<a href="/yzmm/index" class="font16 submitBtn">
			<i>领取</i>
		</a>
	</c:if>
	</div>
</div>
</body>
</html>