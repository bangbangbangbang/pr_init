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
     <script src="<b:staticUrl>/res/js/pageFmtDate.js</b:staticUrl>"></script>
    <script src="<b:staticUrl>/res/js/vote.js</b:staticUrl>"></script>
    <style type="text/css">
    	.subjectBanner .tit,.font19{
    		font-size: 19px;
    		line-height: 19px;
    	}
    	.subjectBanner .time {
		    margin-top: 0.4rem;
		    font-size: 0.4rem;
		}
		.subjectMeb {
		    width: 100%;
		    max-width: 540px;
		    margin: 0 auto;
		    position: relative;
		    z-index: 2;
		    margin-top: -0.26666667rem;
		    padding: 0.1rem 0.4rem;
		    overflow: auto;
		    border-bottom: 0.12rem solid #efeff4;
		}
		.subjectMeb .name {
		    padding: 0.66666667rem 0 0 0.26666667rem;
		    overflow: auto;
		    font-size: 0.35rem;
		    color: #333;
		}
	.addFav2,.remand{
	text-align: center;
    float: right;
    width: 1.8rem;
    height: 0.61333333rem;
    line-height: 0.61333333rem;
    margin-top: 0.51333333rem;
    margin-bottom: 0.2rem;
    color: #ff9900;
    border: 1px solid #ff9900;
    background-repeat: no-repeat;
    background-position: 0.16rem 0.10666667rem;
    background-size: 15px 13px;
    border-radius: 0.05333333rem;
    font-size: 0.32rem;
	}
	.subjectMeb .addFavActive{
		content:未关注;
	    background-color: white;
	    border: #999 1px solid;
	    color: #999;
	}
	.subtitle{
		text-align: center;
	    font-size: 17px;
	    line-height: 17px;
	   	margin-top: 20px;
	}
	.subtitle span:before{
		left: -100%;
	}
	.subtitle span:after{
		right:-100%;
	}
	.subtitle span{
		display: block;
	    width: 1.7rem;
	    position: relative;
	    margin: 0 auto;
	    text-align: center;
	    font-size: 0.40rem;
	}
	.subtitle span:before,.subtitle span:after{
		content: '';
	    width: 1.34666667rem;
	    height: 0;
	    position: absolute;
	    top: 50%;
	    border-top: 0.01333333rem solid #cccccc;
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
    float: right;
   }
    </style>
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
<div class="wrap">
	
	<div class="subjectBanner">
	<div class="shareNote" style="display: none">分享赚会员期限,免费收听,戳我~</div>
	
		<img src="${imgUrl}" >
		<div class="subjectTit">
			<div class="tit font19">${name}</div>
			<c:choose>
				<c:when test="${'PREPARE' == playState}">
	            	<div class="time">直播时间：${startTime}</div>
	           	</c:when>
	           	<c:when test="${'PLAYING' == playState}">
	           		<div class="time">直播进行时( ^_^ )</div>
	           	</c:when>
	           	<c:when test="${'GAMEOVER' == playState}">
	           		<div class="time">直播结束啦，谢谢支持，敬请期待下期课程。</div>
	           	</c:when>
			</c:choose>
			<c:if test="${not auth && once}">
				<div style="margin: 1rem;">
					<p style="color:red;font-size:21px;line-height:21px;">￥${money}<label style="font-size: 15px;line-height: 15px;color: white;">/会员免费</label></p>
				</div>
			</c:if>
	        <a href="javascript:void(0)" class="font14" id="showdayia" style="color:rgba(248, 231, 28, 0.53);display: ${'YES' == answer and auth?'':'none'}">答疑问题可以填写啦~~</a>
		</div>
	</div>
	<div class="subjectMeb">
		<c:choose>
			<c:when test="${not isVip && not auth && not once}">
				<a href="/yzmm/account/VIPStatus" class="remand">成为会员</a>
				<div class="name">会员专属课程，成为会员享受更多特权~</div>
			</c:when>
			<c:when test="${not auth && once}">
				<a href="javascript:void(0)" class="remand payBtn" data-money="${money}" data-body="单次购买课程【￥${money}】">立即购买</a>
				<div class="name">单次付费，永久收听</div>
			</c:when>
			<c:when test="${not auth}">
				<div class="name">您还没有权限哟，亲~ 请微信：miaojieshuo</div>
			</c:when>
			<c:when test="${auth}">
				<c:if test="${hasCollect==false}">
					<a href="javascript:void(0)" id="collection" class="addFav2 addFavActive">未关注</a>
				</c:if>
				<c:if test="${hasCollect==true}">
					<a href="javascript:void(0)" id="collection" class="addFav2">已关注</a>
				</c:if>
				<div class="name">关注课程，不错过精彩内容~</div>
			</c:when>
		</c:choose>
	</div>
	<div style="border-bottom: 5px solid #efeff4;">
		<div class="subtitle"><span>课程介绍</span></div>
		<div class="subjectDetail">
			${description}
		</div>
	</div>
	<div style="border-bottom: 5px solid #efeff4;">
		<div class="subtitle"><span>导师介绍</span></div>
		<div class="subjectDetail">
			<p>${tcName}-${tcRealName}</p>
			${tcDesc}
		</div>
	</div>
	
	<!-- 相关介绍 -->
	<c:if test="${not empty title1}">
		<div style="border-bottom: 5px solid #efeff4;">
			<div class="subtitle"><span>${title1}</span></div>
			<div class="subjectDetail">
				${content1}
			</div>
		</div>
	</c:if>
	<c:if test="${not empty title2}">
		<div style="border-bottom: 5px solid #efeff4;">
			<div class="subtitle"><span>${title2}</span></div>
			<div class="subjectDetail">
				${content2}
			</div>
		</div>
	</c:if>
	<c:if test="${not empty title3}">
		<div style="border-bottom: 5px solid #efeff4;">
			<div class="subtitle"><span>${title3}</span></div>
			<div class="subjectDetail">
				${content3}
			</div>
		</div>
	</c:if>
	<c:if test="${not empty title4}">
		<div style="border-bottom: 5px solid #efeff4;">
			<div class="subtitle"><span>${title4}</span></div>
			<div class="subjectDetail">
				${content4}
			</div>
		</div>
	</c:if>
	<c:if test="${not empty title5}">
		<div style="border-bottom: 5px solid #efeff4;">
			<div class="subtitle"><span>${title5}</span></div>
			<div class="subjectDetail">
				${content5}
			</div>
		</div>
	</c:if>
	<!-- new -->
	    <c:if test="${not empty resp.sqwOneTitle}">
		<div class="relaTit"><span>相关推荐</span></div>
		</c:if>
		
		<div class="section sectionBorder0" id="sqwstart">
		    <c:if test="${not empty resp.sqwOneTitle}">
			<div class="sectionTit">
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
						<div class="other" style="width: 50%;">时长:<span class="fmtDate_mmFssM">${resp.sqwOneTimeCount}</span>
							<c:if test="${resp.sqwOneIsFree}">
								<div class="freebutton" style="background-image: url(<b:staticUrl>/res/img/xsmf.png</b:staticUrl>);background-size: 52px;"></div>
							</c:if>
						</div>
					</div>
				</a></li>
				</c:if>
				<c:if test="${not empty resp.sqwTwoTitle}">
				<li><a id="stwoid">
				<input id="stwoidinput" type="hidden" value="${resp.sqwTwoId}">
					<div class="photo"><img src="${resp.sqwTwoImg}" ></div>
					<div class="info">
						<h2><span class="newesttag"></span>${resp.sqwTwoTitle}</h2>
						<div class="other">推荐${resp.sqwTwoAge}岁<span class="num">${resp.sqwTwoListenCount}人听过</span></div>
						<div class="other" style="width: 50%;">时长:<span class="fmtDate_mmFssM">${resp.sqwTwoTimeCount}</span>
							<c:if test="${resp.sqwTwoIsFree}">
								<div class="freebutton" style="background-image: url(<b:staticUrl>/res/img/xsmf.png</b:staticUrl>);background-size: 52px;"></div>
							</c:if>
						</div>
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
						<div class="other" style="width: 50%;">时长:<span class="fmtDate_mmFssM">${resp.sqwOneTimeCount}</span>
							<c:if test="${resp.sqwOneIsFree}">
								<div class="freebutton" style="background-image: url(../../../res/img/xsmf.png);background-size: 52px;"></div>
							</c:if>
						</div>
					</div>
				</a></li>
				</c:if>
			</ul>
			<c:if test="${resp.flag}">
            <a href="javascript:void(0)" class="viewmore">查看更多推荐<span></span></a>
            </c:if>
		</div>
	<!-- new -->
	
	<a href="javascript:void(0)" class="vote">${"YES"==answer?"答 疑":"评 论"}</a>
</div>
<div class="voteList" style="position: static;">
	<div class="readListTit"><a href="javascript:void(0)" class="slidedownBtn"></a>${name}</div>
	<ul class="commentView" id="commentView">
	</ul>
	<ul class="commentView" id="dayiView">
	</ul>
</div>
<form class="editVote">
	<div class="editVoteBox">
		<div class="expressionList">
			<a href="javascript:void(0)" class="expression-aini" data-txt="[爱你]"></a>
			<a href="javascript:void(0)" class="expression-aixin" data-txt="[爱心]"></a>
			<a href="javascript:void(0)" class="expression-bukaixin" data-txt="[不开心]"></a>
			<a href="javascript:void(0)" class="expression-caimi" data-txt="[财迷]"></a>
			<a href="javascript:void(0)" class="expression-daxiao" data-txt="[大笑]"></a>
			<a href="javascript:void(0)" class="expression-fennu" data-txt="[愤怒]"></a>
			<a href="javascript:void(0)" class="expression-guzhang" data-txt="[鼓掌]"></a>
			<a href="javascript:void(0)" class="expression-hahaha" data-txt="[哈哈哈]"></a>
			<a href="javascript:void(0)" class="expression-haixiu" data-txt="[害羞]"></a>
			<a href="javascript:void(0)" class="expression-kaixin" data-txt="[开心]"></a>
			<a href="javascript:void(0)" class="expression-keai" data-txt="[可爱]"></a>
			<a href="javascript:void(0)" class="expression-koubi" data-txt="[抠鼻]"></a>
			<a href="javascript:void(0)" class="expression-ku" data-txt="[哭]"></a>
			<a href="javascript:void(0)" class="expression-kuu" data-txt="[酷]"></a>
			<a href="javascript:void(0)" class="expression-liuhan" data-txt="[流汗]"></a>
			<a href="javascript:void(0)" class="expression-se" data-txt="[色]"></a>
			<a href="javascript:void(0)" class="expression-shengqi" data-txt="[生气]"></a>
			<a href="javascript:void(0)" class="expression-tiaopi" data-txt="[调皮]"></a>
			<a href="javascript:void(0)" class="expression-touxiao" data-txt="[偷笑]"></a>
			<a href="javascript:void(0)" class="expression-weixiao" data-txt="[微笑]"></a>
			<a href="javascript:void(0)" class="expression-weiqu" data-txt="[委屈]"></a>
			<a href="javascript:void(0)" class="expression-yiwen" data-txt="[疑问]"></a>
			<a href="javascript:void(0)" class="expression-xinsui" data-txt="[心碎]"></a>
			<a href="javascript:void(0)" class="expression-baituo" data-txt="[拜托]"></a>
			<a href="javascript:void(0)" class="expression-shengli" data-txt="[胜利]"></a>
			<a href="javascript:void(0)" class="expression-zan" data-txt="[赞]"></a>
			<a href="javascript:void(0)" class="expression-pengchang" data-txt="[捧场]"></a>
		</div>
		<div class="expression" style='display:${"YES"==answer?"none":""}'></div>
		<div class="voteTxt">
			<a href="javascript:void(0)" class="pubBtn">发表</a>
			<div class="textarea">
				<textarea placeholder='${"YES"==answer?"答疑":"评论"}：' maxlength="120"></textarea>
				<span><i>0</i>／120</span>
			</div>
		</div>
	</div>
</form>
<!-- 静态数据 -->
	<input type="hidden" value="${courseId}" id="courseId">
	<input type="hidden" value="${isVip}" id="isVip">
	<input type="hidden" value="${isWeixin}" id="isWeixin">
	<input type="hidden" value="${nickname}" id="nickname">
	<input type="hidden" value="${album_url}" id="albumUrl">
	<input type="hidden" value="${userIdentity}" id="userIdentity">
	<input type="hidden" value="${babySex}" id="babySex">
	<input type="hidden" value="${babyAge}" id="babyAge">
	<input type="hidden" value="${playState}" id="playState">
	<input type="hidden" value="${auth}" id="auth">
	<input type="hidden" value="${once}" id="once">
	<input type="hidden" value="${uid}" id="uid">
	<input type="hidden" value="${answer}" id="answer">
<jsp:include page="../pay/coupon.jsp">
	<jsp:param value="COURSE" name="businessType"/>
	<jsp:param value="${imgUrl}" name="imgUrl"/>
	<jsp:param value="${name}" name="name"/>
	<jsp:param value="0" name="count"/>
	<jsp:param value="${money}" name="money"/>
	<jsp:param value="${courseId}" name="bizId"/>
</jsp:include>
<script type="text/javascript">
$(function(){
	$(".payBtn").click(function(){
		 if(isWeixin!="true"){
			  toast("请您进入微信支付");
			  return false;
		 }
		showCoupon(callbackPay,".wrap");
	});
})

function callbackPay(id){
	var isVip = '${isVip}';
	var type = 'ONCE';
	if(isVip){
		type = 'BUY';
	}
	 var money = '${money}';
	 var body = "单次购买课程【￥"+money+"】";
		 wxmppay(money,body,courseId,type,id,function(orderId,result){
			 if(result=="ok"){
				 var tourl = "/yzmm/account/course/jump/${courseId}";
			 	window.location.href="/yzmm/wxmppay/order/checkPay?couponId="+id+"&orderId="+orderId+"&toPage="+tourl;
			 }
		 });
	}
</script>
<!-- 导航栏 -->
<jsp:include page="/pages/header_footer.jsp">
		<jsp:param value="2" name="menu"/>
</jsp:include>

<script src='<b:staticUrl>/res/js/scrollpaginationme.js</b:staticUrl>'></script>
<script src='<b:staticUrl>/res/js/subject.js</b:staticUrl>'></script>
<script src='<b:staticUrl>/res/js/clickmore.js</b:staticUrl>'></script>
<script src="<b:staticUrl>/res/js/wxmppay.js</b:staticUrl>"></script>
<script src='<b:staticUrl>/res/js/course/live_prepare_course.js</b:staticUrl>'></script>
<script type="text/javascript">
$(function(){
	//初始化会期连接
	$(".shareNote").bind("click",function(){
		HH.href("/yzmm/account/course/share/placard?courseId="+courseId);
		return;
	})
	//是否处于会期期间
	var activeShareActivity = "${activeShareActivity}";
	if("true" == activeShareActivity){
		$(".shareNote").show();
	}
});

</script>
</body>
</html>