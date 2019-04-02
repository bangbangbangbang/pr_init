<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <!--忽略页面中的邮箱格式为邮箱-->
     <title>喵姐早教说</title>
     <%@include file="../../../header_v2.4.0.jsp" %>
     <%@include file="../../../header_wxjsapi.jsp"%>
    <link rel="stylesheet" href="<b:staticUrl>/res/css/prekindergarten/targetlist.css</b:staticUrl>">
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
        <!--顶部的标题-->
       <div class="targetHeader clearfix">
           <div class="headerLeft">
                <img src="<b:staticUrl>/res/img/prekindergarten/u2165.jpg</b:staticUrl>" alt="" class="headerImg">
           </div>
            <div class="headerRight">
                <h3>${name}</h3>
                <p>第${empty week?1:week}阶段  ·（${begindate} - ${enddate}）</p>
            </div>
       </div>
       <!--本周目标清单列项-->
       <div class="targetList">
            <h4>本阶段目标</h4>
            <c:forEach items="${list}" var="target" varStatus="status">
				<p class="list${status.index+1}">${target.target}</p>
			</c:forEach>
            <img src="<b:staticUrl>/res/img/prekindergarten/u2175.png</b:staticUrl>" alt="" class="listImg">
            <div class="liatWel">
                <span class="welTo">welcome to</span>
                <span class="welWeek">Week ${empty week?1:week}</span>
            </div>
       </div>
       <!--预览任务卡按钮-->
       <div class="planJoin clearfix">
           <img src="<b:staticUrl>/res/img/prekindergarten/u2207.png</b:staticUrl>" alt="" class="planLeft">
           	<c:choose>
           		<c:when test="${preview=='true'}">
           			<a>查看第一天任务</a>
           		</c:when>
           		<c:otherwise>
           			 <a>查看任务卡</a>
           		</c:otherwise>
           	</c:choose>
            <img src="<b:staticUrl>/res/img/prekindergarten/u2205.png</b:staticUrl>" alt="" class="planRight">
       </div>
    </div>
		<c:choose>
			<c:when test="${preview=='true'}">
				<script type="text/javascript">
					$(function(){
						$(".planJoin").on("click",function(){
							HH.href("/yzmm/account/activity//kja/task//tasklistPreview?activityId=${activityId}&todetail=true");
						})
					});
			 	</script>
			</c:when>
			<c:otherwise>
				<script type="text/javascript">
					$(function(){
						$(".planJoin").on("click",function(){
							HH.href("/yzmm/account/activity/kja/task/receivetasklist?activityId=${activityId}&dayTime=${dayTime}");
						})
					});
			 	</script>
			</c:otherwise>
		</c:choose>
    </script>
</body>
</html>