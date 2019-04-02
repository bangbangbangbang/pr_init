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
	<title>${topicTitle}</title>
	
	<%@include file="../header_v13.jsp"%>
	<%@include file="../header_wxjsapi.jsp"%>
	<link rel="stylesheet" href="<b:staticUrl>/res/css/myaudio.css</b:staticUrl>">
	<script type="text/javascript" src="<b:staticUrl>/res/js/myaudio.js</b:staticUrl>"></script>
	<script src="<b:staticUrl>/res/js/custom/lightbox/lightbox.js</b:staticUrl>"></script> 
	<style type="text/css">
		.myaudio{
		    margin-bottom: 10px;
		}
		.about-box{
			 line-height: 19px;
			 margin-top: 25px;
			 margin-left: 20px;
		}
		.voice_background {
		    margin-left: 5%;
		    width: 90%;
		    height: 1.1rem;
		    background: url("<b:staticUrl>/res/img/background-bofangqi.png</b:staticUrl>");
		    background-size: 100%;
		    border-radius: 12px;
		}
		.myaudio .mywrap {
		    height: 1.1rem;
		}
	</style>
</head>
<body id="bgwhite">
	<div class="font12 topic-tit">
		<span class="font17">${topicTitle }</span><i class="font17">|</i>${releasePerson}
	</div>
	<div class="font12 topic-audio">
		<p>${topicContent}</p>
	</div>
	<div class="topic-audio">
		<h2 class="font15">话题来源：</h2>
		<div class="font15 audio-tit">${sourceDescription }</div>
        <c:if test="${hasAuth }">
			<audio class="topicAudio" preload="none" style="visibility:hidden;" controls>
            	<source src="${playUrl}" />
       		 </audio>
		</c:if>
		<c:if test="${!hasAuth }">
			<div class="voice_background" onclick="toSource()"></div>
		</c:if>
		<div class="font12 audio-source" onclick="toSource()">
			话题出自：<a href="#">${relevanceTitle }</a><span><i class="i-source"></i>${topicTypeString }</span>
		</div>
		
		<%-- <div class="img">
			<span class="imgitem">
				<c:if test="${not empty  topicImgFirst}">
					<img src="${topicImgFirst}" >
				</c:if>
			</span>
			<span class="imgitem">
			<c:if test="${not empty  topicImgSecond}">
				<img src="${topicImgSecond}" >
			</c:if>
			</span>
			<span class="imgitem">
			<c:if test="${not empty  topicImgThird}">
				<img src="${topicImgThird}" >
			</c:if>
			</span>
		</div> --%>
		<div class="font12 about-box box5">
			${relevanceContent}
		</div>
	</div>
	<c:if test="${not empty topicRule}">
		<div class="font12 topic-audio">
			<h2 class="font15">参与规则：</h2>
			${topicRule}
		</div>
	</c:if>

	<div class="font17 topic-btn">
		<a href="javascript:void(0)" onclick="goBack()">返回</a>
	</div>
	<!--尾部-->
	<jsp:include page="/pages/header_footer.jsp">
		<jsp:param value="3" name="menu"/>
	</jsp:include>
<script type="text/javascript">
//返回
function goBack(){
	history.back(-1);
}
//去相关话题源
function toSource(id,type) {
	var id = "${relevanceId}";
	var type = "${topicType}";
	if(type == "KNOWLEDGE"){
		//去三千问
		window.location = "/yzmm/account/knowledge/viewDetail?knowledgeId="+id;
	}else if(type == "MIAOCOURSE"){
		//去喵姐说
		window.location = "/yzmm/wxmppay/vod?courseId="+id;
	}
}
$( function()
		{
			$( '.topicAudio' ).myaudio({
				play:function(thet){
				},
				audioPlay:function(){
					if("0" == "${playTime}"){
						addTimelenTopic($( '.topicAudio' ))
					}
				}
			});
			
			if("0" != "${playTime}"){
				$(".myaudio .duration").html("${playTimeShow}");
		}
			
		//为了调整顶端播放器样式
		$($(".topic-audio").find(".mywrap")).attr("style","margin-left: -0.5rem;margin-right: -0.5rem;");
		
		//取消播放，转为链接跳转
		/* $(".play").unbind("click");
		$('.mywrap').unbind("click").bind('click', function(event) {
			toSource();
		  }); */
	});
	function addTimelenTopic(obj){
		obj = $(obj);
		var a = obj.get(0);
		if(a && !obj.hasClass("time")){
			window.setTimeout(function() {
				if(isNumeric(a.duration)){
					var duration = a.duration;
					var o = obj;
					o.addClass("time");
					 if(duration){
						 HH.ajax({
							   waiting:false,
							   url: "/yzmm/account/knowledge/ajaxAddTimeTopic",
							   data: {id:"${id}",time:duration},
						});
					 }
				}
			}, 2000);
		}
	}
	
</script>
<script type="text/javascript">
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
</script>

</body>
</html>