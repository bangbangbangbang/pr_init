<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head lang="en">
<meta charset="UTF-8">
<title>喵姐早教说</title>
<%@include file="../header_v2.1.jsp"%>
<style type="text/css">
	 .invitationTop{
	 	background-color: rgba(255, 161, 46, 1);
	 	text-align: center;
	 }
	 .invitationTop .content{
	 	width: 85%;
	 	display: inline-block;
	 	margin: 1rem 0 1rem 0;
	 	border: 0.06rem solid #efeff4;
	 }
	 .invitationTop .headImg{
	 	width: 2.1rem;
		height: 2.1rem;
		display: inline-block;
		border-radius: 1.2rem;
		border: 0.06rem solid #efeff4;
	 }
	 .invitationTop span{
	 	color:white;
	 }
	 .invitationTop .content .spanBottom{
		font-size: 30%;
		background-color: rgba(255, 161, 46, 1);
		position: relative;
		bottom: -0.3rem;
		padding: 0 0.6rem 0 0.6rem;
	 }
	 .userInfo{
	 	width: 30%;
		display: inline-block;
		background-color: rgba(255, 161, 46, 1);
		position: absolute;
		left: 36%;
		top: 2.3%;
	 }
	 .sectionCnt{
	 	padding: 0 0.7rem 0 0.7rem;
	 	font-size: 0.25rem;
	 }
	 .cntTitle{
	 	display: inline-block;
		text-align: center;
		padding: 0.7rem 0 0 0;
		width: 50%;
		border-bottom: 0.03rem solid rgba(255, 161, 46, 1);
	 }
	 .cntTitle .title{
	 	font-size: 150%;
	 }
	 .cntTitle span{
	 	font-size: 0.25rem;
		position: relative ;
		bottom: -0.3rem;
		background-color: white ;
		padding: 0 0.4rem;
	 }
	 .cntContent{
	 	margin: 0.4rem 0 0 0;
		text-align: left;
		font-size: 149%;
		line-height: 0.9rem;
		color: #515151;
	 }
	 .cntContent table{
	 	font-size: 99%;
	 	color: #515151;
	 }
	 .cntContent table img{
	 	width: 1.4rem;
	 }
	 .cntContent table td{
	 	padding-left: 0.2rem;
	 }
	 .cntBottom{
		display: inline-block;
		width: 80%;
		border-bottom: 0.02rem solid rgb(236, 236, 236);
		margin: 0.5rem 0 0 0;
	 }
	 .marginTop{
	 	margin-top:0.5rem;
	 }
	 .cntBlock{
		 text-align: center ;
		 padding-top: 0.1rem;	
	 }
	 .invitationBottom{
	 }
	 .invitationBottom img{
	 	width:80%;
	 }
	 .timer{
		 background: url('/res/img/knowledge/timer.png?v=2.3.7') center no-repeat;
		background-size: 16px 16px;
		width: 16px;
		height: 16px;
		float: left;
		margin-right: 5px;
	 }
	 .time{
	 	color: #2c8fee;
	 }
	 .scrollAbsolute{
	 	width: 70%;
		text-align: center;
		background-color: rgba(255, 143, 26, 1);
		border-radius: 40px;
		position: fixed;
		top: 86%;
		left: 15%;
	 }
	 .scrollAbsolute img{
	 	width: 80%;
	 }
</style>
</head>
<body>
<section>
	<div class="invitationTop">
		<div class="content">
			<div class="userInfo">
				<div class="headImg"><img style="width: 2rem;height: 2rem;border-radius: 1rem;" src="${album}" />
				</div><br />
				<span style="font-size:0.35rem;">${name}</span>
			</div>
			<div style="margin-top: 2rem;">
				<span style="font-size: 1.5rem;">邀请卡</span><br />
				<span style=" font-size: 0.6rem;">I N V I T A T I O N</span><br />
				<span class="spanBottom">加入喵姐早教说，领取你的私人育儿顾问</span>
			</div>
		</div>
	</div>
</section>
<section class="sectionCnt">
<div class="cntBlock">
	<div class="cntTitle">
		<span class="title"><b>喵姐早教说</b></span>
	</div>
	<div class="cntContent">
		<p>喵姐27年早教经验，打造的家庭教育必听课程</p>
		<p>宝宝0-6岁所有遇见问题的权威答疑库</p>
		<p>和2000万辣妈一起，培养乐观有竞争力的精英宝宝</p>
	</div>
	<div class="cntBottom">
	</div>
</div>
<div class="cntBlock">
	<div class="cntTitle">
		<span class="title"><b>特色内容</b></span>
	</div>
	<div class="cntContent">
		<table style="">
			<tr style="height: 0.3rem;"><td></td></tr>
			<tr>
				<th rowspan="2"><img alt="" src="<b:staticUrl>/res/img/knowledge/sqw.png</b:staticUrl>"></th>
				<td><b>三千问</b></td>
			</tr>
			<tr>
				<td><p>宝宝常见问题解决方案知识库</p></td>
			</tr>
			<tr style="height: 0.5rem;"><td></td></tr>
			<tr>
				<th rowspan="2"><img alt="" src="<b:staticUrl>/res/img/knowledge/mjs.png</b:staticUrl>"></th>
				<td><b>喵姐说</b></td>
			</tr>
			<tr>
				<td><p>权威家庭教育专业课程</p></td>
			</tr>
			<tr style="height: 0.5rem;"><td></td></tr>
			<tr>
				<th rowspan="2"><img alt="" src="<b:staticUrl>/res/img/knowledge/1v1zx.png</b:staticUrl>"></th>
				<td><b>1V1育儿咨询</b></td>
			</tr>
			<tr>
				<td><p>随时随地咨询，针对您的问题，给出靠谱家庭教育建议</p></td>
			</tr>
		</table>
	</div>
	<div class="cntBottom">
	</div>
</div>
<div class="cntBlock">
	<div class="cntTitle">
		<span class="title"><b>适合人群</b></span>
	</div>
	<div class="cntContent">
		<div style="text-align: center;margin: 0.6rem 0 0 0rem;">
			<span style="color:#FF8F1A;"><b>0 - 6岁宝宝的父母</b></span>
		</div>
	</div>
	<div class="cntBottom">
	</div>
</div>
<div class="cntBlock">
	<div class="cntTitle">
		<span class="title"><b>你将获得</b></span>
	</div>
	<div class="cntContent">
		<p>
		移动的“育儿百科全书”，解决所有关于家庭教育的烦恼，成为科学养育的“好妈妈”！</p>
	</div>
	<div class="cntBottom">
	</div>
</div>

<div class="cntBlock">
	<div class="invitationBottom"><img alt="" src='<b:staticUrl>/res/img/knowledge/1yuanxrzx.png</b:staticUrl>' /></div>
	<div style="text-align: center;display: inline-block;">
		<c:if test="${status}">
			<div class="timer"></div>&nbsp;<p style="float: left;font-size: 130%;">还剩 <span class="time">29 分 38秒</span> 恢复原价 ￥79.00</p>
		</c:if>
		<c:if test="${!status}">
			<div></div>&nbsp;<p style="float: left;font-size: 130%;">感谢您的关注，该活动已经结束。请参加其他活动，谢谢</p>
		</c:if>
		<p><a href="/yzmm/index" style="color: #2c8fee;text-decoration: underline;font-size: 0.3rem;margin: 19% 0 0 24%;float: left ;">了解“喵姐早教说”&nbsp;&nbsp;&gt;</a></p>
	</div>
</div>
<c:choose>
	<c:when test="${!userAuthorise && status}">
		<div class="scrollAbsolute payBtn" data-id="${activityId}">
		   <img alt="" src='<b:staticUrl>/res/img/knowledge/buttonlk.png</b:staticUrl>' />
		</div>
	</c:when>
	<c:when test="${!status}">
	</c:when>
	<c:otherwise>
		<div class="scrollAbsolute comeinBtn">
		   <img alt="" src='<b:staticUrl>/res/img/knowledge/buttonlk.png</b:staticUrl>' />
		</div>
	</c:otherwise>
</c:choose>
<div style="height: 5rem;">
</div>
</section>
<script src="<b:staticUrl>/res/js/wxmppay.js</b:staticUrl>"></script>
<script>
$(document).ready(function(){
	var time=60*30;//倒计时三十分 秒
	var timer=null;
	clearInterval(timer);
	timer = setInterval(function() {
		if(time<0){
			clearInterval(timer);
		}
		--time;
		var mm=parseInt(time/60);
		var ss=parseInt(time%60);
		$('.time').text(mm+"分"+ss+"秒");
	},1000);
	
  $(".payBtn").on('click',function(){
		if('${isWeixin}'!="true"){
			toast("请您进入微信支付");
			return false;
		}
		var obj = $(this);
		var id = obj.data("id");
		wxmppayvirtualcard(id,function(orderId,result){
		if(result=="ok"){
			window.location.href="/yzmm/wxmppay/virtualcard/checkPay?orderId="+orderId;
		}
		});
	});
  
  $(".comeinBtn").on('click',function(){
		HH.href("/yzmm/account/knowledge/index?isVipShare=true");
	});
});

</script>
</body>
</html>