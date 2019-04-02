<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--忽略页面中的邮箱格式为邮箱-->
<meta name="format-detection" content="email=no"/>
 <%@include file="../header_v2.0.jsp" %>
 <%@include file="../header_wxjsapi.jsp"%>
 <link rel="stylesheet" href="<b:staticUrl>/res/css/navigator.css</b:staticUrl>">
<title>喵姐早教说</title>
</head>
<body>
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
<c:if test="${hasLive }">
<div class="miaoBanner" onclick="toLive(this);" data-courseid="${lcourseId}">
	<img src="${limgUrl}" >
	<div class="miaoInfo">
	    <input type="hidden" value="${playState}"/>
		<!-- <a onclick="followClick(this);" data-courseid="${lcourseId}" class="atMe" id="remind" style="display:none;">提醒</a> -->
		<div class="tit"><span id="st">预告</span> | ${lname}</div>
		<p id="time" onclick="toLive(this);" data-courseid="${lcourseId}"></p>
	</div>
</div>
</c:if>
<%@include file="../miaosoundbite/miaosoundbite.jsp"%>
<div class="tabTit">
	<a onclick="allcourse()" id="tabfour">全部课程</a>
	<a onclick="popular()" id="tabone">热播排行</a>
	<a onclick="must()" id="tabtwo">辣妈必听</a>
	<a onclick="free()" id="tabthree">限时免费</a>
</div>
<ul id="miaoListOne" class="activityList miaoList"></ul>
<ul id="miaoListTwo" class="activityList miaoList"></ul>
<ul id="miaoListThree" class="activityList miaoList"></ul>
<ul id="miaoListFour" class="activityList miaoList"></ul>

<a href="javascript:void(0)" class="lessonBtn">精品课程</a>
<jsp:include page="/pages/header_footer.jsp">
		<jsp:param value="2" name="menu"/>
	</jsp:include>
	<div class="package">
	<div class="packageBox">
		<div class=""id="packageList">
		</div>
		<a href="javascript:void(0)" class="cancle"><span>取消</span></a>
	</div>
</div>
	
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
<c:if test="${not empty showPrompt}">
	<!-- 引导提示 -->
	<div class="navigatorBox" style="display:none">
		<div class="navFoot"><span class="cir2"><p>喵姐说</p></span></div>
		<div class="navDown">向下滑动，查看更多课程</div>
			<div class="knowItBtn"><a href="/yzmm/account/ending/propmt"><span class="knowIt">宝宝知道了~</span></a></div>
		</div>
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
			$(".navigatorBox").show();
			$("body").addClass("navigator navigator2");
		}   
</script>
</c:if>	

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

<script src='<b:staticUrl>/res/js/lesson.js</b:staticUrl>'></script>
<script src='<b:staticUrl>/res/js/scrollpaginationme.js</b:staticUrl>'></script>
<script type="text/javascript">
$(function(){
	allcourse();
});
</script>
<script type="text/javascript">
var pageIndex = 1;
var sm = {};

function ajaxCourse(type){
	 var con = type;
	 var conclear;
	 if(con=='POPULAR'){
		 conclear=$("#miaoListOne");
	 }else if(con=='MUST'){
		 conclear= $("#miaoListTwo");
	 }else if(con=='FREE'){
		 conclear=$("#miaoListThree");
	 }else {
		 conclear=$("#miaoListFour");
	 }
	 sm = $(window).scrollme({
		 target:conclear,
	    url:'/yzmm/account/course/ajaxList',
	    data:{pageIndex:pageIndex,pageSize:10,courseType:con},
	    callback:function(data,params){
	    	var h = "";
    		if(data.success){
    			var len = data.list.length;
				if(len){
					//增加页码
					params.pageIndex = ++pageIndex;
				} 
				for(var i=0;i< len;i++){
					var o = data.list[i];
						h+='<li>'
						h+='<a onclick="toVod(this);" data-courseid="'+o.courseId+'">'
						h+='<div class="photo"><img src="'+o.imgUrl+'" onclick="toVod(this);" data-courseid="'+o.courseId+'"></div>'
						h+='<div class="info">'
						h+='<h2 class="tit" onclick="toVod(this);" data-courseid="'+o.courseId+'">'+o.name+'</h2>'
						h+='<p>直播时间：'+o.startTime+'</p>'
						h+='<div class="other">'
						if(!o.free&&!o.auth){
							h+='<span class="money"><i>￥</i><em>'+o.money+'</em></span>'
						}
						h+='<span class="num2">'+o.count+'人已看过</span>'
						h+='</div>'
   					    h+='</div>'
						h+='</a></li>';
				} 
    		}
    		 if(con=='POPULAR'){
       			 $("#miaoListOne").append(h);
       		 }else if(con=='MUST'){
       			 $("#miaoListTwo").append(h);
       		 }else if(con=='FREE'){
       			 $("#miaoListThree").append(h);
       		 }else {
       			 $("#miaoListFour").append(h);
       		 }
	    }
	 });
	 sm.reload(); 
}
function ajaxPopular(type){
	$(window).unbind("scroll");
	 var con = type;
	 HH.ajax({
	    url:'/yzmm/account/course/ajaxList',
	    data:{
	    	pageIndex:1,
	    	pageSize:10,
	    	courseType:con
	    	},
	    callback:function(data,params){
	    	var h = "";
   		if(data.success){
   			var len = data.list.length;
   			var jiage = '${isVip ? "":"jiage"}';
				for(var i=0;i< len;i++){
					var tempjiage = jiage;
					var o = data.list[i];
						if(o.auth){
							tempjiage = '';
						}
						    h+='<li>'
							h+='<a onclick="toVod(this);" data-courseid="'+o.courseId+'">'
							h+='<div class="photo"><img src="'+o.imgUrl+'" onclick="toVod(this);" data-courseid="'+o.courseId+'"></div>'
							h+='<div class="info">'
							h+='<h2 class="tit" onclick="toVod(this);" data-courseid="'+o.courseId+'">'+o.name+'</h2>'
							h+='<p>直播时间：'+o.startTime+'</p>'
							h+='<div class="other">'
							if(!o.auth){
								h+='<span class="money"><i>￥</i><em>'+o.money+'</em></span>'
							}
							h+='<span class="num2">'+o.count+'人已看过</span>'
							h+='</div>'
	   					    h+='</div>'
							h+='</a></li>';
				} 
   		}
   			 $("#miaoListOne").html(h);
	    }
	 });
}
function reload(){
	pageIndex = 1;
	sm.reload({pageIndex:1});
}
function toLive(obj){
	HH.href("/yzmm/account/course/liveDetail?courseId="+$(obj).data('courseid'));
}
function toVod(obj){
	HH.href("/yzmm/account/course/toVodDetail?courseId="+$(obj).data('courseid'));
}
function tosign(obj){
	HH.href("/yzmm/account/course/coursepackage?lableId="+$(obj).data('labelid'));
}

//人气课
function popular(){
	pageIndex = 1;
	$("#miaoListTwo li").hide();
	$("#miaoListThree li").hide();
	$("#miaoListFour li").hide();
	$("#tabone").addClass("active");
	$("#tabtwo").removeClass("active");
	$("#tabthree").removeClass("active");
	$("#tabfour").removeClass("active");
	var type ='POPULAR';
	ajaxPopular(type);
}
//必听课 
function must(){
    pageIndex = 1;
    $("#miaoListThree li").hide();
	$("#miaoListOne li").hide();
	$("#miaoListFour li").hide();
	$("#tabone").removeClass("active");
	$("#tabtwo").addClass("active");
	$("#tabthree").removeClass("active");
	$("#tabfour").removeClass("active");
	var type ='MUST';
	ajaxCourse(type);
}
//免费课
function free(){
	pageIndex = 1;
	$("#miaoListTwo li").hide();
	$("#miaoListFour li").hide();
	$("#miaoListOne li").hide();
	$("#tabone").removeClass("active");
	$("#tabtwo").removeClass("active");
	$("#tabthree").addClass("active");
	$("#tabfour").removeClass("active");
	var type ='FREE';
	ajaxCourse(type);
}
//全部
function allcourse(){
	pageIndex = 1;
	$("#miaoListThree li").hide();
	$("#miaoListOne li").hide();
    $("#miaoListTwo li").hide();
	$("#tabone").removeClass("active");
	$("#tabtwo").removeClass("active");
	$("#tabthree").removeClass("active");
	$("#tabfour").addClass("active");
	var type ='ALLCOURSE';
	ajaxCourse(type);
}
</script>
<script type="text/javascript">
$(function(){
	var playState = "${playState}";
	if('PLAYING'==playState ){
		//直播进行中  提醒隐藏
		$("#st").html("直播中");
	}
	if('PREPARE'==playState){
		//1.提醒隐藏 (直播前一小时)
		$("#time").html("直播时间：${lstartTime}");
		var ltime = ${startTime};
		ltime = fmtDate(new Date(ltime*1000),"yyyy-MM-dd HH:mm:ss")
		ltime = getMillisTimeForLive(ltime);
		var time = new Date();
		time = fmtDate(time,"yyyy-MM-dd HH:mm:ss")
		time = getMillisTimeForLive(time);
		//播放前1小时零5分钟时,关闭提醒按钮
		if(ltime - time > 3900000){
			$("#remind").removeAttr("style");
			if ('${followTo == 0}'=='true') {
				$(".atMe").addClass("myremind-yes");
				$(".myremind-yes").attr("style","background-color:#999999");
			} else {
				$(".atMe").addClass("myremind-no");
				$(".myremind-no").attr("style","background-color:#e51812");
			}
		} 
	}
	if('GAMEOVER'==playState){
		$("#st").html("直播已结束");
	}
})
</script>
<script type="text/javascript">
function followClick(obj){
	stopevt();
	var o = $(obj);
	var courseId = o.data("courseid");
	if(o.hasClass("myremind-no")){
		  HH.ajax({
				url:'/yzmm/account/course/followLive', 
				data:{courseId:courseId,follow:1}, 
				callback:function(data){
					//判断发送是否成功
					if(data.success) {
						o.removeClass("myremind-no").addClass("myremind-yes");
						toast("我们会提前一小时提示您哟~");
						$(".atMe").attr("style","background-color:#999999");
	                } else {
	                   toast(data.msg)
	                }
				}
			});
	}else{
		 HH.ajax({
				url:'/yzmm/account/course/followLive', 
				data:{courseId:courseId,follow:0}, 
				callback:function(data){
					//判断发送是否成功
					if(data.success) {
						o.removeClass("myremind-yes").addClass("myremind-no");
						$(".atMe").attr("style","background-color:#e51812");
						$("#remind").html("提醒");
	                } else {
	                	  toast(data.msg)
	                }
				}
			});
	}
}

//只用于直播时间改为毫秒值
function getMillisTimeForLive(date){
	var fmtd = trim(date);
	var fmt = /^(\d{4})\-(\d{2})\-(\d{2}) (\d{2}):(\d{2}):(\d{2})$/;
	if(!fmt.test(date)){
		return 0;
	}
	var _fmtd = fmtd.substr(0,4);
	var f_fmtd = fmtd.substr(10,9);
	fmtd = fmtd.substr(5,5)+"-"+_fmtd+f_fmtd;
	fmtd = fmtd.replace(/-/g,"/");
	date =  Date.parse(fmtd);
	return date;
}
</script>
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
			$(".navigatorBox").show();
			$("body").addClass("navigator navigator2");
		}   
</script>
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
</body>
</html>
