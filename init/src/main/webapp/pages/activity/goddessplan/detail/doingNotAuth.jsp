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
<script src="<b:staticUrl>/res/js/package/activity/goddessplan/activity.js</b:staticUrl>"></script>
<script src="<b:staticUrl>/res/js/custom/lightbox/lightbox.js</b:staticUrl>"></script> 
<link rel="stylesheet" href="<b:staticUrl>/res/css/myaudio.css</b:staticUrl>">
<script src="<b:staticUrl>/res/js/jquery.cookie.js</b:staticUrl>"></script>
<style type="text/css">
.activityInfo .photo img {
   border-radius: 25px;
}
</style>
</head>
<body>
	<div class="activityBanner">
		<img src="${titleImg}" >
		<!-- 当有权限 和没权限 报名中都能看见 -->
		<c:if test="${judegeAuthSign||(!judegeAuthSign &&prcessStatus=='CHECKIN')}">
			<span class="rulebtn hdxz">活动细则</span>
		</c:if>
		<div class="word">
			<h3><c:out value="${topicTitle}"></c:out></h3>
		</div>
	</div>
	<div class="activityInfo">
		<c:if test="${(prcessStatus=='CHECKIN' || prcessStatus=='CHECKIN_OVER')&&judegeAuthSign}">
			<div class="tag">距开始：<span class="txtred">3天20小时</span></div>
			<script type="text/javascript">
				$(function(){
					$(".txtred").html(timer('${activityStartTime}'));
				})
			</script>
		</c:if>
		<c:if test="${(prcessStatus=='DOING')&&!judegeAuthSign}">
			<c:if test="${remind}">
				<span class="clockme">提醒我</span>
				<script type="text/javascript">
				/*$(function(){
					$(".clockBox").parent().fadeIn();
				});*/
				</script>
			</c:if>
			<c:if test="${!remind}">
				<span class="clockme">提醒我</span>
				<script type="text/javascript">
					$(function(){
						$(".clockme").css("background-color","#999");
			   			$(".clockme").unbind();
			   			$(".clockme").click(function(){
			   				toast("此类活动提醒您已经设置过了，当有新的活动开始时会提醒您~");
			   			})
					});
				</script>
			</c:if>
		</c:if>
		<div class="photo"><img src="${tcablumUrl}" ></div>
		<c:out value="${tcName}"></c:out>
	</div>
	<c:if test="${activityType=='COURSE'}">
		<div class="activityBigTit">本期参考课程：</div>
		<div class="selfSubject" onclick="viewVodCourseDetail('${relevanceId}');">
			<div class="name">${relevanceTitle}</div>
			<div class="audio">
				<a href="javascript:void(0)" class="play"><i class="i-playbtn"></i></a>
				<div class="font12 time">00:00</div>
				<div class="wave"></div>
				<div class="font12 time"><c:out value="${timelenmin}"></c:out>:<c:out value="${timelenSec}"></c:out></div>
			</div>
			<p style="color: #a9a1a4">上课之前一定要仔细听课程哦~</p>
		</div>
	</c:if>
	<c:if test="${activityType=='KNOWLEDGE'}">
		<div class="activityBigTit">本期参考三千问：</div>
  	    <div class="selfSubject" onclick="viewKnowledgeDetail('${relevanceId}');">
			<div class="name">${relevanceTitle}</div>
			<div class="audio">
				<a href="javascript:void(0)" class="play"><i class="i-playbtn"></i></a>
				<div class="font12 time">00:00</div>
				<div class="wave"></div>
				<div class="font12 time"><c:out value="${timelenmin}"></c:out>:<c:out value="${timelenSec}"></c:out></div>
			</div>
			<p style="color: #a9a1a4">上课之前一定要仔细听课程哦~</p>
		</div>
	</c:if>
	<div class="activityBigTit">课程概要：</div>
	<div class="subjectWord">
		<p>${titleDescription}</p>
	</div>
	<div class="activityBigTit">行动女神团</div>
	<div class="teamitem">
		<div class="teamlist">
			<c:forEach items="${godnessList}" var="godness">
				<span><img src="${godness.userAlumb}" ></span>
			</c:forEach>
			<i>${godnessCount}位女神已入营</i>
		</div>
	</div>
	<!-- 
	<div class="activityBigTit">相关推荐</div>
	<ul class="activityListMy border0">
		<li class="actitem"><a href="#">
			<div class="img"><img src="" ></div>
			<div class="cont">
				<h2>【第4期】手刃坏脾气重做奶茶妈</h2>
				<p>已入营女神：11230人</p>
				<p>距开始：3天20小时</p>
				<span class="tag txtred">热招中</span>
			</div>
		</a></li>
	</ul>
	<div class="loadmore"><a href="#">更多相关推荐</a></div>
	 -->
	<footer class="footer">
		<div class="fixed">
			<div class="font12 fixed-box">
				<a href="#" class="ft1 active"><p>三千问</p></a>
				<a href="#" class="ft2"><p>喵姐说</p></a>
				<a href="#" class="ft4"><p>喵圈</p></a>
				<a href="#" class="ft3"><p>我</p></a>
			</div>
		</div>
	</footer>
	<!--活动须知-->
	<div class="actlayer bmxz">
		<c:if test="${judegeAuthSign||(!judegeAuthSign &&prcessStatus=='CHECKIN')}">
			<div class="activityruleBox">
				<a href="javascript:void(0)" class="close bmxz"></a>
				<h2 class="tit">活动须知</h2>
				<h3 class="stit">活动细则：</h3>
				<div class="word">
					<p>${activityRule}</p>
				</div>
		<!-- 		<div class="price">￥118</div>
			<div class="pricenote">报名费￥18+保证金￥100</div>
			<a href="javascript:void(0)" class="submitbtn">立即报名</a>
			<div class="protol"><span class="radio radioon"></span>同意并熟知活动细则</div> -->
			</div>
		</c:if>
		<c:if test="${(prcessStatus=='DOING')&&!judegeAuthSign}">
			<div class="clockBox">
				<a href="javascript:void(0)" class="close"></a>
				<h2 class="tit">亲爱的喵女神</h2>
				<p>很遗憾您来晚了，本期活动已开始，开启提醒，不再错过更多精彩</p>
				<a href="javascript:void(0)" class="openbtn">开启提醒</a>
			</div>
		</c:if>
	</div>

	<!--作业补交卡-->
<jsp:include page="/pages/header_footer.jsp">
	<jsp:param value="3" name="menu" />
</jsp:include>
<script type="text/javascript">
//给图片绑定展示事件
initMyImgShow();
</script>
<script type="text/javascript">
$(function(){
	if('${showSuccessTips}'){
		_successTips("报名成功");
	}		
});
	$.cookie('activity_type_detail',true);
	function viewKnowledgeDetail(id){
		top.location="/yzmm/account/knowledge/viewDetail?knowledgeId="+id;
			return;
	}
	function viewVodCourseDetail(id){
		window.location.href="/yzmm/account/course/toVodDetail?courseId="+id;
		return;
	}
	$(function(){
		$(".openbtn").click(function(){
			var activityId = '${activityId}'; 
			HH.ajax({
			    url:'/yzmm/account/activity/goddessplan/detail/openReminder',
			    data:{
			    	activityId:activityId
			    	},
			    callback:function(data){
			   		if(data.success){
			   			toast("设置提醒成功");
			   			$(".clockBox").parent().fadeOut();
			   			$(".clockme").css("background-color","#999");
			   			$(".clockme").unbind();
			   		}else{
			   			toast(data.msg);
			   		}
			    }
			});
		});
	})
</script>
</body>
</html>