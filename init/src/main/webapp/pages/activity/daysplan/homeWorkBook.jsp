<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="j" uri="/jsputil" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta name="format-detection" content="telephone=no" />
	<meta name="format-detection" content="email=no"/>
	<title>${title}</title>
	<%@include file="../../header_v15.jsp"%>
	<%@include file="../../header_wxjsapi.jsp"%>
	<script src="<b:staticUrl>/res/js/scrollpaginationme.js</b:staticUrl>"></script>
	<script type="text/javascript" src="<b:staticUrl>/res/js/publish.js</b:staticUrl>"></script>
	<%-- <script type="text/javascript" src='<b:staticUrl>/res/js/textshow.js</b:staticUrl>'></script> --%>
	<script type="text/javascript" src="<b:staticUrl>/res/js/myaudio-v13.js</b:staticUrl>"></script>
	<link rel="stylesheet" href="<b:staticUrl>/res/css/group.css</b:staticUrl>">
	<script src="<b:staticUrl>/res/js/custom/lightbox/lightbox.js</b:staticUrl>"></script> 
	<link rel="stylesheet" href="<b:staticUrl>/res/css/myaudio.css</b:staticUrl>">
	<style type="text/css">
	.imglist {
    width: 100%;
    margin-top: 0.4rem;
	}
	imgitem {
	    float: left;
	    width: 33%;
	    height: 1.68rem;
	    margin-bottom: 0.4rem;
	}
	
	.imglist img {
	    display: block;
	    width: 2.24rem;
	    height: 1.68rem;
	    margin: 0 auto;
	    border-radius: 0px;
	}
	.publishVote .submit, .publishVote .cancle {
	    float: right;
	    width: 1.54666667rem;
	    height: 0.76rem;
	    line-height: 0.76rem;
	    margin-right: 0.4rem;
	    margin-top: 0.32rem;
	    background-color: #e51812;
	    border-radius: 6px;
	    text-align: center;
	    color: #fff;
	}
	.publishVote .cancle {
		    background-color: #666;
		}
	.wordTit {
	    width: 100%;
	    max-width: 540px;
	    margin: 0 auto;
	    margin-top: 0;
	    padding: 0;
	    color: #fff;
	    }
	.myaudio .bar div:first-child {
	    width: 2.8rem;
	}
	.myaudio .bar {
	    width: 2.8rem;
	}
	.myaudio .mywrap {
	    width: 7.35rem;
	}
	/** 英文换行 **/
	.voteword{
		word-break:break-all;
	}
	/**去掉图片上下的线条**/
	.imglist {
	    border-top: 0px solid #ccc; 
	    border-bottom: 0px solid #ccc; 
	    }
	.viewmore {
	    text-align: right;
	    margin-right: 11px;
	    margin-bottom: 10px;
	    float: none;
		}
		.imglist {
	    border-top: 0px;
	    border-bottom: 0px;
		}
	.evalute3{
		border-top: 0px;
	}
	.codeType{
	margin-top: 20px;
	text-align:center;
	color:#cccccc
	}
	.object-cont{
		padding-bottom: 5px;
	}
	.tutorbtn-already {
    	width: 1.86666667rem;
	    height: 0.66666667rem;
	    line-height: 0.66666667rem;
	    margin-top: -8px;
	  	 background-color: #ccc !important;
	    text-align: center;
	    border-radius: 0.16rem;
	    color: #fff !important;
	}
	.myaudio .mywrap{
	    margin-bottom: 0.32rem;
	}
	
	</style>
</head>
<body id="bgwhite">
	<div class="font17 slidenote"><a href="javascript:void(0)" class="close" onclick="fallback()"></a><p><c:out value="${title}"></c:out></p></div>
	<div class="object">
		<div class="font12 objTit" id="week"><span class="icon"></span>第${week}周作业指导</div>
		<div class="object-cont">
			<div class="photo"><img src="${tcablumUrl}" ></div>
			<div class="info">
				<h3 class="font15 name">导师今日说:</h3>
				<c:if test="${playUrl != null}">
					<audio class="pinglun topAudio" preload="none" style="visibility:hidden;" controls>
                		<source src="${playUrl}" />
            		</audio>
				</c:if>
                <c:if test="${not empty comefromtext}">
				<p class="font12"><c:out value="${comefromtext}"></c:out> </p>
				</c:if>
			</div>
		</div>
	</div>
	<div class="zyzd" style="display: none">
		<div class="zyzdBox">
			<div class="font17 tit">第${week}周作业指导</div>
					<div class="zyzdItem">
			  <c:if test="${not empty activityDetailOneTitle or not empty activityDetailOne}">
				<div>
					  <c:if test="${not empty activityDetailOneTitle}">
					<h2 class="font15">${activityDetailOneTitle}：</h2>
					</c:if>
					  <c:if test="${not empty activityDetailOne}">
					<p class="font12">${activityDetailOne}</p>
					</c:if>
				</div>
				</c:if>
			  <c:if test="${not empty activityDetailTwoTitle or not empty activityDetailTwo}">
				<div>
					<c:if test="${not empty activityDetailTwoTitle}">
					<h2 class="font15">${activityDetailTwoTitle}：</h2>
					</c:if>
					<c:if test="${not empty activityDetailTwo}">
					<p class="font12">${activityDetailTwo}</p>
					</c:if>
				</div>
				</c:if>
			  <c:if test="${not empty activityDetailThreeTitle or not empty activityDetailThree}">
				<div>
					 <c:if test="${not empty activityDetailThreeTitle}">
					<h2 class="font15">${activityDetailThreeTitle}：</h2>
					</c:if>
					 <c:if test="${not empty activityDetailThree}">
					<p class="font12">${activityDetailThree}</p>
					</c:if>
				</div>
				</c:if>
			</div>
			<a href="javascript:void(0)" class="font18 zyzdBtn" id="close">我学会了</a>
		</div>
	</div>
	<div class="workbook">
		<div class="font15 tabtit">
			<a href="javascript:void(0)" class="active" onclick="everyDayDetail('${dayId}')">作业本</a>
			<a href="javascript:void(0)" onclick="miaoClass('${dayId}')">喵班级</a>
		</div>
		<div class="worklist" id="worklist">
			<ul>
			</ul>
		</div>
	</div>
<!--尾部-->
	<jsp:include page="/pages/header_footer.jsp">
		<jsp:param value="3" name="menu"/>
	</jsp:include>
		<!--发表评论-->
	<form class="publishVote">
		<div class="font17 voteTit">发表评论</div>
		<div class="voteBox">
			<textarea class="font12" placeholder="请输入评论内容..." maxlength="120"></textarea>
			<span class="font12 num"><i>0</i> / 120</span>
		</div>
		<a href="javascript:void(0)"  class="font15 cancle" >取消</a>
		<a href="javascript:void(0)" onclick="doCommentText(this)" class="font15 submit" >发表</a>
	</form>
	<c:if test="${doHomework==false && isPrivilege==false && nohw==false}">
		<div class="font18 btnfixed2"><a href="/yzmm/account/activity/daysPlan/myHomeworkList?activityId=${activityId}">查看我的作业</a></div>
	</c:if>
	<c:if test="${doHomework==true && isPrivilege==false && nohw==false}">
     <div class="font18 btnfixed2"><a href="/yzmm/account/activity/daysPlan/toPublishHomework?activityId=${activityId}&dayId=${dayId}">提交作业</a></div>	
    </c:if>
<script>
$(function(){
	 var dayStatus='${theFirst}';
	 if(dayStatus=="yes"){
		 $(".zyzd").show();
	 }
});
function fallback(){
	location.href="/yzmm/account/activity/daysPlan/everyDayList?activityId=${id}";
}
$("#week").click(function(){
	$(".zyzd").show();
});
$("#close").click(function(){
	 $(".zyzd").hide();
});
</script>
	<!-- 初始化 -->
<script type="text/javascript">
var verifyTextStatus = false;
var activityId = '${activityId}';
var dayId = '${dayId}';
var hwId = null;
</script>
<!-- 校验相关 -->
<script type="text/javascript">
function verifyText(text){
	toastWaiting();
	//校验文本是否涉及非法内容
	HH.ajax({
		url: "/yzmm/account/miao/verifyText",
		data:{
			text:text
			},
		async:false,
		callback:function(data){
			if(data.success){
				//
				verifyTextStatus = true;
				return;
			}else{
				toast(data.msg);
				verifyTextStatus = false;
				return;
			}
		}
	});
}
</script>


<script type="text/javascript">
	var pageIndex = 1;
	var sm = {};
	var id = '${dayId}';
	var commentPageSize = 5;
	//楼层数
	var floorNum = 1;
	$(function(){
		sm = $(window).scrollme({
			target:$("#bb"),
			data:{pageSize:10,dayId:id},
			url:"/yzmm/account/activity/daysPlan/ajaxGetHomeworkList",
			beforeLoad:function(){
				//查询之前调用
				
				if(1!=pageIndex){
					$("#showloaddiv").show();
				}
			},
			callback:function(data,params){
				$("#showloaddiv").hide();
				var h = "";
				if (data.success) {
					var len = data.list.length;
					//现有li长度
					var liLength = $("#worklist>ul>li").length;
					//是否为空
					if (!data.totalPage) {
						$(".noresult").remove();
						$("#homeworkNull").remove();
						h='<div class="font15 codeType" id="homeworkNull">作业薄空空如也，快来抢沙发！</div>'
					} else {
						$(".noresult").hide();
						
						if (len) {
							//增加页码
							params.pageIndex = ++pageIndex;
						}
						for (var i = 0; i < len; i++) {
							var o = data.list[i];
							h += '<li>';
							h += '<div class="photo"><img src="'+o.userAlbumUrl+'" ></div>';
							h += '<div class="rightcont">';
							h += '<h2 class="font15"><span>'+o.userName+'</span></h2>';
							
							h += '<div class="font12 sex">'
							if(o.userIdentity != 'HELPER'){
								if(o.userIdentity == 'GRAVIDA'){
									h+='<span class="i-yun">';
									h += '</span>已怀孕';
									h += '</span>';
									h+='&nbsp;&nbsp;'+o.babyAge+'';
								}else if(o.userIdentity == 'MOM'){
									if(o.babySex){
										if(o.babySex == '小王子'){
											h+='<span class="i-boy">';
										}else {
											h+='<span class="i-girl">';
										}
										h += '</span>'+o.babySex;
									}
									if(o.babyAge){
										h+='&nbsp;&nbsp;'+o.babyAge+'';
									}
								}
							}else{
								h+='<span class="i-other">';
								h += '</span>喵星人';
								h += '</span>';
								h += '</span>'
							}
								h+='</div>';
							if(o.type=='TEXT'||o.type=='TEXTIMG'){
 								h += '<div class="contentText">';
 								if(o.content != null){
 									h += '<p class="font12 voteword">'+o.content+'</p>';
 								}
 								h += '</div>';
							}else if(o.type=='AUDIO'||o.type=='AUDIOIMG'){
								//语音
								h += '<audio class="homework'+pageIndex+'" data-time="'+o.playTimeSec+'" data-timefmt="'+o.playTime+'"  data-id="'+o.id+'" preload="none" style="visibility:hidden;" controls>';
			                		h += '<source src="'+o.playUrl+'" />';
			            		h += '</audio>';
							}
						/* 	if(o.imgFirst!=null&&o.imgSecond!=null&&o.imgThird!=null){
								h += '<div class="imglist">';
							}
							 if(o.imgFirst){
								h += '<span class="imgitem"><img style="width: 2.2rem;height:1.8rem;margin-left: 0.2rem;" src="'+o.imgFirst+'"></span>';
							} 
					         if(o.imgSecond){
								h += '<span class="imgitem"><img style="width: 2.2rem;height:1.8rem;margin-left: 0.2rem;" src="'+o.imgSecond+'"></span>';
							}
							if(o.imgThird){
								h += '<span class="imgitem"><img style="width: 2.2rem;height:1.8rem;margin-left: 0.2rem;" src="'+o.imgThird+'"></span>';
							}  */
							
							/* if(o.imgFirst!=null&&o.imgSecond!=null&&o.imgThird!=null){
								h += '</div>';
							}  */
							h += '<img src="'+o.imgFirst+'" class="tips" >';
							h += '<div class="font12 handle">';
							h += '<span>'+o.timeAgo+'</span>';
							if('${isPrivilege}'=='true'){
								if(o.tutorCommentPlayUrl ||o.tutorCommentContent){
									h+='<a class=" tutorbtn-already">导师点评</a>';
								}else{
									h+='<a href="/yzmm/account/activity/daysPlan/toDoTutorRemark?homeworkId='+o.id+'&activityId='+activityId+'&dayId='+dayId+'" class="tutorbtn">导师点评</a>';
								}
							} 
							if(o.meIsMiaoThis){
								h += '<a href="javascript:void(0)"><span class="i-zan i-zanactive"></span>'+o.miaoCount+'</a>';
							}else{
								h += '<a href="javascript:void(0)" onclick="addUpMiao(this)" data-miao="'+o.miaoCount+'" data-id="'+o.id+'"><span class="i-zan"></span>'+o.miaoCount+'</a>';
							}
							h += '<a href="javascript:void(0)" class="votebtn" data-id="'+o.id+'"><span class="i-vote"></span>评论</a>';
							
							h += '</div>';
							var commentlen = o.homeworkCommentList.length;
							h += '<div  id="vote'+o.id+'">';
							if(commentlen!=0){
								h += '<div  class="font12 votemsg huifu">';
							}
							for (var j = 0; j < commentlen; j++) {
								var o2 = o.homeworkCommentList[j];
								h += '<p><span>'+o2.userName+':</span>'+o2.content+'</p>';
							}
							if(commentlen!=0){
								h += '</div>';
							}
							h += '</div>';
							if(o.commentCount>2){
								h += '<div id="more'+o.id+'" onclick="moreComment(this)" data-id="'+o.id+'" class="font12 votemore"><a href="javascript:void(0)">显示全部评论内容<span class="i-xiala"></span></a></div>';
							}
							if(o.tutorCommentPlayUrl){
								h += '<div class="evalute">';
								h += '<div class="evaluteL">';
								h += '<img src="'+o.tutorAlumb+'" >';
								h += '<p class="font12">'+o.tutorName+'</p>';
								h += '</div>';
								h += '<div class="evaluteR">';
								h += '<span class="font15 tit">导师<br >点评</span>';
								h += '<div class="audio">';
								h += '<audio class="tutor'+pageIndex+'" preload="none" style="visibility:hidden;" controls>';
		                		h += '<source src="'+o.tutorCommentPlayUrl+'" />';
		            			h += '</audio>';
		            			h += '</div>';
								h += '</div>';
								h += '</div>';
								h += '</div>';
							}else if(o.tutorCommentContent){
								h+='<div class="zjdp">';
									h+='<div class="img"><img src="'+o.tutorAlumb+'" ></div>';
									h+='<div class="font12 word">';
										h+='<div class="font18 wTit">导师点评</div>';
										h+='<p >'+o.tutorCommentContent+'</p>';
									h+='</div>';
							}
							h += '</div>';
							h += '</div>';
							h += '</li>';
						}
						
					}
				} 
				$(".worklist>ul").append(h);
				audioeventHomework("homework"+pageIndex);
				audioeventTutor("tutor"+pageIndex);
				//给图片绑定展示事件
				initMyImgShow();
				//绑定评论事件
				$('.votebtn').bind('click', function(event) {
					//alert(hwId);
					hwId = $(this).data("id");
					//alert(hwId);
					votebtnClick();
				  });
				//遍历新添加的dom,如果<p>的内容高于隐藏样式的指定的最大高度，则添加显示按钮，否则删除显示按钮
				var newLiLength = liLength + len;﻿
				for (var i=0;i<len;i++)
				{
					var contentText = $($($("#worklist>ul>li")[liLength+i]).children(".contentText"));
					//位置的开始值为 liLength 新增前的li长度
					if($(contentText).innerHeight()>54){
						//添加隐藏样式
						$(contentText).children("p").addClass("els3");
						$(contentText).after('<a href="javascript:void(0)" class="font12 viewall">展开</a>');
					}
				}
				$('.viewall').unbind("click").bind('click', function(event) {
					showAndHide(this);
				  });
				//教师文本回复遍历 
				$(".moretutorcomment").each(function(index){
					if($(this).innerHeight()<30){
						$(this).next("a").hide();
					};
				});
			}
		});
		//加载数据
		sm.reload();
	})
	function reload(){
		pageIndex = 1;
		sm.reload({pageIndex:1});
	}
</script>
<script type="text/javascript">
function moreComment(obj){
	var id = $(obj).data("id");
	//console.log(id);
	var beginIndex = 2;
	HH.ajax({
			url:'/yzmm/account/activity/daysPlan/ajaxHomeworkComment', 
			data:{pageSize:1000,homeworkId:id,beginIndex:beginIndex}, 
			callback:function(data){
				var h = "";
				if (data.success) {
					//是否为空
					if (!data.totalPage) {
						$(obj).hide();
						
					} else {
						var len = data.list.length;
						$(obj).hide();
						h+='</div>';
						 // h += '<div class="font12 votemsg">';
						for (var i = 0; i<len; i++) {
							var o2 = data.list[i];
							h += '<p><span>'+o2.userName+':</span>'+o2.content+'</p>';
						}
					    //h+='</div>'
				} 
				//$("#vote"+id).children(".huifu").append(h);
				$("#vote"+id).children(".huifu").append(h);
			}
			}
		});
	}
</script>
<script type="text/javascript">
	function everyDayDetail(dayId){
		window.location = "/yzmm/account/activity/daysPlan/everyDayDetail?dayId="+dayId;
	}
	function miaoClass(dayId){
		window.location = "/yzmm/account/activity/daysPlan/miaoClass?dayId="+dayId;
	}
	// 评论
	function doCommentText(obj){
		var homeworkId = hwId;
		console.log(homeworkId);
		var text = $(obj).prev().prev(".voteBox").children("textarea").val();
		$(obj).prev().prev(".voteBox").children("textarea").val("");
		verifyText(text);
		if(!verifyTextStatus){
			return verifyTextStatus;
		}
		console.log(text);
		HH.ajax({
			url:'/yzmm/account/activity/daysPlan/doHomeworkComment',
			data:{homeworkId:homeworkId,activityId:activityId,dayId:dayId,
				text:text}, 
			callback:function(data){
				console.log(data);
				if (data.success) {
				if(!$("#more"+homeworkId).css("display")&&$("#vote"+homeworkId).children(".huifu").length==0){
					var h2 = '<div  class="font12 votemsg huifu">';
					  h2+='<p><span>${userName}：</span>'+text+'</p>'
				       h2 +='</div>';
				       $("#vote"+homeworkId).append(h2);
				}
				else if(!$("#more"+homeworkId).css("display")&&$("#vote"+homeworkId).children(".huifu").length>0){
					var h2 ='<p><span>${userName}：</span>'+text+'</p>';
					$("#vote"+homeworkId).children(".huifu").append(h2);
				}
				$(".publishVote .cancle").click();
				}else{
					toast(data.msg);
				}
			}
		});
	}
	//添加喵
	function addUpMiao(obj){
		var miaoNum = $(obj).data("miao");
		var homeworkId = $(obj).data("id");
		console.log(homeworkId+" "+miaoNum);
		HH.ajax({
			url:'/yzmm/account/activity/daysPlan/doAgreeToHomework',
			data:{homeworkId:homeworkId,activityId:activityId,dayId:dayId}, 
			callback:function(data){
				console.log(data);
				if (data.success) {
					var newmiaoNum = parseInt(miaoNum)+1;
					var h = "<span class='i-zan i-zanactive'></span>"+newmiaoNum+"</a>";
					$(obj).html(h);
				}else{
					toast(data.msg);
				}
			}
		});
	}
	$(function(){
		//评论点击取消
		$(".publishVote .cancle").click(function(){
			$("#textAreaSubmit").val("");
			 $("#replyId").val("");
			 
			 var st = parseInt($("body").data("st"));
				$(".publishVote").addClass("slideBottom");
				setTimeout(function(){
					$("body").removeAttr("style");
					$(".publishVote").removeClass("slideTop");
					$(".publishVote").removeClass("slideBottom");
					stopWindowDefault.windowdefaultEvent(true);	
					$(".btnfixed").show();
					//$(window).scrollTop(st);
				},800);
				
		});
	});
	
	//显示全部活动详情
	function viewAll(dayId){
		window.location = "/yzmm/account/activity/daysPlan/toEverydayActivityDetail?dayId="+dayId;
	}
</script>
<script type="text/javascript">
//给图片绑定展示事件
initMyImgShow();
</script>
<script type="text/javascript">
	//顶端播放器
	$(function(){
		$(".topAudio").myaudio({
			nowrap:true,
			play:function(thet){
				var a = $(".pause").find("audio").get(0);
				if(a){
					a.pause();
				}
			},
			audioPlay:function(){
				if("0" == "${playTime}"){
					addTopAudioTimelen($(".topAudio"))
				}
			}
		});
			
		if("0" != "${playTime}"){
			$(".myaudio .duration").html("${playTimeShow}");
		}
	});
	function addTopAudioTimelen(obj){
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
							   url: "/yzmm/account/activity/daysPlan/ajaxAddTime",
							   data: {
								   dayId:"${dayId}",
								   time:duration
							   },
						});
					 }
				}
			}, 2000);
		}
	}
	
	//作业簿播放器
	function addhomeworkTimelen(obj){
		obj = $(obj);
		var a = obj.get(0);
		if(a && !obj.hasClass("hastime")){
			window.setTimeout(function() {
				if(isNumeric(a.duration)){
					var duration = a.duration;
					var o = obj;
					o.addClass("hastime");
					var id = o.parents("li").data("id");
					 if(id && duration){
						 HH.ajax({
							   waiting:false,
							   url: "/yzmm/account/activity/daysPlan/ajaxAddHomeWorkTime",
							   data: {id:id,time:duration},
						});
					 }
				}
			}, 2000);
		}
	}
	function audioeventHomework(homework){
		//播发器
		$("."+homework).myaudio({
			nowrap:true,
			play:function(thet){
				var a = $(".pause").find("audio").get(0);
				if(a){
					a.pause();
				}
			},
			audioPlay:function(audio){
				//添加时间
				addhomeworkTimelen($( audio));
			}
		});
	
		$("."+homework).each(function(){
			var o = $(this);
			if("0" != o.data("time")){
				var ad = $(this);
				ad.addClass("hastime");
				o.find(".duration").html(o.data("playTimeShow"));
			}
			
			
		});
	}
	//导师点评播放器
	function audioeventTutor(tutor){
		//播放器样式
		$($(".audio").find(".time")).remove();
		//播发器
		$("."+tutor).myaudio({
			nowrap:true,
			play:function(thet){
				var a = $(".pause").find("audio").get(0);
				if(a){
					a.pause();
				}
			},
		});
		$($(".audio").find(".bar")).attr("style","margin-left: -1.1rem;");
	}
</script>
<script type="text/javascript">
//展示与隐藏多行文本
function showAndHide(thet){
	if($(thet).text() == "展开"){
		//如果是隐藏，修改为展开啊状态，修改文字为隐藏
		$(thet).siblings("div").children("p").removeClass("els3");
		$(thet).text("隐藏")
	}else if($(thet).text() == "隐藏"){
		$(thet).siblings("div").children("p").addClass("els3");
		$(thet).text("展开")
	}
}
</script>
<script type="text/javascript">
//关于导师点评 关闭 和 放开
function gettutorcommentmore(obj){
	if($(obj).text()=="查看全部"){
		$(obj).prev("p").removeClass("els2");
		$(obj).text("隐藏");
		//$(obj).parents(".evalute3").css("background","none");
	}else if($(obj).text()=="隐藏"){
		$(obj).prev("p").addClass("els2");
		$(obj).text("查看全部");
		//$(obj).parents(".evalute3").css("background","url(<b:staticUrl>/res/img/activity/dialog@2x.png</b:staticUrl>) center 0.26666667rem no-repeat");
	}
	
}
//阻止冒泡
function getEvent() {
    if (document.all) {
        return window.event; //如果是ie
    }
    func = getEvent.caller;
    while (func != null) {
        var arg0 = func.arguments[0];
        if (arg0) {
            if ((arg0.constructor == Event || arg0.constructor == MouseEvent) || (typeof(arg0) == "object" && arg0.preventDefault && arg0.stopPropagation)) {
                return arg0;
            }
        }
        func = func.caller;
    }
    return null;
}

function stopevt() {
	var ev = getEvent();
    if (ev.stopPropagation) {
        ev.stopPropagation();
    } else if (window.ev) {
        window.ev.cancelBubble = true;
    }
}
$(".zyzdBox").click(function(){
	stopevt();
});
$(".zyzd").click(function(){
	 $(".zyzd").hide();
});

</script>
</body>
</html>