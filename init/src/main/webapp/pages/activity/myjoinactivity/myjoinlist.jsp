<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="containerAct">
	<h1 class="activityTitle">我的活动<span class="backBtn"></span></h1>
	<div class="containerActBox">
	</div>
	<div class="actempty">
		<div class="actempty-icon"></div>
		<div class="actempty-word">没有活动记录哟～</div>
		<a href="javascript:void(0)" class="btnred">查看热招中的活动</a>
	</div>
</div>
<div class="containerActBox2">
	<h1 class="activityTitle">热招活动<span class="backBtn2"></span></h1>
	<ul class="activityList">
		
	</ul>
</div>
<script>
$(function(){
	$(".myactivity").click(function(){
		myJoinActivityShowObj.initActivityList({pageIndex : 1,pageSize:10});
	});
	$(".btnred").click(function(){
		myJoinActivityShowObj.initHotActivityList({pageIndex : 1,pageSize:10});
	});
})
</script>
<script src="<b:staticUrl>/res/js/custom/constant/constant.js</b:staticUrl>"></script>
 <script src="<b:staticUrl>/res/js/package/activity/myjoinactivity.js</b:staticUrl>"></script>
