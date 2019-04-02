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
	<title>活动</title>
	 <%@include file="../../header_v2.1.jsp" %>
	 <script src="<b:staticUrl>/res/js/activity/activity.js</b:staticUrl>"></script>
	 <script src="<b:staticUrl>/res/js/jquery.cookie.js</b:staticUrl>"></script>
</head>
 <body>
<div class="containerOther">
	<div class="activityBanner activityBanner2">
		<div class="banimg"><img src="${globalLabel.img }" ></div>
		<div class="titbar">${globalLabel.name}</div>
		<div class="txt2">
			<p class="els2">${globalLabel.content }</p>
			<a href="javascript:void(0)" class="slidebtn"></a>
		</div>
	</div>
	<ul class="activityList" id='activityList'>
	 <!-- 活动内容 -->
	</ul>
	<a href="javascript:void(0)" class="myactivity">我的活动</a>
</div>
<div class="actlayer">
			<div class="activityruleBox">
				<a href="javascript:void(0)" class="close"></a>
				<h2 class="tit">报名须知</h2>
				<h3 class="stit"></h3>
				<div class="word">
					<p></p>
				</div>
				<div class="price"></div>
					<div class="pricenote"></div>
					<a href="javascript:void(0)" class="submitbtn">立即报名</a>
				<div class="protol"><span class="radio radioon"></span>同意并熟知活动细则</div> 
			</div>
		<c:if test="${(prcessStatus=='DOING')&&!judegeAuthSign}">
			<div class="clockBox">
				<a href="javascript:void(0)" class="close"></a>
				<h2 class="tit">亲爱的喵女神</h2>
				<p>很遗憾您来晚了，本期活动已开始，开启提醒，不再错过更多精彩</p>
				<a href="javascript:void(0)" class="openbtn">开启提醒</a>
			</div>
		</c:if>
	</div>
<!-- 我参加的活动 -->
 <%@include file="../myjoinactivity/myjoinlist.jsp" %>
<jsp:include page="/pages/header_footer.jsp">
	<jsp:param value="3" name="menu"/>
</jsp:include>
<script type="text/javascript">
function statusSeleter(id,status){
	//alert(status);
	HH.href("/yzmm/account/activity/goddessplan/detail/statusSeleter?activityId="+id+"&processStatus="+status+"");
}

$(function(){
	var activity_type_detail=$.cookie('activity_type_detail');
	if(undefined==activity_type_detail){
		$.cookie('activity_type_detail',false);
	}
	if(activity_type_detail=="true"){
		$.cookie('activity_type_detail',false);
		HH.href('/yzmm/account/activitytype/detail?classifyId=${classifyId}');
	}
	var content = {};
	var pageIndex = 1;
	var totalPage = 1;
	var classifyId='${globalLabel.id }';
	//打赏
	var activityList=$('.activityList');//打赏容器 ul
		content = $(window).scrollme({
		target:$(".activityList"),
		heightOffset:140,
		url:'/yzmm/account/activitytype/ajaxActivityList', 
		data:{pageIndex:pageIndex,classifyId:classifyId},
		beforeLoad:function(){
			//查询之前调用
		},
		callback:function(data,params){
			if(data.success){
				var len = data.ext.list.length;
				if (len) {
					//增加页码
					params.pageIndex = ++params.pageIndex;
				}
				totalPage = data.ext.totalPage;
				if(data.ext.totalPage == 0){
					$(".noneData").remove();
					return '<div class="noneData"><span>现在还没有活动哦~</span></div>';
				}else{
					var len = data.ext.list.length;
					if(len){
						//增加页码
						params.pageIndex = ++pageIndex;
					}
					for(var i=0;i< len;i++){
						var o = data.ext.list[i];
						var li=$("<li class='actitem'></li>").appendTo(activityList);
						var dtFmt='MM月dd日';//日期格式
						if(o.processStatus=='CHECKIN'){
							if(o.isParticipated){
								var a1=$("<a href='javascript:;' onclick='statusSeleter(\""+o.id+"\",\"CHECKIN\")'><div class='img'><img src='"+o.titleImg+"' ></div></a>").appendTo(li);
							}else{
								var a1=$("<a class='joinIn' style='cursor: pointer;' data-activityid="+o.id+"><div class='img'><img src='"+o.titleImg+"'></div></a>").appendTo(li);
							}
							
							var div1=generatingElement(a1,o);
							//报名中
							var div4=$('<p>距开始：'+timer(o.activityBeginTime)+'</p>').appendTo(div1);
							if(o.isParticipated){ 
								$('<div class="tagbtn"><span class="" style="border-color: #4523f5;">已报名</span></div>').appendTo(div1);
							}else{
								$('<span class="tag txtorage">热招中</span>').appendTo(div1);
							}
						}else if(o.processStatus=='CHECKIN_OVER'){
							var a1=$("<a href='javascript:;' onclick='statusSeleter(\""+o.id+"\",\"CHECKIN_OVER\")'><div class='img'><img src='"+o.titleImg+"' ></div></a>").appendTo(li);
							var div1=generatingElement(a1,o);
							//报名结束
							var div4=$('<p>距开始：'+timer(o.activityBeginTime)+'</p>').appendTo(div1);
							if(o.isParticipated){ 
								$('<div class="tagbtn"><span class="" style="border-color: #4523f5;">已报名</span></div>').appendTo(div1);
							}else{
								$('<span class="tag" style="color:#999">人数已满</span>').appendTo(div1);
							}
						}else if(o.processStatus=='DOING'){
							var a1=$("<a href='javascript:;' onclick='statusSeleter(\""+o.id+"\",\"DOING\")'><div class='img'><img src='"+o.titleImg+"' ></div></a>").appendTo(li);
							var div1=generatingElement(a1,o);
							//活动进行中 
							var div4=$('<p>时间：'+fmtDate(new Date(o.activityBeginTime*1000),dtFmt)+'-'+fmtDate(new Date(o.activityEndTime*1000),dtFmt)+'</p>').appendTo(div1);
							if(o.isParticipated){ 
								$('<div class="tagbtn"><span class="taggreen">参与中</span></div>').appendTo(div1);
							}else{
								$('<span class="tag txtgreen2">女神修炼中</span>').appendTo(div1);
							}
						}else if(o.processStatus=='RESULT'||o.processStatus=='DONE'){
							var a1=$("<a href='javascript:;' onclick='statusSeleter(\""+o.id+"\",\"RESULT\")'><div class='img'><img src='"+o.titleImg+"' ></div></a>").appendTo(li);
							var div1=generatingElement(a1,o);
							//活动结束 tag txtorage
							var div4=$('<p>时间：'+fmtDate(new Date(o.activityBeginTime*1000),dtFmt)+'-'+fmtDate(new Date(o.activityEndTime*1000),dtFmt)+'</p>').appendTo(div1);
							if(o.isParticipated){
								$('<div class="tagbtn"><span class="taggrey">已结束</span></div>').appendTo(div1);
							}else{
								$('<span class="tag " style="color:#999">已结束</span>').appendTo(div1);
							}
						}
					}
					return "";
				}
			}
		}
	});
	content.reload();
	/**
	*生成元素	
	*/
	function generatingElement(a1,o){
		var div1=$('<div class="cont"></div>').appendTo(a1);
		var h2=$('<h2>'+o.topicTitle+'</h2>').appendTo(div1);
		var div3=$('<p>已入营女神：'+o.participantsNum+'人</p>').appendTo(div1);
		return div1;
	}
	
	
	/***
	 * 里面的方法解决了ajax拦截的问题
	 * @author qzq
	 */
	$('body').on('click','.joinIn',function(){
		var activityId = $(this).data("activityid");
		var classifyId='${classifyId}';
			HH.ajax({
			    url:'/yzmm/account/activitytype/checkPath',
			    data:{
			    	tourl:"/yzmm/account/activity/goddessplan/detail/ajaxGetSignInInfo"
			    	},
			    	callback:function(data){
			   		if(data){
			   			HH.ajax({
						    url:'/yzmm/account/activity/goddessplan/detail/ajaxGetSignInInfo',
						    data:{
						    	activityId:activityId,
						    	classifyId:classifyId
						    	},
						    callback:function(data){
						   		if(data.success){
						   			$(".activityruleBox .submitbtn").unbind();
						   			$(".activityruleBox .word").html(data.activityContent);
						   			$(".activityruleBox .price").html("￥"+data.allMoney);
						   			$(".activityruleBox .pricenote").html("报名费￥"+data.chargeMoney+"+保证金￥"+data.depositMoney)
						   			//$(".activityruleBox .submitbtn").bind("click","alert(111);");
							   		 $(".activityruleBox .submitbtn").bind("click", function () {
							   			if("${accessType}" != "WEIXIN"){
							   				toast("请您进入微信支付");
							   				return false;
							   			}
							   			window.location = "/yzmm/wxmppay/activity?data="+data.data;
							   	    });
						   			//data
						   			$(".activityruleBox").parent().fadeIn();
						   		}
						    }
						});
			   		}else{
			   			HH.href('/yzmm/account/activitytype/detailHref?classifyId=${classifyId}');
			   		}
				}
			});
	});
	function toActivity(data){
		//alert(data);
		if("${accessType}" != "WEIXIN"){
			toast("请您进入微信支付");
			return false;
		}
		window.location = "/yzmm/wxmppay/activity?data="+data;
	}
	});
	
</script>
</body>
</html>