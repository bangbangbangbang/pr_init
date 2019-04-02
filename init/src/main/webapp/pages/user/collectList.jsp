<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head lang="en">
<meta charset="UTF-8">
<title>喵姐早教说会员号-我的收藏</title>
<%@include file="../header_v12_2.jsp"%>
<script src="<b:staticUrl>/res/js/scrollpaginationme.js</b:staticUrl>"></script>
<link rel="stylesheet" type="text/css" href="<b:staticUrl>/res/css/common-v1.css</b:staticUrl>" />
<link rel="stylesheet" href="<b:staticUrl>/res/css/activity-v2.0.css</b:staticUrl>" >
<script src="<b:staticUrl>/res/js/activity/activity.js</b:staticUrl>"></script>
</head>
<body id="bgwhite">
<div class="wrap" style="background-color:white;">
	<div class="boxhor packcenter tab">
		<a href="javascript:void(0)" class="font15 active collectKnowledge">三千问</a>
		<a href="javascript:void(0)" class="font15 collectCourse">喵姐说</a>
	</div>
	<div class="favlist">
		<ul class="knowledge-list">
		</ul>
		<ul class="course-list" style="display:none">
		</ul>
	</div>
</div>
<jsp:include page="/pages/header_footer.jsp">
		<jsp:param value="4" name="menu"/>
	</jsp:include>
</body>
<script>
//三千问详情
function toKnowledgeDetail(id) {
	window.location = "/yzmm/account/knowledge/viewDetail?knowledgeId="+id;
}

//课程详情
function toCourseDetail(id) {
	window.location = "/yzmm/account/to/"+id;
}

//删除三千问收藏
function deleteCollectKnowledge(id) {
	HH.ajax({
		url:'/yzmm/account/user/collectKnowledge', 
		waiting:false,
		data:{
			collectStatus:0,
			knowledgeId:id
			}, 
		callback:function(data){
			$(".knowledge"+id).remove();
			if ($(".knowledge-list").children("li").size() == 0) {
				$(".knowledge-list").html('<div class="noneData"><span>您还没有收藏咧~</span></div>');
			}
		}
	});
}

//删除课程收藏
function deleteCollectCourse(id) {
	HH.ajax({
		url:'/yzmm/account/user/collectCourse', 
		waiting:false,
		data:{
			collectStatus:0,
			courseId:id
			}, 
		callback:function(data){
			$(".course"+id).remove();
			if ($(".course-list").children("li").size() == 0) {
				$(".course-list").html('<div class="noneData"><span>您还没有收藏咧~</span></div>');
			}
		}
	});
}
</script>

<script>
var pageIndex = 1;
var sm = {};
function sqwsm(){
	sm = $(window).scrollme({
		target:$(".knowledge-list"),
		data:{pageSize:15},
		url:"/yzmm/account/user/ajaxCollectKnowledgeList",
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
					h += '<div class="noneData"><span>您还没有收藏咧~</span></div>';
				} else {
					$(".noresult").hide();
					var len = data.list.length;
					if (len) {
						//增加页码
						params.pageIndex = ++pageIndex;
					}
					for (var i = 0; i < len; i++) {
						var o = data.list[i];
						h += '<li class="knowledge'+o.id+'">'
						+'<h2 class="font15" onclick="toKnowledgeDetail(\''+o.id+'\')">'+o.title+'</h2>'
						+'<p class="font12" onclick="toKnowledgeDetail(\''+o.id+'\')">'+o.formatDate+'</p>'
						+'<div class="handle">'
						+'<a href="javascript:void(0)" class="i-play" onclick="toKnowledgeDetail(\''+o.id+'\')"></a>'
						+'<a href="javascript:void(0)" class="i-stop" onclick="deleteCollectKnowledge(\''+o.id+'\')"></a>'
						+'</div>'
						+'</li>'
					}
				}
			} 
			$(".knowledge-list").append(h);
		}
	});
	sm.reload();
}
</script>

<script>
function kcsm(){
	sm = $(window).scrollme({
		target:$(".course-list"),
		data:{pageSize:15},
		url:"/yzmm/account/user/ajaxCollectCourseList",
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
					h += '<div class="noneData"><span>您还没有收藏咧~</span></div>';
				} else {
					$(".noresult").hide();
					var len = data.list.length;
					if (len) {
						//增加页码
						params.pageIndex = ++pageIndex;
					}
					for (var i = 0; i < len; i++) {
						var o = data.list[i];
						h += '<li class="course'+o.courseId+'">'
						+'<h2 class="font15" onclick="toCourseDetail(\''+o.courseId+'\')">'+o.name+'</h2>'
						+'<p class="font12" onclick="toCourseDetail(\''+o.courseId+'\')">'+o.formatDate+'</p>'
						+'<div class="handle">'
						+'<a href="javascript:void(0)" class="i-play" onclick="toCourseDetail(\''+o.courseId+'\')"></a>'
						+'<a href="javascript:void(0)" class="i-stop" onclick="deleteCollectCourse(\''+o.courseId+'\')"></a>'
						+'</div>'
						+'</li>'
					}
				}
			} 
			$(".course-list").append(h);
		}
	});	 
	sm.reload();
}

$(function(){
	sqwsm();
})

</script>
<script type="text/javascript">
	$(function(){
		pageIndex = 1;
		$(".collectKnowledge").click(function(){
			$(".collectKnowledge").addClass("active");
			$(".collectCourse").removeClass("active");
			$(".knowledge-list").show();
			$(".course-list").hide();
			$(".course-list").empty();
			sqwsm();
		})
		
		$(".collectCourse").click(function(){
			$(".collectCourse").addClass("active");
			$(".collectKnowledge").removeClass("active");
			$(".course-list").show();
			$(".knowledge-list").hide();
			$(".knowledge-list").empty();
			kcsm();
		})
	})
</script>

</body>
</html>