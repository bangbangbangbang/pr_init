<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<meta http-equiv="Content-type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>国民宝宝</title>
<!--忽略页面中的数字识别为电话号码-->  
<meta name="format-detection" content="telephone=no" />
<!--忽略页面中的邮箱格式为邮箱-->
<meta name="format-detection" content="email=no"/>

<%@include file="../header_vote.jsp"%>
<%@include file="../header_wxjsapi.jsp"%>

<script src="<b:staticUrl>/res/js/package/vote/index.js</b:staticUrl>"></script>

</head>
<body>
<div class="swiper-container">
	<div class="swiper-wrapper">
		<!--马上参与-->
		<div class="swiper-slide page-three" style="background:url(<b:staticUrl>/res/img/vote/bg.png</b:staticUrl>) no-repeat;background-size:cover">
			<a href="javascript:void(0)" class="logo"><img src="<b:staticUrl>/res/img/vote/logo2@2x.png</b:staticUrl>" ></a>
			<div class="banner">
				<img src="<b:staticUrl>/res/img/vote/1.png</b:staticUrl>" >
				<img src="<b:staticUrl>/res/img/vote/pthree/title.png</b:staticUrl>" class="title" >
			</div>
			<div class="data">
				<p class="p1">你心目中的国民宝宝什么样</p>
				<p class="p2">已有 <span>${partNumber}</span> 人参与，快来投下你的神圣一票！</p>
				<div class="jionBtn"><div><a href="javascript:void(0)">马上参与</a></div></div>
			</div>
		</div>
		<div class="swiper-slide page-five" style="background:url(<b:staticUrl>/res/img/vote/bg.png</b:staticUrl>) no-repeat;background-size:cover">
			<a href="javascript:void(0)" class="logo"><img src="<b:staticUrl>/res/img/vote/logo@2x.png</b:staticUrl>" ></a>
			<div class="shape1"></div>
			<div class="shape2"></div>
			<div class="shape3"></div>
			<div class="word">我是哪个年代的辣妈～</div>
			<ul class="mumlist">
				<li data-age="SEXY"><div><span>70后辣妈</span></div></li>
				<li data-age="FASHION"><div><span>80后辣妈</span></div></li>
				<li data-age="CUTE"><div><span>90后辣妈</span></div></li>
			</ul>
		</div>
		<input id="agegroup" name="agegroup" type="hidden"/>
		<div class="swiper-slide page-six" style="background:url(<b:staticUrl>/res/img/vote/bg.png</b:staticUrl>) no-repeat;background-size:cover">
			<a href="javascript:void(0)" class="logo"><img src="<b:staticUrl>/res/img/vote/logo@2x.png</b:staticUrl>" ></a>
			<div class="title">请为你心目中的国民宝宝选择3个特质~~</div>
			<div class="tag tag1"><div><span>未选择标签</span></div><i class="close"></i></div>
			<div class="tag tag2"><div><span>未选择标签</span></div><i class="close"></i></div>
			<div class="tag tag3"><div><span>未选择标签</span></div><i class="close"></i></div>
			<div class="refresh">换一批</div>
			<ul class="tagList">
				<c:forEach items="${voteLabelList}" var="vote">
					<li><div><span>${vote.title}</span></div></li>
				</c:forEach>
			</ul>
			<div class="identify"><input type="text" maxlength="4" placeholder="添加自定义标签（请输入2-4个字）"><span class="sureBtn">确定</span></div>
			<div class="jionBtn completeBtn"><div><span>选完了</span></div><i class="close"></i></div>
		</div>
		<!--第一页-->
			<div class="swiper-slide page-two" style="background:url(<b:staticUrl>/res/img/vote/bg.png</b:staticUrl>) no-repeat;background-size:cover">
			<div class="top">
				<a href="javascript:void(0)" class="logo"><img src="<b:staticUrl>/res/img/vote/logo2@2x.png</b:staticUrl>" ></a>
				<span class="goL"></span>
				<span class="goR"></span>
				<div class="photo" style="display:block;">
					<div class="photoTag">
						<span class="tag1">诚实</span>
						<span class="tag2">坚持</span>
						<span class="tag3">正直</span>
					</div>
				</div>
				<div class="photo">
					<div class="photoTag">
						<span class="tag1">诚实</span>
						<span class="tag2">坚持</span>
						<span class="tag3">正直</span>
					</div>
				</div>
				<div class="photo">
					<div class="photoTag">
						<span class="tag1">诚实</span>
						<span class="tag2">坚持</span>
						<span class="tag3">正直</span>
					</div>
				</div>
				<p class="name" style="display:block;">70后萌妈心目中的国民宝宝</p>
				<p class="name">80后萌妈心目中的国民宝宝</p>
				<p class="name">90后萌妈心目中的国民宝宝</p>
				<div class="title"></div>
			</div>
			
			<div class="data">
				<p>有 <span>8.32%</span> 的人也选择了 <i>快乐</i>，<span>0.89%</span> 选择了 <i>健康</i>，<span>0.99%</span> 选择了 <i>爱心</i><span class="otherMeb">其他人选择</span></p>
				<div class="jionBtn"><div><a href="javascript:void(0)">邀请朋友参加</a></div></div>
			</div>
			<a href="javascript:void(0)" class="ad">
				<span class="arrow"></span>
				<div class="word">
					<p>12月4日，喵姐高寿岩12小时超</p>
					<p>长直播，教你培养国民宝宝</p>
				</div>
			</a>
		</div>
		<!--其他宝宝页-->
		<div class="swiper-slide page-four" style="background:url(<b:staticUrl>/res/img/vote/bg.png</b:staticUrl>) no-repeat;background-size:cover">
			<a href="javascript:void(0)" class="logo"><img src="<b:staticUrl>/res/img/vote/logo@2x.png</b:staticUrl>" ></a>
			<span class="shape1"></span>
			<span class="shape2"></span>
			<span class="shape3"></span>
			<div class="word"><p>大家心目中的</p><p>国民宝宝特质</p></div>
			<ul class="perdata">
				<!-- <li>
					<div class="tit">可爱</div>
					<div class="bar"></div>
					<div class="value">23.88%</div>
				</li> -->
			</ul>
			<div class="line"></div>
		</div>
		<!--分享页-->
		<div class="swiper-slide page-two" style="background:url(<b:staticUrl>/res/img/vote/bg.png</b:staticUrl>) no-repeat;background-size:cover">
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
				<p class="p2">已有 <span>${partNumber}+1</span> 人参与，快来投下你的神圣一票！</p>
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
<div class="prompt"><div class="promptBox"><span>最多只能选择3个哟</span></div></div>		
<div class="shareLayer">
	<span class="arrow"></span>
	<p>亲，邀请好友点击右上角</p>
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


$(function(){
	var pageIndex=2;
$(".refresh").click(function(){
	 HH.ajax({
		    url:'/yzmm/account/vote/ajaxSelectInfo',
		    data:{
		    	pageIndex:pageIndex,
		    	pageSize:12,
		    	},
		    callback:function(data,params){
		    	var h = "";
		   		if(data.success){
		   			var len = data.list.length;
		   			console.log(len);
		   			if(len==12){
		   				console.log(pageIndex);
		   				pageIndex=pageIndex+1;
		   				console.log(pageIndex);
		   			}else{
		   				pageIndex=1;
		   			}
					for(var i=0;i<len;i++){
						var o = data.list[i];
						h+='<li class="active"><div><span>'+o.title+'</span></div></li>';
					} 
		   		}
		   			 $(".tagList").html(h);
			    }
		 });
	});
});
</script>
</body>
</html>