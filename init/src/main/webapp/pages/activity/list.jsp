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
	<title>喵圈</title>
	<%@include file="../header_v14.jsp"%>
	<%@include file="../header_wxjsapi.jsp"%>
	<script src="<b:staticUrl>/res/js/scrollpaginationme.js</b:staticUrl>"></script>
	<script src="<b:staticUrl>/res/js/swiper-3.3.0.min.js</b:staticUrl>"></script>
</head>
<body id="bgwhite">
	<div class="font15 tabtit">
		<a href="/yzmm/account/miao/topic/index">话题</a>
		<a href="/yzmm/account/activity/list" class="active">活动</a>
	</div>
	<div class="activity-list">
		
		<div id="bb"></div>
		<div id="showloaddiv" style="display: none;">正在加载数据</div>
	</div>
<!--尾部-->
	<jsp:include page="/pages/header_footer.jsp">
		<jsp:param value="3" name="menu"/>
	</jsp:include>
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
var mySwiper = new Swiper('.swiper-container', {
	autoplay: 5000,
	pagination: '.swiper-pagination'
})
</script>
<script type="text/javascript">
	var sm = {};
	var pageIndex = 1;
	$(function(){
		sm = $(window).scrollme({
			target:$("#bb"),
			data:{pageSize:10,pageIndex:pageIndex},
			url:"/yzmm/account/activity/ajaxList",
			beforeLoad:function(){
			},
			callback:function(data,params){
				$("#showloaddiv").hide();
				var h = "";
				if (data.success) {
					//是否为空
					if (!data.totalPage) {
						$(".noresult").remove();
						
					} else {
						$(".noresult").hide();
						var len = data.list.length;	
						if (len) {
							//增加页码
							params.pageIndex = ++pageIndex;
						}
						for (var i = 0; i < len; i++) {
							var o = data.list[i];
							//alert(o.processStatus);
							if(o.activityType=="DAYS"){
								if(o.processStatus=="DOING"){
									if(o.isJoinIn){
										h+='<a href="/yzmm/account/activity/daysPlan/everyDayList?activityId='+o.id+'" class="activity-item a2">';
									}else{
										h+='<a href="/yzmm/account/activity/daysPlan/everyDayList?activityId='+o.id+'" class="activity-item a2">';
									}
									
								}else if(o.processStatus=="CHECKIN"){
									if(o.isJoinIn){
										h+='<a href="/yzmm/account/activity/daysPlan/everyDayList?activityId='+o.id+'" class="activity-item a1">';
									}else{
										h+='<a href="/yzmm/account/activity/daysPlan/index?id='+o.id+'" class="activity-item a1">';
									}
								}else if(o.processStatus=="CHECKIN_OVER"){
									if(o.isJoinIn){
										h+='<a href="/yzmm/account/activity/daysPlan/everyDayList?activityId='+o.id+'" class="activity-item a3">';
									}else{
										h+='<a href="/yzmm/account/activity/daysPlan/everyDayList?activityId='+o.id+'" class="activity-item a3">';
									}
								}else if(o.processStatus=="RESULT"){
									if(o.isJoinIn){
										h+='<a href="/yzmm/account/activity/daysPlan/everyDayList?activityId='+o.id+'" class="activity-item ">';
									}else{
										h+='<a href="/yzmm/account/activity/daysPlan/everyDayList?activityId='+o.id+'" class="activity-item">';
									}
									h+='<span class="namelist"><i class="i-arrow3"></i>获奖名单</span>';
								}else if(o.processStatus=="DONE"){
									
									if(o.isJoinIn){
										h+='<a href="/yzmm/account/activity/daysPlan/everyDayList?activityId='+o.id+'" class="activity-item ">';
									}else{
										h+='<a class="activity-item">';
									}
									h+='<span  href="/yzmm/account/activity/daysPlan/everyDayList?activityId='+o.id+'" class="tag2">活动结束</span>';
								}else{
									h+='<a href="/yzmm/account/activity/daysPlan/index?id='+o.id+'" class="activity-item">';
								}
								
							}else if(o.activityType=="TZL"){
								if(o.processStatus =="RESULT"){
									h+='<a href="/yzmm/account/activity/tzl/activityCompletePage?id='+o.id+'" class="activity-item">';
									h+='<span class="namelist"><i class="i-arrow3"></i>获奖名单</span>';
								}else if(o.processStatus=="DOING"){
									h+='<a href="/yzmm/account/activity/tzl/detailIncludeReply?id='+o.id+'" class="activity-item a2">';
								}
							}
								h+='<div class="img"><img src="'+o.activityImg+'"></div>';
								h+='<div class="info">';
								h+='<h2 class="font17">'+o.title+'</h2>';
								
								
								if(o.activityType=="TZL"){
									h+='<p class="font12">结束时间：'+o.activityTime+'</p>';
								}else if(o.activityType=="DAYS"){
									h+='<p class="font12">时间：'+o.activityTime+'</p>';
								}
								h+='<div class="font12 num">参与人数：'+o.userNumber+'</div>';
								h+='<span class="font13 tag">'+o.chargeRule+'</span>';
								h+='</div>';
							h+='</a>';
						}
					}
				} 
				$("#bb").append(h);
			}
		});
		//加载数据
		sm.reload();
	})
	function reload(){
		pageIndex = 1;
		sm.reload({pageIndex:1});
	}
	function isdoing(){
		toast("本期课程已开班，很遗憾您未获得听课资格");
	}
	function isdone(){
		toast("本期课程已结束");
	}
	function isresult(){
		toast("本期课程已结束");
	}
	function ischickdone(){
		toast("您来晚了，本期课程报名人数已满~");
	}
</script>
</body>
</html>