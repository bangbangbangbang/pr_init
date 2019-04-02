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
	<%@include file="../../header_v14.jsp"%>
	<title>喵圈</title>
</head>
<body id="bgwhite">
	<div class="bigTitle2">
	<div class="font17">
		${title}</div>
	</div>
	<c:if test="${activityContent != null}">
		<div class="font12 contword">
			<div class="font15 tit">重要声明：</div>
			<p>${activityContent}</p>
		</div>
	</c:if>
	<c:if test="${detailRules != null}">
		<div class="font12 contword">
			<div class="font15 tit">活动细则：</div>
			<p>${detailRules}</p>
		</div>
	</c:if>
	
	<c:if test="${activityDetailOne != null}">
		<div class="font12 contword">
			<div class="font15 tit">行动方案：</div>
			<%-- <div class="case"><i class="i-clock"></i>${activityDetailOneTitle}</div> --%>
			${activityDetailOne}
		</div>
	</c:if>
	<c:if test="${activityDetailTwo != null}">
		<div class="font12 contword">
			<div class="font15 tit">可运用的工具：</div>
			${activityDetailTwo}
		</div>
	</c:if>
	<c:if test="${activityDetailThree != null}">
		<div class="font12 contword">
			<div class="font15 tit">格式举例：</div>
				${activityDetailThree}
		</div>
	</c:if>
		<div class="font17 topic-btn">
			<a href="javascript:void(0)" class="backbtn" onclick="back('${dayId}')">返回</a>
		</div>
		
	<!--尾部-->
	<jsp:include page="/pages/header_footer.jsp">
		<jsp:param value="3" name="menu"/>
	</jsp:include>
	
<script type="text/javascript">
	function back(dayId){
		history.go(-1);
	}
</script>
</body>
</html>