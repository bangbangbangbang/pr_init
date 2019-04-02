<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>喵圈</title>
	
	<%@include file="../header_v13.jsp"%>
	<%@include file="../header_wxjsapi.jsp"%>
	<script src="<b:staticUrl>/res/js/scrollpaginationme.js</b:staticUrl>"></script>
	<link rel="stylesheet" href="<b:staticUrl>/res/css/myaudio.css</b:staticUrl>">
	<script src="<b:staticUrl>/res/js/swiper-3.3.0.min.js</b:staticUrl>"></script> 
	<script src="<b:staticUrl>/res/js/autoheight.js</b:staticUrl>"></script> 
		<script type="text/javascript" src="<b:staticUrl>/res/js/myaudio-v13.js</b:staticUrl>"></script>
	
</head>
<style type="text/css">
.colorcolor{
color:#666;
}

.tabtop {
    width: 100%;
    max-width: 540px;
    margin: 0 auto;
    height: 1.09333333rem;
    line-height: 1.09333333rem;
}
.tabtop a {
    float: left;
    width: 50%;
    height: 100%;
    position: relative;
    text-align: center;
    font-size: 0.42666667rem;
    color: #666;
}
.tabtop .active {
    color: #d0021b;
}
.active2:after {
    content: '';
    width: 70%;
    height: 0;
    position: absolute;
    left: 15%;
    bottom: 0;
    border-bottom: 0.05333333rem solid #d0021b;
}
</style>
<body id="bgwhite">
		<div class="tabtop">
			<a href="/yzmm/account/miao/topic/index" class="active2">话题</a>
			<a href="/yzmm/account/activitytype/list">活动</a>
		</div>

<div class="swiper-container topic-first">
<div class="swiper-wrapper">
<c:if test="${list!= null}">
<c:forEach var="i" items="${list}">
	<div class="swiper-slide" onclick="toDetail(${i.id})">
		    <a href="#"><img src="${i.titleImg}" ></a>
			<div class="word" >
				<a href="#"><p class="font15 els2">${i.topicContent}</p></a>
				<div class="font12 wordother">
					话题出自：<a href="#">${i.topicTypeString}</a>
					<span class="author">${i.releasePerson}</span>
					<span class="num">${i.pvCount}</span>
				</div>
			</div>
		</div>
</c:forEach>
</c:if>
   </div>
<div class="swiper-pagination"></div>
</div>

<div class="topic-item">
	<ul  id = "content">
		
	</ul>
</div>

<!--尾部-->
	<jsp:include page="/pages/header_footer.jsp">
		<jsp:param value="3" name="menu"/>
	</jsp:include>
<script> 
var mySwiper = new Swiper('.swiper-container', {
	autoplay: 5000,
	pagination: '.swiper-pagination'
})
</script>
<!-- 初始化查询 -->
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

var imgBanner = 0;
var pageIndex = 1;
var sm = {};
//楼层数
var floorNum = 1;
$(function(){
	sm = $(window).scrollme({
		target:$("#content"),
		data:{pageSize:4},
		url:"/yzmm/account/miao/topic/ajaxtolist",
		callback:function(data,params){
			$("#showloaddiv").hide();
			var h = "";
			if (data.success) {
				//是否为空
				if (!data.totalPage) {
					$(".noresult").remove();
				} else {
					$(".noresult").hide();
					var len = data.list.length;
					if (len) {
						//增加页码
						params.pageIndex = ++pageIndex;
					}
					
					for (var i = 0; i < len; i++) {
						var o = data.list[i];
						floorNum = floorNum +1;
							h+='<li onclick=toDetail('+o.id+') class="li'+pageIndex+'"   data-id="'+o.id+'">';
							h+='<a href="#"><img src="'+o.titleImg+'" ></a>';
							h+='<a href="#"><p class="font15 els2 colorcolor" >'+ o.topicContent+'</p></a>';
							h+='<div class="font12 others">';
							h+='话题出自：<a href="#"> '+ o.topicTypeString + '</a>';
							h+='<span class="author">'+ o.releasePerson +'</span>';
							h+='<span class="num">'+ o.pvCount +'</span>';
							h+='</div>';
							h+='</li>';
					}
				}
			} 
			$("#content").append(h);
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

//去相关话题源
function toSource(id,type) {
	if(type == "KNOWLEDGE"){
		//去三千问
		window.location = "/yzmm/account/knowledge/viewDetail?knowledgeId="+id;
	}else if(type == "MIAOCOURSE"){
		//去喵姐说
		window.location = "/yzmm/wxmppay/vod?courseId="+id;
	}
}
//去详情
function toDetail(id) {
	//去详情页
	window.location = "/yzmm/account/miao/topic/viewDetailIncludeReply?id="+id;
}

</script>

</body>
</html>