<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta name="format-detection" content="telephone=no" />
	<meta name="format-detection" content="email=no"/>
	<title>喵姐早教说</title>
 	<%@include file="../header_v2.0.jsp"%>
	<%@include file="../header_wxjsapi.jsp"%>
	<link rel="stylesheet" type="text/css" href="<b:staticUrl>/res/css/share_mjs.css</b:staticUrl>" />
    <script src="<b:staticUrl>/res/js/scrollpaginationme.js</b:staticUrl>"></script>
    <script src="<b:staticUrl>/res/js/vote.js</b:staticUrl>"></script>
    
</head>
<body>
<%@include file="../share_head.jsp"%>
<script type="text/javascript">
  wxfenxiangcb={
		title: '${wxshare.title}', // 分享标题
		desc : '${wxshare.desc}',
	    link: '${wxshare.link}', // 分享链接
	    imgUrl: '${wxshare.imgUrl}', // 分享图标
	    shareTimeline:function(bool){
	    },
	    shareAppMessage:function(bool){
	    }
};
  var courseId='${courseId}';
</script>
<style type="text/css">
	.livetime{
		font-size:0.4rem;
		}
	.first{
		height:40px;
		border-bottom: 0.12rem solid #efeff4;
		}
	.ending{
		font-size:12px;
		position: absolute;
		margin-top:10px;
		}
	.pic{
		margin-left:10px;
		}
	.section1{
	    width: 100%;
    	line-height: 0.37333333rem;
    	font-size: 0.32rem;
    	color: #999;
    	clear: both;
	}
	.careBtn{
	    font-size: 0.32rem;
	    line-height: 0.61333333rem;
	    margin-top: 0.51333333rem;
	    margin-left: 77%;
	    border: 1px solid #ff9900;
	    border-radius: 0.05333333rem;
	    width: 1.8rem;
	    height: 0.61333333rem;
	    text-align: center;
	    color: #ff9900;
	}
	.subscribe{
	    text-align: center;
	    width: 1.8rem;
	    height: 0.61333333rem;
	    line-height: 0.61333333rem;
	    margin-top: -0.486667rem;
	    margin-bottom: 0.2rem;
	    color: #ff9900;
	    border: 1px solid #ff9900;
	    background-repeat: no-repeat;
	    background-position: 0.16rem 0.10666667rem;
	    background-size: 15px 13px;
	    border-radius: 0.05333333rem;
	    font-size: 0.32rem;
	    margin-left: 77%;
	    text-align: center;
	}
	.second{
		float:left;
	}
	.livename{
		font-size:0.6rem;
	}
	.section2{
	    width: 100%;
	    max-width: 540px;
	    margin: 0 auto;
	    padding: 0.3rem;
	    overflow: auto;
	}
		.askmain{
			height: 4rem;
		}
		
	.questionAsk {
		    font-size: 19px;
		    line-height: 19px;
		    text-align: center;
		}
		
	.askimg{
			width: 8rem;
    		margin-top: 0.8rem;
		}
		
	.fastAsk {
		    font-size: 15px;
		    line-height: 38px;
		    margin: 0.7rem auto 0 auto;
		    border: 1px solid #ff9900;
		    border-radius: 20px;
		    width: 177px;
		    height: 40px;
		    text-align: center;
		    color: #ff9900;
		}
	.section{
		margin-left:10px;
	}
	.section .sectionTit{
		width:95%;
	}
</style>
<div class="wrap">
	<div class="subjectBanner">
		<img src="${imgUrl}" >
		<div class="subjectTit">
			<div class="livename" style="font-size:20px;">${name}</div>
			<br/>
	        <div class="livetime">直播结束 </div>
		</div>
	</div>
	<div class="first">
			<span class="ending"><img class="pic" src="<b:staticUrl>/res/img/u1151.png</b:staticUrl>">&nbsp;&nbsp;${endWords}</span> 
			<input type="hidden" id="courseId" value="${courseId}"/>
		</div>
	 <!-- ppt下载 -->
	 <c:if test="${not empty ppt}">
	 	<div class="section1 box_align" style="position: relative;width: 100%;margin-top:12px;border-bottom: 0.12rem solid #efeff4;">
		 <div style="width:3px; height:16px;background-color: rgba(0, 0, 0, 1);float:left;margin-left:10px;" class="u45_div"></div>
		 	<span class="sectitle" style="font-size: 0.40rem;font-weight:bold;color:rgba(72, 72, 72, 1)"> &nbsp;课堂教材 </span>
		 	<div style="font-size:15px;border-bottom: 0.022rem solid rgba(217, 217, 217, 0.58);margin:10px auto;width:94%;"></div>
		 	<div style="margin-top:20px;">
		 		<img src="${ppt}" style="width: 90%;margin-left: 20px;">
		 		<div class="careBtn">下载</div><br/>
		 	</div>
	 	</div>
	 </c:if>
	 <!-- 下载浮层 -->
	 <div class="careShareLayer" style="z-index: 999;">
		<div class="careShareBox">
			<img src="<b:staticUrl>/res/img/share/code.jpg</b:staticUrl>" class="mebmber" >
			<div class="font14 codeword" >
				<p>长按图片【识别二维码】关注公众号</p>
			</div>
			<div class="font12 word" >
				<p>1、识别图中二维码，点击【关注】</p>
				<p>2、回复"${rely}"</p>
				<p>3、点击链接，完成课件下载</p>
			</div>
		</div>
		<a href="javascript:void(0)" class="close"></a>
	</div>
	<!-- 相关推荐 -->
	    <c:if test="${not empty resp.sqwOneTitle}">
	    	<div class="section1 box_align" style="position: relative;width: 100%;margin-top:12px;border-bottom: 0.12rem solid #efeff4;">
		 	<div style="width:3px; height:16px;background-color: rgba(0, 0, 0, 1);float:left;margin-left:10px;" class="u45_div"></div>
		 	<span class="sectitle" style="font-size: 0.40rem;font-weight:bold;color:rgba(72, 72, 72, 1)"> &nbsp;相关推荐 </span>
		 	 <div style="font-size:15px;border-bottom: 0.022rem solid rgba(217, 217, 217, 0.58);margin:10px auto;width:94%;"></div>
				<div class="section sectionBorder0" id="sqwstart" style="margin-left: 10px;border-bottom: 0;">
				    <c:if test="${not empty resp.sqwOneTitle}">
					<div class="sectionTit" style="width: 95%;">
					    <c:if test="${resp.sqwSum!=null}">
						<a onclick="sqwSum()" class="more">
							相关<span class="txtyellow">${resp.sqwSum}条</span>答疑
							<input type="hidden" id="sqwsum" value="${resp.sqwSum}">
						</a>
						</c:if>
						<span class="icon-ask"></span>三千问
					</div>
					</c:if>
					<ul class="recommendList" id="sqwandid">
				     	<c:if test="${not empty resp.sqwOneTitle}">
						<li><a id="sthreeid">
						<input id="sthreeidinput" type="hidden" value="${resp.sqwOneId}">
							<div class="photo"><img src="${resp.sqwOneImg}" ></div>
							<div class="info">
								<h2><span class="hottag"></span>${resp.sqwOneTitle}</h2>
								<div class="other">推荐${resp.sqwOneAge}岁<span class="num">${resp.sqwOneListenCount}人听过</span></div>
							</div>
						</a></li>
						</c:if>
						<c:if test="${not empty resp.sqwTwoTitle}">
						<li><a id="stwoid">
						<input id="stwoidinput" type="hidden" value="${resp.sqwThreeId}">
							<div class="photo"><img src="${resp.sqwTwoImg}" ></div>
							<div class="info">
								<h2><span class="newesttag"></span>${resp.sqwTwoTitle}</h2>
								<div class="other">推荐${resp.sqwTwoAge}岁<span class="num">${resp.sqwTwoListenCount}人听过</span></div>
							</div>
						</a></li>
						</c:if>
						<c:if test="${not empty resp.sqwThreeTitle}">
						<li><a id="soneid" >
						<input id="soneidinput" type="hidden" value="${resp.sqwThreeId}">
							<div class="photo"><img src="${resp.sqwThreeImg}" ></div>
							<div class="info">
								<h2><span class="newesttag"></span>${resp.sqwThreeTitle}</h2>
								<div class="other">推荐${resp.sqwThreeAge}岁<span class="num">${resp.sqwThreeListenCount}人听过</span></div>
							</div>
						</a></li>
						</c:if>
					</ul>
					<c:if test="${resp.flag}">
			            <a href="javascript:void(0)" class="viewmore">查看更多推荐<span></span></a>
			            </c:if>
				  </div>
			  </div>
			</c:if>
		</div>
			 <!-- 下周预告-->
	<c:if test="${show}">
	 <div class="section1 box_align" style="position: relative;width: 100%;margin-top:12px;border-bottom: 0.12rem solid #efeff4;">
	  <div style="width:3px; height:16px;background-color: rgba(0, 0, 0, 1);float:left;margin-left:10px;" class="u45_div"></div>
		 	<span class="sectitle" style="font-size:0.40rem;font-weight:bold;color:rgba(72, 72, 72, 1)"> &nbsp;下周预告 </span>
		 	<div style="font-size:15px;border-bottom: 0.022rem solid rgba(217, 217, 217, 0.58);margin:10px auto;width:94%;"></div>
 		<div>
 			<div id="second" style="margin-top:13px;">
	 			<span id="u12" style="font-size:0.42rem;color:#FF9900;margin-left:15px;overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">${lname}</span><br><br/>
	 			<span class="one" style="margin-left:15px;color:#9E9E9E;font-size:0.28rem;">直播时间: ${lstartTime}</span><br/><br/>
		 		<span class="one" style="margin-left:15px;color:#9E9E9E;font-size:0.28rem;">适合: 0-6岁宝宝</span><br/><br/>
		 		<span class="one" style="margin-left:15px;color:#9E9E9E;font-size:0.28rem;">主讲人: ${nickName}-${realname}</span>
		 		<input type="hidden" id="lcourseId" value="${lcourseId}"/>
		 		<c:if test="${hasCollect==false}">
					<div class="subscribe addActive">关注</div>
				</c:if>
				<c:if test="${hasCollect==true}">
					<div class="subscribe">已关注</div>
				</c:if>
				<br/>
 			</div>
 		</div>
 	 </div>
 	</c:if>
	
	<div class="askmain">
		<div class="questionAsk"><img class="askimg" alt="" src="<b:staticUrl>/res/img/miaoqaask.png</b:staticUrl>"/></div>
		<div class="fastAsk" onclick="justAsk();">快速提问</div>
	</div>

 
<!-- 导航栏 -->
<jsp:include page="/pages/header_footer.jsp">
		<jsp:param value="2" name="menu"/>
</jsp:include>
<script src='<b:staticUrl>/res/js/scrollpaginationme.js</b:staticUrl>'></script>
<script src='<b:staticUrl>/res/js/subject.js</b:staticUrl>'></script>
<script src='<b:staticUrl>/res/js/clickmore.js</b:staticUrl>'></script>
<script src="<b:staticUrl>/res/js/wxmppay.js</b:staticUrl>"></script>
 <script type="text/javascript">
 var courseId=$("#courseId").val()
 $(function(){
	    HH.ajax({
	    	url:'/yzmm/account/course/ajaxrecommend',
		    data:{courseId:courseId},
			 callback: function(data,params){
				 h="";
				 if(data.success){
					 var len = data.list.length;
				     for(var i=0;i<len;i++){
					 var o = data.list[i];
					 h +='<input type="hidden" id="keyWord" value="'+o.keyWord+'">';
					 if(o.courseOneTitle!=null){
						 h+='<div class="section2" style="display:none;">';
					     h+='<div class="sectionTit">';
					     if(o.courseCount>1){
					    	 h+='<a onclick="coursemore()" class="more">';
						     h+='相关<span class="txtyellow" id="coursemore" value="'+o.courseCount+'">'+o.courseCount+'节</span>课程';
						     h+='</a>';
					     }
					     h+='<span class="icon-speak"></span>喵姐说';
					     h+='</div>';
					     h+='<ul class="speakList" id="courseandid">';
					     h+='<li><a onclick="toVod(this);" data-courseid="'+o.courseOneId+'">';
					     h+='<div class="photo"><span><img src="'+o.courseOneImg+'" ></span></div>';
					     h+='<p>'+o.courseOneTitle+'</p>';
					     h+='</a></li>';
					     h+='<li><a onclick="toVod(this);" data-courseid="'+o.courseTwoId+'">';
					     h+='<div class="photo"><span><img src="'+o.courseTwoImg+'" ></span></div>';
					     h+='<p>'+o.courseTwoTitle+'</p>';
					     h+='</a></li>';
					     h+='</ul></div>';
					 }
					 if(o.activityTitle!=null){
						 h+='<div class="section2" style="display:none;">';
					     h+='<div class="sectionTit">';
					     if(o.activityCount!=1){
					    	 h+='<a class="more" onclick="activitymore()">';
						     h+='相关<span class="txtyellow" id="activitymore" value="'+o.activityCount+'">'+o.activityCount+'期</span>活动';
						     h+='</a>';
					     }
					     h+='<span class="icon-activity"></span>喵活动';
					     h+='</div>';
					     h+='<ul class="activityList" id="activityandid">';
					     h+='<li onclick=toactivitylist() >';
					     h+='<input type="hidden" value="'+o.activityId+'" id="actid">';
					     h+='<div class="photo"><a href="#"><img src="'+o.activityImg+'" ></a></div>';
					     h+='<div class="info">';
					     h+='<h2 class="tit">'+o.activityTitle+'</h2>';
					     h+='<p>时间：'+o.activityStartTime+'－'+o.activityEndTime+'</p>';
					     h+='<div class="other"><a href="#" class="join">我要参与</a>会员价：￥'+o.activityMoney+'元</div>';
					     h+='</div></li></ul></div>';
					 }
					 if(o.topicOneTitle!=null){
						 h+='<div class="section2 sectionBorder0" style="display:none;">';
					     h+='<div class="sectionTit">';
					     if(o.topicCount!=1){
					    	  h+='<a class="more" onclick="topicmore()">';
							  h+='相关<span class="txtyellow" id="topicmore" value="'+o.topicCount+'">'+o.topicCount+'场</span>话题';
							  h+='</a>'; 
					     }
					     h+='<span class="icon-topic"></span>喵话题';
					     h+='</div>';
					     h+='<ul class="activityList" id="topicandid">';
					     h+='<li onclick=totopic('+o.topicOneId+')>';
					     h+='<div class="photo"><a ><img src="'+o.topicOneImg+'" ></a></div>';
						 h+='<div class="info">';
						h+='<p class="word">'+o.topicOneTitle+'</p>';
						h+='<div class="num">'+o.topicOnePv+'人看过</div>';
						h+='</div></li>';
						 if(o.topicTwoTitle!=null){
							  h+='<li>';
							    h+='<div class="photo"><a><img src="'+o.topicTwoImg+'" ></a></div>';
								h+='<div class="info">';
								h+='<p class="word">'+o.topicTwoTitle+'</p>';
								h+='<div class="num">'+o.topicTwoPv+'人看过</div>';
								h+='</div></li>'; 
						 }
						 if(o.topicThreeTitle!=null){
							  h+='<li>';
							    h+='<div class="photo"><a ><img src="'+o.topicThreeImg+'" ></a></div>';
								h+='<div class="info">';
								h+='<p class="word">'+o.topicThreeTitle+'</p>';
								h+='<div class="num">'+o.topicThreePv+'人看过</div>';
								h+='</div></li>';
						 }
						 h +='<input type="hidden" id="keyWord" value="'+o.keyWord+'">';
						h+='</ul></div>';
					 }
					}
				 }
	          $("#sqwstart").append(h);
			 }
		 });
	});
//快速提问
 function justAsk(){
 	HH.href('/yzmm/account/miaoqa/index');
 }
 function download(){
	 $(".word").show();
 }
 
 </script>
  <script type="text/javascript">
  var lcourseId = $("#lcourseId").val();
 
//订阅 
  $(".subscribe").click(function(){
	  	var cid = lcourseId;
 		var collectStatus="";
 		var follow="";
 		if ($(".subscribe").hasClass("addActive")) {
 			//此次点击会添加收藏
 			collectStatus = 1;
 			//此处点击已关注
 			follow=1;
 		} else {
 			//此次点击会取消收藏 
 			collectStatus = 0;
 			//此次点击取消关注
 			follow=0;
 		}
 		HH.ajax({
			   waiting:false,
			   async:false,
			   url: "/yzmm/account/course/followAndCollectLive",
			   data: {
				   courseId : cid,
				   collectStatus : collectStatus,
				   follow:follow
			   },
			   callback: function(data){
					if (data.success) {
						if ($(".subscribe").hasClass("addActive")) {
							$(".subscribe").removeClass("addActive");
							$(".subscribe").html("已关注");
						} else {
							$(".subscribe").addClass("addActive");
							$(".subscribe").html("关注");
						}
					}
			   }
		});
 		 
 	})
  
  </script>
 <script type="text/javascript">
$(function(){
	/*显示分享*/
	$(".careBtn").click(function(){
		$(".careShareLayer").fadeIn();
	});
	/*关闭分享*/
	$(".close").click(function(){
		$(".careShareLayer").fadeOut();
	});
})
</script>
<!-- 相关推荐 需要整合 -->
<script type="text/javascript">
//推荐
function tosqwlist(obj){
	window.location.href="/yzmm/account/knowledge/viewDetail?knowledgeId="+$(obj).data('sqwmoreid');
}
//三千问推荐加载更多
var sqwSumFlag = 1;
function sqwSum(){
	if(sqwSumFlag==1){
		var type ='SQW';
		  var sqwsum=$("#sqwsum").val();
		  var keyword=$("#keyWord").val();
		  var sqwOneId=$("#soneidinput").val();
		  var sqwTwoId=$("#stwoidinput").val();
		  var sqwThreeId=$("#sthreeidinput").val();
		 HH.ajax({
			    url:'/yzmm/account/course/ajaxmoreknowledge',
			    data:{
			    	sum:sqwsum,
			    	courseId:courseId,
			    	keyWords:keyword,
			    	sqwOneId:sqwOneId,
			    	sqwTwoId:sqwTwoId,
			    	sqwThreeId:sqwThreeId
			    	},
			    callback:function(data,params){
			    	var h = "";
		   		if(data.success){
		   			sqwSumFlag = true;
		   			var len = data.list.length;
						for(var i=0;i< len;i++){
							var o = data.list[i];
							if(o.sqwOneTitle!=null){
								h+='<li class="moresanqianwenlist"><a onclick="tosqwlist(this);" data-sqwmoreid="'+o.sqwOneId+'" >';
								h+='<div class="photo"><img src="'+o.sqwOneImg+'" ></div>';
								h+='<div class="info">';
							    h+='<h2><span class="hottag"></span>'+o.sqwOneTitle+'</h2>';
								h+='<div class="other">推荐'+o.sqwOneAge+'岁<span class="num">'+o.sqwOneListenCount+'人听过</span></div>';
								let obj=getDateObject(o.sqwOneTimeCount);
								h+='<div class="other" style="width: 50%;">时长:<span class="fmtDate_mmFssM">'+(obj.mm?parseInt(obj.mm)+'分':'') + (obj.ss?obj.ss+'秒':'')+'</span>';
								if(o.sqwOneIsFree){
									h+='<div class="freebutton" style="background-image: url(../../../res/img/xsmf.png);background-size: 52px;"></div>';
								}
								h+='</div>';
								h+='</div></a></li>';
							}
						} 
		   		}
		   		sqwSumFlag=2;
		   			 $("#sqwandid").append(h);
			    }
		    });
	}else{
		sqwSumFlag=1;
		$(".moresanqianwenlist").hide();
	}
	
}
function tocourselist(obj){
	window.location.href="/yzmm/account/course/toVodDetail?courseId="+$(obj).data('coursemoreid');
}
//课程加载更多
var coursemoreFlag = 1;
function coursemore(){
	if(coursemoreFlag==1){
		var type ='COURSE';
		var keyword=$("#keyWord").val();
		 HH.ajax({
			    url:'/yzmm/account/course/ajaxmoretopicandactivity',
			    data:{
			    	type:type,
			    	courseId:courseId,
			    	keyWords:keyword
			    	},
			    callback:function(data,params){
			    	var h = "";
		   		if(data.success){
		   			coursemoreFlag = true;
		   			var len = data.list.length;
						for(var i=0;i< len;i++){
							var o = data.list[i];
							
							if(o.courseOneTitle!=null){
								 h+='<li style="height:4.6rem;" class="morecourselist"><a onclick="tocourselist(this);" data-coursemoreid="'+o.courseOneId+'">';
							     h+='<div class="photo"><span><img src="'+o.courseOneImg+'" ></span></div>';
							     h+='<p>'+o.courseOneTitle+'</p>';
							     if(o.courseMoney){
							    	 h+='<label style="float: right;font-size: 0.32rem;margin-right: 5px;color: red;"><i>￥</i><em>'+o.courseMoney+'</em></label>';
							     }
							     h+='</a></li>';	
							}
						} 
		   		}
		   		coursemoreFlag=2;
		   		$("#courseandid").append(h);
			    }
		    });
	}else{
		coursemoreFlag=1;
		$(".morecourselist").hide();
	}
	
}
function totopicmore(obj) {
	var topicid=$(obj).data('topimoreid');
	window.location = "/yzmm/account/miao/topic/viewDetailIncludeReply?id="+topicid;
}
function totopic(id) {
	window.location = "/yzmm/account/miao/topic/viewDetailIncludeReply?id="+id;
}
function toactivitymore(obj) {
	var id=$(obj).data('activitymoreid');
	window.location = "/yzmm/account/course/toactivitypath?activityId="+id;
}
$(function(){
    HH.ajax({
    	url:'/yzmm/account/course/ajaxrecommend',
	    data:{courseId:courseId},
		 callback: function(data,params){
			 h="";
			 if(data.success){
				 var len = data.list.length;
			     for(var i=0;i<len;i++){
				 var o = data.list[i];
				 h +='<input type="hidden" id="keyWord" value="'+o.keyWord+'">';
				 if(o.courseOneTitle!=null){
					 h+='<div class="section" style="display:none;">';
				     h+='<div class="sectionTit">';
				     if(o.courseCount>1){
				    	 h+='<a onclick="coursemore()" class="more">';
					     h+='相关<span class="txtyellow" id="coursemore" value="'+o.courseCount+'">'+o.courseCount+'节</span>课程';
					     h+='</a>';
				     }
				     h+='<span class="icon-speak"></span>喵姐说';
				     h+='</div>';
				     h+='<ul class="speakList" id="courseandid">';
				     h+='<li style="height:4.6rem;"><a onclick="toVod(this);" data-courseid="'+o.courseOneId+'">';
				     h+='<div class="photo"><span><img src="'+o.courseOneImg+'" ></span></div>';
				     h+='<p>'+o.courseOneTitle+'</p>';
				     if(o.courseMoney){
				    	 h+='<label style="float: right;font-size: 0.32rem;margin-right: 5px;color: red;"><i>￥</i><em>'+o.courseMoney+'</em></label>';
				     }
				     h+='</a></li>';
				     h+='<li style="height:4.6rem;"><a onclick="toVod(this);" data-courseid="'+o.courseTwoId+'">';
				     h+='<div class="photo"><span><img src="'+o.courseTwoImg+'" ></span></div>';
				     h+='<p>'+o.courseTwoTitle+'</p>';
				     if(o.courseMoney2){
				    	 h+='<label style="float: right;font-size: 0.32rem;margin-right: 5px;color: red;"><i>￥</i><em>'+o.courseMoney2+'</em></label>';
				     }
				     h+='</a></li>';
				     h+='</ul></div>';
				 }
				 if(o.activityTitle!=null){
					 h+='<div class="section" style="display:none;">';
				     h+='<div class="sectionTit">';
				     if(o.activityCount!=1){
				    	 h+='<a class="more" onclick="activitymore()">';
					     h+='相关<span class="txtyellow" id="activitymore" value="'+o.activityCount+'">'+o.activityCount+'期</span>活动';
					     h+='</a>';
				     }
				     h+='<span class="icon-activity"></span>喵活动';
				     h+='</div>';
				     h+='<ul class="activityList" id="activityandid">';
				     h+='<li onclick=toactivitylist() >';
				     h+='<input type="hidden" value="'+o.activityId+'" id="actid">';
				     h+='<div class="photo"><a href="#"><img src="'+o.activityImg+'" ></a></div>';
				     h+='<div class="info">';
				     h+='<h2 class="tit">'+o.activityTitle+'</h2>';
				     h+='<p>时间：'+o.activityStartTime+'－'+o.activityEndTime+'</p>';
				     h+='<div class="other"><a href="#" class="join">我要参与</a>会员价：￥'+o.activityMoney+'元</div>';
				     h+='</div></li></ul></div>';
				 }
				 if(o.topicOneTitle!=null){
					 h+='<div class="section sectionBorder0" style="display:none;">';
				     h+='<div class="sectionTit">';
				     if(o.topicCount!=1){
				    	  h+='<a class="more" onclick="topicmore()">';
						  h+='相关<span class="txtyellow" id="topicmore" value="'+o.topicCount+'">'+o.topicCount+'场</span>话题';
						  h+='</a>'; 
				     }
				     h+='<span class="icon-topic"></span>喵话题';
				     h+='</div>';
				     h+='<ul class="activityList" id="topicandid">';
				     h+='<li onclick=totopic('+o.topicOneId+')>';
				     h+='<div class="photo"><a ><img src="'+o.topicOneImg+'" ></a></div>';
					 h+='<div class="info">';
					h+='<p class="word">'+o.topicOneTitle+'</p>';
					h+='<div class="num">'+o.topicOnePv+'人看过</div>';
					h+='</div></li>';
					 if(o.topicTwoTitle!=null){
						  h+='<li>';
						    h+='<div class="photo"><a><img src="'+o.topicTwoImg+'" ></a></div>';
							h+='<div class="info">';
							h+='<p class="word">'+o.topicTwoTitle+'</p>';
							h+='<div class="num">'+o.topicTwoPv+'人看过</div>';
							h+='</div></li>'; 
					 }
					 if(o.topicThreeTitle!=null){
						  h+='<li>';
						    h+='<div class="photo"><a ><img src="'+o.topicThreeImg+'" ></a></div>';
							h+='<div class="info">';
							h+='<p class="word">'+o.topicThreeTitle+'</p>';
							h+='<div class="num">'+o.topicThreePv+'人看过</div>';
							h+='</div></li>';
					 }
					 h +='<input type="hidden" id="keyWord" value="'+o.keyWord+'">';
					h+='</ul></div>';
				 }
				}
			 }
          $(".wrap").append(h);
		 }
	 });
});
function toactivitylist(obj){
	var id=$("#actid").val();
	window.location ="/yzmm/account/course/toactivitypath?activityId="+id;
}
$("#soneid").click(function(){
	var id=$("#soneidinput").val();
	window.location ="/yzmm/account/knowledge/viewDetail?knowledgeId="+id;
});
$("#stwoid").click(function(){
	var id=$("#stwoidinput").val();
	window.location ="/yzmm/account/knowledge/viewDetail?knowledgeId="+id;
});
$("#sthreeid").click(function(){
	var id=$("#sthreeidinput").val();
	window.location ="/yzmm/account/knowledge/viewDetail?knowledgeId="+id;
});
function toVod(obj){
	window.location.href="/yzmm/account/course/toCoursePath?courseId="+$(obj).data('courseid');
}


</script>
</body>
</html>