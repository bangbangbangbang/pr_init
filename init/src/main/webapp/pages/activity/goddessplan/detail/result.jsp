<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="j" uri="/jsputil" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head lang="en">
<meta charset="UTF-8">
<title>女神行动计划</title>
<%@include file="../../../header_v2.1.jsp"%>
<%@include file="../../../header_wxjsapi.jsp"%>
<script src="<b:staticUrl>/res/js/scrollpaginationme.js</b:staticUrl>"></script>
<script src="<b:staticUrl>/res/js/activity/activity.js</b:staticUrl>"></script>
<script type="text/javascript" src="<b:staticUrl>/res/js/myaudio-v13.js</b:staticUrl>"></script>
<script src="<b:staticUrl>/res/js/custom/lightbox/lightbox.js</b:staticUrl>"></script>
<link rel="stylesheet" href="<b:staticUrl>/res/css/myaudio.css</b:staticUrl>">
<style type="text/css">
.activityInfo .photo img {
   border-radius: 25px;
}
.myactivitytmp {
  display: block;
  width: 1.13333333rem;
  height: 1.13333333rem;
  padding: 0.13333333rem 0.24rem;
  overflow: hidden;
  background: #d0021b;
  border-radius: 100%;
  position: fixed;
  right: 0.4rem;
  bottom: 1.46666667rem;
  z-index: 99;
  font-size: 0.32rem;
  color: #fff;
}
</style>
</head>
<body>
<div class="containerOther">
	<div class="activityBanner">
		<img src="${titleImg}">
		<span class="rulebtn">活动细则</span>
		<div class="word">
			<h3><c:out value="${topicTitle}"></c:out></h3>
		</div>
	</div>
	<div class="activityInfo">
		<span class="tag">活动已结束</span>
		<div class="photo"><img src="${tcablumUrl}" ></div>
		${tcName}
	</div>
	<div class="activityWord">
		${activityContent2}
	</div>
	<div class="motherSort">
		<div class="motherSortTit">
			<!-- <span class="ruleBtn">排行规则</span> -->
			女神排行(TOP10）
		</div>
		<ul class="motherSortList">
			<c:if test="${joinFlag}">
				<li class="motherSortItem">
					<span class="title">${myMedalName}</span>
					<c:if test="${myRank==1||myRank==2||myRank==3}">
						<span class="tagno no${myRank}"></span>
					</c:if>
					<c:if test="${!(myRank==1||myRank==2||myRank==3)}">
						<span class="tagno">${myRank}</span>
					</c:if>
					<div class="photo"><img src="${myAlumbUrl}" ></div>
					<c:out value="${myNickname}"></c:out>
				</li>
			</c:if>
			<c:forEach items="${topUserList}" var="top" varStatus="status">
				<li class="motherSortItem">
					<span class="title">${top.medalName}</span>
					<c:if test="${status.index==0||status.index==1||status.index==2}">
						<span class="tagno no${status.index + 1}"></span>
					</c:if>
					<c:if test="${!(status.index==0||status.index==1||status.index==2)}">
						<span class="tagno">${status.index + 1}</span>
					</c:if>
					<div class="photo"><img src="${top.alumbUrl}" ></div>
					<c:out value="${top.nickname}"></c:out>
				</li>
			</c:forEach>
		</ul>
	</div>
	<c:if test="${judegeAuthSign}">
		<a href="/yzmm/account/activity/goddessplan/detail/doneDetail?activityId=${activityId}" class="myactivitytmp activitymore">查看作业</a>
	</c:if>
	
	<!--报名须知-->
	<div class="actlayer">
		<div class="activityruleBox">
			<a href="javascript:void(0)" class="close"></a>
			<h2 class="tit">活动细则：</h2>
			<div class="word">
				${activityRule}
			</div>
		</div>
	</div>
	<!--排名须知
	<div class="actlayer">
		<div class="sortruleBox">
			<a href="javascript:void(0)" class="close"></a>
			<h2 class="tit">报名须知</h2>
			<h3 class="stit">活动细则：</h3>
			<div class="word">
				<p>1、本次活动报名费为 ￥18.00 元；</p>
				<p>2、参加女神行动计划的用户，没人须缴纳100元保证金，每日完成任务，成功坚持21天的用户，活动刚结束后，全额返还保证金；</p>
				<p>3、中途退出、或未完成每日签到的用户，保证金扣除，发放给参与的用户，当红包奖励；</p>
				<p>4、用户需要每日在 23：59 以前，完成签到任务，超时默认为未完成当日任务；</p>
				<p>5、活动时间：10月24日正式开营，请参加女神行动计划的亲们加小喵微信，方便简历行动群，微信号：miaojieshuo；</p>
				<p>6、喵姐早教说宝丽路对此次活动的最终解释权。</p>
			</div>
			<a href="javascript:void(0)" class="submitbtn">我知道了</a>
		</div>
	</div> -->
</div>
<!-- 底脚 -->
<jsp:include page="/pages/header_footer.jsp">
	<jsp:param value="3" name="menu" />
</jsp:include>
<script type="text/javascript">
//给图片绑定展示事件
initMyImgShow();
</script>
</body>
</html>