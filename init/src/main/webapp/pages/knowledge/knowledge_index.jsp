<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head lang="en">
<meta charset="UTF-8">
<title>喵姐早教说</title>
<%@include file="../header_v2.0.jsp"%>
<script src="<b:staticUrl>/res/js/scrollpaginationme.js</b:staticUrl>"></script>
<link rel="stylesheet" href="<b:staticUrl>/res/css/swiper.css</b:staticUrl>">
 <link rel="stylesheet" href="<b:staticUrl>/res/css/navigator.css</b:staticUrl>">
<script src="<b:staticUrl>/res/js/swiper-3.3.0.min.js</b:staticUrl>"></script>
<script src="<b:staticUrl>/res/js/home/banner/homebanner.js</b:staticUrl>"> </script>
<script src="<b:staticUrl>/res/js/home/banner/hotmeowask.js</b:staticUrl>"></script>
<script src="<b:staticUrl>/res/js/jquery.json-2.4.min.js</b:staticUrl>"></script>
<style type="text/css">
	.resultEmpty{
		margin-top:5.373333rem;
	}
	/*三千问浮球功能*/
.circleLayer{
	display:block;
	width:100*@base;
	height:100*@base;
	border-radius:100%;
	position:fixed;
	z-index:102;
	right: 0.24rem;
	bottom: 1.46666667rem;
}
.circleLayer img{
	display:block;
	width:100%;
	height:100%;
	border-radius: 100%;
	-webkit-animation: rotate 13s linear infinite;
}
.sectionTopBottom {
  width: 100%;
  max-width: 540px;
  margin: 0 auto;
  padding: 0.4rem;
  overflow: auto;
  border-bottom: 0.12rem solid #efeff4;
}
.u45_div{
	width: 3px;
	height: 0.43rem;
	background-color: rgba(0, 0, 0, 1);
	float: left;
	margin-top: 0px !important;
}
b{
  font-size: 0.43rem;
}
.activityList .word {
    font-size: 0.39rem;
}
/* 喵问喵答部分 */
	.fastAsk {
	    font-size: 0.4rem;
	    line-height: 25px;
	    margin-top: 0;
	    margin-left: 2rem;
	    border: 1px solid #ff9900;
	    border-radius: 20px;
	    width: 177px;
	    height: 30px;
	    text-align: center;
	    color: #ff9900;
	}
	.questionAsk {
	    font-size: 19px;
	    line-height: 19px;
	    text-align: center;
	}
	.asktitle{
		font-weight: 400;
	    font-style: normal;
	    font-size: 20px;
	    color: #ff99cc;
	   	margin: 40px 0 0 0;
	}
	.askimg{
		float: right;
	    width: 2rem;
	    margin-top: 0.5rem;
	}
	.askmain{
		height: 112px;
	}
	.askname{
		color:#ffcc99;
		font-size: 0.4rem;
	}
	.ask{
	    margin-top: 0.2rem;
	    font-size: 10px;
    	color: #9E9E9E;
	}
	.miaoAsk{
		padding: 0.4rem;
	}
	.miaoAsk p{
		font-size: 0.35rem;
	    color: rgba(72, 72, 72, 1);
	    margin-top: 0.2rem;
	    overflow: hidden;
	    display: -webkit-box;
	    -webkit-line-clamp: 2;
	    -webkit-box-orient: vertical;
	}
	.sectitle{
		margin-left: 5px;
	}
	.freebutton{
		width: 52px;
		height: 16px;
		font-family: 'PingFangSC-Regular', 'PingFang SC';
		font-weight: 400;
		font-style: normal;
		font-size: 9px;
		text-align: center;
		line-height: normal;
		position: absolute;
		margin: -20px 0 0 2rem;
	}
	.freebutton_div{
		width: 52px;
		height: 16px;
		background: inherit;
		box-sizing: border-box;
		border-width: 0px;
		border-style: solid;
		-moz-box-shadow: none;
		-webkit-box-shadow: none;
		box-shadow: none;
		font-family: 'PingFangSC-Regular', 'PingFang SC';
		font-weight: 400;
		font-style: normal;
		font-size: 9px;
		color: #33CC33;
	}
	.freebutton_div1{
		width: 48px;
		word-wrap: break-word;
	}
	.box_align{
		
	}
	.box_align_right{
		/* Firefox */
		display:-moz-box;
		-moz-box-pack:end;
		-moz-box-align:center;
		
		/* Safari, Chrome, and Opera */
		display:-webkit-box;
		-webkit-box-pack: end;
		-webkit-box-align:center;
		
		/* W3C */
		display:box;
		box-pack:end;
		box-align:center;
	}
	.newshare{
		text-align: center;
	}
	
	.newshare img{
		width:100%;
	}
	.sectionTit {
	    height: 0.45rem;
	    line-height: 0.45rem;
	}
</style>
</head>
<body>
<%@include file="knowledge_dtl_show.jsp" %>
<div class="wrap parent">
	<!--头部轮播-->
	<div class="swiper-container hdBanner">
		<div class="swiper-wrapper">
			<!-- banner内容 -->
			<c:forEach items="${bannerList}" var="banner" >
			 	<div class="swiper-slide">
					<a href="${banner.gotoUrl }" class="img"><img src="${banner.imgUrl }" ></a>
					<%-- <div class="word">
						<a href="${banner.gotoUrl }" >
							${banner.title }
								<c:if test="${banner.btype =='MICRCLASS'}">
									<c:if test="${!empty banner.originTime }">
										<br/> 直播时间：${banner.originTime}
									</c:if>
								</c:if>
        				</a>
					</div> --%>
				</div>
			</c:forEach>
		</div>
		<div class="swiper-pagination"></div>
	</div>
	<div class="section">
		 <div class="searchBar">
			<a href="javascript:void(0)" class="searchBox inputFocus"><span class="showInput">您想解决的育儿难题都在这里</span></a>
		</div>
	</div>
	<div class="section">
		<div class="sectionTit box_align">
		 <div id="" class="u45_div"></div>
		 <span class="sectitle" style="font-size:0.40rem;color:rgba(72, 72, 72, 1)"><b>每日一喵</b></span>
		</div>
		 <div style="font-size: 15px;border-bottom: 0.022rem solid rgba(217, 217, 217, 0.58);margin: 10px 0 0 0;width: 100%;"></div>
		<ul class="activityList">
			<li class="hotlistitem" style="height: 2.63333333rem;">
				<div class="info">
					<p class="word" onclick="viewDetail(${dayMiaoId})" style='padding: 0.5rem 0.4rem 0.3rem 0;color:rgba(72, 72, 72, 1);cursor: pointer;'>${dayMiaoTitle}</p>
					<p class="word"  style="color:#9E9E9E;font-size:0.33rem;">适合${minAgeYear }岁-${maxAgeYear }岁 | ${dayMiaoListen } 位家长觉着有用</p>
					<ul style="padding: 0.27rem 0.4rem 0.4rem 0">
						<li class='word' style="font-size:0.32rem;color:#9E9E9E;">时长：&nbsp;${playTime }</li>
					</ul>
				</div>
			</li>
		</ul>
		<div class="audioCont topaudio" style="display: none">
			<audio preload="auto" id="audio" src=""></audio>
	        <span class="playBtn play"></span>
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
		<div class="toDayMiao" style="width: 1.5rem;margin: -2rem 0.9rem 0rem 8rem;position: absolute;cursor: pointer;">
			<img style="width: 1.5rem;height: 1.5rem" src="../../../res/img/u511.png" />
		</div>
		<script src="<b:staticUrl>/res/js/streamAudio_sqw_heartbeat.js</b:staticUrl>"></script>
	</div>
	<!-- 喵问喵答 -->
	<c:if test="${not empty miaoQa}">
	<div class="section">
		<div class="sectionTit">
				<div class="box_align" style="position: relative;width: 100%">
					 <div id="" class="u45_div"></div>
					 <span class="sectitle" style="font-size:0.40rem;color:rgba(72, 72, 72, 1)"><b>最新咨询</b></span>
					 <label style="font-size: 12px; color: #9E9E9E;float: right!important;" onclick="tomiaoqaList()">查看更多咨询&nbsp;></label>
				</div>
			 <div style="font-size: 15px;border-bottom: 0.022rem solid rgba(217, 217, 217, 0.58);margin: 10px 0 0 0;width: 100%;"></div>
		</div>
		<ul class="activityList">
			<li class="hotlistitem" style="height: 3.63333333rem;">
				<img class="askimg" alt="" src="<b:staticUrl>/res/img/rwsc.png</b:staticUrl>"/>
				<div class="askmain">
					<div class="miaoAsk" onclick="tomiaoqaList()">
						<label class="ask"><span class="askname"><c:out value="${miaoQa.nickname}"></c:out></span>&nbsp;${miaoQa.pbsex}&nbsp;${miaoQa.pbage}</label>
						<p>${miaoQa.questionTxt}</p>
					</div>
					<div class="fastAsk" onclick="justAsk();">快速提问</div>
				</div>
			</li>
		</ul>
	</div>
	</c:if>
	<!-- 新人专享礼 -->
<%--<div class="section sectionTopBottom newshare">
			<img alt="" src='<b:staticUrl>/res/img/knowledge/11.png</b:staticUrl>'>
		<div style="text-align: center;font-size: 0.35rem;margin-top: 0.2rem;"><div style="font-size: 15px;border-bottom: 0.022rem solid rgba(217, 217, 217, 0.58);margin: 0.3rem 0 0.3rem 0;width: 100%;"></div><span id="" style="cursor: pointer;color:#9E9E9E ">点击领取</span></div>
	</div> --%>
	<div class="newshareDiv">
	</div>
	<!-- 签到活动 -->
	<div class="signForGift">
		
	</div>
	<!--热门喵问-->
	<div class="section" id="hotmeowask" style="display: none">
		 
	</div>
	<!--小喵推荐-->
	<div class="section sectionBorder0">
		<div class="sectionTit box_align">
		 <div id="" class="u45_div"></div>
		 <span class="sectitle" style="font-size:0.40rem;color:rgba(72, 72, 72, 1)"><b>小喵推荐</b></span>
		</div>
		<div style="font-size: 15px;border-bottom: 0.022rem solid rgba(217, 217, 217, 0.58);margin: 12px 0 0 0;width: 100%;"></div>
			<ul class="recommendList" style="margin-top: 20px;">
			<%-- <li><a href="#">
			<div class="photo"><img src="" ></div>
			<div class="info">
				<h2><span class="hottag"></span>孩子上亲子课孩子课孩话怎么办？</h2>
				<div class="other" onclick='viewDetail(${dayMiaoId})'>推荐1-4岁<span class="num">1033人听过</span></div>
			</div>
		</a></li> --%>
		</ul>
			<div id="floatingBallTemp" style="display:none">
				<a href="#" class="circleLayer" style="display:none;"><img id="circleLayerImg" src="" ></a>
			</div>
	</div>
	</div>
	
	<!-- 三千问足迹 -->
	
	<div class="hisList">
		<div class="readListTit"><a href="javascript:void(0)" class="slidedownBtn"></a>我听过的</div>
		<div class="section sectionBorder0">
			<ul class="recommendList2">
			</ul>
		</div>
	</div>
	<!-- 底脚 -->
	<jsp:include page="/pages/header_footer.jsp">
		<jsp:param value="1" name="menu" />
	</jsp:include>
	<c:if test="${not empty showPrompt}">
	<%-- <!-- 引导提示 -->
	<div class="navigatorBox" style="display:none" >
		<div class="navSearch"><span class="sr"></span><span class="sl"></span></div>
		<div class="navSearchWord">查找问题点这里</div>
		<div class="navFoot"><span class="cir"><p>三千问</p></span></div>
		<div class="nextStepBtn"><a href="/yzmm/account/course/list?showPrompt=${showPrompt}"><span class="nextStep">下一步</span></a></div>
	</div> --%>
	<script type="text/javascript">
		var stopWindowDefault = {
				windowdefaultEvent: function(windowflag){
					window.ontouchmove = function(e){
						e.preventDefault && e.preventDefault();
						e.stopPropagation && e.stopPropagation();
						if(windowflag){
				            e.returnValue=true;
				            return true;	
						}
						else{
					        e.returnValue=false;
					        return false;
						}
					}
				}
			};
			//判断是否给出提示信息
			var showPrompt = "${showPrompt}";
			if("true" == showPrompt){
				promptShow();
				stopWindowDefault.windowdefaultEvent(false);
			}
			function promptShow(){
				$(".lineLayer").hide();
				$("body").addClass("navigator");
				$(".navigatorBox").show();
			}  
	</script>
	</c:if>
	<script type="text/javascript">
	
/* 	var wxfenxiangcb_list={
			title: '${wxshare.title}', // 分享标题
		    link: '${wxshare.link}', // 分享链接
		    imgUrl: '${wxshare.imgUrl}', // 分享图标
		    desc : '${wxshare.desc}',
		    shareTimeline:function(bool){
		    },
		    shareAppMessage:function(bool){
		    }
	}
	initwxfx(wxfenxiangcb_list); */
	
//详情
/*  function viewDetail(id) {
 	top.location="/yzmm/account/knowledge/viewDetail?knowledgeId="+id;
 } */
//三千问列表
$(".freebutton").click(function(){
	top.location="/yzmm/wxmppay/sqwlist";
	return;
})
</script>
	<script>
	//每日一喵弹框事件
	function backGroundPromptShow(){
		$(".lineLayer").show();	
	}
	function backGroundPromptHide(){
		$(".lineLayer").hide();
	}
	//点击事件
	$(".close,.lineLayerBox").click(function(){
		backGroundPromptHide();
	})
	
	//每日一喵id
	var dayMiaoViewDetail;
	var playUrl='${playUrl}';
	var playImg='../../../res/img/u511.png';
	var pauseImg='../../../res/img/u512.png';
	$(".toDayMiao").click(function(){
		var img=$(this).find('img');
		var src=img.attr('src');
		
		$("#audio").attr('src',playUrl);
		$('.playBtn').click();
		
		//清空iframe
		window.frames.removeOver();
		//隐藏浮球
		$('#floatingBallTemp').css('display','none');
		if(src==playImg){
			img.attr('src',pauseImg);
		}else{
			img.attr('src',playImg);
		}
	});
	
	function dayPause(){
		var img=$(".toDayMiao").find('img');
		var src=img.attr('src');
		
		$('.playBtn').click();
		
		if(src==playImg){
			img.attr('src',pauseImg);
		}else{
			img.attr('src',playImg);
		}
	}
	
</script>
<!-- 初始化推荐列表 -->
<script type="text/javascript">


var enableDefaultImage = "${enableDefaultImage}";
var userAuthorise = "${userAuthorise}";
var defaultImage = configuration.knowledge.indexDefaultImg;
var sm = {};
var pageIndex = 1;
var age = "${age}";
var sex = "${sex}";
var kdata = {
		pageSize:12,
		age : age,
		sex : sex,
		fromIndex:true
	};
</script>
<%@include file="../custom/search.jsp"%>
<script src="<b:staticUrl>/res/js/wxmppay.js</b:staticUrl>"></script>
<script src="<b:staticUrl>/res/js/package/knowledge/knowledgeList.js</b:staticUrl>"></script>
<!-- 搜索框 -->
<script type="text/javascript">
//搜索条件
$(".inputFocus").click(function(){
	searchObj.showSearch();
	//隐藏vip成为框
	searchObj.hideEmptyAndNoVip();
	searchObj.hideEmptyAndVip();
});

//取消三千问
$(".slidedownBtn").click(function(){
	$(".hisList").hide();
	$(".wrap").show();
});
// 三千问 足迹
		
$(".his").click(function(){
	var userAuthorise = "${userAuthorise}";
	if(userAuthorise =="NOTALL"){
		top.location="/yzmm/account/user/info";
		return;
	}
	$(".wrap").hide();
	$(".hisList").height($(window).height());
	$(".hisList").show();
	sqwsm();
})
	function sqwsm(){
		sm = $('.hisList').scrollme({
			target:$(".recommendList2"),
			data:{pageSize:16},
			url:"/yzmm/account/sqwFoot/ajaxSqwFootList ",
			beforeLoad:function(){
				//查询之前调用
				if(1!=pageIndex){
					
				}
			},
			callback:function(data,params){
				var h='';
				if (data.success) {
					//是否为空
					if (!data.totalPage && data.curPage == 1) {
						h += '<div class="resultEmpty"><div class="icon"></div><div class="txt">没有发现您的收听记录哦</div></div>';
					} else {
						$(".noresult").hide();
						var len = data.list.length;
						if (len) {
							//增加页码
							params.pageIndex = ++pageIndex;
						}
						for (var i = 0; i < len; i++) {
							var o = data.list[i];
							if (o.minAge.year < 1) {
								if (o.minAge.month == 0) {
									mina = o.minAge.year;
								} else {
									mina = o.minAge.month + "月";
								}
							}
							if (o.minAge.year >= 1 && o.minAge.month < 6) {
								mina = o.minAge.year;
							}
							if (o.minAge.year >= 1 && o.minAge.month >= 6) {
								mina = o.minAge.year + ".5";
							}
							
							if (o.maxAge.year < 1) {
								if (o.maxAge.month == 0) {
									maxa = o.maxAge.year + "岁";
								} else {
									maxa = o.maxAge.month + "月";
								}
							}
							if (o.maxAge.year >= 1 && o.maxAge.month < 6) {
								maxa = o.maxAge.year + "岁";
							}
							if (o.maxAge.year >= 1 && o.maxAge.month >= 6) {
								maxa = o.maxAge.year + ".5岁";
							}
							if(!o.picUrl ){
								o.picUrl = defaultImage;
							}
							h += '<li>'
							+'<a onclick="viewDetail(\''+o.sqwId+'\')">'
							+'<div class="photo">'
							+'<img src=\''+o.picUrl+'\'>'
							+'</div>'
							+'<div class="info">'
							+'<h2>'+o.title+'</h2>'
							+'<div class="other">'+'推荐'+ mina+ '-' + maxa+'<span class="num"> '+o.listenCount+'人听过</span>'
							+'</div>'
							+'</div>'
							+'</a>'
							+'</li>'
						}
					}
				} 
				$(".recommendList2").append(h);
			}
		});
		sm.reload();
	
	};	
//初始化对象
searchObj.searchCallback = function(){
	//初始化搜索pageIndex
	$(".showInput").text(searchObj.searchShowValue);
	var url = "/yzmm/account/home/toKeyWordSearchGlobal?keyword="+searchObj.title + "&minScope=" + searchObj.minScope + "&maxScope="+searchObj.maxScope + "&type=INDEXSEARCH";
	window.location = url;
}


//标签搜索

//指向喵问喵答
function tomiaoqaList(){
			HH.href("/yzmm/account/miaoqa/qaSpecialPage");
}
//快速提问
function justAsk(){
	HH.href('/yzmm/account/miaoqa/gotoAskMiaoQa');
}
</script>
<script type="text/javascript">
//bannerList
var bannerList='${bannerList}';
var kid='${dayMiaoId}';//每日一喵三千问id
</script>
<script type="text/javascript">
//新人分享礼相关
$(function(){
	var userStatus = '${userStatus}';
/* 	 HH.ajax({
			url:"/yzmm/account/virtualcard/ajaxList",
			async:false,
		    callback:function(data){
		   		if(data.success){
		   			var len = data.list.length;
		   			var h = "";
		   			for(var i=0;i<len;i++){
		   				var o = data.list[i];
		   				//暂时只能进来的是小白，所以小白付费
		   				h+='<div class="section sectionTopBottom payBtn newshare" data-id="'+o.id+'">';
			   				h+='<img alt="" src="<b:staticUrl>/res/img/knowledge/11.png</b:staticUrl>">'
			   				h+='<div style="text-align: center;font-size: 0.35rem;margin-top: 0.2rem;"><div style="font-size: 15px;border-bottom: 0.022rem solid rgba(217, 217, 217, 0.58);margin: 0.3rem 0 0.3rem 0;width: 100%;"></div><span id="" style="cursor: pointer;color:#9E9E9E ">点击领取</span></div>';
			   			h+='</div>';
		   			}
		   			$(".newshareDiv").append(h);
	   			}
		    }
		}); */
	 	HH.ajax({
			url:"/yzmm/account/generalizeactivity/ajaxLuckdrawactivityList",
			async:false,
		    callback:function(data){
		   		if(data.success){
		   			var len = data.list.length;
		   			var h = "";
		   			for(var i=0;i<len;i++){
		   				var o = data.list[i];
		   				//暂时只能进来的是小白，所以小白付费
		   				h+='<div data-id="'+o.relateId+'" class="section sectionTopBottom signForGiftUrl">';
		   					h+='<img style="width: 100%;" alt="" src="<b:staticUrl>/res/img/knowledge/sign_give_gift.png</b:staticUrl>">';
		   				h+='</div>';
		   				$(".signForGift").append(h);
		   				$(".signForGiftUrl").on("click",function(){
		   					var id = $(".signForGiftUrl").data("id");
			   				HH.href("/yzmm/account/sign/userSign?signId="+id);
			   			});
		   			}
		   			
	   			}
		    }
		});
		$(".payBtn").on('click',function(){
			if('${isWeixin}'!="true"){
				toast("请您进入微信支付");
				return false;
			}
			var obj = $(this);
			var id = obj.data("id");
			wxmppayvirtualcard(id,function(orderId,result){
			if(result=="ok"){
				window.location.href="/yzmm/wxmppay/virtualcard/checkPay?orderId="+orderId;
			}
			});
		});
		
	//由分享进来的用户显示 isVip
	if('${isVipShare}'=='true'){
		_successTips("您已经是会员啦...");
	}
});
</script>
</body>
