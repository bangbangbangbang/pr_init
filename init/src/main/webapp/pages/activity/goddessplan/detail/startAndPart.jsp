<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="j" uri="/jsputil" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head lang="en">
<meta charset="UTF-8">
<title>女神行动计划</title>
<%@include file="../../../header_v2.1.jsp"%>
<%@include file="../../../header_wxjsapi.jsp"%>
<script src="<b:staticUrl>/res/js/scrollpaginationme.js</b:staticUrl>"></script>
<script src="<b:staticUrl>/res/js/package/activity/goddessplan/activity.js</b:staticUrl>"></script>
<script type="text/javascript" src="<b:staticUrl>/res/js/myaudio-v13.js</b:staticUrl>"></script>
<script src="<b:staticUrl>/res/js/custom/lightbox/lightbox.js</b:staticUrl>"></script> 
<script src="<b:staticUrl>/res/js/activity/goddessplan/detail/startAndPart.js</b:staticUrl>"></script>
<link rel="stylesheet" href="<b:staticUrl>/res/css/group.css</b:staticUrl>">
<link rel="stylesheet" href="<b:staticUrl>/res/css/myaudio.css</b:staticUrl>">
<script src="<b:staticUrl>/res/js/jquery.cookie.js</b:staticUrl>"></script>
<style>
.nozan {
  float: right;
    margin-right: 0.29333333rem;
    padding-left: 14px;
    background: url(/res/img/common/zanon@2x.png) left center no-repeat;
    background-size: 10px 11px;
}
.imglist {
    width: 100%;
    margin-top: 0.4rem;
	}
	imgitem {
	    float: left;
	    width: 33%;
	    height: 1.68rem;
	    margin-bottom: 0.4rem;
	}
	
	.imglist img {
	    display: block;
	    width: 2.24rem;
	    height: 1.68rem;
	    margin: 0 auto;
	    border-radius: 0px;
	}
	.publishVote .submit, .publishVote .cancle {
	    float: right;
	    width: 1.54666667rem;
	    height: 0.76rem;
	    line-height: 0.76rem;
	    margin-right: 0.4rem;
	    margin-top: 0.32rem;
	    background-color: #e51812;
	    border-radius: 6px;
	    text-align: center;
	    color: #fff;
	}
	.publishVote .cancle {
		    background-color: #666;
		}
	.wordTit {
	    width: 100%;
	    max-width: 540px;
	    margin: 0 auto;
	    margin-top: 0;
	    padding: 0;
	    color: #fff;
	    }
	.myaudio .bar div:first-child {
	    width: 2.8rem;
	}
	.myaudio .bar {
	    width: 2.8rem;
	}
	.myaudio .mywrap {
	    width: 7.35rem;
	}
	/** 英文换行 **/
	.voteword{
		word-break:break-all;
	}
	/**去掉图片上下的线条**/
	.imglist {
	    border-top: 0px solid #ccc; 
	    border-bottom: 0px solid #ccc; 
	    }
	.viewmore {
	    text-align: right;
	    margin-right: 11px;
	    margin-bottom: 10px;
	    float: none;
		}
		.imglist {
	    border-top: 0px;
	    border-bottom: 0px;
		}
	.evalute3{
		border-top: 0px;
	}
	.codeType{
	margin-top: 20px;
	text-align:center;
	color:#cccccc
	}
	.object-cont{
		padding-bottom: 5px;
	}
	.tutorbtn-already {
    	width: 1.86666667rem;
	    height: 0.66666667rem;
	    line-height: 0.66666667rem;
	    margin-top: -8px;
	  	 background-color: #ccc !important;
	    text-align: center;
	    border-radius: 0.16rem;
	    color: #fff !important;
	}
	.myaudio .mywrap{
	    margin-bottom: 0.32rem;
	}
	.font15 {
	  font-size: 15px;
	  line-height: 15px;
	}
	.font12 {
	  font-size: 12px;
	  line-height: 12px;
	}
	.font17{
	   font-size: 17px;
	      line-height: 17px;
	 }
	.juzhong{
		vertical-align: middle;
	    display: table-cell;
	    width: 760px;
    }
</style>
</head>
<body>
	<div class="activityBanner">
		<img src="${titleImg}" >
		<span class="rulebtn hdxz">活动细则</span>
		<div class="word">
			<h2>${topicTitle}</h2>
			<p><span></span><span id='dryy'></span></p>
		</div>
	</div>
	<div class="activityGB">
		<div class="tit">活动必听课程:</div>
		<div class=juzhong>
			<marquee scrollamount="4">
			<c:if test="${not empty relevanceTitle}">
			<c:if test="${activityType=='COURSE'}">
				<a href="/yzmm/wxmppay/vod?courseId=${relevanceId}"><c:out value="${relevanceTitle}"></c:out></a>
			</c:if>
			<c:if test="${activityType=='KNOWLEDGE'}">
				<a href="/yzmm/account/knowledge/viewDetail?knowledgeId=${relevanceId}"><c:out value="${relevanceTitle}"></c:out></a>
			</c:if>
		</c:if>
			</marquee>
		</div>
	</div>
	<div class="timelist">
		<div class="timelistBox">
			<c:forEach var="item" items="${activityList}" varStatus="i">
				<c:if test="${ i.index%7==0 }">
					<ul data-index='${i.index }' style="cursor: pointer;">
				</c:if>
					<li class="${item.isDoHomework}" data-activityid="${item.id }" data-datestring="${item.dateString }" data-topictitle="${item.topicTitle }">
						<a href="javascript:void(0)">
							<div class="date">${item.dateString}</div>
							<div class="num">${item.dayNumber} </div>
						</a>
					</li>
				<c:if test="${ (i.index+1)/7%1==0}">
					</ul>
				</c:if>
			</c:forEach>
		</div>
	</div>
	<div class="todayspeak">
		<div class="top">
			<a href="javascript:void(0)" class="nextweek">第周作业指导</a>
			<div class="photo"><img src="${tcablumUrl }" ></div>
			<span>导师今日说：</span>
		</div>
		<div class="audioItem">
			<audio class="pinglun topAudio" preload="none" style="visibility:hidden;" controls=""><source src=""></audio>
		</div>
		<div class="word" style="color: #a9a1a4">听听今天喵姐对你说了什么吧！</div>
	</div>
	<div class="tabTit">
		<a href="javascript:myHomework('${activityId}');">我的作业</a><span>|</span>
		<a href="javascript:meowClass('${activityId}')">喵班级</a>
	</div>
	<ul class="workList">
		  
	</ul>
	<a href="javascript:void(0)" class="writeBtn" style="cursor: pointer; display:none;">写作业</a>
	<jsp:include page="/pages/header_footer.jsp">
		<jsp:param value="3" name="menu"/>
	</jsp:include>
	<!--报名须知-->
	<div class="actlayer bmxz">
		<div class="activityruleBox">
			<a href="javascript:void(0)" class="close bmxz"></a>
			<h2 class="tit">活动细则</h2>
			<h3 class="stit">活动细则：</h3>
			<div class="word">
				<p>${activityRule }</p>
			</div>
		</div>
	</div>
	<!--作业补交卡-->
	<div class="actlayer zybjk" style="display:${jobMakeUpCard };">
		<div class="workcardBox">
			<a href="javascript:void(0)" class="close zybjkclose"></a>
			<div class="workcardBg"></div>
			<div class="word">
				<div class="tit">连续5天完成作业很棒哦</div>
				<p>作业补交卡可以在错过交作业时使用</p>
				<a href="javascript:void(0)" class="submitBtn">点击领取</a>
			</div>
		</div>
	</div>
	<%@include file="zuoyezhidao.jsp"%>
	<!--发表评论-->
	<form class="publishVote">
		<div class="font17 voteTit">发表评论</div>
		<div class="voteBox">
			<textarea class="font12" placeholder="请输入评论内容..." maxlength="120"></textarea>
			<span class="font12 num"><i>0</i> / 120</span>
		</div>
		<a href="javascript:void(0)"  class="font15 cancle" >取消</a>
		<a href="javascript:void(0)" onclick="doCommentText(this)" class="font15 submit" >发表</a>
	</form>
<script type="text/javascript">
//总活动id
var activityId='${activityId}';
//是否是特权用户
var isPrivilege = '${isPrivilege}';
//给图片绑定展示事件
initMyImgShow();
var totalDay='${activityCountDay}';

//活动状态
var activityStatue="${activityStatue}";
</script>
</body>
</html>