<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
	<meta name="format-detection" content="telephone=no,address=no,email=no">
	<title>喵姐早教说</title>
	<%@include file="../header_v2.0.jsp"%>
<%@include file="../header_wxjsapi.jsp"%>
	<link rel="stylesheet" type="text/css" href="<b:staticUrl>/res/css/share_mjs.css</b:staticUrl>" />
	<link rel="stylesheet" type="text/css" href="<b:staticUrl>/res/css/animate.css</b:staticUrl>" />
    <link rel="stylesheet" type="text/css"  href="<b:staticUrl>/res/css/animator.css</b:staticUrl>" >
    <script src="<b:staticUrl>/res/js/scrollpaginationme.js</b:staticUrl>"></script>
    <script src="<b:staticUrl>/res/js/vote.js</b:staticUrl>"></script>
    <script src="<b:staticUrl>/res/js/reward.js</b:staticUrl>"></script>
    <style type="text/css">
		.liveVedio{
		    max-width: 540px;
		    max-height:300px;
		    position: relative;
		    z-index: 2;
		}
		.liveVedio video{
			max-height:300px;
		}
		.over{
		    max-width: 540px;
		    width:100%;
		    height:200px;
		    position: relative;
		    z-index: 2;
		    display: none;
		    color: white;
		    font-size: 32px;
		    text-align: center;
		    padding-top: 100px;
		}
    </style>
</head>
<body>
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
</script>
<div class='over'>直播结束~</div>
<c:if test="${isWeb}">
<div class="liveVedio">
	<div id="playercontainer"></div>
</div>
    <script type="text/javascript" src="<b:staticUrl>/res/player/cyberplayer.js</b:staticUrl>"></script>
    <script type="text/javascript">
        var myPlayer = cyberplayer("playercontainer").setup({
      	  	width: 540,
            height: 300,
            stretching: "uniform",
            file: "${playUrl}",
            autostart: false,
            repeat: false,
            volume: 100,
            controls: true,
            barLogo:false,
            ak: '${baiduoak}' // 公有云平台注册即可获得accessKey
        });
        myPlayer.on('ready', function () {
	        	if('PLAYING'=='${playState}' && 'true' == '${auth}'){
	        		myPlayer.play();
	        	}
   		});
        myPlayer.on('play', function () {
    			initLiveVote();
		});
    	 
    </script>
</c:if>

<c:if test="${not isWeb }">
<div class="liveVedio">

<%-- <video id="audio"  width="100%"  data-setup="{}" webkit-playsinline="true" x-webkit-airplay="true" x5-video-player-type="h5" playsinline width="100%"   controls="controls" autoplay="autoplay"  src="${playUrl}"></video> --%>
<video id="audio"  width="100%"  data-setup="{}" webkit-playsinline="true" x-webkit-airplay="true" x5-video-player-type="h5" playsinline  controls="controls" autoplay="autoplay">
<source src="${playUrl}">
</video>
</div>
<script type="text/javascript">
//播放器对象
var myPlayer = document.getElementById("audio");
$(function(){
	   
	   if('GAMEOVER' != '${playState}'){
		   if("${isWeixin}"=="false"){
		   		 myPlayer.play();
		    }else{
		   	 	document.addEventListener("WeixinJSBridgeReady", function () { 
		 		   myPlayer.play();
		 	    }, false);
		    }
			 myPlayer.addEventListener("play", function() {
				   initLiveVote();
			 }, false);
		}else{
			myPlayer.pause();
		}
	  
})

</script>
</c:if>
<script type="text/javascript">
function playover(){
	$(".liveVedio").hide();
		$(".over").show();
}
$(function(){
	if('GAMEOVER'=='${playState}'){
		playover();
 	}
})

</script>
<div class="courseScore" style="display:none;">
		<div class="courseScoreBox">
			<h3 class="tit">课程评分</h3>
			<h4 class="smallTit"><span>您的评分对我们很重要</span></h4>
			<div class="starlist">
				<span class="star"></span>
				<span class="star"></span>
				<span class="star"></span>
				<span class="star"></span>
				<span class="star"></span>
			</div>
			<P class="word"></P>
			<textarea placeholder="其他意见和建议都可以写这里呦~"></textarea>
			<a href="javascript:;" class="txtbtn">提 交</a>
		</div>
	</div>
	<div class="courseScore" style="display:none">
		<div class="courseScoreCirl">
			<img src="../../res/img/face.png">
			<p>收到评价！么么哒！</p>
			<p>我们会继续努力~</p>
		</div>
	</div>
<div class="live">
	<img src="${imgUrl}" class="livephoto" >
	<div class="liveTop" style="padding-top:0.16rem">
		<div class="liveNote" >
			<div class="photo"><img src="${tcAblumUrl}" ></div>
			<div class="tit">答疑开始啦</div>
			<span class="horn"></span>
		</div>
		<div class="scrollLive">
			<div class="scrollLiveList">
				<a href="#">${nickname}加入课程</a>
			</div>
		</div>
	</div>
	<div class="teaching">
		<div class="liveVote">
			<ul class="bb">
			</ul>
		</div>
		<div class="liveBottom">
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
				<div class="expression"></div>
				<div class="voteTxt">
					<a href="javascript:void(0)" class="pubBtn commentBtn">发表</a>
					<div class="textarea commentContent">
						<textarea placeholder="评论：" maxlength="120"></textarea>
						<span><i>0</i>／120</span>
					</div>
				</div>
				<c:if test="${isWeixin && !noBalance}">
					<a href="javascript:void(0)" class="reward t-reward">打赏</a>
				</c:if>
				<p id="flowercount" style="display:none;">8</p>
				<a href="javascript:void(0)" class="flower">送花</a>
			</div>
		</div>
	</div>
	<div class="answer" style="display: none;">
			<ul class="answerList">
			</ul>
			<div class="editVote" <c:if test="${'PLAYING' == playState}">style="display:block;"</c:if>>
			<div class="editVoteBox">
				<div class="voteTxt">
					<a href="javascript:void(0)" class="pubBtn questionBtn">发表</a>
					<div class="textarea questionContent">
						<textarea placeholder="请输入您的问题..." maxlength="300"></textarea>
						<span><i>0</i>／300</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="rewardLayer">
	<div class="rewardLayerBox">
		<h2><span class="heart"></span>请您选择愿意支付的价格</h2>
		<P>目前仅支持微信支付</P>
		<ul class="moneylist">
			<c:forEach items="${balanceList}" var="bal" varStatus="status">
				
				<li class="tip_cf<c:if test="${status.index==0}"> active</c:if>"  data-money='${bal}' data-body="打赏TA【￥${bal}】">
					<a href="javascript:void(0)">￥${bal}元  </a>
				</li>
			</c:forEach>
		</ul>
	</div>
</div>
<div class="main" style="display:none;">
	<div class="item1">
		<div class="kodai"></div>
		<div class="clipped-box"></div>
	</div>
</div>

<div class="votestr" style="display:none;"></div>
<div class="payover" style="display:none;"></div>
<a href="#" class="circleLayer" style="display:none"><img src="" ></a>
	<input type="hidden" value="${courseId}" id="courseId">
	<input type="hidden" value="${nickname}" id="nickname">
	<input type="hidden" value="${album_url}" id="albumUrl">
	<input type="hidden" value="${playState}" id="playState">
	<input type="hidden" value="${isVip}" id="isVip">
	<input type="hidden" value="${auth}" id="auth">
	<input type="hidden" value="${isWeixin}" id="isWeixin">
	<input type="hidden" value="${answer}" id="answer">
	<input type="hidden" value="${tcAblumUrl}" id="tcAblumUrl">
	<input type="hidden" value="${tcName}" id="tcName">
	<input type="hidden" value="${uid}" id="uid">
<script src="<b:staticUrl>/res/js/wxmppay.js</b:staticUrl>"></script>
<script src="<b:staticUrl>/res/js/course/money.js</b:staticUrl>"></script>
<script src="<b:staticUrl>/res/js/msgscroll.js</b:staticUrl>"></script>
<script src="<b:staticUrl>/res/js/course/live_playing_course.js</b:staticUrl>"></script> 
<script src="<b:staticUrl>/res/js/course/course_score.js</b:staticUrl>"></script>
</body>
</html>