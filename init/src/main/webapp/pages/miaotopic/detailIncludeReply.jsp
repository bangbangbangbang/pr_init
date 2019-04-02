<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>${topicTitle}</title>
	<%@include file="../header_v13.jsp"%>
	<%@include file="../header_wxjsapi.jsp"%>
	<script src="<b:staticUrl>/res/js/custom/lightbox/lightbox.js</b:staticUrl>"></script> 
	<script src="<b:staticUrl>/res/js/scrollpaginationme.js</b:staticUrl>"></script>
	<link rel="stylesheet" href="<b:staticUrl>/res/css/myaudio.css</b:staticUrl>">
	<script type="text/javascript" src="<b:staticUrl>/res/js/myaudio-v13.js</b:staticUrl>"></script>
	<script type="text/javascript" src="<b:staticUrl>/res/js/publish.js</b:staticUrl>"></script>
	<style type="text/css">
		.myaudio .bar div:first-child {
		    width: 3.8rem;
		}
		.myaudio .bar {
		    width: 3.8rem;
		}
	</style>
	
	<style type="text/css">
		.reply{
			background-color: #e51812;
		}
	</style>
	<style type="text/css">
		.topic-list .rightcont .img{
			border-bottom: 0px solid #ccc;
		}
		.topic-list .handle{
			border-top: 0px solid #ccc;
		}
	
		/** 回复框时间向右浮动 **/
		.voterights .voteright h3 span {
		    float: right;
		    color: #666;
		}
		/** 自动换行 **/
		.els3 {
		    width: 100%;
		    max-height: 54px;
		    line-height: 18px;
		    overflow: hidden;
		    -webkit-line-clamp: 3;
		    display: -webkit-box;
		    -webkit-box-orient: vertical;
		}
		/** 回复行高 **/
		.font12 {
		    line-height: 18px;
		}
		/** 英文换行 **/
		.voteword{
			word-break:break-all;
		}
		.topic-list .voteright {
		    height: 1.41333333rem;
		}
		/** 图片圆角 **/
		.radius{
		    border-radius: 6px;        
		}
		.topDistance{
			margin-top: 5px;
		}
		.i-shangla {
		    display: block;
		    width: 15px;
		    height: 10px;
		    position: relative;
		    top: 50%;
		    margin-top: -0.13333333rem;
		    background-image: url("<b:staticUrl>/res/img/group/shangla.png</b:staticUrl>");
		    background-size: 16px 10px;
		    display: inline-block;
		    margin-left: 0.13333333rem;
   			vertical-align: -0.02666667rem;
		}
		.line18{
		line-height: 18px;
		}
		.voice_background {
		    margin-left: 5%;
		    width: 90%;
		    height: 1.1rem;
		    background: url("<b:staticUrl>/res/img/background-bofangqi.png</b:staticUrl>");
		    background-size: 100%;
		    border-radius: 12px;
		}
		.myaudio .mywrap {
		    height: 1.1rem;
		}
		
	</style>
</head>
<body id="bgwhite">
	<input type="hidden" id="topicId" value="${topicId}">
	<input type="hidden" id="relevanceId" value="${relevanceId}">
	<input type="hidden" id="topicType" value="${topicType}">
	<!-- 二级评论暂存对一级评论的一级评论id -->
	<input type="hidden" id="replyId" value="">
	<!-- 临时增加二级评论回复框，不坚黄哦  -->
	<!-- <div class="tempInput">
		<input type="text" id="tpInput" style="border-color: red;height: 1.2rem;width: 9rem">
		<button style="color: blue;" onclick="tempStepReply()">提交</button>
	</div> -->
	
	
	<div class="topic-banner">
		<h2 class="font24">${topicTitle}</h2>
		<c:if test="${not empty topicImg}">
			<img src="${topicImg}">
		</c:if>
		<c:if test="${empty topicImg}">
			<img src="<b:staticUrl>/res/img/topicdefault.png</b:staticUrl>">
		</c:if>
		
		<div class="font12 topic-bannerinfo">
			<span class="right">${partUserAmount}位女神正在热聊中</span>
			<span>${releaseTime}</span>
		</div>
	</div>
	<div class="topic-info">
		<h2 class="font15">话题描述：</h2>
		<div class="font12 word">${titleDescription}</div>
		<div class="font12 viewmore"  onclick="toDetail()" ><span class="i-arrow"></span><a href="javascript:void(0);">查看详情</a></div>
	</div>
	<div class="topic-audio topic-audio2">
	<c:if test="${hasAuth }">
		<audio class="topicAudio" preload="none" style="visibility:hidden;" controls>
            <source src="${playUrl}" />
        </audio>
	</c:if>
	<c:if test="${!hasAuth }">
		<div class="voice_background" onclick=toSource();></div>
	</c:if>
        
		<div class="font12 audio-source">
			话题出自：<a href="javascript:void(0);" onclick=toSource();>${relevanceTitle}</a><span><i class="i-source"></i>${topicTypeString}</span>
		</div>
	</div>
	<div class="topic-tab">
		<div class="font15 topic-tablink">
			<a href="javascript:void(0);" class="active" onclick="queryByFav()" id="queryByFav">精彩</a>
			<span>|</span>
			<a href="javascript:void(0);"  onclick="queryByCreateTime()" id="queryByCreateTime">最新</a>
		</div>
		<div class="font15" style="display:none;text-align:center;" id="comeOn">
			<span >快点来抢沙发吧</span>
		</div>
	</div>
	<div class="topic-list byCreatemTimeReplyList" id="byCreatemTimeReplyList">
		<ul>
			<!-- <li>
				<div class="photo"><img src="images/1.png" ></div>
				<div class="rightcont">
					<h2 class="font15"><i class="font12">24小时前</i>疯狂的苹果<span>喵主</span></h2>
					<div class="font12 sex">
						<span class="i-boy"></span>MALE&nbsp;&nbsp;3岁
						<span class="i-pos"></span>北京市
					</div>
					<div class="font12 word">我每天陪伴孩子有固定的3个时间段早上7:00，中我每天陪伴孩子有固定的3个时间段早上7:00，中...</div>
					<a href="javascript:void(0)" class="font12 viewall">展开</a>
					<div class="img">
						<span class="imgitem"><img src="images/3.png" ></span>
						<span class="imgitem"><img src="images/3.png" ></span>
						<span class="imgitem"><img src="images/3.png" ></span>
					</div>
					<div class="voteitems">
						<div class="voteitem">
							<div class="votephoto"><img src="images/1.png" ></div>
							<div class="voteright">
								<h3 class="font15">张三丰</h3>
								<div class="font12 votesex">
									<span class="i-girl"></span>小公主&nbsp;&nbsp;3岁
									<span class="i-pos"></span>北京市
								</div>
							</div>
							<div class="font12 voteword">很开行，我在这里盖楼了</div>
							<div class="font12 votedate">07-22 22:33</div>
						</div>
					</div>
					<div class="font12 handle">
						<a href="javascript:void(0)"><span class="i-zan"></span><span>23</span></a>
						<a href="javascript:void(0)"><span class="i-vote"></span>评论</a>
					</div>
					<div class="font12 votemore"><a href="javascript:void(0)">显示全部评论内容<span class="i-xiala"></span></a></div>
				</div>
			</li> -->
		</ul>
	</div>
	<div class="topic-list byCommentNumberReplyList" id = 'byCommentNumberReplyList'>
 		<ul>
 		</ul>
 	</div>
	<!--尾部-->
	<jsp:include page="/pages/header_footer.jsp">
		<jsp:param value="3" name="menu"/>
	</jsp:include>
	<div class="btnfixed" onclick="toOneStepReply()">
		<a href="javascript:void(0);"  class="font18">发表喵说</a>
	</div>
	<!--发表评论-->
	<form class="publishVote">
		<div class="font17 voteTit">发表评论</div>
		<div class="voteBox">
			<textarea id="textAreaSubmit" class="font12" placeholder="请输入评论内容" maxlength="120"></textarea>
			<span class="font12 num"><i>0</i> / 120</span>
		</div>
		<a href="javascript:void(0)" onclick="toSStepReply()" class="font15 submit reply" style="background-color: #e51812;">发表</a>
		<a href="javascript:void(0)" onclick="cancel()" class="font15 submit">取消</a>
		
	</form>
<script type="text/javascript">
//三千问
function tosqw() {
	window.location = "/yzmm/account/knowledge/index?timestamp="
			+ new Date().getTime();
}

//喵姐说
function tocourse() {
	window.location = "/yzmm/account/course/list?timestamp="
			+ new Date().getTime();
}

//我
function tome() {
	window.location = "/yzmm/account/user/info?timestamp="
			+ new Date().getTime();
}
//去相关话题源
function toSource(id,type) {
	var id = "${relevanceId}";
	var type = "${topicType}";
	if(type == "KNOWLEDGE"){
		//去三千问
		window.location = "/yzmm/account/knowledge/viewDetail?knowledgeId="+id;
	}else if(type == "MIAOCOURSE"){
		//去喵姐说
		window.location = "/yzmm/wxmppay/vod?courseId="+id;
	}
}
</script>
<!-- 相关两个回复查询操作 -->
<!-- #1.根据创建时间进行查询 -->
<script type="text/javascript">
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


var topicId = $("#topicId").val();
var pageIndex = 1;
var sm = {};
//楼层数
var floorNum = 1;

function byCreatemTimeReplyListQuery(){
	sm = $(window).scrollme({
		target:$("#content1"),
		data:{pageSize:10,step:1,queryType:1,topicId:topicId},
		url:"/yzmm/account/miao/topic/reply/ajaxtolist",
		beforeLoad:function(){
			//查询之前调用
			if(1!=pageIndex){
				
			}
		},
		callback:function(data,params){
			var h = "";
			if (data.success) {
				//现有li长度
				var liLength = $("#byCreatemTimeReplyList>ul>li").length;
				var len = data.list.length;
				
				//是否为空
				if (!data.totalPage && data.curPage == 1) {
					toast("还没有人回复呢，快去回复吧");
				} else {
					$(".noresult").hide();
					if (len) {
						//增加页码
						params.pageIndex = ++pageIndex;
					}
					for (var i = 0; i < len; i++) {

						var o = data.list[i];
						floorNum = floorNum +1;
						h+='<li class="li'+pageIndex+'" data-time="'+o.playTime+'" data-timefmt="'+o.playTimeShow+'"  data-id="'+o.id+'">';
						h+='<div class="photo"><img src="'+o.rAlbumUrl+'" ></div>';
						h+='<div class="rightcont">';
						h+='<h2 class="font15">';
						h+='<i class="font12">'+o.replyTimeString+'';
						h+='</i>'+o.rNickName+'';
						if(o.isMiaoMaster != null){
						h+='<span>喵主</span>';
						}
						h+='</h2>';
						if(o.education != "HELPER" && o.education != null){
							h+='<div class="font12 sex">';
							if(o.education == "GRAVIDA"){
								h+='<span class="i-yun">';
								h+='</span>已怀孕&nbsp;&nbsp;';
								h+=''+o.babyAgeString+'';
							}else{
								if(o.rBabySex == 'MALE'){
									h+='<span class="i-boy">';
									h+='</span>小王子';
								}else {
									h+='<span class="i-girl">';
									h+='</span>小公主';
								}
								
								h+='&nbsp;&nbsp;'+o.babyAgeString+'';
								
							}
								h+='<span class="i-pos">';
							if(o.city!=null){
								h+='</span>'+o.city+'';
							}else{
								h+='</span>北京';
							}
							h+='</div>';
						}else{
							h+='<div class="font12 sex">';
							h+='<span class="i-other">';
							h+='</span>喵星人&nbsp;&nbsp;';
							h+='</div>';
						}
							
						
						h+='<div class="topDistance">';
						if((o.replyType)  == 'TEXTANDIMG'){
							h+='<div class="contentText">';
							h+='<p class="font12 voteword">'+o.content+'';
							h+='</div>';
							//h+='<a href="javascript:void(0)" class="font12 viewall">展开</a>';
						}else if(o.replyType == 'VOICEANDIMG'){
							h+='<audio preload="none" style="visibility:hidden;" controls>';
							h+='<source src="'+o.playUrl+'" />';
							h+='</audio>';
						}
						h+='</div>';
						h+='<div class="img topDistance">';
						if(o.imgFirst != null){
							h+='<span class="imgitem"><img class="radius" src="'+o.imgFirst+'" ></span>';
						}
						if(o.imgSecond != null){
							h+='<span class="imgitem"><img class="radius" src="'+o.imgSecond+'" ></span>';
						}
						if(o.imgThird != null){
							h+='<span class="imgitem"><img class="radius" src="'+o.imgThird+'" ></span>';
						}
						h+='</div>';
						h+='<div class="font12 handle">';
						h+='<a href="javascript:void(0)">';
						if(o.agree == "YESLOVE"){
							h+='<span class="i-zan i-zanactive" onclick=toAgree(\"'+o.id+'\",this)>';
						}else{
							h+='<span class="i-zan" onclick=toAgree(\"'+o.id+'\",this)>';
						}
						h+='</span><span>'+o.miaoCount+'</span</a>';
						h+='<a href="javascript:void(0)" class="votebtn" onclick=prePublish(\"'+o.id+'\",this)>';
						h+='<span class="i-vote">';
						h+='</span>评论</a>';
						h+='</div>';
						
						if(null != o.cAlbumUrl){
							h+='<div class="voteitems">';
							h+='<div class="voteitem">';
							h+='<div class="votephoto"><img src="'+o.cAlbumUrl+'" ></div>';
							h+='<div class="voterights">';
							h+='<div class="voteright">';
							h+='<h3 class="font15">';
							h+='<span class="font12">'+o.cReplyTimeString+'</span>';
							h+=''+o.cNickName+'</h3>';
							
							h+='<div class="font12 votesex">';
							if(o.cEducation != "HELPER"){
								if(o.cEducation == "GRAVIDA"){
									h+='<span class="i-yun">';
									h+='</span>已怀孕&nbsp;&nbsp;';
									h+=''+o.cBabyAgeString+'';
								}else{
									if(o.cBabySex == 'MALE'){
										h+='<span class="i-boy">';
										h+='</span>小王子&nbsp;&nbsp;';
									}else {
										h+='<span class="i-girl">';
										h+='</span>小公主&nbsp;&nbsp;';
									} 
									
									h+=''+o.cBabyAgeString+'';
								}
								
								if(o.cCity!=null){
									h+='<span class="i-pos"></span>'+o.cCity+'';
								}else{
									h+='<span class="i-pos"></span>北京';
								}
							}else{
								h+='<span class="i-other">';
								h+='</span>喵星人&nbsp;&nbsp;';
							}
							
							h+='</div>';
							h+='</div>';
							h+='<div class="font12 voteword">'+o.cContent+'</div>';
							h+='</div>';
							h+='</div>';
						}
						if(o.haveMoreReply != null){
							h+='<div class="font12 votemore" onclick=queryChildrenReply(\"'+o.id+'\",this)>';
							h+='<a href="javascript:void(0);">';
							h+='<span>显示全部评论内容</span>';
							h+='<span class="i-xiala"></span></a></div>';
						}
						h+='</div>';
						h+='</li>';
					
					}
				}
			} 
			$("#byCreatemTimeReplyList").children("ul").append(h);
			audioevent("li"+pageIndex);
			
			modifyPlayerStyle();
			
			//给图片绑定展示事件
			initMyImgShow();
			//绑定评论事件，先解除绑定再绑定
			$('.votebtn').unbind("click").bind('click', function(event) {
				//验证路径权限，通过后展示弹框，否则去相应信息 完善
				authoriseVerify("","",votebtnClick);
			  });
			
			//遍历新添加的dom,如果<p>的内容高于隐藏样式的指定的最大高度，则添加显示按钮，否则删除显示按钮
			var newLiLength = liLength + len;﻿
			for (var i=0;i<len;i++)
			{
				var contentText = $($($("#byCreatemTimeReplyList>ul>li")[liLength+i]).children(".rightcont")).children(".topDistance").children(".contentText");
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
		}
	});
	sm.reload();
}
</script>
<!-- #2.根据点赞数进行查询 -->
<script type="text/javascript">

function byCommentNumberReplyList(){
	sm = $(window).scrollme({
		target:$("#content1"),
		data:{pageSize:10,step:1,queryType:0,topicId:topicId},
		url:"/yzmm/account/miao/topic/reply/ajaxtolist",
		beforeLoad:function(){
			//查询之前调用
			if(1!=pageIndex){
				
			}
		},
		callback:function(data,params){
			var h = "";
			if (data.success) {
				//现有li长度
				var liLength = $("#byCommentNumberReplyList>ul>li").length;
				var len = data.list.length;
				//是否为空
				if (!data.totalPage && data.curPage == 1) {
					toast("还没有人回复呢，快去回复吧");
				} else {
					$(".noresult").hide();
					if (len) {
						//增加页码
						params.pageIndex = ++pageIndex;
					}
					for (var i = 0; i < len; i++) {

						var o = data.list[i];
						floorNum = floorNum +1;
						h+='<li class="li'+pageIndex+'" data-time="'+o.playTime+'" data-timefmt="'+o.playTimeShow+'"  data-id="'+o.id+'">';
						h+='<div class="photo"><img src="'+o.rAlbumUrl+'" ></div>';
						h+='<div class="rightcont">';
						h+='<h2 class="font15">';
						h+='<i class="font12">'+o.replyTimeString+'';
						h+='</i>'+o.rNickName+'';
						if(o.isMiaoMaster != null){
						h+='<span>喵主</span>';
						}
						h+='</h2>';
						
						if(o.education != "HELPER" && o.education != null){
							h+='<div class="font12 sex">';
							if(o.education == "GRAVIDA"){
								h+='<span class="i-yun">';
								h+='</span>已怀孕&nbsp;&nbsp;';
								h+=''+o.babyAgeString+'';
							}else if(o.education == "MOM"){
								if(o.rBabySex == 'MALE'){
									h+='<span class="i-boy">';
									h+='</span>小王子';
								}else {
									h+='<span class="i-girl">';
									h+='</span>小公主';
								}
								h+='&nbsp;&nbsp;'+o.babyAgeString+'';
								
							}
								h+='<span class="i-pos">';
							if(o.city!=null){
								h+='</span>'+o.city+'';
							}else{
								h+='</span>北京';
							}
							h+='</div>';
						}else{
							h+='<div class="font12 sex">';
							h+='<span class="i-other">';
							h+='</span>喵星人&nbsp;&nbsp;';
							h+='</div>';
						}
						
						
						h+='<div class="topDistance">';
						if((o.replyType)  == 'TEXTANDIMG'){
							h+='<div class="contentText">';
							h+='<p class="font12 voteword">'+o.content+'';
							h+='</div>';
							//h+='<a href="javascript:void(0)" class="font12 viewall">展开</a>';
						}else if(o.replyType == 'VOICEANDIMG'){
							h+='<audio preload="none" style="visibility:hidden;" controls>';
							h+='<source src="'+o.playUrl+'" />';
							h+='</audio>';
						}
						h+='</div>';
						h+='<div class="img topDistance">';
						if(o.imgFirst != null){
							h+='<span class="imgitem"><img class="radius" src="'+o.imgFirst+'" ></span>';
						}
						if(o.imgSecond != null){
							h+='<span class="imgitem"><img class="radius" src="'+o.imgSecond+'" ></span>';
						}
						if(o.imgThird != null){
							h+='<span class="imgitem"><img class="radius" src="'+o.imgThird+'" ></span>';
						}
						h+='</div>';
						h+='<div class="font12 handle">';
						h+='<a href="javascript:void(0)">';
						if(o.agree == "YESLOVE"){
							h+='<span class="i-zan i-zanactive" onclick=toAgree(\"'+o.id+'\",this)>';
						}else{
							h+='<span class="i-zan" onclick=toAgree(\"'+o.id+'\",this)>';
						}
						h+='</span><span>'+o.miaoCount+'</span</a>';
						h+='<a href="javascript:void(0)" class="votebtn" onclick=prePublish(\"'+o.id+'\",this)>';
						h+='<span class="i-vote">';
						h+='</span>评论</a>';
						h+='</div>';
						
						if(null != o.cAlbumUrl){
							h+='<div class="voteitems">';
							h+='<div class="voteitem">';
							h+='<div class="votephoto"><img src="'+o.cAlbumUrl+'" ></div>';
							h+='<div class="voterights">';
							h+='<div class="voteright">';
							h+='<h3 class="font15">';
							h+='<span class="font12">'+o.cReplyTimeString+'</span>';
							h+=''+o.cNickName+'</h3>';
							
							h+='<div class="font12 votesex">';
							if(o.cEducation != "HELPER" && o.education != null) {
								if(o.cEducation == "GRAVIDA"){
									h+='<span class="i-yun">';
									h+='</span>已怀孕&nbsp;&nbsp;';
									h+=''+o.cBabyAgeString+'';
								}else{
									if(o.cBabySex == 'MALE'){
										h+='<span class="i-boy">';
										h+='</span>小王子&nbsp;&nbsp;';
									}else {
										h+='<span class="i-girl">';
										h+='</span>小公主&nbsp;&nbsp;';
									} 
									
									h+=''+o.cBabyAgeString+'';
								}
							
								if(o.cCity!=null){
									h+='<span class="i-pos"></span>'+o.cCity+'';
								}else{
									h+='<span class="i-pos"></span>北京';
								}
								
							}else{
								h+='<span class="i-other">';
								h+='</span>喵星人&nbsp;&nbsp;';
							}
							h+='</div>';
							
							h+='</div>';
							h+='<div class="font12 voteword">'+o.cContent+'</div>';
							h+='</div>';
							h+='</div>';
						}
						if(o.haveMoreReply != null){
							h+='<div class="font12 votemore" onclick=queryChildrenReply(\"'+o.id+'\",this)>';
							h+='<a href="javascript:void(0);">';
							h+='<span>显示全部评论内容</span>';
							h+='<span class="i-xiala"></span></a></div>';
						}
						h+='</div>';
						h+='</li>';
					
					}
				}
			} 
			$("#byCommentNumberReplyList").children("ul").append(h);
			audioevent("li"+pageIndex);
			
			modifyPlayerStyle();
			
			initMyImgShow();
			
			//绑定评论事件，先解除绑定再绑定
			$('.votebtn').unbind("click").bind('click', function(event) {
				//验证路径权限，通过后展示弹框，否则去相应信息 完善
				authoriseVerify("","",votebtnClick);
				
			  });
			//遍历新添加的dom,如果<p>的内容高于隐藏样式的指定的最大高度，则添加显示按钮，否则删除显示按钮
			var newLiLength = liLength + len;
			for (var i=0;i<len;i++)
			{
				
				var contentText = $($($("#byCommentNumberReplyList>ul>li")[liLength+i]).children(".rightcont")).children(".topDistance").children(".contentText");
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
			//如果没有值
			if($("#byCommentNumberReplyList > ul > li").length == 0){
				$(".topic-tablink").hide();
				$("#comeOn").show();
			}
			
		}
	});
	sm.reload();
}
</script>
<script type="text/javascript">
function queryByFav(){
	pageIndex = 1;
	//展示，同时隐藏主内容
	$("#byCreatemTimeReplyList>ul").hide();
	$("#byCommentNumberReplyList>ul").show();
	//设置active
	$("#queryByCreateTime").removeClass("active");
	$("#queryByFav").addClass("active");
	$("#byCommentNumberReplyList>ul").children().remove();
	byCommentNumberReplyList();
	
}
function queryByCreateTime(){
	pageIndex = 1;
	//展示，同时隐藏主内容
	$("#byCommentNumberReplyList>ul").hide();
	$("#byCreatemTimeReplyList>ul").show();
	$("#queryByFav").removeClass("active");
	$("#queryByCreateTime").addClass("active");
	$("#byCreatemTimeReplyList>ul").children().remove();
	byCreatemTimeReplyListQuery();
}
//初始化
$(function(){
	var verifyTextStatus = false;
	//初始化创建时间查询数据
	//byCreatemTimeReplyListQuery();
	//初始化点赞数查询时间数据
	byCommentNumberReplyList();
	$("#byCommentNumberReplyList").show();
	//判断来源(mark不为空:来源为发表喵说且成功)
	if("${mark}" == "newPublication"){
		$("#queryByCreateTime").click();
	}
})
//查询二级评论/加载更多按钮
function queryChildrenReply(replyId,thet){
	if($(thet).hasClass("commentHide")){
		$(thet).parent().children(".voteitem:first").siblings(".voteitem").hide();
		//修改文字显示为：显示所有评论
		$($(thet).parent().children(".votemore").children("a").children("span")[0]).text("显示全部评论内容");
		$(thet).removeClass("commentHide");
		$(thet).addClass("commentShow");
		//显示下拉按钮
		$($(thet).parent().children(".votemore").children("a").children("span")[1]).removeClass("i-shangla");
		$($(thet).parent().children(".votemore").children("a").children("span")[1]).addClass("i-xiala");
		return;
	}
	if($(thet).hasClass("commentShow")){
		$($(thet).parent().children(".votemore").children("a").children("span")[0]).text("收起全部评论内容");
		$(thet).removeClass("commentShow");
		$(thet).addClass("commentHide");
		//显示上啦按钮
		$($(thet).parent().children(".votemore").children("a").children("span")[1]).removeClass("i-xiala");
		$($(thet).parent().children(".votemore").children("a").children("span")[1]).addClass("i-shangla");
		//展示所有评论
		$(thet).parent().children(".voteitem:first").siblings(".voteitem").show();
		return;
	}
	var curPageTotalCount =  $(thet).parent().children().length-1;
	var pageSize = 10;
	var secPageIndex = Math.floor(curPageTotalCount/10) + 1;
	//根据reply查询子list
	$.post("/yzmm/account/miao/topic/reply/ajaxtochildrenlist", 
			{replyId:replyId,pageIndex:secPageIndex,pageSize:pageSize},
   function(data){
		if(data.success){
			var x = "";
			var len = data.list.length;	
			if(len == 0){
				toast("您的信息已经是最新信息");
			}
			//当余数不等于查询的数量，并且余数不等于10的时候，则进行查询
			if(($(thet).parent().children().length-1)%10 == len && $(thet).parent().children().length-1 != 10){
				toast("您的信息已经是最新信息");
				return;
			}
			for (var i = 0; i < len; i++) {
					//由于第一条是直接显示的，所以第一条不进行拼接
					if(i==0 && curPageTotalCount==1){
						continue;
					}
					var o = data.list[i];
					x+='<div class="voteitem">';
					x+='<div class="votephoto">';
					x+='';
					x+='<img src="'+o.rAlbumUrl+'" ></div>';
					x+='<div class="voterights">';
					x+='<div class="voteright">';
					x+='<h3 class="font15">';
					x+='<span class="font12">'+o.replyTimeString+'</span>';
					x+=''+o.rNickName+'</h3>';
					
					x+='<div class="font12 votesex">';
					if(o.education != "HELPER" && o.education != null){
						if(o.education == "GRAVIDA"){
							x+='<span class="i-yun">';
							x+='</span>已怀孕&nbsp;&nbsp;';
							x+=''+o.babyAgeString+'';
						}else{
							if(o.rBabySex == 'MALE'){
								x+='<span class="i-boy">';
								x+='</span>小王子&nbsp;&nbsp;';
							}else {
								x+='<span class="i-girl">';
								x+='</span>小公主&nbsp;&nbsp;';
							} 
							x+=''+o.babyAgeString+'';
						}
						
						if(o.city != null){
						x+='<span class="i-pos"></span>'+o.city+'';
						}else{
						x+='<span class="i-pos"></span>北京';
						}
					}else{
						x+='<span class="i-other">';
						x+='</span>喵星人&nbsp;&nbsp;';
					}
					x+='</div>';
					
					
					x+='</div>';
					x+='</div>';
					x+='<div class="font12 voteword">'+o.content+'</div>';
					x+='</div>';
			}
			//根据id，查询子回复，追加
			$(thet).parent().children(".voteitem").last().after(x);
			//如果查询的总条数与当前页总条数相等，则为最后一条，修改为收起全部评论内容
			if(data.totalRows == $(thet).parent().children(".voteitem").length){
				$($(thet).parent().children(".votemore").children("a").children("span")[0]).text("收起全部评论内容");
				$(thet).addClass("commentHide");
			}
			
		}
  });
	
}
//展示|隐藏 二级评论
function showChildren(thet){
	if($(thet).hasClass("active")){
		$(thet).parent().siblings("a").hide();
		$(thet).removeClass("active");
		$(thet).addClass("active");
		$(thet).text("隐藏");	
		//删除统计查询active
	}else{
		$(thet).parent().siblings("a").show();
		$(thet).addClass("active");
		$(thet).text("展开");		
		//删除统计查询active
		$(thet).removeClass("active");
	}	
	
	}
</script>
<script type="text/javascript">
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

//点赞
function toAgree(replyId,thet){
	if($(thet).hasClass("i-zanactive")){
		return;
	}
	$(thet).addClass("i-zanactive");
	var topicId = $("#topicId").val();
	//修改为hh请求
	HH.ajax({
			url: "/yzmm/account/miao/topic/reply/agree",
			data:{ topicId: topicId, replyId: replyId },
			callback:function(data){
				if(data.success){
					var num = parseInt($(thet).parent().children().last().text())+1;
					$(thet).parent().children().last().text(num);	
				}else{
				}
			}
		})
	//自加1
	
}
//详情
function toDetail(){
	var id = $("#topicId").val();
	//去详情页
	window.location = "/yzmm/account/miao/topic/viewDetail?id="+id;
}
//发表喵说
function toOneStepReply(){
	//判断是否有权限，如果没有权限则跳转相应页面
	var a = "${authoriseResp.userAuthorise}";
	//alert(a);
	
	var topicId = $("#topicId").val();
	//发表喵说
	window.location = "/yzmm/account/miao/toPublicationMiao?topicId="+topicId;
}
//二级评论取消
function cancel(){
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
		
}
//预发布
function prePublish(replyId,thet){
	$("#textAreaSubmit").val("");
	$("#replyId").val(replyId);
}
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
//发表二级回复
function toSStepReply(){
	
	var topicId = $("#topicId").val();
	var replyId = $("#replyId").val();
	var text = $("#textAreaSubmit").val();
	
	if(text.length < 1){
		toast("评论内容不能为空");
		return;
	}
	//校验文本是否涉及非法内容
	verifyText(text);
	if(!verifyTextStatus){
		return verifyTextStatus;
	}
	//发表二级回复
	  HH.ajax({
			url: "/yzmm/account/miao/replyStepSecond",
			data:{
				text:text,
				replyId:replyId,
				topicId:topicId
				},
			callback:function(data){
				if(data.success){
					toast("回复成功");
					location.reload();
					return;
				}else{
					return;
				}
			}
		});
	}

</script>
<script>
function addTimelen(obj){
	obj = $(obj);
	var a = obj.get(0);
	if(a && !obj.hasClass("hastime")){
		window.setTimeout(function() {
			if(isNumeric(a.duration)){
				var duration = a.duration;
				var o = obj;
				o.addClass("hastime");
				var rid = o.parents("li").data("id");
				 if(rid && duration){
					 HH.ajax({
						   waiting:false,
						   url: "/yzmm/account/miao/topic/ajaxAddTime",
						   data: {
							   	  rid:rid,
							      time:duration
							      },
					});
				 }
			}
		}, 2000);
	}
}
function audioevent(li){
	//播发器
	$("."+li+ ' audio' ).myaudio({
		nowrap:true,
		play:function(thet){
			var a = $(".pause").find("audio").get(0);
			if(a){
				a.pause();
			}
		},
		audioPlay:function(audio){
			//添加时间
			addTimelen($( audio));
		}
	});

	$("."+li).each(function(){
		var o = $(this);
		if("0" != o.data("time")){
			var ad = o.find("audio");
			ad.addClass("hastime");
			o.find(".duration").html(o.data("timefmt"));
		}
	});
}

$( function(){
		$( '.topicAudio' ).myaudio({
			nowrap:true,
			play:function(thet){
				var a = $(".pause").find("audio").get(0);
				if(a){
					a.pause();
				}
			},
			audioPlay:function(){
				if("0" == "${playTime}"){
					addTimelenTopic($( '.topicAudio' ))
				}
			}
		});
		
		if("0" != "${playTime}"){
			$(".myaudio .duration").html("${playTimeShow}");
		}
		
		//为了调整顶端播放器样式
		$($(".topic-audio").find(".mywrap")).attr("style","margin-left: 0.5rem;margin-right: 0.5rem;");
		
		//取消播放，转为链接跳转
		//$(".play").unbind("click");
		/* $('.mywrap').unbind("click").bind('click', function(event) {
			toSource();
		  }); */
		
});
function addTimelenTopic(obj){
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
						   url: "/yzmm/account/miao/topic/ajaxAddTimeTopic",
						   data: {id:"${id}",time:duration},
					});
				 }
			}
		}, 2000);
	}
}
</script>
<script type="text/javascript">
	function modifyPlayerStyle(){
		$(".mywrap").attr("style","margin-right: 0.6rem;");
	}
	//权限验证
	function authoriseVerify(url,tourl,callback){
		//判断用户权限是否大于路径权限
		HH.ajax({
				url: "/yzmm/account/verify/authoriseUrlAjax",
				data:{
					//权限校验路径
					url:"/yzmm/account/miao/replyStepSecond",
					//目标跳转路径
					tourl:"/yzmm/account/miao/topic/viewDetailIncludeReply?id="+topicId
					},
				callback:function(data){
					if(data.success){
						callback();
					}else{
						alert(data.msg)
					}
				}
			});
	}
</script>
</body>
</html>