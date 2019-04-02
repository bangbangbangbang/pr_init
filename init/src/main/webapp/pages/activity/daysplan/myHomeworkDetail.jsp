<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta name="format-detection" content="telephone=no" />
	<meta name="format-detection" content="email=no"/>
	<%@include file="../../header_v15.jsp"%>
	<%@include file="../../header_wxjsapi.jsp"%>
	<script src="<b:staticUrl>/res/js/wxmppay.js</b:staticUrl>"></script>
	 <link rel="stylesheet" type="text/css" href="<b:staticUrl>/res/css/share.css</b:staticUrl>" />
	<link rel="stylesheet" href="<b:staticUrl>/res/css/style-v1.2.2.css</b:staticUrl>">
	<title>我的作业详情</title>
	
	<style type="text/css">
	/** 样式文件变更，增加此项属性不对header进行修改**/
		.arrow{
			all:initial;
		}
		.i-other{
			inline-block;
		}
	</style>
	<script type="text/javascript">
	var wxfenxiangcb_dtl={
				title: '${wxshare.title}', // 分享标题
				desc : '${wxshare.desc}',
			    link: '${wxshare.link}', // 分享链接
			    imgUrl: '${wxshare.imgUrl}', // 分享图标
			    shareTimeline:function(bool){
			    	location.href='/yzmm/account/activity/daysPlan/shareMyHomeWork?dayId='+"${dayId}"+'&uid='+"${uid}";
			    },
			    shareAppMessage:function(bool){
			    	location.href='/yzmm/account/activity/daysPlan/shareMyHomeWork?dayId='+"${dayId}"+'&uid='+"${uid}";
			    }
			};
	
			 initwxfx(wxfenxiangcb_dtl);
			
	</script>
</head>
<body id="shareBg">
<input style="display:none;" id="dayId" value="${dayId}">
<div>
	<img style="width: 100%;" alt="" src="<b:staticUrl>/res/img/activity30days.jpg</b:staticUrl>">
	<div class="share">
			<div class="shareBox">
				<div class="arrow"></div>
				<p class="font15">当日任务还差最后一步哟～</p>
				<p class="font32">加油吧！</p>
			</div>
		</div>
</div>
<%-- <div class="shareTop">
	<c:if test="${shareHomework.isPrivacy=='PRIVACY'}">
		<div class="font18 tit">想看我的作业？哈哈哈...今天的作业已加密，想要分享我的小秘密，那就快来参加喵姐早教说训练营吧~ </div>
	</c:if>
	<c:if test="${shareHomework.isPrivacy=='OPEN'}">
		<a href="javascript:void(0)" class="closeBtn close"></a>
		<img src="<b:staticUrl>/res/img/center-old/top.png</b:staticUrl>" class="imgtit" >
		<div class="font18 tit">${shareHomework.dayTitle}</div>
		<div class="mebInfo">
			<div class="photo"><img src="${shareHomework.albumUrl }" ></div>
			<div class="font12 phR">
				<p class="font12">${shareHomework.nickName }</p>
				<p class="font12">
				<c:choose>
					<c:when test="${shareHomework.education == 'GRAVIDA'}">
						<span class="i-yun"></span>已怀孕&nbsp;&nbsp;${shareHomework.babyBirthdayString }
					</c:when>
					<c:when test="${shareHomework.education == 'MOM'}">
						<c:if test="${shareHomework.babySex == 'MALE' }">
							<span class="i-boy"></span>小王子&nbsp;&nbsp;${shareHomework.babyBirthdayString }
						</c:if>
						<c:if test="${shareHomework.babySex == 'FAMALE' }">
							<span class="i-girl"></span>小公主&nbsp;&nbsp;${shareHomework.babyBirthdayString }
						</c:if>
					</c:when>
					<c:when test="${shareHomework.education == 'HELPER'}">
						<span class="i-other"></span>喵星人&nbsp;&nbsp;
					</c:when>
					<c:otherwise>
					
					</c:otherwise>
				</c:choose>
				</p>
			</div>
		</div> 
		<div class="font12 word">
			${shareHomework.content}
		</div>
	</c:if>
	<c:if test="${shareHomework.isPrivacy!='PRIVACY'}">
		<div class="share">
			<div class="shareBox">
				<div class="arrow"></div>
				<p class="font15">当日任务还差最后一步哟～</p>
				<p class="font32">加油吧！</p>
			</div>
		</div>
	</c:if>
	<c:if test="${shareHomework.isPrivacy=='PRIVACY'}">
		<div class="share">
			<div class="shareBox">
				<div class="arrow"></div>
				<br/><br/><br/>
				<p class="font13">作业已加密，小喵会安全的将作业私密给喵姐哒～</p><br/>
				<p class="font13">请小主放心分享吧！</p><br/>
				<p class="font12" style="color: white;">（分享朋友圈，提交作业才会成功哦）</p>
			</div>
		</div>
	</c:if>
	<div class="img"><img src="${shareHomework.dayimgFirst }" ></div>
	<img src="<b:staticUrl>/res/img/center-old/code.png</b:staticUrl>" class="imgfoot">
</div> --%>
<div class="prompt">
    <div class="promptBox">
    	<div class="font18 tit">温馨提示</div>
        <div class="font15 word4">当日任务就差最后一步啦，确认要取消吗？取消之后，作业会帮您自动保存草稿，过一会儿您可以直接点击{提交作业}重新编辑哟。</div>
        <a href="#" class="font18 sureBtn">确定</a>
    </div>
</div>

<script type="text/javascript">
//初始化页面
$(".share").show();
$(".share").click(function(){
	$(".share").hide()
});


</script>
<!-- 初始化 -->
<script type="text/javascript">
$(".close").click(function(){
	var activityId = $("#activityId").val();
	location.href='/yzmm/account/activity/goddessplan/detail/statusSeleter?activityId='+activityId+'&processStatus=DOING';
});
</script>
</body>
</html>