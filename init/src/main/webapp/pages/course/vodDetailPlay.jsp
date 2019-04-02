<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <%@include file="../header_v2.0.jsp" %>
    <%@include file="../header_wxjsapi.jsp"%>
     <link rel="stylesheet" type="text/css" href="<b:staticUrl>/res/css/share_mjs.css</b:staticUrl>" />
     <link rel="stylesheet" href="<b:staticUrl>/res/css/animate.css</b:staticUrl>">
     <script src="<b:staticUrl>/res/js/vote.js</b:staticUrl>"></script>
     <script src="<b:staticUrl>/res/js/course/course_score.js</b:staticUrl>"></script>
     <script src="<b:staticUrl>/res/js/pageFmtDate.js</b:staticUrl>"></script>
    <title>喵姐早教说</title>
      <style type="text/css">
    	.videoDiv{
    		    width: 100%;
		    max-width: 540px;
		    /*min-height:${isWeb?"330":"220"}px;*/
		    margin: 0 auto;
		    position: relative;
		    /* overflow: hidden; */
    		}
    	.videsubjectBanneroDiv .video_con{
    	    width: 100%;/*
	    position: absolute;
	    left: 0;
	    bottom: 0;
	    z-index: 3;*/
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
<%@include file="../share_head.jsp"%>
<script type="text/javascript">
	//用户如果已登录，分享后跳转如中间页
	var uid = "${uid}";
	wxfenxiangcb_vodDtl={
			title: '${wxshare.title}', // 分享标题
			desc : '${wxshare.desc}',
		    link: '${wxshare.link}', // 分享链接
		    imgUrl: '${wxshare.imgUrl}', // 分享图标
		    shareTimeline:function(bool){
		    },
		    shareAppMessage:function(bool){
		    }
	};	
	initwxfx(wxfenxiangcb_vodDtl);
	var courseId='${courseId}';
	/*  需优化加载
		if(!la){
		toast("登陆后分享获取免费会员体验哦~.~");
		//延时1s等待wxjsp加载
		setTimeout(wxfenxiangcb.hideOptionMenu,1000);
	} */
</script>
<div class="wrap">
	<div class="${'VIDEO'==courseType and auth?'videoDiv':'subjectBanner'}">
		<c:if test="${'VIDEO' != courseType}">
			<div class="shareNote" style="display: none">分享赚会员期限,免费收听,戳我~</div>
		</c:if>
	    <input type="hidden" value="${courseId}" id="courselistmoreid">
	    <input type="hidden" id="auth" value="${auth}"/>
	    <c:choose>
	    	 <c:when test="${not isVip and not auth}">
	    	  <img id="video_class" src="${imgUrl}" >
	    	 <div class="subjectTit">
			   <div class="tit font19">${name}</div>
			   <c:if test="${not auth}">
					<div style="margin: 1rem;">
						<p style="color:red;font-size:21px;line-height:21px;">￥${money}<label style="font-size: 15px;line-height: 15px;color: white;">/会员免费</label></p>
					</div>
				</c:if>
		     </div>
	    	 </c:when>
	    	 <c:when test="${not auth}">
	    	  <img id="video_class" src="${imgUrl}" >
	    	  <div class="subjectTit">
			   <div class="tit2">${name}</div>
			   <p class="priceword">单次付费，永久收听</p>
			   <div class="price"><span>￥</span>${money}元</div>
			   <a href="javascript:void(0)" class="payBtn" data-money='${money}' data-body="单次购买课程【￥${money}】">支付</a>
		     </div>
	    	 </c:when>
	    	 <c:otherwise>
	    	 <c:if test="${'VIDEO' !=  courseType}">
	    	  	<img id="video_class" src="${imgUrl}" >
		    <div class="video_con">
			<div class="tit">${name}</div>
            <div class="audioBtn">
                <a href="javascript:void(0)" class="teach">讲课</a>
                <a href="javascript:void(0)" class="playBtn play"></a>
            <c:if test="${answer!=0}">
			    <a href="javascript:void(0)" class="answer" data-answer="${answer}">答疑</a>
			</c:if>
            </div>
            <audio id="audio" preload="auto" src="${playUrl}" ></audio>
            <div class="audioCont">
                <span class="txt">00·00</span>
                <div class="audioLine">
                    <div class="active"></div>
                    <a class="circle" id="drag"></a>
                </div>
                <span class="txt2"><c:out value="${timeLen}"></c:out></span>
            </div>
            </div>
            </c:if>
              	 <c:if test="${'VIDEO' ==  courseType}">
              	   <div>
			            <video id="audio" webkit-playsinline="true" x-webkit-airplay="true" x5-video-player-type="h5" playsinline preload="none" controls="controls" width="100%" poster="${imgUrl}">
			                <source src="${playUrl}" type="video/mp4">
			            </video>
		            </div>
              	 </c:if>
	         </c:otherwise>
		</c:choose>
	</div>
	<c:if test="${not auth}">
		<div class="subjectMeb">
			<a href="javascript:void(0)" class="remand payBtn" data-money="${money}" data-body="单次购买课程【￥${money}】">立即购买</a>
			<div class="name">单次付费，永久收听</div>
		</div>
	</c:if>
	<div class="subjectInfo">
			<c:choose>
	    	 <c:when test="${not isVip and not auth}">
	    	 <div class="streamTit2">
			     <a id="1" style="display:none;">目录</a>
			     <a id="2" onclick="courseDetail()" class="t-course">课程详情</a>
			     <a id="3" onclick="say()"  class="t-comment">评论(${commentCount})</a>
			     <a id="4" onclick="courseQA()" class="t-answer">答疑(${qaCount})</a>
		    </div>
	    	 </c:when>
	    	 <c:when test="${not auth}">
	        <div class="streamTit2">
	             <a id="1" style="display:none;">目录</a>
			     <a id="2" onclick="courseDetail()"  class="t-course">课程详情</a>
			     <a id="3" onclick="say()" class="t-comment">评论(${commentCount})</a>
			     <a id="4" onclick="courseQA()" class="t-answer">答疑(${qaCount})</a>
		     </div>
	    	 </c:when>
	    	 <c:otherwise>
	        <div class="streamTit">
		       <a id="1" style="display:none;">目录</a>
			   <a id="2" onclick="courseDetail()" class="t-course">课程详情</a>
			   <a id="3" onclick="say()"  class="t-comment">评论<span id="commentCountSpan">(${commentCount})</span></a>
			   <a id="4" onclick="courseQA()" class="t-answer">答疑(${qaCount})</a>
			   <a id="5" class="t-reward" style="display: ${not auth ? 'none' : ''}">打赏</a>
	        </div>
	         </c:otherwise>
		</c:choose>
		<div class="streamMeb" onclick="subjectbtn();" style="float: right;">
			<a  class="subjectBtn" >课程列表</a>
		</div>
		<div class="desc">
		<div style="border-bottom: 5px solid #efeff4;">
			<div class="subtitle"><span>课程介绍</span></div>
			<div class="subjectDetail" style="margin-top: 20px;">
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
		</div>
		<input id="keyword" type="hidden" value="${resp.keyWord}">
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
								<div class="freebutton" style="background-image: url(../../../res/img/xsmf.png);background-size: 52px;"></div>
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
								<div class="freebutton" style="background-image: url(../../../res/img/xsmf.png);background-size: 52px;"></div>
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
						<div class="other" style="width: 50%;">时长:<span class="fmtDate_mmFssM">${resp.sqwThreeTimeCount}</span>
							<c:if test="${resp.sqwThreeIsFree}">
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
		
	</div>
	<!-- 课程列表 -->
	<div class="subjectList">
		<ul>
			<li><a href="#"><span></span>${name}</a></li>
		</ul>
		<ul class="ul">
			<li><a href="#"><span></span>${name}</a></li>
		</ul>
	</div>
	<div class="btn"><a href="javascript:void(0)" class="goback">取消</a></div>
	<!-- 答疑 -->
	<div class="voteList streamVote" >
			<ul id="QAId"></ul>
	</div>
	<!-- 评论 -->
	<div class="voteList streamVote" id="vodDetailPlayComment">
	<input type="hidden" id="commentCountSpan"/> 
			<ul id="courseComment"></ul>
	</div>

<form class="editVote" style="display: block;">
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
			<a href="javascript:void(0)" class="pubBtn">发表</a>
			<div class="textarea vodcomment">
				<textarea placeholder="评论：" maxlength="120"></textarea>
				<span><i>0</i>／120</span>
			</div>
		</div>
	</div>
</form>

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
<a id="sqwflag" style="display: none;">1</a>
<a id="courseflag" style="display: none;">1</a>
<a id="activityflag" style="display: none;">1</a>
<a id="topicflag" style="display: none;">1</a>
<!-- 导航栏 -->
<jsp:include page="/pages/header_footer.jsp">
		<jsp:param value="2" name="menu"/>
</jsp:include>
</div>
<jsp:include page="../pay/coupon.jsp">
	<jsp:param value="COURSE" name="businessType"/>
	<jsp:param value="${imgUrl}" name="imgUrl"/>
	<jsp:param value="${name}" name="name"/>
	<jsp:param value="${count}" name="count"/>
	<jsp:param value="${money}" name="money"/>
	<jsp:param value="${courseId}" name="bizId"/>
</jsp:include>
<script type="text/javascript">
var isWeixin = "${isWeixin}";
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
	 var type = 'ONCE';
	 var isVip = '${isVip}';
	if(isVip){
		type = 'BUY';
	}
	 var money = '${money}';
	 var body = "单次购买课程【￥"+money+"】";
	 wxmppay(money,body,courseId,type,id,function(orderId,result){
		 if(result=="ok"){
			 var tourl = "/yzmm/account/course/jump/${courseId}";
		 	window.location.href="/yzmm/wxmppay/order/checkPay?couponId="+id+"&orderId="+orderId+"&toPage="+tourl+"&courseId=${courseId}";
		 }
	 });
}
</script>
<script src='<b:staticUrl>/res/js/scrollpaginationme.js</b:staticUrl>'></script>
<script src='<b:staticUrl>/res/js/subject.js</b:staticUrl>'></script>
<script src='<b:staticUrl>/res/js/clickmore.js</b:staticUrl>'></script>
<script src='<b:staticUrl>/res/js/answer.js</b:staticUrl>'></script>
<script src='<b:staticUrl>/res/js/course/vod_comment.js</b:staticUrl>'></script>
<script type="text/javascript">
function tosqwcourse(obj){
	window.location.href="/yzmm/account/knowledge/viewDetail?knowledgeId="+$(obj).data('sqwmoreid');
}
//三千问推荐加载更多
var sqwSumFlag = 1;
function sqwSum(){
	var type ='SQW';
	var sqwsum=$("#sqwsum").val();
	var pageIndex=$("#sqwflag").html();
	  var keyword=$("#keyword").val();
	  var sqwOneId=$("#soneidinput").val();
	  var sqwTwoId=$("#stwoidinput").val();
	  var sqwThreeId=$("#sthreeidinput").val();
	if(sqwSumFlag==1){
		 HH.ajax({
			    url:'/yzmm/account/course/ajaxmoreknowledge',
			    data:{
			    	sum:sqwsum,
			    	courseId:courseId,
			    	keyWords:keyword,
			    	sqwOneId:sqwOneId,
			    	sqwTwoId:sqwTwoId,
			    	sqwThreeId:sqwThreeId
			    	},
			    callback:function(data,params){
			    	var h = "";
		   		if(data.success){
		   			sqwSumFlag = 2;
		   			var len = data.list.length;
						for(var i=0;i< len;i++){
							var o = data.list[i];
							if(o.sqwOneTitle!=null){
							    h+='<li class="moresanqianwenlist"><a onclick="tosqwcourse(this);" data-sqwmoreid="'+o.sqwOneId+'" >';
								h+='<div class="photo"><img src="'+o.sqwOneImg+'" ></div>';
								h+='<div class="info">';
							    h+='<h2><span class="hottag"></span>'+o.sqwOneTitle+'</h2>';
								h+='<div class="other">推荐'+o.sqwOneAge+'岁<span class="num">'+o.sqwOneListenCount+'人听过</span></div>';
								
								let obj=getDateObject(o.sqwOneTimeCount);
								h+='<div class="other" style="width: 50%;">时长:<span class="fmtDate_mmFssM">'+(obj.mm?parseInt(obj.mm)+'分':'') + (obj.ss?obj.ss+'秒':'')+'</span>';
								if(o.sqwOneIsFree){
									h+='<div class="freebutton" style="background-image: url(../../../res/img/xsmf.png);background-size: 52px;"></div>';
								}
								h+='</div>';
								
								h+='</div></a></li>'; 
							}
						} 
		   		}
		   		$("#sqwandid").append(h);
			    }
		    });
	}else{
		sqwSumFlag = 1;
		$(".moresanqianwenlist").hide();
	}
}
function tocourselist(obj){
	window.location.href="/yzmm/account/course/toCoursePath?courseId="+$(obj).data('coursemoreid');
}
//课程加载更多
var coursemoreflag = 1;
function coursemore(){
	var type ='COURSE';
	var pageIndex=$("#courseflag").html();
	var keyword=$("#keyword").val();
	 if(coursemoreflag==1){
		 HH.ajax({
			    url:'/yzmm/account/course/ajaxmoretopicandactivity',
			    data:{
			    	type:type,
			    	courseId:courseId,
			    	keyWords:keyword
			    	},
			    callback:function(data,params){
			    	var h = "";
		   		if(data.success){
		   			coursemoreflag = 2;
		   			var len = data.list.length;
						for(var i=0;i< len;i++){
							var o = data.list[i];
							if(o.courseOneTitle!=null){
								 h+='<li style="height:4.6rem;" class="morecourselist"><a onclick="tocourselist(this);" data-coursemoreid="'+o.courseOneId+'">';
							     h+='<div class="photo"><span><img src="'+o.courseOneImg+'" ></span></div>';
							     h+='<p>'+o.courseOneTitle+'</p>';
							     if(o.courseMoney){
							    	 h+='<label style="float: right;font-size: 0.32rem;margin-right: 5px;color: red;"><i>￥</i><em>'+o.courseMoney+'</em></label>';
							     }
							     h+='</a></li>';	
							}
						} 
		   		}
		   		var x=$("#courseflag").html();
		   	    x=parseInt(x)+1;
		   	    $("#courseflag").html(x);
		   		$("#courseandid").append(h);
			    }
		    });
	 }else{
		 coursemoreflag = 1;
		 $(".morecourselist").hide();
	 }
}
function totopic(id) {
	window.location = "/yzmm/account/miao/topic/viewDetailIncludeReply?id="+id;
}

</script>
<script type="text/javascript">
$(function(){
	$(".tip_cf").click(function(){
		//alert("${isWeixin}");
		if("${isWeixin}"!="true"){
			toast("请您进入微信支付");
			return false;
		}
		var obj = $(this);
		var content = "￥"+obj.data("money");
		//alert(content);
		wxmppay(obj.data("money"),obj.data("body"),"${courseId}","RED",null,function(orderId,result){
			if(result=="ok"){
				HH.ajax({
		   			waiting:false,
					url:'/yzmm/account/comment/sendComment', 
					data:{
						courseId:'${courseId}',
						courseType:'LIVE',
						commentType:'TIP',
						content:content,
						commentStatus:'USE'
						}, 
					callback:function(data){
						//本地添加
						//前端显示
					 	var nickname = "${nickname}";
					 	var createTime = fmtDate(new Date(),"HH:mm:ss");
					 	var albumUrl = "${album_url}";
					 	var commentType="TIP";
					 	toGethercommentsContent(data.list[i].nickname,data.list[i].commentType,data.list[i].content,commentId);
					 	var contentAll = toGethercommentsContent(nickname,'TIP',content,null);
					 	$(".bb").append(contentAll);
					}
				});
			}
		});
	   
	});
});
</script>
<script type="text/javascript">
var playqaobj = "";
var qaaudio;
$(function(){
    HH.ajax({
    	url:'/yzmm/account/course/ajaxrecommend',
	    data:{courseId:courseId},
		 callback: function(data,params){
			 h="";
			 if(data.success){
				 var len = data.list.length;
			     for(var i=0;i<len;i++){
				 var o = data.list[i];
				 h +='<input type="hidden" id="keyWord" value="'+o.keyWord+'">';
				 if(o.courseOneTitle!=null){
					 h+='<div class="section" style="display:none;">';
				     h+='<div class="sectionTit">';
				     if(o.courseCount!=null){
				    	 h+='<a onclick="coursemore()" class="more">';
					     h+='相关<span class="txtyellow" id="coursemore" value="'+o.courseCount+'">'+o.courseCount+'节</span>课程';
					     h+='</a>';
				     }
				     h+='<span class="icon-speak"></span>喵姐说';
				     h+='</div>';
				     h+='<ul class="speakList" id="courseandid">';
				     if(o.courseOneTitle!=null){
				    	  h+='<li style="height:4.6rem;"><a onclick="toVod(this);" data-courseid="'+o.courseOneId+'">';
						  h+='<div class="photo"><span><img src="'+o.courseOneImg+'" ></span></div>';
						  h+='<p>'+o.courseOneTitle+'</p>';
						  if(o.courseMoney){
						    	 h+='<label style="float: right;font-size: 0.32rem;margin-right: 5px;color: red;"><i>￥</i><em>'+o.courseMoney+'</em></label>';
						     }
						  h+='</a></li>';
				     }
				     if(o.courseTwoTitle!=null){
				    	 h+='<li style="height:4.6rem;"><a onclick="toVod(this);" data-courseid="'+o.courseTwoId+'">';
					     h+='<div class="photo"><span><img src="'+o.courseTwoImg+'" ></span></div>';
						 h+='<p>'+o.courseTwoTitle+'</p>';
						 if(o.courseMoney2){
					    	 h+='<label style="float: right;font-size: 0.32rem;margin-right: 5px;color: red;"><i>￥</i><em>'+o.courseMoney2+'</em></label>';
					     }
						 h+='</a></li>';
					     h+='</ul></div>';
				     }
				 }
				 if(o.activityTitle!=null){
					 h+='<div class="section" style="display:none;">';
				     h+='<div class="sectionTit">';
				     if(o.activityCount!=null){
				    	 h+='<a class="more">';
					     h+='相关<span class="txtyellow" id="activitymore" value="'+o.activityCount+'">'+o.activityCount+'期</span>活动';
					     h+='</a>';
				     }
				     h+='<span class="icon-activity"></span>喵活动';
				     h+='</div>';
				     h+='<ul class="activityList" id="activityandid">';
				     h+='<li onclick=toactivitycourse() >';
				     h+='<input type="hidden" value="'+o.activityId+'" id="actid">';
				     h+='<div class="photo"><a href="#"><img src="'+o.activityImg+'" ></a></div>';
				     h+='<div class="info">';
				     h+='<h2 class="tit">'+o.activityTitle+'</h2>';
				     h+='<p>时间：'+o.activityStartTime+'－'+o.activityEndTime+'</p>';
				     h+='<div class="other"><a href="#" class="join">我要参与</a>会员价：￥'+o.activityMoney+'元</div>';
				     h+='</div></li></ul></div>';
				 }
				 if(o.topicOneTitle!=null){
					 h+='<div class="section sectionBorder0" style="display:none;">';
				     h+='<div class="sectionTit">';
				     if(o.topicCount!=1){
				    	  h+='<a class="more">';
						  h+='相关<span class="txtyellow" id="topicmore" value="'+o.topicCount+'">'+o.topicCount+'场</span>话题';
						  h+='</a>'; 
				     }
				     h+='<span class="icon-topic"></span>喵话题';
				     h+='</div>';
				     h+='<ul class="activityList" id="topicandid">';
				     h+='<li onclick=totopic('+o.topicOneId+')>';
				     h+='<div class="photo"><a ><img src="'+o.topicOneImg+'" ></a></div>';
					 h+='<div class="info">';
					h+='<p class="word">'+o.topicOneTitle+'</p>';
					h+='<div class="num">'+o.topicOnePv+'人看过</div>';
					h+='</div></li>';
					 if(o.topicTwoTitle!=null){
						  h+='<li>';
						    h+='<div class="photo"><a><img src="'+o.topicTwoImg+'" ></a></div>';
							h+='<div class="info">';
							h+='<p class="word">'+o.topicTwoTitle+'</p>';
							h+='<div class="num">'+o.topicTwoPv+'人看过</div>';
							h+='</div></li>'; 
					 }
					 if(o.topicThreeTitle!=null){
						  h+='<li>';
						    h+='<div class="photo"><a ><img src="'+o.topicThreeImg+'" ></a></div>';
							h+='<div class="info">';
							h+='<p class="word">'+o.topicThreeTitle+'</p>';
							h+='<div class="num">'+o.topicThreePv+'人看过</div>';
							h+='</div></li>';
					 }
					 h +='<input type="hidden" id="keyWord" value="'+o.keyWord+'">';
					h+='</ul></div>';
				 }
				}
			 }
          $(".subjectInfo").append(h);
		 }
	 });
});
function toactivitycourse(obj){
	var id=$("#actid").val();
	window.location ="/yzmm/account/course/toactivitypath?activityId="+id;
}
$("#soneid").click(function(){
	var id=$("#soneidinput").val();
	window.location ="/yzmm/account/knowledge/viewDetail?knowledgeId="+id;
});
$("#stwoid").click(function(){
	var id=$("#stwoidinput").val();
	window.location ="/yzmm/account/knowledge/viewDetail?knowledgeId="+id;
});
$("#sthreeid").click(function(){
	var id=$("#sthreeidinput").val();
	window.location ="/yzmm/account/knowledge/viewDetail?knowledgeId="+id;
});
function toVod(obj){
	window.location.href="/yzmm/account/course/toCoursePath?courseId="+$(obj).data('courseid');
}

var sm = {};
function courseQA(){
	var pageIndex = 1;
	$("#2").removeClass("active");
    $("#3").removeClass("active");
    $("#4").addClass("active");
    $("#5").removeClass("active");
    $(".editVote").hide();
    $(".section").hide();
    $(".streamMeb").hide();
    $(".desc").hide();
    $(".relaTit").hide();
    $("#QAId").show();
    $(".sectionBorder0").hide();
    //推荐隐藏
    $("#sqwstart").hide();
    //评论列表隐藏
    $("#vodDetailPlayComment").hide();
	sm = $(window).scrollme({
		target:$("#QAId"),
	    url:'/yzmm/qa/ajaxstaticQaList',
	    data:{courseId:courseId,pageIndex:pageIndex,pageSize:10},
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
					h +='<li class="li'+params.pageIndex+'">'
					h +='<div class="photo"><img src="'+o.albumUrl+'"></div>'
					h +='<div class="voteInfo">'
					h +='<div class="name">'+o.nickname+'</div>'
					h +='<div class="other">'
						if(o.userIdentity=='GRAVIDA'){
							h+='<span class="icon-yun"></span>已怀孕 ';
							if(o.babyAge){
								h+=o.babyAge;
							}
						}else if(o.userIdentity=='MOM'){
							if(o.babySex){
								if(o.babySex=='小王子'){
									h+='<span class="icon-boy"></span>小王子 ';
								}else if(o.babySex=='小公主'){
									h+='<span class="icon-girl"></span>小公主 ';
								}
							}
							if(o.babyAge){
								h+=o.babyAge;
							}
						}
						
					h+='</div>';
					h +='<div class="word">'+o.question+'</div>'
					if(o.answerVoice!=null){
						h +='<div class="voice">'
						h +='<div class="voicephoto"><img src="${tcAblumUrl}" ></div>'
						h +='<div  data-url="'+o.answerVoice+'" onclick="playqa(this)" data-id="'+o.id+'" style="cursor: pointer;" class="voicemsg '+o.hasTime+'"><span class="voicebar"></span><span class="time">'+o.voiceLong+'</span></div>';
					    h +='</div>';
					}
					h +='</div></li>';
				} 
				 
				$("#QAId").append(h);
    			}
	    }
	 });
	 sm.reload();
}
function playqa(obj){
	  if("${auth}"!="true"){
		  toast("喵~请先喂(qu)猫(zhi)粮(fu)");
		  return;
	  } 
	  if(!obj){
		  return;
	  }
	  if($("#audio").size()){
		  $("#audio").get(0).pause();
		  $(".playBtn").removeClass("pause");
		  $(".playBtn").addClass("play");
	  }
	  initqaaudio();
	  if(playqaobj){
		  if(obj != playqaobj){
			  qaaudio.pause();
			 $(playqaobj).removeClass("active")
		  }
	  }
	  playqaobj = obj;
	  qaaudio.src =  $(playqaobj).data("url");
	  if(!$(playqaobj).hasClass("active")){
		  qaaudio.play();
		  $(playqaobj).addClass("active")
		  addTimelen();
	  }else{
		  qaaudio.pause();
		  $(playqaobj).removeClass("active")
	  }
}
	  function initqaaudio(){
		  if(!qaaudio){
			 $('body').append('<audio id="qaaudio" src="" preload="none" controls="controls" style="display: none;"></audio>');
			 qaaudio = document.getElementById("qaaudio");
		  }
	  }
	  
	  function addTimelen(){
			var obj = $(playqaobj);
			var a = qaaudio;
			if(a && !obj.hasClass("time")){
				window.setTimeout(function() {
					if(isNumeric(a.duration)){
						var duration = a.duration;
						var o = obj;
						o.addClass("time");
						 if(duration){
							 HH.ajax({
								   waiting:false,
								   url: "/yzmm/qa/ajaxAddTime",
								   data: {id:obj.data("id"),time:duration},
							});
						 }
					}
				}, 2000);
			}
		}
</script>
<script type="text/javascript">
$(function(){
	courseDetail();
});

function courseDetail(){
	$("#2").addClass("active");
    $("#3").removeClass("active");
    $("#4").removeClass("active");
    $("#5").removeClass("active");
    $(".editVote").hide();
    $(".streamMeb").show();
    $(".desc").show();
    $(".relaTit").show();
    if($(".viewmore").length == 0){
    	$(".section").show();
    }
     //评论列表隐藏
    $("#vodDetailPlayComment").hide();
    $("#QAId").hide();
    $("#sqwstart").show();
}
function say(){
	var pageIndex = 1;
	$("#2").removeClass("active");
    $("#3").addClass("active");
    $("#4").removeClass("active");
    $("#5").removeClass("active");
    $(".editVote").show();
    $(".section").hide();
    $(".streamMeb").hide();
    $(".desc").hide();
    $(".relaTit").hide();
    $("#QAId").hide();
    //评论列表隐藏
    $("#vodDetailPlayComment").show();
    //隐藏推荐
    $("#sqwstart").hide();
}

function reload(){
	pageIndex = 1;
	sm.reload({pageIndex:1});
}
function toVod(obj){
	window.location.href="/yzmm/account/course/toVodDetail?courseId="+$(obj).data('courseid');
}

</script>
<script src="<b:staticUrl>/res/js/wxmppay.js</b:staticUrl>"></script> 
<c:if test="${auth}">
<script src="<b:staticUrl>/res/js/streamAudio_mjs_heartbeat.js</b:staticUrl>"></script>
</c:if>
<script src="<b:staticUrl>/res/js/subject.js</b:staticUrl>"></script>
<script src="<b:staticUrl>/res/js/reward.js</b:staticUrl>"></script>
<%-- <script src='<b:staticUrl>/res/js/answer.js</b:staticUrl>'></script> --%>
<script type="text/javascript">
$(function(){
	//初始化会期连接
	$(".shareNote").bind("click",function(){
		HH.href("/yzmm/account/course/share/placard?courseId="+courseId);
	})
});

//是否处于会期期间
var activeShareActivity = "${activeShareActivity}";
if("true" == activeShareActivity){
	$(".shareNote").show();
} 
/* //监听返回
$(function(){  
    pushHistory();  
    var bool=false;  
    setTimeout(function(){  
          bool=true;  
    },1500);
    window.addEventListener("popstate", function(e) {  
        //alert("我监听到了浏览器的返回按钮事件啦");//根据自己的需求实现自己的功能  
    	if(bool){
    		HH.href("/yzmm/account/course/list");
    	}
}, false);  
    function pushHistory() {
        var state = {  
            title: "title",  
            url: "#"  
        };  
        window.history.pushState(state, "title", "#");  
    }  
});   */
</script>
<script type="text/javascript">
	//评级类型
	var scoreType='VOD_SCORE';
	
	//播放器对象
	var myPlayer = document.getElementById("audio");
	var audioplaytime = {};
	//记录播放时间
	function uploadPlayTime(audio){
			HH.ajax({
				   waiting:false,
				   url: "/yzmm/account/course/mjsPlayTime",
				   data: {courseId:'${courseId}',start:audioplaytime["start${courseId}"],end:new Date().getTime(),duration:audio.duration,endCurrentTime:audio.currentTime,startCurrentTime:audioplaytime["currentTime${courseId}"]},
			});
	}
	$(function(){
		if("${auth}"!="true"){
			  return;
		} else{
			//扩展暂停与播放动作
			mjsAudioExtObj.extPlay = function(){
				//停止答疑
				if(qaaudio){
					qaaudio.pause();
					$(playqaobj).removeClass("active");
				}
				//播放记录时长
				audioplaytime["currentTime${courseId}"] = myPlayer.currentTime;
				var starttime = audioplaytime["start${courseId}"];
				if(!starttime){
					audioplaytime["start${courseId}"] = new Date().getTime();
				}
				return;
			}
			mjsAudioExtObj.extPause = function(){
				//记录播放时间
				uploadPlayTime(myPlayer);
				return;
			}
		}
	})
	
	
</script>
</body>
</html>