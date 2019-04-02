<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/commons/header-static.jsp" %>
<style>
	.redpoint {
	   width: 9px;
	   height: 9px;
	   margin-left: 8px;
	   display:none;
	}
	.underpoint{
	    position: absolute;
	    top: 0.1rem;
	    right: 0.6rem;
	}
</style>
<footer class="footer">
	<div class="fixed">
		<div class="font12 fixed-box">
			<a href="#" class="ft1" onclick="tosqw()"><p>三千问</p></a>
			<a href="#" class="ft2" onclick="tocourse()"><p>喵姐说</p></a>
			<a href="#" class="ft4" onclick="toactivity()"><p>活动</p></a>
			<a href="#" class="ft3" onclick="tome()"><p>我<img class="redpoint underpoint newcoupon" alt="redpoint.png" src="<b:staticUrl>/res/img/redpoint.png</b:staticUrl>"></p></a>
		</div>
	</div>
	
</footer>

<script type="text/javascript">
//三千问
function tosqw() {
	top.location = "/yzmm/account/knowledge/index"+(la?"?la="+la:"");
}

//喵姐说
function tocourse() {
	top.location = "/yzmm/account/course/list"+(la?"?la="+la:"");
}
//喵圈
function toactivity() {
	top.location = "/yzmm/account/activitytype/list"+(la?"?la="+la:"");
}

//我
function tome() {
	top.location = "/yzmm/account/user/info"+(la?"?la="+la:"");
}
window.onload=function(){
	var sw = "${param.menu}";
	switch(sw)
	{
	case "1"://三千问
	  selKnowledge();
	  break;
	case "2"://喵姐说
	  selCourse()
	  break;
	case "3"://喵圈
	  selActivity();
	  break;
	case "4"://我
	  selMe();
	  break;
	default:
	  return;
	}
}
function selKnowledge(){
	$(".ft1").addClass("active");
	cancelSelActivity();
	cancelSelCourse()
	cancelSelMe();
}
function cancelSelKnowledge(){
	$(".ft1").removeClass("active");
	$(".ft1").removeAttr("style");
}
function selCourse(){
	$(".ft2").addClass("active");
	cancelSelActivity();
	cancelSelKnowledge();
	cancelSelMe();
}
function cancelSelCourse(){
	$(".ft2").removeClass("active");
	$(".ft2").removeAttr("style");
}
function selActivity(){
	$(".ft4").addClass("active");
	cancelSelKnowledge();
	cancelSelCourse()
	cancelSelMe();
}
function cancelSelActivity(){
	$(".ft4").removeClass("active");
	$(".ft4").removeAttr("style");
}
function selMe(){
	$(".ft3").addClass("active");
	cancelSelKnowledge();
	cancelSelActivity();
	cancelSelCourse();
}
function cancelSelMe(){
	$(".ft3").removeClass("active");
	$(".ft3").removeAttr("style");
}
$(function(){
	if("" == "${la}"){
		return;
	}
	var url = '/yzmm/account/usercoupon/isHaveCoupon';
	HH.ajax({
		waiting:false,
		data:{},
		url:url,
		success:function(data){
			if(data.success){				
				$(".newcoupon").css('display','inline');;
			}
		},
	});
	
})
</script>
 