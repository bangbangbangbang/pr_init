<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--忽略页面中的邮箱格式为邮箱-->
<meta name="format-detection" content="email=no"/>
 <%@include file="../header_v2.0.jsp" %>
 <%@include file="../header_wxjsapi.jsp"%>
 <script src="<b:staticUrl>/res/js/home/course/microcamp.js</b:staticUrl>"></script>
 <script src="<b:staticUrl>/res/js/home/course/carousel.js</b:staticUrl>"></script>
 <link rel="stylesheet" href="<b:staticUrl>/res/css/navigator.css</b:staticUrl>">
 <link rel="stylesheet" href="<b:staticUrl>/res/css/course/said.css</b:staticUrl>">
 <link rel="stylesheet" href="<b:staticUrl>/res/css/course/base.css</b:staticUrl>">
<title>喵姐早教说</title>
<style type="text/css">
#xbq{
	    position: absolute;
    height: 1rem;
    background-image: url(<b:staticUrl>/res/img/course/u41.png</b:staticUrl>);
    background-repeat: no-repeat;
    background-size: contain;
    text-align: center;
    font-size: 0.23rem;
    color: #CC6600;
    /* text-decoration: underline; */
    padding-top: 0.1rem;
    margin-left: 0.5rem;
}
#time{
	margin-left: 0.2rem;
	background-color: rgba(242, 242, 242, 1);
	border-radius:10px;
	font-size: 0.25rem;
	padding: 0 0.2rem;
	margin-top: 0.5rem;
	color: #949494;
}
#gotolive{
	font-size: 0.3rem;
	text-align: center;
	padding: 0.3rem;
	border-top: 0.042rem solid #efeff4;
	margin-top: 0.2rem;
}
.u45_div{
	width: 3px;
	height: 0.43rem!important;
	background-color: rgba(0, 0, 0, 1);
	float: left;
	margin-top: 0px !important;
}
.hot{
	margin-top: 0.2rem;
	margin-bottom: 0.2rem;
	position: relative;
}
.wky{
	border-radius: 9px;
	width:33.33%;
	text-align: center;
	cursor: pointer;
	position: relative;
}
.wky.two{
	position:absolute;
	left:33.33%;
	top:0;
}
.wky.three{
	position:absolute;
	left:66.66%;
	top:0;
}
.wky img{
	width: 100%;
}
.wky .new{
	width: 100%;
	position: absolute;
	top:0;
	right: 0;
}
#hotplay div{
	width: 100%;
	height: 100%;
	border: 0.022rem solid white;
}
#hotplay span{
	font-size: 0.34rem;
	margin-top: -0.2rem;
	float: left;
	background-color: rgb(242, 242, 242);
	margin-left: 0.7rem;
	color: #FF9900;
}
#hotplay p{
	font-size: 0.25rem;
	float: left;
	margin: 0.1rem 0.36rem;
}
.wkyspan{
	font-size: 0.34rem;
	margin-top: 0.01rem;
	float: left;
	width: 100%;
	text-align: left;
	padding-left: 0.2rem;
}
.wkyp{
	font-size: 0.28rem;
	color: #AEAEAE;
	margin-top: 0.1rem;
	float: left;
	padding-left: 0.2rem;
}
.wkynr{
	margin-top: 0.3rem;
	border-radius: 4px;
	background-color:rgb(242,242,242);
	width:3rem;
	height:1.5rem; 
	text-align: center;
	float: left;
	margin-left: 0.1rem;
}
.wkynr p{
	font-size: 0.34rem;
	height: 1rem;
	float: left;
	margin-top: 0.3rem;
	margin-left: 0.3rem;
	padding-left: 0.2rem;
	width: 0.9rem;
	border-left: 0.032rem solid white;
}
.wkynrimg{
	width: 1.2rem;
	height: 1.2rem;
	float: left;
	margin-top: 0.15rem;
	margin-left: 0.2rem;
}
#hotmeowask{
	min-height: 4rem;
}
.poster-main{
	position: relative;
	height: 6.3rem;
	width: 100%;
}
.mainimgdiv{
background-repeat: no-repeat;
background-size: cover;
height: 100%;
width: 100%;
}
.poster-main .poster-btn{
	width: 0.8rem;
	height: 100%;
	z-index:100;
	position:absolute;	
}
.poster-main .poster-prev-btn{
	left:0;
	background: url("<b:staticUrl>/res/img/course/btn_l.png</b:staticUrl>") no-repeat center center;
}
.poster-main .poster-next-btn{
	right:0;
	background: url("<b:staticUrl>/res/img/course/btn_r.png</b:staticUrl>") no-repeat center center;
}
.showtitle span{
	font-size: 0.3rem;
}
.showtitle p{
	color: #868686;
}
.showtitle .playImg{
	width:11px;
	height:9px;
	background: url("<b:staticUrl>/res/img/common/listen2@2x.png</b:staticUrl>") center center no-repeat;
	background-size: 11px 9px;
}
.searchBar span{
	font-size: 0.4rem;
	float: right;
	color: #FF9900;
}
.searchBar input{
	float: left;
	width:7rem;
}
.activityList .tit {
    font-size: 0.38rem !important;
}
.miaoList p {
    font-size: 0.36rem !important;
}
.searchBar .searchBox span {
    padding-left: 18px;
}
.searchBar input {
    width: 7.5rem;
}
.searchlabel{
    float: right !important;
    font-size: 0.4rem;
    color: #FFA12E;
    margin-top: 3px;
}
b{
	font-size:0.43rem;
}
.sectionTit{
height:0.45rem;
line-height:0.45rem;
}
</style>

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
//测试自定义页面跳转
//var loginReferParam = "/yzmm/account/miao/topic/viewDetailIncludeReply?id=252";
//loginBar.setLoginReferParam(loginReferParam);
</script>

</head>
<body>
<div class="section" style="padding: 0;">
	<div class="searchBar">
		<div class="mySearch" style="padding: 0.33333333rem 0rem;">
			<button type="button" class="searchlabel searchcourse">搜索</button>
			<a href="javascript:void(0)" class="searchBox inputFocus" style="width: 90%;">
				<span class="showInput" style="margin-top: 6px;"><input  onkeyup="fn()" onblur="fn()" type="text" placeholder="适合您的课程都在这里" id="keyword" class="inputFocus searchTitle mySearchTitle" ></span>
			</a>
		</div>
	</div>
</div>
<div class="mainDiv">
<c:if test="${hasLive==true}">
	<div class="miaoBanner" onclick="toLive(this);" data-courseid="${lcourseId}">
	<div id="xbq">
		<c:choose>
			<c:when test="${playState=='PREPARE'}">
				&nbsp;直播预告&nbsp;
			</c:when>
			<c:when test="${playState=='PLAYING'}">
				&nbsp;&nbsp;&nbsp;直播中&nbsp;&nbsp;&nbsp;
			</c:when>
			<c:when test="${playState=='GAMEOVER'}">
				&nbsp;直播结束&nbsp;
			</c:when>
			<c:otherwise>
				&nbsp;直播预告&nbsp;
			</c:otherwise>
		</c:choose>
	</div>
		<img src="${limgUrl}" >
		<input type="hidden" value="${playState}"/>
	</div>
</c:if>
<div class="miaoBanner" id="comingsoon" style="display:none" onclick="toast('敬请期待~');">
		<img src="http://onlinefile.sevenkids.cn/uploadm/201705/25/1495703826086OBFC.jpg" >
</div>
<!--8分钟经典育儿开始-->
<div class="parenting" style="display:none">
	<div class="parentingTop">
		<img src="<b:staticUrl>/res/img/course/smalldayupdate/u33.jpg</b:staticUrl>" alt="" class="headerImg" />
		<span class="lookWhole">戳此查看全部</span>
	</div>
	<div class="par_content clearfix">
		<div class="con_text">
			<h3>关于打人或挨打的偏方，就藏在这些绘本里</h3>
			<div class="text_time clearfix">
				<p>鼎力绘本推荐  | 07-07  |  时长8:07</p>
				<img src="<b:staticUrl>/res/img/course/smalldayupdate/u133.png</b:staticUrl>" alt="" />
			</div>
		</div>
		<div class="toDayMiao" id="toDayMiao">
			<img  src="<b:staticUrl>/res/img/u511.png</b:staticUrl>" class="con_suspend">
		</div>
	</div>
	<!--暂停播放的audio-->
	<div class="audioCont topaudio" style="display: none">
		<audio preload="auto" id="audio" src=""></audio>
		<span class="playBtn play ui-play"></span>
		<div class="topaudioBox">
			<span class="txt">00:00</span>
			<div class="audioLine">
				<span class="lineaft"></span>
				<div class="active"></div>
				<a href="javascript:void(0)" class="circle" id="drag"></a>
			</div>
			<span class="txt2" data-sec="">03分16秒</span>
		</div>
	</div>
</div>
<!--8分钟经典育儿结束-->
<script src="<b:staticUrl>/res/js/streamAudio_smalldayupdate_heartbeat.js</b:staticUrl>"></script>
<script type="text/javascript">	
var topicCid = "-1";
$(function(){
	var playImg='<b:staticUrl>/res/img/u511.png</b:staticUrl>';
	var pauseImg='<b:staticUrl>/res/img/u512.png</b:staticUrl>';
	var first=true;
	$("#toDayMiao img").on('click',function(){
		var audiosrc=$('#audio').attr('src');
		if(audiosrc.length==0){
			toast('会员专享');
		}else{
			var img=$(".con_suspend");
			var src=$(".con_suspend").attr('src');		
			if(src==playImg){
				$(".con_suspend").attr('src',pauseImg);
			}else{
				$(".con_suspend").attr('src',playImg);
			}
			topicCid=$('#audio').data('id');
			$('.playBtn').click();
		}
	})
	
	 HH.ajax({
			url:'/yzmm/account/smallDayUpdate/getSmallDayUpdate', 
			data:{}, 
			callback:function(data){
				//判断发送是否成功
				if(data.success) {
					$('.parenting').css('display','block');
					var obj=data.ext;
					//周 日期 
					$('.par_top_r').text(fmtDate(new Date(obj.smduTime*1000),'MM月dd日')+" •"+" 星期" + "日一二三四五六".charAt(new Date().getDay()));
					//课程名称
					$('.con_text h3').text(obj.courseName);
					/* <p>鼎力绘本推荐  | 07-07  |  时长8:07</p> */
					//主题名称
					$('.con_text p').text(obj.themeName+" | "+fmtDate(new Date(obj.smduTime*1000),'MM-dd')+" | 时长"+formatSecondsDDHHmmss(obj.timeLen));
					
					$('.con_text').data('sduid',obj.id);
					
					$('.audioCont audio').attr('src',obj.playUrl);
					$('.audioCont audio').data('id',obj.courseId);
             } else {
            	 $('#comingsoon').css('display','block');
             }
			}
		});
	$('.parentingTop').on('click',function(){
		HH.href('/yzmm/account/smallDayUpdate/list');
	});
	$('.con_text').on('click',function(){
		var self=$(this);
		HH.href('/yzmm/account/smallDayUpdate/detail?id='+self.data('sduid'));
	});

})
</script>
<div class="section" style="display: none">
		<div class="sectionTit box_align">
		 <div id="" class="u45_div"></div>
		 <span class="sectitle" style="padding-left: 0.1rem;font-size:0.40rem;color:rgba(72, 72, 72, 1)"><b>主题课</b></span>
		</div>
		 <div style="font-size: 15px;border-bottom: 0.022rem solid rgba(217, 217, 217, 0.58);margin: 10px 0 0 0;width: 100%;"></div>
		 <div class="topicCourseDiv" style="min-height: 3.4rem;margin-top: 0.32rem;display: none;" data-id="" onclick="topicCourseClick(this)">
		 	<div style="width: 100%;">
		 		<div style="text-align: right;float: left;">
		 			<img class="titleImg" style="height: 3rem;width: 2.33333rem;border-radius: 0.2rem;" >
		 		</div>
		 		<div style="overflow: hidden;padding: 0rem 0.2rem;font-size: 0.38rem;line-height: 0.62rem;min-height: 3rem;">
		 			<p class="titleP" style="font-weight: bold;">新手妈妈必听的6节课</p>
		 			<div class="descP" style=" font-size: 0.34rem;color: #A1A1A1;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;line-height: 0.8rem;">新手妈妈必听课程，持证上岗不是吓唬你</div>
		 			<div style="border-bottom: 1px #F2F2F2 solid;">
		 				<span class="priceSpan"  style="font-size: 15px;color: #FFA12E;display:none;"><span class="beginnerPrice">￥79 </span><span style="font-size: 10px;" class="vipPrice">/ 会员 5 折</span></span>
		 				<span class="vipSpan"  style="font-size: 0.3rem;;display:none;background-repeat: no-repeat;padding-left:0.5rem;color: #FFA12E;background-size: auto 80%;background-image: url(<b:staticUrl>/res/img/vip1.png</b:staticUrl>);background-position: left center;">会员专享</span>
		 				<span class="subscribeSpan"  style=" font-size: 0.3rem;color: #929090;float: right;" class="subscribe">1人订阅</span>
		 			</div>
		 			<p class="newCourse" style='font-size: 0.34rem;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;display: none;margin-top: 0.1rem; color: #666666;'>最新：思维能力的差与好</p>
		 		</div>
		 	</div>
		 	 <div class="lineDiv" style="height:2px;width: 100%;background-color: #F2F2F2;margin-top: 0.1rem;clear: both;margin-top: 0.3rem;"></div>
		</div>
		
		<script type="text/javascript">
		function topicCourseClick(obj){
			var o = $(obj);
			HH.href("/yzmm/account/course/topic/index?id="+o.data("id"));
		}
		$(function(){
			HH.ajax({
				url:'/yzmm/account/course/topic/ajaxList', 
				data:{}, 
				callback:function(data){
					
					var tcd = $(".topicCourseDiv");
					var vp = tcd.parent();
					//判断发送是否成功
					if(data.success) {
						if(data.totalRows <=0){
							return;
						}
						
						for(var i=0;i<data.totalRows;i++){
							var dd = data.list[i];
							var tcdc = tcd.clone();
							tcdc.data("id",dd.id);
							tcdc.data("lookId",dd.giveLookIdentity);
							tcdc.find(".titleImg").attr("src",dd.icon);
							tcdc.find(".titleP").html(dd.name);
							tcdc.find(".descP").html(dd.remarks);
							
							//已订阅的不用关注收费情况
							if(dd.hasSubscribe){
								tcdc.find(".priceSpan").html("已订阅").show();
							}else if(dd.payType=='FREE'){
								 tcdc.find(".priceSpan").html("限时免费").show();
							 }else if(dd.payType=='VIP'){
								 //vip 收費 
								 if(dd.vip){
									 tcdc.find(".beginnerPrice").html("￥"+dd.vipPrice+"&nbsp;/");
									 tcdc.find(".vipPrice").html("&nbsp;原价￥"+dd.beginnerPrice).css("text-decoration","line-through");
									 tcdc.find(".priceSpan").show();
								 }else if(!dd.vip){
									 tcdc.find(".priceSpan").find(".beginnerPrice").html("￥"+dd.beginnerPrice);
									 tcdc.find(".priceSpan").find(".vipPrice").html("&nbsp;/&nbsp;会员5折");
									 tcdc.find(".priceSpan").show();
								 }
								
							 }else if(dd.payType=='BEGINNER'){
								 //小白收费
								 if(dd.vip){
									tcdc.find(".vipSpan").show();
								 }else{
									 tcdc.find(".priceSpan").find(".beginnerPrice").html("￥"+dd.beginnerPrice);
									 tcdc.find(".priceSpan").find(".vipPrice").html("&nbsp;/&nbsp;会员免费");
									 tcdc.find(".priceSpan").show();
								 }
							 }
							
							tcdc.find(".subscribeSpan").html(dd.subscribe+"人订阅");
							if(dd.ext){
								var newCourse = tcdc.find(".newCourse");
								newCourse.html("最新："+dd.ext);
								newCourse.show();
							}
							if(i == data.totalRows-1){
								tcdc.find(".lineDiv").hide();
							}
							tcdc.show();
							vp.append(tcdc);
						}
						
						vp.slideDown();
	                } 
				}
			});
		})
		</script>
</div>

<div class="section" style="clear:both;">
		<div class="sectionTit box_align">
		 <div id="" class="u45_div"></div>
		 <span class="sectitle" style="padding-left: 0.1rem;font-size:0.40rem;color:rgba(72, 72, 72, 1)"><b>每日推荐</b></span>
		</div>
		 <div style="font-size: 15px;border-bottom: 0.022rem solid rgba(217, 217, 217, 0.58);margin: 10px 0 0 0;width: 100%;"></div>
		 
		 <div class='poster-main'>
		 	<div class="poster-btn poster-prev-btn"></div> 
		   	<div class="poster-btn poster-next-btn"></div> 
		   		<div class="mainimgdiv" data-index="2" onclick="toVod(this)" data-courseid="${miaoreclist[0].courseId }" data-count="${miaoreclist[0].count }" data-title="${miaoreclist[0].name }" style="text-align: center;position: absolute;z-index: 60;border-radius:0.2rem;background-image: url(${miaoreclist[0].imgUrl })">
		   		</div>
		 </div>
		 <div class="showtitle" style="width: 100%;text-overflow:ellipsis;overflow: hidden;font-size: 12px;text-align: center ;">
		   		<span onclick="toVod(this)" data-courseid="${miaoreclist[0].courseId }">${miaoreclist[0].name }</span><br><p><span class="playImg">&nbsp;&nbsp;&nbsp;&nbsp;</span>播放${miaoreclist[0].count }次</p>
		  </div>
</div>
 <div class="section">
		<div class="sectionTit box_align">
		 <div id="" class="u45_div"></div>
		 <span class="sectitle" style="padding-left: 0.1rem;font-size:0.40rem;color:rgba(72, 72, 72, 1)"><b>微课营</b></span>
		</div>
		 <div style="font-size: 15px;border-bottom: 0.022rem solid rgba(217, 217, 217, 0.58);margin: 10px 0 0 0;width: 100%;"></div>
		 <div id="hotmeowask">
		<div class="hot" style="display: none">
			<div class="wky">
				<img src="<b:staticUrl>/res/img/course/hotmiaowen.png</b:staticUrl>">
			</div>
			<div  class="wky two">
				<img src="<b:staticUrl>/res/img/course/hotmiaowen.png</b:staticUrl>">
			</div>
			<div class="wky three" >
				<img src="<b:staticUrl>/res/img/course/hotmiaowen.png</b:staticUrl>">
			</div>
		</div>
		</div>
</div>
<%@include file="../miaosoundbite/miaosoundbite.jsp"%>
</div>
<div class="searchresult">
	<ul id="searchresultul" class="activityList miaoList">
			
	</ul>
</div>
<jsp:include page="/pages/header_footer.jsp">
		<jsp:param value="2" name="menu"/>
</jsp:include>  
	
<div class="courseScore" style="display: none">
		<div class="shareActBox">
			<div class="maximBox">
				<a href="javascript:void(0);" class="cha"></a>
				<img src="/res/img/bar.png" class="bar" >
				<img src="/res/img/shareacttit.png" class="shareActTit" >
				
				<div class="timeout"><c:out value="${startDate} 至  ${endDate}"></c:out></div>
				<div class="word">
					<p>1、点击“立即领取”生成个人海报，将海报分享至微信朋友圈。</p>
					<p>2、如果您已经是喵姐早教说VIP用户，通过您分享进入的朋友将获得一天会员免费体验机会，您将获得会员时长延期一天的福利。</p>
					<p>3、如果您是喵姐早教说非VIP用户，通过您分享进入的朋友与您都将获得一天的免费会员时长</p>
				</div>
			</div>
			<div class="privilegeTit">会员特权</div>
			<img src="/res/img/privilege.png" class="privilege" >
			<div class="getActBtn"><a href="javascript:;"><img src="/res/img/getactbtn.png" ></a></div>
		</div>
	</div>
<script type="text/javascript">
// 弹框相关
$(".courseScore").on("click",function(e){
	e.stopPropagation();
	if($(e.target).hasClass("courseScore")){
		$(".courseScore").hide();
	}
})
$(".cha").click(function(){
	$(".courseScore").hide();
})
var shareCourseId= "${bestNewVodCourseId}";
//初始化会期连接
$(".getActBtn").bind("click",function(){
	HH.href("/yzmm/account/course/share/placard?courseId="+shareCourseId);
	return ;
})
var shareActivityStatus = "${shareActivityStatus}";
if("true" == shareActivityStatus){
		  HH.ajax({
				url:'/yzmm/account/course/ackShareActivityStatus', 
				data:{}, 
				callback:function(data){
					//判断发送是否成功
					if(data.success) {
						$(".courseScore").show();
	                } else {
	                   //toast(data.msg)
	                }
				}
			});
}
</script>
 <script>
  var bigleft = 0;
  var bigtop = 0;
  var bigwidth = 0; 
  var smwidth = 0;
  var smleft = 0;
  var smright = 0;
  var smtop = 0;
  var pmd1,pmd2,pmd3;
  var zhuanging = false;
		$(function(){
			var d = $(".poster-main");
// 			var w = d.width();
// 			var h = d.height();
			var mainimgdiv = $(".mainimgdiv");
			
			bigleft = "15%";
			bigtop = "15%";
			big = "70%";
			
			smtop = "30%";
			sm = "40%";
			smleft = "2%";
			smright = "58%";
			
			
			var one = mainimgdiv.clone();
			one.css("z-index",20);
			one.width(sm);
			one.height(sm);
			one.children("div").html(1234);
			one.css("left",smleft);
			one.css("top",smtop);
			one.attr("data-index",1);
			one.attr("data-count",'${miaoreclist[1].count }');
			one.attr("data-title","${miaoreclist[1].name }");
			one.attr("data-courseid","${miaoreclist[1].courseId }");
			one.css("background-image","url(${miaoreclist[1].imgUrl })");
			
			var two = mainimgdiv.clone();
			two.css("z-index",40);
			two.width(sm);
			two.height(sm);
			two.children("div").html(2345);
			two.css("left",smright);
			two.css("top",smtop);
			two.attr("data-index",3);
			two.attr("data-count",'${miaoreclist[2].count }');
			two.attr("data-title","${miaoreclist[2].name }");
			two.attr("data-courseid","${miaoreclist[2].courseId }");
			two.css("background-image","url(${miaoreclist[2].imgUrl })");
			
			mainimgdiv.before(one);
			mainimgdiv.after(two);
			
			
			mainimgdiv.animate({
				width:big,
				height:big,
				left:bigleft,
				top:bigtop
			},1000);
			
			pmd1 = one;
			pmd2 = mainimgdiv;
			pmd3 = two;
			
			$(".poster-prev-btn").click(function(){
				if(zhuanging){
					return;
				}	
				zhuanging = true;
				var t1 = pmd1;
				var t2 = pmd2;
				var t3 = pmd3;
				t2.css("z-index",40);
				t2.animate({
					width:sm,
					height:sm,
					left:smleft,
					top:smtop,
					zIndex:20
				},1000,function(){
					pmd1 = 	t2;
				});
				t3.css("z-index",60)
				t3.animate({
					width:big,
					height:big,
					left:bigleft,
					top:bigtop,
					zIndex:60
				},1000,function(){
					pmd2 = 	t3;
					$(".showtitle").html('<span>'+pmd2.data("title")+'</span><br><p><span class="playImg">&nbsp;&nbsp;&nbsp;&nbsp;</span>播放'+pmd2.data("count")+'次</p>');
					zhuanging = false;
				});
				t1.animate({
					width:sm,
					height:sm,
					left:smright,
					top:smtop,
					zIndex:40
				},1000,function(){
					pmd3 = 	t1;
				});
			})
			$(".poster-next-btn").click(function(){
				if(zhuanging){
					return;
				}	
				zhuanging = true;
				
				var t1 = pmd1;
				var t2 = pmd2;
				var t3 = pmd3;
				
				t2.css("z-index",40)
				t2.animate({
					width:sm,
					height:sm,
					left:smright,
					top:smtop,
					zIndex:40
				},1000,function(){
					pmd3 = 	t2;
				});
				
				t1.css("z-index",60)
				t1.animate({
					width:big,
					height:big,
					left:bigleft,
					top:bigtop,
					zIndex:60
				},1000,function(){
					pmd2 = 	t1;
					$(".showtitle").html('<span>'+pmd2.data("title")+'</span><br><p><span class="playImg">&nbsp;&nbsp;&nbsp;&nbsp;</span>播放'+pmd2.data("count")+'次</p>');
					zhuanging = false;
				});
				t3.css("z-index",20)
				t3.animate({
					width:sm,
					height:sm,
					left:smleft,
					top:smtop,
					zIndex:20
				},1000,function(){
					pmd1 = 	t3;
				});
				
			})
		});
	</script> 
<script type="text/javascript">
$(function(){
	$('#hotplay').on('click',function(){
		HH.href("/yzmm/account/homegloballabel/popular");
	});
	$(".searchcourse").on('click',function(){
		//判断当是取消的情况
		if($(this).hasClass("canelBtn")){
			$("#searchresultul").html("");
			$("#searchresult").hide();
			$(".mainDiv").show();
			$(".searchcourse").removeClass("canelBtn").html("搜索");
			 $("#keyword").val("");
		}else{
			search();
		}
	});
	
	
	$('#keyword').on('keypress', function(event) {  
		
        if (event.keyCode == "13") {              
            event.preventDefault();   
            //回车执行查询  
           search();
        }  
    });  
});
function search(){
	var keyword = $("#keyword").val();
	if(!keyword){
		toast("请输入关键词~");
		return;
	}
	 HH.ajax({
		    url:'/yzmm/account/home/ajaxOpenSerachVodCourseList',
		    data:{
		    	keyword:keyword,
		    	pageSize:100
		    },
		    callback:function(data){
		      	var h = "";
	    		if(data.success){
	    			var len = data.list.length;
	    			if(!len){
	    				h = "<li><p style='text-align: center;margin-top: 30px;'>抱歉，没有找到相关课程~</p></li>";
	    			}else{
	    				h = "";
	    			}
					for(var i=0;i< len;i++){
						var o = data.list[i];
						if(!o.imgUrl ){
							o.imgUrl = configuration.course.indexDefaultImg;
						}
							h+='<li>'
							h+='<a onclick="toVod(this);" data-courseid="'+o.courseId+'">'
							h+='<div class="photo"><img src="'+o.imgUrl+'" onclick="toVod(this);" data-courseid="'+o.courseId+'"></div>'
							h+='<div class="info">'
							h+='<h2 class="tit" onclick="toVod(this);" data-courseid="'+o.courseId+'">'+o.name+'</h2>'
							h+='<p>直播时间：';
							if(o.playStartTime){
								h+=fmtSecondyyyMMDD(o.playStartTime);
							}
							h+='</p>';
							h+='<div class="other">'
							if(o.money){
								h+='<span class="money"><i>￥</i><em>'+o.money+'</em></span>'
							}
							h+='<span class="num2">'+o.listenCount+'人已看过</span>'
							h+='</div>'
	   					    h+='</div>'
							h+='</a></li>';
					}
					$("#searchresultul").html(h);
					$("#searchresult").show();
					$(".mainDiv").hide();
					$(".searchcourse").addClass("canelBtn").html("取消");
	    		}
		    }
	});
}
function toLive(obj){
	HH.href("/yzmm/account/course/liveDetail?courseId="+$(obj).data('courseid'));
}
function toVod(obj){
	HH.href("/yzmm/account/course/toVodDetail?courseId="+$(obj).data('courseid'));
}
function fn(){
	
	var len = $("#keyword").val().length;
	if(len){
		
	}else{
		$(".searchcourse").removeClass("canelBtn").html("搜索");
	}
}
</script>
</body>
</html>