<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head lang="en">
<meta charset="UTF-8">
<title>喵姐早教说</title>
<%@include file="../header_vote.jsp"%>
<script src="<b:staticUrl>/res/js/package/vote/share.js</b:staticUrl>"></script>
<%@include file="../header_wxjsapi.jsp"%>
</head>
<body>
<div class="load">
		<div class="loading"><div class="loadbg"></div></div>
</div>
<div class="swiper-container">
	<div class="swiper-wrapper">
		<div class="swiper-slide page-one" style="background:url(<b:staticUrl>/res/img/vote/bg.png</b:staticUrl>) no-repeat;background-size:cover">
			<div class="photoshow">
				<a href="javascript:void(0)" class="logo"><img src="<b:staticUrl>/res/img/vote/logo2@2x.png</b:staticUrl>"></a>
				<div class="title"></div>
				<div class="photolist">
					<ul>
						<li>
							<div class="photo">
								<div class="photoTag">
										<span class="tag1">诚实</span>
										<span class="tag2">坚持</span>
										<span class="tag3">正直</span>
								</div>
							</div>
						</li>
					</ul>
				</div>
			</div>
			<div class="data">
				<p class="p1">你心目中的国民宝宝什么样</p>
				<p class="p2">已有 <span>${partNumber }</span> 人参与，快来投下你的神圣一票！</p>
				<div class="jionBtn"><div><a href="javascript:void(0)">马上参与</a></div></div>
			</div>
			<a href="javascript:void(0)" class="ad">
				<span class="arrow"></span>
				<div class="word">
					<p>12月4日，喵姐高寿岩12小时超</p>
					<p>长直播，教你培养国民宝宝</p>
				</div>
			</a>
		</div>
	</div>
</div>
<script type="text/javascript">
var wxfenxiangcb_list={
		title: '${wxshare.title}', // 分享标题
	    link: '${wxshare.link}', // 分享链接
	    imgUrl: '${wxshare.imgUrl}', // 分享图标
	    desc : '${wxshare.desc}',
	    shareTimeline:function(bool){
	    },
	    shareAppMessage:function(bool){
	    }
}
initwxfx(wxfenxiangcb_list);

var labels = "${labels}";
if(labels.length > 1){
	var labelArray = labels.split(",");
	var _h = ""
	for (var i = 0; i < labelArray.length; i++) {
		_h += "<span class=tag"+(i+1)+">"+labelArray[i]+"</span>"
	}
	$(".photoTag").children().remove();
	$(".photoTag").append(_h);
}

$(".jionBtn").click(function(){
	window.location.href = "/yzmm/account/vote/toVote";
	return;
})
</script>
</body>
</html>