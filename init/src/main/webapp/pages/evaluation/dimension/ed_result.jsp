<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--忽略页面中的邮箱格式为邮箱-->
<meta name="format-detection" content="email=no"/>
 <%@include file="../../header_v2.0.jsp" %>
 <%@include file="../../header_wxjsapi.jsp"%>
 <script src="<b:staticUrl>/res/js/scroll.js</b:staticUrl>"></script>
 <link rel="stylesheet" href="<b:staticUrl>/res/css/activity-v2.0.css</b:staticUrl>" >
 <script src="<b:staticUrl>/res/js/evaluation/idenify.js</b:staticUrl>"></script>
<title>喵姐早教说</title>
<style type="text/css">
	p{
		font-size: 13px;
	}
	.section_top{
		text-align: center;
		padding: 0.7rem;
		background-color: rgba(250, 207, 67, 1); 
	}
	.section_top p{
		margin-top: 20px;
		color: white;
	}
	section h5{
		margin-top: 10px;
		color: white;
	}
	.topDiv{
	}
	.topDiv img{
		width:64px;
		height:105.5px;
		float: left;
	}
	.marginTop{
		margin-top:1.5rem;
	}
	.marginTop img{
		width:50px;
		height:50px;
		cursor: pointer;
	}
	.marginTop span{
		font-size:14px;
		cursor: pointer;
	}
	.idenify{
		float: left;
		width: 33.333%;
	}
	.span-prompt{
		font-size: 10px;
		color: #AEAEAE;
		text-align: center;
	}
	.tipInfo{
		bottom: 5px;
	    position: absolute;
	    margin: 0 auto;
	    width: 100%;
	    text-align: center;
	}
	.resultTop{
		padding-left: 20px;
		padding-right: 20px;
		padding-top: 10px;
	}
	.resultTop p{
		padding-bottom: 5px;
		border-bottom: 0.02rem solid #efeff4;
	}
	
	.resultTop b{
		margin-left: 0.3rem;
	}
	.resultCanvas{
		padding: 0px 20px 20px 60px;
		height: 4.4rem;
		width: 10.42rem;
	}
	.resultChart{
		height: 4.4rem;
		width: 7rem;
		padding: 0px 0 20px 1.08rem;
		margin: 40px 0px 20px 0px;
		border-top: 0.02rem solid #efeff4;
		border-left: 0.02rem solid #efeff4;
	}
	.resultRows{
		height: 0.22rem;
		margin: 0.3rem 0px 0px -1.93rem;
	}
	.resultRows span{
		height:0.25rem;
		font-size:0.25rem;
		float: left;
		margin-right: 0.1rem;
		color:#868686
	}
	.resultRows div{
		height: 0.3rem;
		float: left;
	}
	.score{
		width:5rem;
		background-color:rgba(250, 207, 67, 1);
	}
	
	.resultScale{
		margin: 0 0 0 -1.08rem;
	}
	.resultScale div{
		height: 0.3rem;
		float: left;
	}
	.resultScale span{
		position: absolute;
		font-size:0.25rem;
		margin-top: -0.38rem;
		color:#868686
	}
	.scale{
		width:1.6666666667rem;
	}
	.defen{
		margin-left: 2rem;
	}
	.centralAshing{
		font-size: 10px;
		text-align: center;
		margin: 0.35rem auto;
		color: #C9C9C9;
	}
	.analysis{
		border-top: 0.16rem solid #efeff4;
	}
	.analysisContent{
		padding: 0.4rem 0.9rem 0.7rem 0.99rem;
	}
	.analysisContent p{
		font-size:12px;
		color: #666666;
	}
	.showInfo{
		color:#FF9900;
		text-decoration:underline;
		text-align:center;
		font-size: 0.35rem;
		cursor: pointer;
	}
	i{
		margin-left: -0.7rem;
	}
	
	.foot{
	    width: 100%;
	    text-align: center;
	}
	.foot .comment{
	    font-size: 0.4rem;
	    line-height: 38px;
	    margin-top: 20px;
	    margin-left: auto;
	    margin-right: auto;
	    border: 1px solid #ff9900;
	    border-radius: 20px;
	    width: 177px;
	    height: 40px;
	    text-align: center;
	    color: #ff9900;
	}
</style>
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
initwxfx(wxfenxiangcb);
</script>
<!-- 头部222 -->
<section class="section_top">
<div class="topDiv">
	<img alt="" src="/../../../res/img/evaluation/result.png">
</div>
	<p style="font-size:14px;">${self?"您":userName}培养一个成功孩子的可能性：</p>
	<h5><i>${wdResult.score }%</i></h5>
 </section>
 <!-- 测评图表 -->
 <section>
 <div class="resultTop">
	 <p><b>测评结果</b></p>
	
 </div>
 <div class="resultCanvas">
 	<div class="resultChart"><!-- width:5rem; -->
 		<div class="resultScale"><div class="scale"></div><span>30分</span><div class="scale"></div><span>60分</span><div class="scale"></div><span>100分</span><span class="defen" style="margin-top: -0.21rem">得分</span></div>
 		 <c:forEach items="${resultMap}" var="item">
	 		<div class="resultRows"><span>${item.key }</span><div class="score" style="width:${item.value *(5/100)}rem"></div><span>&nbsp;&nbsp;${item.value }分</span></div>
		 </c:forEach>
 	</div>
 </div>
 <p class="centralAshing">*测评结果柱状数据图*</p>
 </section>
 
 <!-- 分析建议 -->
 <section class="analysis">
	<div class="resultTop">
		<p><b>分析 &amp; 建议</b></p>
	</div>
	<div class="analysisContent">
		<p>${adviceTxt }</p>
		<p>${analysisTxt1 }</p>
	</div>
	<%-- <c:if test="${!analysisTxt1.isEmpty()}">
		<div class="analysisContent">
			<p>${analysisTxt1 }</p>
		</div>
	</c:if> --%>
	
	<div class="showInfo">
		<span onclick="toDetail()">查&nbsp;看&nbsp;详&nbsp;情</span>
	</div>
	<div class="foot" style="display: ${self?'none':''}">
		<div class="comment" onclick="HH.href('/yzmm/account/evaluation/toWelcome?id=${cpId}');">我要测试</div>
	</div>
	<br>
 </section>
<jsp:include page="/pages/header_footer.jsp">
		<jsp:param value="4" name="menu"/>
</jsp:include>
 <script>
 	function toDetail(){
 		HH.href("/yzmm/account/evaluation/result/detail?resultId=${wdResult.id}&uid=${uid}");
 	}
 </script>
</body>
</html>
