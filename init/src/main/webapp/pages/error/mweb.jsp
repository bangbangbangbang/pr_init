<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true" %>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>喵姐早教说</title>
<%@include file="../header.jsp" %>
<script type="text/javascript">
function detail(){
	$("#detailp").show();
	$(".hhh").hide();
}

</script>
</head>
<body>
  <!--content start-->
    <c:choose>
    	<c:when test="${not empty exceptionResp}">
	    	<section class="err_wrap">
	    	<h1  class="hhh">${exceptionResp.code}</h1>
	    	<h2 class="hhh"><img src='<b:staticUrl>/res/img/icon/err_icon.png</b:staticUrl>'/></h2>
	    	<p class="hhh">${exceptionResp.msg}</p>
	    	<p>${requestId}</p>
	    	<c:if test="${exceptionResp.code==100004 or exceptionResp.code==100006}">
	    		<p><a href="/yzmm/error/cleancookie">请点击此处清理缓存</a></p>
	    	</c:if>
	    	<c:if test="${exceptionResp.code == 400 }">
	    		<p  class="hhh"><a style="color:#c8c8c8" href="javascript:;" onclick="detail()">点击查看详细信息</a></p>
	    		<p id="detailp" style="text-align: left;word-wrap:break-word;word-break: normal;display: none"><%exception.printStackTrace(new java.io.PrintWriter(out)); %></p>
	    	</c:if>
	    </section>
    	</c:when>
    	<c:otherwise>
    		<section class="err_wrap">
	    	<h1>-1</h1>
	    	<h2><img src='<b:staticUrl>/res/img/icon/err_icon.png</b:staticUrl>'/></h2>
	    	<p>太累了！亲~~</p>
	    </section>
    	</c:otherwise>
    </c:choose>
    <!--content end-->
</body>
</html>