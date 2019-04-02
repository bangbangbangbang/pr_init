<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix='j' uri='/jsputil'%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="format-detection" content="telephone=no" />
<meta name="format-detection" content="email=no" />
<title>喵姐早教说</title>
<%@include file="../../header_v2.4.0.jsp"%>

<link rel="stylesheet" href="<b:staticUrl>/res/css/activity/prekindergarten/kja/share.css</b:staticUrl>">
<%@include file="../../header_wxjsapi.jsp"%>
<style>
body {
	background-color: #f2f2f2;
}

.wrapPage {
	width: 100%;
	min-height: 18rem;
}
</style>
<script>
	var wxfenxiangcb = {
		title : '${wxshare.title}', // 分享标题
		desc : '${wxshare.desc}',
		link : '${wxshare.link}', // 分享链接
		imgUrl : '${wxshare.imgUrl}', // 分享图标
		shareTimeline : function(bool) {
		},
		shareAppMessage : function(bool) {
		}
	};
	initwxfx(wxfenxiangcb);
</script>
</head>
<body>
	<div class="wrapPage">
		<!--顶部的标题-->
		<div class="trainHeader clearfix">
			<div class="headerText">
				<p class="textTit">家庭版入园适应训练</p>
				<p class="textAtta">专属定制入园适应训练，帮助宝宝顺利入园</p>
			</div>
		</div>
		<div class="trainContent">
			<!--内容的第一部分推荐信息-->
			<div class="contentReco ">
				<div class="clearfix">
					<div class="leftImg">
						<img src="${albumUrl }" alt="">
					</div>
					<div class="leftTxt">
						<p class="txtName">${nickName }</p>
						<p class="txtBaby">第${week }阶段 · 连续打卡${rewardNum }天</p>
					</div>
				</div>
				<img src="<b:staticUrl>/res/img/prekindergarten/comment/u4837.jpg</b:staticUrl>" alt="" class="trophy">
				<p class="baby">
					宝宝：<span>${babyNickname }</span>
				</p>
				<p class="honor">获&nbsp;“优秀宝宝”&nbsp;荣誉</p>
			</div>
			<!--小卟咪的测评成绩单-->
			<!--小卟咪的训练计划-->
			<h3 class="contentTitle">
				<span>${babyNickname }</span>的入园适应训练进度
			</h3>
			<div class="contentReco">
				<p class="recoTime">
					总训练时长：<span>${weekCount }周 · ${actDays }天</span>
				</p>
				<p class="recoTerm">
					总训练项目 ${taskCount }项，已完成 <span>${completeTaskCount }</span> 项
				</p>
			</div>
			<!--小卟咪的训练主题-->
			<h3 class="contentTitle">
				<span>${babyNickname }</span>的入园适应训练进度
			</h3>
			<!--社会交往-->
			<div class="contentReco clearfix">
				<div class="recoSubLe">
					<p>社会交往</p>
				</div>
				<div class="recoSubRi clearfix">
					<p class="subMar">• 适应能力</p>
					<p class="subMar">• 专注做事</p>
					<p>• 遵守规则</p>
					<p>• 与人合作</p>
				</div>
			</div>
			<!--语言表达-->
			<div class="contentReco clearfix">
				<div class="recoSubLe">
					<p class="lang">语言表达</p>
				</div>
				<div class="recoSubRi clearfix">
					<p class="subLan subMar">• 理解他人意图</p>
					<p class="subLan">• 服从指令</p>
					<p class="subLan">• 向不熟悉的人表达需求</p>
				</div>
			</div>
			<!--生活自理-->
			<div class="contentReco clearfix">
				<div class="recoSubLe">
					<p>生活自理</p>
				</div>
				<div class="recoSubRi clearfix">
					<p class="subMar">• 吃饭习惯</p>
					<p class="subMar">• 排便控制</p>
					<p>• 睡眠作息</p>
					<p>• 自我服务意识</p>
				</div>
			</div>
			<!--家庭准备-->
			<div class="contentReco clearfix">
				<div class="recoSubLe">
					<p class="lang">家庭准备</p>
				</div>
				<div class="recoSubRi clearfix">
					<p class="subLan subMar">• 亲子依恋关系</p>
					<p class="subLan">• 孩子的安全感</p>
					<p class="subLan">• 家庭的心态及重视程度</p>
				</div>
			</div>
			<p class="recoBottom">不哭不闹少生病，快速适应幼儿园</p>
			<p class="recoBottom recoCode">心动吗？心动就来围观吧！</p>
			<div class="planJoin clearfix">
				<a href="#">去看看</a>
			</div>
		</div>
	</div>
	<div class="line"></div>
	<script type="text/javascript">
		$(function(){
			$('.planJoin').on('click',function(){
				HH.href("/yzmm/account/activity/prekindergarten/testordetail?id=${activityId}")
			});
		})
	</script>
</body>
</html>
