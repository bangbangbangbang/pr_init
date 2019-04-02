<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@include file="../header_v15.jsp" %>
<link rel="stylesheet" href="<b:staticUrl>/res/css/style-v1.2.2.css</b:staticUrl>" />
<script src="<b:staticUrl>/res/js/flexible.js</b:staticUrl>"></script>
<script src="<b:staticUrl>/res/js/scrollpaginationme.js</b:staticUrl>"></script>
<title>我的足迹</title>
<style type="text/css">
.noneData {
    width: 80%;
    text-align: center;
    height: 56px;
    padding-top: 16px;
    font-size: 16px;
    color: #a0a0a0;
    margin: 20px auto;
    border-radius: 8px;
    border: 2px solid #a0a0a0;
}
.noneData span {
    background: url('/res/img/dotted_bg3.png') no-repeat;
    padding-left: 18px;
}
</style>
</head>
<body id="bgwhite">
<div class="stepTit">
	<div class="fixed">
		<div class="font15 stepTitBox">
			<a href="#" class="knowledge active"><span>三千问</span></a>
			<a href="#" class="course"><span>喵姐说</span></a>
			<a href="#" class="topic"><span>喵圈</span></a>
		</div>
	</div>
</div>
<div class="font15 steplist myCss">
	<ul class="knowledge-list">
	</ul>
	<ul class="course-list" style="display:none;">
	</ul>
	<ul class="topic-list" style="display:none;">
	</ul>
</div>
</body>

<script>
//三千问详情
function viewDetail(id) {
	window.location = "/yzmm/account/knowledge/viewDetail?knowledgeId="+id;
}
//课程详情(直播)
function toLive(obj){
	window.location.href="/yzmm/account/course/liveDetail?courseId="+$(obj).data("courseid");
};
//课程详情(点播)
function toVod(obj){
	window.location.href="/yzmm/account/course/toVodDetail?courseId="+$(obj).data("courseid");
};
//喵圈(话题)
function toTopic(topicId){
	window.location.href="/yzmm/account/miao/topic/viewDetailIncludeReply?id="+topicId;
};
//喵圈(帖子楼)
function toTzl(tzlId){
	window.location.href="/yzmm/account/activity/tzl/activityCompletePage?id="+tzlId;
};
//喵圈(女神活动)
function toActivity(activityId){
	window.location.href="/yzmm/account/activity/daysPlan/everyDayList?activityId="+activityId;
};

//三千问足迹
var pageIndex = 1;
var sm = {};
function sqwsm(){
	sm = $(window).scrollme({
		target:$(".knowledge-list"),
		data:{pageSize:15},
		url:"/yzmm/account/sqwFoot/ajaxSqwFootmarkList",
		beforeLoad:function(){
			//查询之前调用
			if(1!=pageIndex){
				
			}
		},
		callback:function(data,params){
			var h = "";
			if (data.success) {
				//是否为空
				if (!data.totalPage && data.curPage == 1) {
					h += '<div class="noneData"><span>您还没有足迹咧~</span></div>';
				} else {
					$(".noresult").hide();
					var len = data.list.length;
					if (len) {
						//增加页码
						params.pageIndex = ++pageIndex;
					}
					for (var i = 0; i < len; i++) {
						var o = data.list[i];
						h += '<li>'
						+'<a onclick="viewDetail(\''+o.sqwId+'\')">'
						+'<span class="icon-audio"></span>'
						+'<div class="word">'
						+'<p class="font15">'+o.title+'</p>'
						+'<P class="font12">'+fmtSecond(o.updateTime)+'</P>'
						+'</div>'
						+'</a>'
						+'</li>'
					}
				}
			} 
			$(".knowledge-list").append(h);
		}
	});
	sm.reload();
}

//课程足迹
function kcsm(){
	sm = $(window).scrollme({
		target:$(".course-list"),
		data:{pageSize:15},
		url:"/yzmm/account/courseFoot/ajaxCourseFootmarkList",
		beforeLoad:function(){
			//查询之前调用
			if(1!=pageIndex){
				
			}
		},
		callback:function(data,params){
			var h = "";
			if (data.success) {
				//是否为空
				if (!data.totalPage && data.curPage == 1) {
					h += '<div class="noneData"><span>您还没有足迹咧~</span></div>';
				} else {
					$(".noresult").hide();
					var len = data.list.length;
					if (len) {
						//增加页码
						params.pageIndex = ++pageIndex;
					}
					for (var i = 0; i < len; i++) {
						var o = data.list[i];
						if (o.status) {
							h+='<li>' 
							+'<a onclick="toLive(this);" data-courseid="'+o.courseId+'">'
							+'<span class="icon-voice"></span>'
							+'<div class="word">'
							+'<p class="font15">'+o.name+'</p>'
							+'<P class="font12">'+fmtSecond(o.startTime)+'</P>'
							+'</div>'
							+'</a>'
							+'</li>'
						} else {
							h+='<li>' 
							+'<a onclick="toVod(this);" data-courseid="'+o.courseId+'">'
							+'<span class="icon-voice"></span>'
							+'<div class="word">'
							+'<p class="font15">'+o.name+'</p>'
							+'<P class="font12">'+fmtSecond(o.startTime)+'</P>'
							+'</div>'
							+'</a>'
							+'</li>'
						}
					}
				}
			} 
			$(".course-list").append(h);
		}
	});	 
	sm.reload();
}

//喵团足迹
function htsm(){
	sm = $(window).scrollme({
		target:$(".topic-list"),
		data:{pageSize:15},
		url:"/yzmm/account/miaoquanFoot/ajaxMiaoquanFootmarkList",
		beforeLoad:function(){
			//查询之前调用
			if(1!=pageIndex){
				
			}
		},
		callback:function(data,params){
			var h = "";
			if (data.success) {
				//是否为空
				if (!data.totalPage && data.curPage == 1) {
					h += '<div class="noneData"><span>您还没有足迹咧~</span></div>';
				} else {
					$(".noresult").hide();
					var len = data.list.length;
					if (len) {
						//增加页码
						params.pageIndex = ++pageIndex;
					}
					for (var i = 0; i < len; i++) {
						var o = data.list[i];
						h += '<li>'
						if (o.topicOrTzlOrActivity == "TOPIC") {
							h +='<a onclick="toTopic('+o.topicId+');">'
						} else if(o.topicOrTzlOrActivity == "TZL"){
							h +='<a onclick="toTzl('+o.tzlId+');">'
						} else {
							h +='<a onclick="toActivity('+o.activityId+');">'
						}
						if (o.topicOrTzlOrActivity == "TOPIC") {
							h +='<span class="font12 tag1">话题</span>'
						} else {
							h +='<span class="font12 tag1">活动</span>'
						} 
						h +='<div class="word">'
						h +='<p class="font15">'+o.title+'</p>'
						h +='<P class="font12">'+fmtSecond(o.updateTime)+'</P>'
						h +='</div>'
						h +='</a>'
						h +='</li>'
					}
				}
			} 
			$(".topic-list").append(h);
		}
	});	 
	sm.reload();
}

$(function(){
	sqwsm();
	$(".knowledge").click(function(){
		sqwsm();
		$(".knowledge-list").show();
		$(".knowledge").addClass("active");
		$(".course-list").hide();
		$(".course").removeClass("active");
		$(".topic-list").hide();
		$(".topic").removeClass("active");
	})
	$(".course").click(function(){
		kcsm();
		$(".knowledge-list").hide();
		$(".knowledge").removeClass("active");
		$(".course-list").show();
		$(".course").addClass("active");
		$(".topic-list").hide();
		$(".topic").removeClass("active");
	})
	$(".topic").click(function(){
		htsm();
		$(".knowledge-list").hide();
		$(".knowledge").removeClass("active");
		$(".course-list").hide();
		$(".course").removeClass("active");
		$(".topic-list").show();
		$(".topic").addClass("active");
	})
})



</script>
</html>
