<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/commons/header-static.jsp" %>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
<meta name="format-detection" content="telephone=no,address=no,email=no">
<meta name="keywords" content="" />
<meta name="description" content="" />
<link rel="shortcut icon" type="image/x-icon" href="<b:staticUrl>/res/img/favicon.ico</b:staticUrl>" media="screen">
<link rel="apple-touch-icon" href="<b:staticUrl>/res/img/favicon.ico</b:staticUrl>">
<script src="<b:staticUrl>/res/js/flexible.js</b:staticUrl>"></script>
<link rel="stylesheet" href="<b:staticUrl>/res/css/style-v2.0.css</b:staticUrl>">
<script src="<b:staticUrl>/res/js/jquery-2.1.1.min.js</b:staticUrl>"></script> 
<%	
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>
	<title>手机测试视频直播界面</title>
	<style type="text/css">
	#audio{
		    z-index: 9999;
   			 position: relative;
	}
		.rem{
		line-height: 0.42666667rem;
	    font-size: 0.32rem;
	    text-align: center;
	    color: #f8e71c;
	}
	</style>
</head>
<body>
<div class="liveTit">${name}</div>
<div>
<video id="audio"  width="100%"  data-setup="{}" webkit-playsinline="true" x-webkit-airplay="true" x5-video-player-type="h5" playsinline width="100%"   controls="controls" autoplay="autoplay"  src="${playUrl}"></video>
</div>
<div class="rem liveTit"><p>本页面仅作测试直播所用</p><p>为了更好的为您服务</p><p>如若本页面能听，请反馈 《手机测试音频直播界面》能听</p><p>谢谢您的合作</p></div>
	<div class="answer" >
		<div class="answerImg"><img src="${imgUrl}" >
			<div class="layerImgFloat flushDiv" onclick="myPlayer.play();">
				<p>手机浏览器</p>
				<p>没有声音</p>
				<p>点我试试</p>
				<a href="javascript:void(0)" class="refresh"></a>
			</div>
		</div>	
	</div>
<script type="text/javascript">
//播放器对象
var myPlayer = document.getElementById("audio");
$(function(){
   if("${isWeixin}"=="false"){
   		 myPlayer.play();
    }else{
   	 	document.addEventListener("WeixinJSBridgeReady", function () { 
 		   myPlayer.play();
 	    }, false);
    }
});
</script>

<div class="live">
	<img src="${imgUrl}" class="livephoto" >
</div>

</body>
</html>