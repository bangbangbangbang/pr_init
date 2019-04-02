<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--忽略页面中的邮箱格式为邮箱-->
<meta name="format-detection" content="email=no"/>
 <%@include file="../../header_v2.0.jsp" %>
 <%@include file="../../header_wxjsapi.jsp"%>
 <script src="<b:staticUrl>/res/js/scroll.js</b:staticUrl>"></script>
 <link rel="stylesheet" href="<b:staticUrl>/res/css/activity-v2.0.css</b:staticUrl>" >
<title>喵姐早教说</title>
<style type="text/css">
	.foot{
	    width: 100%;
		max-width: 540px;
	    text-align: center;
	    top: 0.8rem;
	    border-bottom: 5px solid rgba(242, 242, 242, 1);
	    padding: 0.8rem;
	}
	.foot .comment{
	    font-size: 0.4rem;
		line-height: 38px;
		margin-top: 20px;
		margin-left: auto;
		margin-right: auto;
		border: 1px solid #ff9900;
		border-radius: 20px;
		width: 247px;
		height: 40px;
		text-align: center;
		color: #FFFFFF;
		background-color: rgba(255, 153, 0, 1);
	}
	.foot  p{
		font-size: 12px;
		color: #868686;
	}
	.font20{
		font-size:20px;
		color:#333;
		padding: 0.5rem;
	}
	.font18{
		font-size: 18px;
		color: #0099FF;
	}
	
	ul{
	 	font-size: 13px;
	 	padding: 10px 25px;
		line-height: 35px;
		border-bottom: 5px solid rgba(242, 242, 242, 1);
	 }
	 ul .li1{
	 	background: url(<b:staticUrl>/res/img/evaluation/title.png</b:staticUrl>) no-repeat center;
	 	background-size: 5%;
		background-position-x: 0px;
		padding-left: 30px;
	 }
	 ul .li2{
	 	background: url(<b:staticUrl>/res/img/evaluation/time.png</b:staticUrl>) no-repeat center;
	 	background-size: 5%;
		background-position-x: 0px;
		padding-left: 30px;
	 }
	 ul .li3{
	 	background: url(<b:staticUrl>/res/img/evaluation/score.png</b:staticUrl>) no-repeat center;
	 	background-size: 5%;
		background-position-x: 0px;
		padding-left: 30px;
	 }
	.top{
		height: 50px;
		padding: 25px;
		position: relative ;
		border-bottom: 1px solid rgba(242, 242, 242, 1);
	 }
	 .new{
	 	font-size: 12px;
		color: #A1A1A1;
		float: left;
		position: absolute ;
		top:20%;
	 }
	 .detail{
	 	font-size: 11px;
		color: #0099FF;
		float: right;
	 }
	 font{
	 	font-family: 'Arial-BoldItalicMT', 'Arial Bold Italic', 'Arial';
	 	font-size: 28px;
	 	color:#333;
	 }
	 .score{
	 	color:#FF6600;
	 	font-size:15px;
	 }
</style>
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
	<div>
	</div>
	<div class="foot">
		<!-- 标题 -->
		<div class="font20">${cpwd.subjectName }</div>
		<!-- 测评开始 -->
		<%-- <p>新的一轮测评，预祝您有新的收获</p>
		<div class="comment" onclick="HH.href('/yzmm/account/evaluation/toWelcome?id=${cpId}');">开始测试</div> --%>
		<!-- 距离开始 -->
		<c:if test="${not empty respList}">
			<c:if test="${unixTime<(respList[0].completeTime+cpwd.intervalTime) }">
				<p>距下一轮测评时间还剩</p>
				<span class="font18 djs">0 天00 时00 分00 秒</span>
				<script type="text/javascript">
					$(function(){
						var time='${(respList[0].completeTime+cpwd.intervalTime)-unixTime }';//倒计时
						var timer=null;
						clearInterval(timer);
						timer = setInterval(function(){
							if(time<0){
								clearInterval(timer);
							}
							--time;
							var dd = parseInt(time/(3600*24));
							var hh = parseInt(time%(3600*24)/3600);
							var mm=parseInt(time%3600/60);
							var ss=parseInt(time%3600%60);
							var timetext = "";
							if(dd){
								timetext+=dd+' 天 ';
							}
							if(hh){
								timetext+=hh+' 时 ';
							}
							if(mm){
								timetext+=mm+' 分 ';
							}else{
								if(hh){
									timetext+=' 0分 ';
								}
							}
							if(ss){
								timetext+=ss+" 秒 ";
							}else{
								if(mm){
									timetext+=' 0秒';
								}
							}
							$('.djs').text(timetext);
						},1000);
					});
				</script>
			</c:if>
			<c:if test="${unixTime>(respList[0].completeTime+cpwd.intervalTime) }">
				<p>新的一轮测评，预祝您有新的收获</p>
				<div class="comment" onclick="HH.href('/yzmm/account/evaluation/toWelcome?id=${cpId}');">开始测试</div>
			</c:if>
		</c:if>
		<c:if test="${empty respList}">
				<p>新的一轮测评，预祝您有新的收获</p>
				<div class="comment" onclick="HH.href('/yzmm/account/evaluation/toWelcome?id=${cpId}');">开始测试</div>
		</c:if>
	</div>
	<!-- 结果列表 -->
	<div>
		<c:forEach items="${respList }" var="item" begin="0" varStatus="status">
			<div class="top">
				<span class="new">第 <font >${respListSize-status.count + 1}</font> 次测评：</span>
				<span class="detail" data-id="${item.id}">查看详情 &gt;</span>
			</div>
			<ul>
				<li class="li1">${item.cpName}</li>
				<li class="li2">测评时间：<span class='cpdate' data-completetime="${item.completeTime }"></span></li>
				<li class="li3">培养一个成功的孩子您有 <font class="score">${item.score}%</font> 的可能性</li>
			</ul>
		</c:forEach>
		<script type="text/javascript">
		$(function(){
			var cpdates=$('.cpdate');
			cpdates.each(function(){
				var self=$(this);
				var time=self.data('completetime');
				self.text(fmtDate(new Date(time*1000),'yyyy-MM-dd hh:mm:ss'));
			});
			var details=$('.detail');
			details.on('click',function(){
				var self=$(this);
				var id=self.data('id');
				HH.href("/yzmm/account/evaluation/result/toResult?id="+id);
			});
			/* /yzmm/account/evaluation/result */
		});
		</script>
	</div>
	<jsp:include page="/pages/header_footer.jsp">
		<jsp:param value="4" name="menu"/>
</jsp:include>
</body>
</html>