<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<!--忽略页面中的邮箱格式为邮箱-->
	<meta name="format-detection" content="email=no"/>
	<%@include file="../../header_v2.4.0.jsp" %>
	<%@include file="../../header_wxjsapi.jsp"%>
	<title>喵姐早教说</title>
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
			<div class="sleepActivity">
				<img src="<b:staticUrl>/res/img/prekindergarten/sleepTrain/u73.jpg</b:staticUrl>" alt="" class="activityImg">
				<div class="activitAsk">
					<h4 class="askSubtitle">好习惯养成</h4>
					<h3 class="askTitle">好好睡觉</h3>
					<p class="askList">适合人群：1.5岁以上宝宝家长</p>
				</div>
				<div class="line"></div>
				<p class="activitTextP">拥有充足的睡眠才能健康成长，14天睡眠引导训练，解决宝宝安睡一大难题。</p>
				<!--星级重要性-->
				<div class="starContent clearfix">
					<!--<ul class="clearfix">
						<li>★</li>
						<li>★</li>
					</ul>-->
					<p class="starInterest">找出宝宝无法安睡原因</p>
				</div>
				<div class="starContent clearfix">
					<!--<ul class="clearfix">
						<li>★</li>
						<li>★</li>
						<li>★</li>
					</ul>-->
					<p class="starInterest">定制宝宝睡眠时间表</p>
				</div>
				<div class="starContent clearfix">
					<!--<ul class="clearfix">
						<li>★</li>
						<li>★</li>
						<li>★</li>
						<li>★</li>
					</ul>-->
					<p class="starInterest">养成安睡好习惯</p>
				</div>
				<div class="starContent clearfix">
					<!--<ul class="clearfix">
						<li>★</li>
						<li>★</li>
						<li>★</li>
						<li>★</li>
						<li>★</li>
					</ul>-->
					<p class="starInterest">帮助妈妈摆脱“哄睡”困扰</p>
				</div>
				<div class="line"></div>
				<div class="activitContentTil clearfix">
					<p class="contentTitle">特色内容</p>
					<p class="activityBtnText">以下内容报名成功后立即生效</p>
				</div>

				<!--特色内容-->
				<div class="activitContent clearfix">
					<!--左边图标-->
					<ul class="contentLeft fl">
						<li class="leftLi"><img src="<b:staticUrl>/res/img/prekindergarten/activitypage/u10385.png</b:staticUrl>" alt=""></li>
						<img src="<b:staticUrl>/res/img/prekindergarten/activitypage/u10399.png</b:staticUrl>" alt="" class="verticalLine">
						<li class="leftLi"><img src="<b:staticUrl>/res/img/prekindergarten/activitypage/u10393.png</b:staticUrl>" alt=""></li>
						<img src="<b:staticUrl>/res/img/prekindergarten/activitypage/u10399.png</b:staticUrl>" alt="" class="verticalLine">
						<li class="leftLi"><img src="<b:staticUrl>/res/img/prekindergarten/activitypage/u10403.png</b:staticUrl>" alt=""></li>
					</ul>
					<!--右边的内容-->
					<ul class="contentRight fr">
						<li class="rightLi">
							<h3>训练项目专属定制</h3>
							<p>活动开始前，需要完成一份关于宝宝各项能力的测评，根据测评结果自动筛选，定制专属训练项目。</p>
						</li>
						<div class="blankLine"></div>
						<li class="rightLi rightLi1">
							<h3>专业指导</h3>
							<p>每一项任务对应一份专业自测题，每一份自测题目又涵盖导师专业指导。</p>
						</li>
						<div class="blankLine"></div>
						<li class="rightLi rightLi1">
							<h3>成长基金</h3>
							<p>由喵姐早教说投资，天天做任务，天天领现金红包，为宝宝挣取人生第一桶金。</p>

						</li>
					</ul>
				</div>
				<div class="line"></div>
				<div class="activitContentTil clearfix">
					<p class="contentTitle">任务规则</p>
					<p class="activityBtnText">为保证学习效果，请认真读完以下内容：</p>
				</div>
				<div class="btnContent">
					<p>1、本训练项目共两周时间，每七天为一周，将在第七天时给出周测试；</p>
					<p>2、每天完成任务及分享任务卡都可获得“成长基金”换取现金红包；</p>
					<p>3、连续完成3天任务，可获得一项荣誉；连续7天，可获得一张平台奖励券。</p>
				</div>
				<p class="completeText">每天陪宝宝完成一个小任务，共同成长一大步。</p>
				<a href="javascript:void(0);" class="activityBtn">免费测试</a>
			</div>
		</div>
    <script type="text/javascript">
	$(function(){
		$(".activityBtn").click(function(){
			HH.href("/yzmm/account/evaluation/toWelcome?id=${id}");
		});
	})
	</script>
</body>
</html>