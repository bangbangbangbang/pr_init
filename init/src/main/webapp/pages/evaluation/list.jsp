<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--忽略页面中的邮箱格式为邮箱-->
<meta name="format-detection" content="email=no"/>
 <%@include file="../header_v2.0.jsp" %>
 <%@include file="../header_wxjsapi.jsp"%>
 <script src="<b:staticUrl>/res/js/scroll.js</b:staticUrl>"></script>
 <link rel="stylesheet" href="<b:staticUrl>/res/css/activity-v2.0.css</b:staticUrl>" >
<title>喵姐早教说</title>
<style type="text/css">
	 .contailner{
	 	width: 100%;
		max-width: 540px;
	 }
	 .subject{
	 	text-align: center;
		position: relative;
		padding: 2px;
		margin: 5px 0;
	 }
	 .subject img{
	 	width: 90%;
	 	opacity:0.6;
	 }
	 .subject .count{
	 	position: absolute;
		top: 67%;
		right: 9%;
		font-size: 13px;
	 }
	 .subject .name{
	 	position: absolute;
		top: 79%;
		right: 9%;
		font-size: 18px;
	 }
	 .subject .give{
	 	background: url(/res/img/evaluation/give.png?v=2.3.10) no-repeat center;
		width: 50px;
		height: 35px;
		position: absolute;
		top: 3%;
		left: 7%;
		color:white;
		font-size: 10px;
		text-align: left;
	 }
	 .top{
		height: 50px;
		padding: 25px;
	 }
	 .new{
	 	font-size: 16px;
		color: #FF6600;
		float: left;
	 }
	 .detail{
	 	font-size: 11px;
		color: #BCBCBC;
		float: right;
	 }
	 ul{
	 	font-size: 13px;
	 	padding: 10px 25px;
		line-height: 35px;
		border-bottom: 5px solid rgba(242, 242, 242, 1);
	 }
	 ul .li1{
	 	background: url(/res/img/evaluation/title.png?v=2.3.10) no-repeat center;
	 	background-size: 5%;
		background-position-x: 0px;
		padding-left: 30px;
	 }
	 ul .li2{
	 	background: url(/res/img/evaluation/time.png?v=2.3.10) no-repeat center;
	 	background-size: 5%;
		background-position-x: 0px;
		padding-left: 30px;
	 }
	 ul .li3{
	 	background: url(/res/img/evaluation/score.png?v=2.3.10) no-repeat center;
	 	background-size: 5%;
		background-position-x: 0px;
		padding-left: 30px;
	 }
	 font {
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
	<div class="contailner">
		<!-- 最新测评数据： -->
		<c:if test="${not empty cpWdResult }">
			<div>
				<div class="top">
					<span class="new">最新测评数据：</span>
					<span class="detail" data-cpid="${cpWdResult.cpId}">查看详情 &gt;</span>
				</div>
				<ul>
					<c:if test="${type=='ORDINARY'}">
						<li class="li1">${subjectName}</li>
						<li class="li2">测评时间：<span id='cpdate'></span></li>
						<li class="li3">培养一个成功的孩子您有 <font>${cpWdResult.score}%</font> 的可能性</li>
					</c:if>
					<c:if test="${type=='KINDERGARTEN'}">
						<li class="li1">入园适应训练测评</li>
						<li class="li2">测评时间：<span id='cpdate'></span></li>
						<li class="li3">宝贝各项入园适应能力总得分 <font>${cpWdResult.score}</font>分</li>
					</c:if>
				</ul>
			</div>
		</c:if>
		<!-- 课程列表 -->
		<div>
			<c:forEach items="${list }" var="item" >
				<div class="subject" data-id="${item.id }" data-giveidentity="${item.giveIdentity}">
					&nbsp;<img alt="" src="${item.subjectImg }" />
					<span class="count">${item.id+23014 }位家长完成测试</span><br>
					<span class="name"><b>${item.subjectName }</b></span>
					<c:if test="${item.giveIdentity=='1' }">
						<div class="give">会员专享</div>
					</c:if>
				</div>
			</c:forEach>
		</div>
	</div>
	<jsp:include page="/pages/header_footer.jsp">
		<jsp:param value="4" name="menu"/>
</jsp:include>
<script type="text/javascript">
	$(function(){
		$("#cpdate").html(fmtSecond('${cpWdResult.completeTime}'));
		$(".detail").on('click',function(){
			HH.href("/yzmm/account/evaluation/detail?cpId="+$(this).data('cpid'));
		});
		$(".subject").on('click',function(){
			var self=$(this);
			var giveidentity=self.data('giveidentity');
			if(giveidentity==1){
				if('${isvip}'=='false'){
					toast('成为vip才可参加');
					return;
				}
			}
			HH.href("/yzmm/account/evaluation/detail?cpId="+$(this).data('id'));
		});
	});
</script>
</body>
</html>