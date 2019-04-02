<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head lang="en">
<meta charset="UTF-8">
<title>${title}</title>
<%@include file="../../header_v14.jsp"%>
<script src="<b:staticUrl>/res/js/scrollpaginationme.js</b:staticUrl>"></script>
<script src="<b:staticUrl>/res/js/custom/lightbox/lightbox.js</b:staticUrl>"></script> 
<style type="text/css">
.myi-video {
   	padding-left:27px;
   	padding-top:8px;
   	padding-bottom:8px;
    background-image: url("<b:staticUrl>/res/img/center/i-play1.png</b:staticUrl>");
    background-repeat:no-repeat;
    background-size: 23px 23px;
    color: #F8E71C;
    text-decoration:underline;
    line-height: 23px;
    
}
.word4 {
    padding: 1.06666667rem 0 0 0 !important;
}
</style>
</head>
<style>
.place{
color: white;
text-align:center; 
}
</style>
<body id="bgbanner">
	<div class="wrapper">
		<div class="bar"></div>
		<div class="b1"></div>
		<div class="b2"></div>
		<div class="wrapperBg2">
			<div class="font15 word4">
				<div class="font17 tit"><c:out value="${title}"></c:out></div>
				<p>1.报名截止时间：<c:out value="${registrationDeadlineTime}"></c:out></p>
				<p>2.活动开始时间：<c:out value="${activityBeginTime}"></c:out></p>
				<p>3.颁奖日期：<c:out value="${awardTime}"></c:out></p>
				<p>4.限定人数：
					<c:if test="${activityPersonLimit =='LIMIT'}">
						<c:out value="${ totalPerson}"></c:out>
						<span style="color: #F8E71C;">(已报名<c:out value="${nowPerson}"></c:out> )</span>
					</c:if>
					<c:if test="${activityPersonLimit =='NOTLIMIT'}">
						不限
					</c:if>
				</p>
				<p>5.<c:out value="${chargeMoney}"></c:out></p>
			</div>
			
			<c:if test="${not empty relevanceTitle}">
				<div class="line"></div>
				<div class="font15 word">
					<p class="font17">本期教材：</p>
					<br>
						<c:if test="${activityType=='COURSE'}">
							<a class="font15" href="/yzmm/wxmppay/vod?courseId=${relevanceId}"><span class="myi-video"><c:out value="${relevanceTitle}"></c:out></span></a>
							
						</c:if>
						<c:if test="${activityType=='KNOWLEDGE'}">
							<a class="font15" href="/yzmm/account/knowledge/viewDetail?knowledgeId=${relevanceId}"><span class="myi-video"><c:out value="${relevanceTitle}"></c:out></span></a>
						</c:if>
					<div class="imglist">
						<c:if test="${not empty dayImgFirst}">
							<span class="imgitem"><img src="${dayImgFirst}" ></span>
						</c:if>
						<c:if test="${not empty dayImgSecond}">
						<span class="imgitem"><img src="${dayImgSecond}" ></span>
						</c:if>
						<c:if test="${not empty dayImgThird}">
							<span class="imgitem"><img src="${dayImgThird}" ></span>
						</c:if>
					</div>
				</div>
				<div>
                <p class="font13 place">参与活动，教材打包带走~</p>
                </div>
			</c:if>
			<div class="font17 handleBtn">
				<a  onclick="toRuleAndDetail('${activityId}')">下一步</a>
			</div>
		</div>
		<%-- <a href="#" class="font17 moreinfo">了解规则<span class="i-arrow3"></span></a> --%>
		
	</div>
<!--尾部-->
	<jsp:include page="/pages/header_footer.jsp">
		<jsp:param value="3" name="menu"/>
	</jsp:include>
	
<script type="text/javascript">
	//三千问
	function tosqw() {
		window.location = "/yzmm/account/knowledge/index?timestamp="
				+ new Date().getTime();
	}
	
	//喵姐说
	function tocourse() {
		window.location = "/yzmm/account/course/list?timestamp="
				+ new Date().getTime();
	}
	
	//我
	function tome() {
		window.location = "/yzmm/account/user/info?timestamp="
				+ new Date().getTime();
	}
	
	//下一步进入规则和详情
	function toRuleAndDetail(id) {
		window.location = "/yzmm/account/activity/daysPlan/ruleAndDetail?id="+id;
	}
</script>
<script type="text/javascript">
//给图片绑定展示事件
initMyImgShow();
</script>
</body>
</html>