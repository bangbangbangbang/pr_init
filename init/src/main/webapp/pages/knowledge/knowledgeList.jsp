<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head lang="en">
<meta charset="UTF-8">
<title>喵姐早教说</title>
<%@include file="../header_v2.0.jsp"%>
<script src="<b:staticUrl>/res/js/jquery.cookie.js</b:staticUrl>"></script>
<script src="<b:staticUrl>/res/js/scrollpaginationme.js</b:staticUrl>"></script>
<link rel="stylesheet"
	href="<b:staticUrl>/res/css/footer-v2.css</b:staticUrl>">

<style type="text/css">
.header .search-link-me:before {
	background-image: none;
}
	/*三千问浮球功能*/
.circleLayer{
	display:block;
	width:100*@base;
	height:100*@base;
	border-radius:100%;
	position:fixed;
	z-index:102;
	right: 0.24rem;
	bottom: 1.46666667rem;
}
.circleLayer img{
	display:block;
	width:100%;
	height:100%;
	border-radius: 100%;
	-webkit-animation: rotate 13s linear infinite;
}

</style>
</head>
<body>
<%@include file="knowledge_dtl_show.jsp" %>
<div class="wrap">
<form class="search">
	<div class="searchBox">
		<a href="javascript:void(0)" class="cancleBtn backBtn" style="display:block;">返回</a>
		<div class="searchTxt">
			<a href="javascript:void(0)" class="clear"></a>
			<div class="placeholder inputFocus showInput" ></div>
		</div>
	</div>
</form>
	<div class="section sectionBorder0">
		<div class="sectionTit">
			<span class="icon-ask"></span>三千问
		</div>
		<ul class="recommendList">
			<!-- <li><a href="#">
				<div class="photo"><img src="" ></div>
				<div class="info">
					<h2><span class="hottag"></span>孩子上亲子课孩子课孩话怎么办？</h2>
					<div class="other">推荐1-4岁<span class="num">1033人听过</span></div>
				</div>
			</a></li> -->
		</ul>
		<div id="floatingBallTemp" style="display:none"><a href="#" class="circleLayer" style="display:none;"><img id="circleLayerImg" src="" ></a></div>
	</div>				
</div>
	<!-- 底脚 -->
	<jsp:include page="/pages/header_footer.jsp">
		<jsp:param value="1" name="menu" />
	</jsp:include>
	<!-- 初始化 -->
	<script type="text/javascript">
	var showFreeList = "${showFreeList}";
	var enableDefaultImage = "${enableDefaultImage}";
	var sm = {};
	var pageIndex = 1;
	var userAuthorise = "${userAuthorise}";
	var age = "${age}";
	var sex = "${sex}";
	 configuration.knowledge.indexDefaultI
	var defaultImage = configuration.knowledge.listDefaultImg;
	var kdata = {
			pageSize:12,
			age : age,
			sex : sex,
			showFreeList:showFreeList
		};
	</script>
	<!-- 搜索框 -->
	<%@include file="../custom/search.jsp"%>
	<script src="<b:staticUrl>/res/js/package/knowledge/knowledgeList.js</b:staticUrl>"></script>
</body>
</html>