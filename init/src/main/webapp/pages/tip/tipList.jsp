<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@include file="../header_v2.1.jsp" %>
<script src="${baseStaticUrl}/res/js/scrollpagination.js?v=${version}"></script>
<script src="<b:staticUrl>/res/js/activity/datetime.js</b:staticUrl>"></script>
<script src="<b:staticUrl>/res/js/activity/center.js</b:staticUrl>"></script>
<script src="<b:staticUrl>/res/js/tip/tipList.js</b:staticUrl>"></script>

<title>个人中心</title>
<title>喵姐早教说</title>
</head>
<body>
<div class="tabtop">
		<a href="javascript:void(0)" class="active">打赏记录</a>
		<a href="javascript:showPurchaseRecord()">购买记录</a>
	</div>
	<div class="tabslide" style="display:block;">
		<ul class="expectionList" id='expectionList'>
			<!-- 打赏记录 -->
		</ul>
	</div>
	<div class="tabslide">
		<div class="section sqwSection" >
			<div class="sectionTit">
				<a href="javascript:knowledgeMore()" class="more">
					全部<span class="txtyellow sqwtxtyellow"></span>条音频资讯
				</a>
				<span class="icon-ask"></span>三千问
			</div>
			<ul class="recommendList" id="recommendList">
				 <!-- 三千问内容 -->
			</ul>
			<ul class="recommendList recommendListMore" id="recommendListMore" style="display:none">
				 <!-- 三千问更多内容 -->
			</ul>
		</div>
		<div class="section vodCourseSection" >
			<div class="sectionTit">
				<a href="javascript:vodMore()" class="more">
					共<span class="txtyellow mjstxtyellow"></span>条购买记录
				</a>
				<span class="icon-speak"></span>喵姐说
			</div>
			<ul class="buyList mjsbuyList" id="mjsbuyList">
				<!-- 喵姐说内容 -->
			</ul>
			<ul class="buyList buyListMore" id="buyListMore" style="display:none">
				 <!-- 喵姐说更多内容 -->
			</ul>
		</div>
		<div class="section sectionBorder0 activitySection">
			<div class="sectionTit">
				<a href="javascript:activityMore()" class="more">
					共<span class="txtyellow activitytxtyellow"></span>条购买记录
				</a>
				<span class="icon-activity"></span>喵活动
			</div>
			<ul class="buyList activitybuyList" id='activitybuyList'>
				<!-- 秒活动内容 -->
			</ul>
			<ul class="buyList activitybuyListMore" id='activitybuyListMore'>
				<!-- 秒活动更多内容 -->
			</ul>
		</div>
	</div>
	 <jsp:include page="/pages/header_footer.jsp">
		<jsp:param value="4" name="menu"/>
	 </jsp:include>
</body>
</html>
