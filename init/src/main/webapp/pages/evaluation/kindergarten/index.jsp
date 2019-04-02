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
	<link rel="stylesheet" href="<b:staticUrl>/res/css/prekindergarten/activityPage.css</b:staticUrl>">
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
		<img src="<b:staticUrl>/res/img/prekindergarten/activitypage/ryhome.png</b:staticUrl>" alt="" class="activityImg"/>
		<div class="activitAsk">
			<h3 class="askTitle">为什么要做入园适应训练？</h3>
			<ul class="askList clearfix">
				<li>• 降低分离焦虑</li>
				<li>• 学会生活自理</li>
				<li>• 提升语言表达</li>
				<li>• 增强社交能力</li>
				<li>• 量身定制方案</li>
				<li>• 贴身智能教练</li>
			</ul>
		</div>
		<div class="activitAsk">
			<h3 class="askTitle askTitle1">为什么要选择喵姐早教说产品？</h3>
			<div class="askList">
				<p>• “家庭版入园适应训练”由早期教育专家喵姐高寿岩带队研发</p>
				<p>• 72项智能任务单元凝聚国内早教行业强大脑智慧</p>
				<p>• 国内第一套AI人工智能宝宝入园适应训练方案</p>
				<p>• 因材施教，根据宝宝适应情况及提升改善程度智能推送训练项目</p>
				<p>• 教练式每日指导，清晰指导解决问题具体方法</p>
			</div>
		</div>
		<div class="activitContentTil clearfix">
			<img src="<b:staticUrl>/res/img/prekindergarten/activitypage/u10377.png</b:staticUrl>" alt="" / class="titImgLeft">
			<p>特色内容</p>
			<img src="<b:staticUrl>/res/img/prekindergarten/activitypage/u10377.png</b:staticUrl>" alt="" / class="titImgRight">
		</div>
		<!--特色内容-->
		<div class="activitContent clearfix">
			<!--左边图标-->
			<ul class="contentLeft fl">
				<li class="leftLi"><img src="<b:staticUrl>/res/img/prekindergarten/activitypage/u10385.png</b:staticUrl>" alt="" /></li>
				<img src="<b:staticUrl>/res/img/prekindergarten/activitypage/u10399.png</b:staticUrl>" alt="" class="verticalLine"/>
				<li class="leftLi"><img src="<b:staticUrl>/res/img/prekindergarten/activitypage/u10393.png</b:staticUrl>" alt="" /></li>
				<img src="<b:staticUrl>/res/img/prekindergarten/activitypage/u10399.png</b:staticUrl>" alt=""  class="verticalLine"/>
				<li class="leftLi"><img src="<b:staticUrl>/res/img/prekindergarten/activitypage/u10403.png</b:staticUrl>" alt="" /></li>
				<img src="<b:staticUrl>/res/img/prekindergarten/activitypage/u10399.png</b:staticUrl>" alt=""  class="verticalLine"/>
				<li class="leftLi"><img src="<b:staticUrl>/res/img/prekindergarten/activitypage/u10413.png</b:staticUrl>" alt="" /></li>
			</ul>
			<!--右边的内容-->
			<ul class="contentRight fr">
				<li class="rightLi">
					<h3>专属定制训练</h3>
					<p>通过宝宝入园适应能力测试，给出专业训练方案。</p>
				</li>
				<div class="blankLine"></div>
				<li class="rightLi rightLi1">
					<h3>导师专业指导</h3>
					<p>通过训练项目自测，导师给出专属宝宝个人能力的分析和指导。</p>
				</li>
				<div class="blankLine"></div>
				<li class="rightLi rightLi1">
					<h3>入园基金</h3>
					<p>宝妈和宝宝每天坚持训练任务，还能领取“现金红包”，为TA攒下一笔入园基金。</p>

				</li>
				<div class="blankLine"></div>
				<li class="rightLi rightLi1">
					<h3>毕业证书</h3>
					<p>每一份坚持和努力，都会有回报，当宝宝结束入园适应训练，将获得喵姐早教说颁发的“毕业证书”作为奖励。</p>
				</li>
			</ul>
		</div>
		<p class="activityBtnText">以上内容报名成功后立即生效</p>
		<a href="javascript:void(0);" class="activityBtn">免费测试</a>
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