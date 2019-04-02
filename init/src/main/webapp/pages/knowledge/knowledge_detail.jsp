<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head lang="en">
	<meta charset="UTF-8">
	<title>喵姐早教说</title>
    <%@include file="../header_v2.0.jsp"%>
    <%@include file="../header_wxjsapi.jsp"%>
    <%@include file="../userAuthorise.jsp" %>
    <link rel="stylesheet" type="text/css" href="<b:staticUrl>/res/css/share.css</b:staticUrl>" />
    <style>
		/* 阻止长按出现的复制框 */
		body{
			background: white;
			height:auto;
   		}
   		.wrap3{
   			overflow: auto;
   		}
   	</style>
    <script src="<b:staticUrl>/res/js/custom/authorise/authorise.js</b:staticUrl>"></script>
	<link rel="stylesheet" href="<b:staticUrl>/res/css/custom/userAuthorise/userAuthorise.css</b:staticUrl>">
	<script src="<b:staticUrl>/res/js/scrollpaginationme.js</b:staticUrl>"></script>
	<link rel="stylesheet" href="<b:staticUrl>/res/css/swiper.css</b:staticUrl>">
	<script src="<b:staticUrl>/res/js/wxmppay.js</b:staticUrl>"></script>
	<script src="<b:staticUrl>/res/js/clickmore.js</b:staticUrl>"></script>
	<script type="text/javascript">
	var isIframe = top != window;
	  var wxfenxiangcb_dtl={
			title: '${wxshare.title}', // 分享标题
			desc : '${wxshare.desc}',
		    link: '${wxshare.link}', // 分享链接
		    imgUrl: '${wxshare.imgUrl}', // 分享图标
		    shareTimeline:function(bool){
		    },
		    shareAppMessage:function(bool){
		    }
	};
	  initwxfx(wxfenxiangcb_dtl);
	var hasAuth = "${hasAuth}"=="true";
	var authMsg = "亲，听完语音，再来点我~";
	/*$(function(){
		 if("${not hasAuth}"=="true"){
			userAuthOpt.once("${money}");
			userAuthOpt.onceClick=function(){
				$(".oneyuan").click();
			};
		} 
	})*/
	
	$(function(){
		if(isIframe){
			$("#iframeDiv").height(document.documentElement.clientHeight);
			$("#iframeDiv").css("overflow","scroll");
			$("#clearDetailDiv").show();
		}
	});
	</script>
</head>
<body>
<div id="iframeDiv">
<%@include file="../share_head.jsp"%>
<%@include file="../userAuthorise.jsp" %>
<div class="wrap wrap3">
	<input type="hidden" id="limit" value="${listen+1}">
	<h1 id="clearDetailDiv" style="display:none;" class="activityTitle" onclick="top.clearDetail()"><span class="backBtn"></span></h1>
	<div class="section">
		<ul class="activityList">
			<li class="hotlistitem">
				<div class="photo photo2"><a href="#"><img src="${knowledgeImg}"></a></div>
				<div class="info">
					<p class="word">${knowledge.title}</p>
					<div class="otherinfo"><span>喵姐</span> 推荐${minAge}-${maxAge}</div>
					<div class="datanum"><span class="listen">${listen}人看过</span>
					<span class="zan">${miao}</span></div>
					<c:if test="${not hasAuth}">
						<div class="topay oneyuan"><a href="javascript:;">会员专享</a><span> <i> </i></span></div>
					</c:if>
				</div>
			</li>
		</ul>
		<div class="audioCont topaudio">
			 <audio preload="auto" id="audio" src="${playUrl}"></audio>
	         <c:if test="${!hasAuth}">
	        	<span class="playBtn oneyuan"></span>
	        </c:if>
	         <c:if test="${hasAuth}">
	        	<span class="playBtn play"></span>
	        </c:if>
	        <div class="topaudioBox">
	            <span class="txt">00:00</span>
	            <div class="audioLine">
	            	<span class="lineaft"></span>
	                <div class="active"></div>
	                <a href="javascript:void(0)" class="circle" id="drag"></a>
	            </div>
	            <span class="txt2" data-sec="${playTimeSec}"><c:out value="${playTime}"></c:out></span>
            </div>
        </div>
		<div class="audioword">
			<h2 class="tit">内容介绍：</h2>
				<p>${content}</p>
		</div>
		<div class="audiohandle">
			<c:if test="${uState==0}">
			   <span class="unuseable">无趣</span>
			    <span class="useable"><i>有用 +1</i>有用</span>
		   </c:if>
			<c:if test="${uState==1}">
				<span class="unuseable">无趣</span>
				<span class="useable useable-active"><i>有用 +1</i>有用</span>
			</c:if>
			<c:if test="${uState==2}">
				<span class="unuseable unuseable-active">无趣</span>
				<span class="useable"><i>有用 +1</i>有用</span>
			</c:if>
			<c:if test="${hasCollect==0}">
				<span class="adfav">收藏</span>
			</c:if>
			<c:if test="${hasCollect==1}">
				<span class="adfav adfav-active">收藏</span>
			</c:if>
			
		</div>
	</div>
	<div class="relaTit2"><span>相关推荐</span></div>
	<%@include file="relatedSuggestion.jsp"%>
</div>
	<!--尾部-->
	<jsp:include page="/pages/header_footer.jsp">
		<jsp:param value="1" name="menu" />
	</jsp:include>
</div>
	<div class="courseScore" style="display:none;">
		<div class="feedLay">
			<div class="photo"></div>
			<div class="feedLayCont">
				<a href="javascript:;" class="close"></a>
				<p>本条内容是否对您有帮助？</p>
				<p>我们会根据您的反馈不断努力哒~</p>
				<div class="feedBtn">
					<a href="javascript:;" class="unuseable nouseful">没 帮 到</a>
					<a href="javascript:;" class="useable useful">很 实 用</a>
				</div>
			</div>
		</div>
	</div>
<script src="<b:staticUrl>/res/js/streamAudio_sqw_heartbeat.js</b:staticUrl>"></script>
<script src="<b:staticUrl>/res/js/recommend/indexRelateSuggest.js</b:staticUrl>"></script>
<script type="text/javascript">
$(function(){
	$(".feedLayCont .close").click(function(){
		$(".courseScore").hide();
	});
})
</script>
<script type="text/javascript">
	//三千问图片
	var knowledgeImg = "${knowledgeImg}";
	//初始化
	var enableDefaultImage = "${enableDefaultImage}";
	var userAuthorise = "${hasAuth}";
	var keyword = "${keyword}";
	var knowledgeId ="${knowledge.id}";
	var minScope = "";
	var maxScope = "";
	init({pageIndex : 1,pageSize:2,keyword:keyword,minScope:minScope,maxScope:maxScope});
	//初始化list查询sm
	var knowledgeListsm = {};
	var knowledgePageIndex = 1;
	var courseListsm = {};
	var coursePageIndex = 1;
	var activityListsm = {};
	var activityPageIndex = 1;
	var topicListsm = {};
	var topicPageIndex = 1;
	//检查是否有返回值
	var ajaxQueryNumber = 0;
	//检测是否唯一的查询记录数
	var onlyQueryNumber = 0;
</script>
<script type="text/javascript">
//是否有访问权限
var hasAuth = ${hasAuth};
var authStatus = "${authStatus}";
var kid="${knowledge.id}";
$(function(){
	 $(".oneyuan").click(function(){
			userAuthOpt.once("${money}");
			userAuthOpt.onceClick=function(){
				 top.wxmppayasqw("${kid}",function(orderId,result){
		 			if("ok"==result){
		 				if(isIframe){
		 					HH.href("/yzmm/wxmppay/sqw/checkPay?knowledgeId=${kid}&orderId="+orderId);
		 				}else{
		 					HH.href("/yzmm/wxmppay/sqw/checkPay?knowledgeId=${kid}&orderId="+orderId);
		 				}
		 			 }else{
							return;
					  }
			 	}); 
			};
	 	});
	 var kid="${knowledge.id}";
	 //添加收藏
	 $(".adfav").click(function(){
			var uid = "${uid}";
			if(!uid){
				toast("请先登录...");
				return;
			}
			var kid = '${knowledgeId}';
			var collectStatus;
			if ($(".adfav").hasClass("adfav-active")) {
				//此次点击会取消收藏
				collectStatus = 0;
			} else {
				//此次点击会添加收藏
				collectStatus = 1;
			}
			HH.ajax({
				   waiting:false,
				   async:false,
				   url: "/yzmm/account/user/collectKnowledge",
				   data: {
					   uid : uid,
					   knowledgeId : kid,
					   collectStatus : collectStatus
				   },
				   callback: function(data){
						if (data.success) {
							if ($(".adfav").hasClass("adfav-active")) {
								$(".adfav").removeClass("adfav-active");
							} else {
								toast("收藏成功~~~");
								$(".adfav").addClass("adfav-active");
							}
						}
				   }
			});
		});
		 var hasAuth = "${hasAuth}"=="true";
		 var authMsg = "亲，听完语音，再来点我~";
		//有用
		$(".useable").click(function(){
		 	if(!hasAuth){
		 		toast(authMsg);
		 		return;
		 	}
		 	if($(".useable").hasClass("useable-active")){
		 		return;
		 	};
		 	if( $(".unuseable").hasClass("unuseable-active")){
		 		return;
		 	}
		 	var kid="${knowledge.id}";
		 	 HH.ajax({
		 		 waiting:false,
		 		   url: "/yzmm/account/knowledgeMiaoListen/ajaxMiao",
		 		   data: {knowledgeId:kid},
		 		   callback: function(data){
		 			   if(!data.success){
		 				   return;
		 			   }
		 			  $(".useable").addClass("useable-active")
		 			  $(".useable").find("i").show().animate({"top":"-20px"},400,function(){
							$(".useable i").fadeOut();
						})
	 				   var x =$(".zan").html();
	 				   x = parseInt(x) + 1;
	 				   $(".zan").html(x);
		 		   }
		 	});
		});
		$(".useful").click(function(){
		 	if(!hasAuth){
		 		toast(authMsg);
		 		return;
		 	}
		 		toast("提交成功，谢谢您的支持");
		 		$(".courseScore").hide();
		});
		//无趣按钮
		 $(".unuseable").click(function(){
		 	if(!hasAuth){
		 		toast(authMsg);
		 		return;
		 	}
		 	if($(".useable").hasClass("useable-active")){
		 		return;
		 	};
		 	if( $(".unuseable").hasClass("unuseable-active")){
		 		return;
		 	}
		 	var kid="${knowledge.id}";
		 	 HH.ajax({
		 		 waiting:false,
		 		   url: "/yzmm/account/knowledgeMiaoListen/ajaxPei",
		 		   data: {knowledgeId:kid},
		 		   callback: function(data){
		 			   if(!data.success){
		 				   return;
		 			   }
		 				  $(".unuseable").addClass("unuseable-active");
		 		   }
		 	});
		 });
	$(".nouseful").click(function(){
		if(!hasAuth){
	 		toast(authMsg);
	 		return;
	 	}
		toast("提交成功，谢谢您的支持");
	 		$(".courseScore").hide();
	 		return;
	})
})
var kid=${knowledge.id};
/**
 * 暂停每日一喵播放
 */
function puaseDayMiao(){
	try{
		var pause=$(".pause", parent.document);
		if(pause.length>0){
			parent.dayPause();
		}
	}catch(e){
			
	}
}
$('.playBtn').on('click',function(){
	puaseDayMiao();
})
</script>
</body>
</html>