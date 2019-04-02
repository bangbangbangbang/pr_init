<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <!--忽略页面中的邮箱格式为邮箱-->
     <title>喵姐早教说</title>
     <%@include file="../../../header_v2.4.0.jsp" %>
     <%@include file="../../../header_wxjsapi.jsp"%>
    <link rel="stylesheet" href="<b:staticUrl>/res/css/prekindergarten/sleepTrain.css</b:staticUrl>">
    <script>
	var wxfenxiangcb={
			title: '${wxshare.title}', // 分享标题
			desc : '${wxshare.desc}',
		    link: '${wxshare.link}', // 分享链接
		    imgUrl: '${wxshare.imgUrl}', // 分享图标
		    shareTimeline:function(bool){
		    },
		    shareAppMessage:function(bool){
		    }
	};
	initwxfx(wxfenxiangcb);
	</script>
</head>
<body>
		<div class="wrapPage">
			<div class="sleepList">
				<h3 class="listTit">好习惯养成</h3>
				<h2 class="listSubtitle">好好睡觉</h2>
				<p  class="listStage">第${empty week?1:week}阶段训练目标</p>
				<div class="line"></div>
				<c:forEach items="${list}" var="target" varStatus="status">
					<p class="list list${status.index+1}" >${target.target}</p>
				</c:forEach>
				<c:choose>
	           		<c:when test="${preview=='true'}">
	           			<a href="#" class="joinBtn">查看第一天任务</a>
	           		</c:when>
	           		<c:otherwise>
	           			 <a href="#" class="joinBtn">查看任务卡</a>
	           		</c:otherwise>
	           	</c:choose>
				<div class="blankLine"></div>
			</div>
		</div>
		<c:choose>
			<c:when test="${preview=='true'}">
				<script type="text/javascript">
					$(function(){
						$(".joinBtn").on("click",function(){
							HH.href("/yzmm/account/activity//kja/task//tasklistPreview?activityId=${activityId}&todetail=true");
						})
					});
			 	</script>
			</c:when>
			<c:otherwise>
				<script type="text/javascript">
					$(function(){
						$(".joinBtn").on("click",function(){
							HH.href("/yzmm/account/activity/kja/task/receivetasklist?activityId=${activityId}&dayTime=${dayTime}");
						})
					});
			 	</script>
			</c:otherwise>
		</c:choose>
	</body>
</html>