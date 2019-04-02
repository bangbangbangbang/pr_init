<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--忽略页面中的邮箱格式为邮箱-->
<meta name="format-detection" content="email=no"/>
 <%@include file="../../header_v2.0.jsp" %>
 <%@include file="../../header_wxjsapi.jsp"%>
<title>喵姐早教说</title>
    <link rel="stylesheet" href="<b:staticUrl>/res/css/base.css</b:staticUrl>">
    <link rel="stylesheet" href="<b:staticUrl>/res/css/banner.css</b:staticUrl>">
<style type="text/css">
body {
	color: #000000;
	font-size: 0.32rem;
}

.section {
	position: relative;
	font-size: 0.32rem;
	font-weight: 400;
	font-family: 'ArialMT', 'Arial';
	font-style: normal;
	line-height: 0.5rem;
	overflow: visible!important;
}

table {
	width: 100%;
	border: 0px;
	border-color: transparent;
	border-collapse: collapse;
	border-spacing: 0;
	color: #434343;
	font-size: 0.32rem;
}

table td {
	position: relative;
	padding-top: 0.1rem;
}

.td1 {
	width: 1.7rem;
}

.td2 {
	
}
</style>
<style type="text/css">
.share {
		    display: none;
		    width: 100%;
		    max-width: 540px;
		    margin: 0 auto;
		    height: 100%;
		    position: fixed;
		    top: 0;
		    z-index: 100;
		    background-color: rgba(0, 0, 0, 0.8);
		}
		.share .shareBox {
		    width: 100%;
		    padding-top: 1.12rem;
		    position: relative;
		}
		.share .sharearrow {
		    display: block;
		    width: 75px;
		    height: 84px;
		    position: absolute;
		    right: 0.48rem;
		    top: 0.21333333rem;
		    background-image: url(<b:staticUrl>/res/img/share/share.png</b:staticUrl>);
		    background-position: right top;
		    background-repeat: no-repeat;
		    background-size: 78px 72px;
		}
		.share p {
		    margin-bottom: 0.26666667rem;
		    text-align: center;
		    color: #f8e71c;
		}
    </style>
<style type="text/css">
.shijianchangdu {
	background-repeat: no-repeat;
	background-size: auto 60%;
	padding-left: 0.32rem;
	background-position: left 40%;
	background-image:url('<b:staticUrl>/res/img/shijintubiao.png</b:staticUrl>');
}
.shiting{
	color:#FF9900;
	border: 1px #FF9900 solid;  
	border-radius: 0.3rem;
	font-size: 0.32rem;
	padding: 0.01rem 0.3rem;
}
.xihuan{
	background-repeat: no-repeat;
	background-size: contain;
	padding-left: 0.5rem;
	background-position: left center;
	background-image:url('<b:staticUrl>/res/img/u1757.png</b:staticUrl>');
}
.fenxiang{
	background-repeat: no-repeat;
	background-size: contain;
	padding-right: 0.66rem;
	background-position: right center;
	background-image:url('<b:staticUrl>/res/img/u1755.png</b:staticUrl>');
}
.fenxiang2{
	background-repeat: no-repeat;
	background-size: 0.66rem;
	padding-right: 0.66rem;
	background-position: right center;
	background-image:url('<b:staticUrl>/res/img/u35.png</b:staticUrl>');
}
.viponly{
	display: none;
	width: 1rem;
    height: 1rem;
}
.playBtn{
	height:1rem!important;
	width:1rem!important;
	float:inherit!important;
	background-repeat: no-repeat;
	background-size: contain!important;
	background-position: center;
	background-image:url('<b:staticUrl>/res/img/bofang.png</b:staticUrl>')!important;
}
.topaudio .pause{
	background-image:url('<b:staticUrl>/res/img/zanting.png</b:staticUrl>')!important;
	background-size: contain!important;
}
</style>

<script type="text/javascript">
var courseId = "${courseId}";
var id = '${id}';
var mywxfenxiangcb={
		title: '${wxshare.title}', // 分享标题
		desc : '${wxshare.desc}',
	    link: '${wxshare.link}', // 分享链接
	    imgUrl: '${wxshare.imgUrl}', // 分享图标
	    shareTimeline:function(bool){
	    	HH.ajax({
	    		waiting:false,
	    		data:{shareType:"COURSE_GROUP",shareRelateId:courseId},
	    		url:"/yzmm/account/sharetofriend/createShare",
	    		callback:function(data){
	    			HH.href("/yzmm/account/course/topic/index?id="+id+"&courseId="+courseId);
	    		}
	    	});
	    },
	    shareAppMessage:function(bool){
	    	HH.ajax({
	    		waiting:false,
	    		data:{shareType:"COURSE_GROUP",shareRelateId:courseId},
	    		url:"/yzmm/account/sharetofriend/createShare",
	    		callback:function(data){
	    			HH.href("/yzmm/account/course/topic/index?id="+id+"&courseId="+courseId);
	    		}
	    	});
	    }
};

initwxfx(mywxfenxiangcb);

	function showmoreinfo(obj){
		var o = $(obj);
		if(o.css("visibility") == "hidden"){
			$(".moreinfo").slideUp();
			o.css("visibility","visible");
		}else{
			$(".moreinfo").slideDown();
			o.css("visibility","hidden");
		}
	}
	function hidemoreinfo(){
		showmoreinfo(".showmoreinfo");
	}
</script>
</head>
<body>
<div class="bigImg section" style="width: 100%; height: 100%;display: none;">
	<img src="" width="100%">
	<h1 class="activityTitle" style="position: fixed;bottom: 1rem;right: 0.1rem;background: transparent"><span class="backBtn"></span></h1>
<script type="text/javascript"> 
	function showBig(obj){
		var o = $(obj);
		 $(".bigImg img").attr("src",o.data("img90"));
		 $(".bigImg").show();
		 $(".mainWrap").hide();
	}
	$(function(){
		$(".activityTitle").click(function(){
			 $(".bigImg").hide();
			 $(".mainWrap").show();
		});
	})
	function like1(){
		toast("喜欢 +1 ~")
	}
</script>
</div>
<c:if test="${not empty comeinNumber}">
	<!--改版banner 开始-->
	<div class="banner">       
	    <div class="banner_top">
	        <a href="javascript:void(0)">关注&nbsp;<font>"喵姐早教说"</font>&nbsp;育儿顾问领回家</a>
	    </div>
		<!--<div>-->
			<img src="<b:staticUrl>/res/img/redpage/u402.png</b:staticUrl>" alt="" class="line">
		<!--</div>-->
		<p class="banner_con">恭喜，你是第 ${comeinNumber} 个抢到的</p>
	    <div class="banner_bottom clearfix">
	        <div class="banner_bottom_l">
				<img src="<b:staticUrl>/res/img/redpage/u406.png</b:staticUrl>" alt="">
			</div>
	        <div class="banner_bottom_r">
				<img src="<b:staticUrl>/res/img/redpage/u404.png</b:staticUrl>" alt="">
			</div>
	    </div>
	</div>
	<!--改版banner 结束-->
</c:if>
<div class="mainWrap">
<div class="section" style="min-height: 5rem;display: none">
	<p class="showname" style="font-size: 0.46rem;padding: 0.6rem 0.1rem 0rem;color: #000;line-height: 0.6rem;font-weight: bold;"  >第 1 课</p>
	<div style="color: #A1A1A1;margin-top: 0.1rem;padding: 0rem 0.1rem 0.1rem;font-size: 0.32rem;">
		<span class="showPlayEndTimeStr">01月03天</span>更新&nbsp;|&nbsp;<span class="showtingguo">1</span>次播放
	</div>
	<div class="audioCont topaudio">
			<audio preload="auto" id="audio" src=""></audio>
	        <div class="topaudioBox">
	            <span class="txt">00:00</span>
	            <div class="audioLine">
	            	<span class="lineaft"></span>
	                <div class="active"></div>
	                <a href="javascript:void(0)" class="circle" id="drag"></a>
	            </div>
	            <span class="txt2" data-sec="0">00:00</span>
            </div>
            <div style="margin-top: 0.6rem;">		
           			<table class="canplay">
           				<tr>
           					<td width="33.33%" align="center"><span class="xihuan" onclick="like1()">喜 欢</span></td>
           					<td width="33.33%" align="center">
           					 <img class="viponly" src="<b:staticUrl>/res/img/playviponly.png</b:staticUrl>g" height="100%"> 
           					 <div class="playBtn play"></div>
           					</td>
							<td width="33.33%" align="center"><span class="fenxiang" onclick='$(".share").show();'>分 享</span></td>
						</tr>            			
           			</table>
            </div>
       </div>
       <div style="text-align: center;margin-top: 1.2rem;">
       	<img id="mindImg" onclick="showBig(this)" data-img90="" width="90%" src="">
       		<div style="margin-top: 0.32rem;color: #BCBCBC;">点击查看大图</div>
       </div>
		</div>
<div class="section">
	 <p style="font-size: 0.4rem;font-weight: bold;">课程列表</p>
	 <c:forEach var="o" items="${ll}" varStatus="status">
		 <div class="kechenglist courseId${o.courseId}" style="margin-top: 0.32rem;" data-play="" data-title="第 ${status.count} 课 | ${o.name}" data-pets="${o.playEndTimeStr}" data-id="${o.courseId}" data-len="${o.timeLenStr}" data-count="${o.count}" data-img="${o.imgUrl}" data-img90="${o.imgUrl90}">
		 	 <table>
		 	 	<tr>
		 	 		<td class="td1" valign="top"><img style="margin: 0 auto;" src="<b:staticUrl>/res/img/topiccourseplay.jpeg</b:staticUrl>" ></img></td>
		 	 		<td class="td2">
		 	 			<p class="name" style="font-size: 0.36rem;">第 ${status.count} 课 ${o.name}</p>
		 	 			<div style="color: #BCBCBC;margin-top: 0.1rem;">
		 	 				<span class="playEndTimeStr">${o.playEndTimeStr}</span>更新&nbsp;&nbsp;&nbsp;<span class="tingguo">${o.count}</span>人听过&nbsp;&nbsp;&nbsp;<span class="shijianchangdu">${o.timeLenStr}</span>&nbsp;&nbsp;&nbsp;<span class="shiting" style="display:${!hasAuth and o.isfree ? '':'none'}">试听</span>
		 	 			</div>
		 	 		</td>
		 	 	</tr>
		 	 </table>
		 	 <div class="lineDiv" style="height:1px;width: 100%;background-color: #F2F2F2;margin-top: 0.1rem;"></div>
		 </div>
	  </c:forEach>
	</div>
</div>
<div class="share">
	<div class="share">
		<div class="shareBox">
			<div class="sharearrow"></div>
			<p class="font15" style="margin-top: 40px;">独乐了不如众乐乐</p>
			<p class="font15">点击屏幕右上角分享给好友！</p>
		</div>
	</div>
</div>
<script type="text/javascript">
 var topicCid = "-1";
 $(function(){
	 function initplay(auth,obj){
		var o = $(obj); 
		topicCid = o.data("id");
		$("#audio").attr("src",o.data("play"));
		$(".txt2").html(o.data("len"));
		$(".showPlayEndTimeStr").html(o.data("pets"));
		$(".showname").html(o.data("title"));
		$(".showtingguo").html(o.data("count"));
		$("#mindImg").attr("src",o.data("img"));
		$("#mindImg").data("img90",o.data("img90"));
		if(auth){
			$(".viponly").hide();
			$(".playBtn").show();
		}else{
			$(".playBtn").hide();
			$(".viponly").show();
		}
		$("#mindImg").parents(".section").show();
	 }
	 //默认显示
	 $(".viponly").hide();
	 $(".playBtn").show();
	 $(".txt2,txt").html("00:00");
	 $(".playBtn").removeClass("pause");
	 $(".playBtn").addClass("play");
	 $(".lineaft").css("width","0px");
	 $("#drag").css("left","0px");
	 
	 var o =$(".courseId${courseId}");
	  
	 if(o.data("play")){
		 initplay(true,o);
		 return;
	 }
	 HH.ajax({
			waiting : false,
			url : "/yzmm/account/course/topic/checkAndMark",
			data : {
				courseId : o.data("id")
			},
			callback:function(data){
				if(data.success){
					o.data("play",data.ext);
				}
				initplay(data.success,o);
			}
		});
	$(".share").click(function(){
		$(".share").hide();
	});
	$(".kechenglist").click(function(){
		 var o =$(this);
		 var courseId = o.data("id");
		 HH.href("/yzmm/account/course/toVodDetail?courseId="+courseId);
	});
 });
</script>
<script src="<b:staticUrl>/res/js/streamAudio_coursetopic_heartbeat.js</b:staticUrl>"></script>
</body>
</html>