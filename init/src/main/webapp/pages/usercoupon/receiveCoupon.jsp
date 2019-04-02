<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head lang="en">
<meta charset="UTF-8">
<title>喵姐早教说</title>
<%@include file="../header_v2.4.0.jsp" %>
<link rel="stylesheet" href="<b:staticUrl>/res/css/voucher.css</b:staticUrl>">
</head>
<body style="background-color: rgba(255, 222, 85, 1);">
    <div class="page">
        <div class="public">
            <!--顶部的头像和信息-->
            <div class="userInfo clearfix">
                <div class="headImg">
                    <img src="${album}">
                </div>
                <div class="content">
                    <p>Hi~我在喵姐早教说找到私人育儿顾问，每天解决一个育儿难题，感觉很不错，送你一张
		     	<c:choose>
				<c:when test="${couponType=='CASH'}">
					现金券
				</c:when>
				<c:when test="${couponType=='SINGLE'}">
					抵扣劵
				</c:when>
				<c:otherwise>
					优惠券
				</c:otherwise>
			</c:choose>
		     快来试试看吧！</p>
                </div>
            </div>
            <!--提问券-->
            <div class="voucher">
                <div class="voucherTop">
                    <img src="<b:staticUrl>/res/img/center/couponImg.png</b:staticUrl>" alt="">
		    	<c:choose>
				<c:when test="${couponType=='CASH'}">
					<h1><i>￥</i><c:out value="${couponPrice}"></c:out></h1>
				</c:when>
				<c:when test="${couponType=='SINGLE'}">
					<h1><c:out value="${couponName}"></c:out></h1>
				</c:when>
			</c:choose>
		    	<p class="top">
				喵姐早教说-
				<c:choose>
					<c:when test="${businessType=='YEARCARD'}">VIP会员卡专场</c:when>
					<c:when test="${businessType=='COURSE'}">喵姐说专场</c:when>
					<c:when test="${businessType=='COURSEPACKAGE'}">喵姐说专场</c:when>
					<c:when test="${businessType=='MIAOQA'}">1对1咨询专场</c:when>
					<c:when test="${businessType=='GODDESSACTIVITY'}">行动计划专场</c:when>
					<c:when test="${businessType=='ALL'}">全网通</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${couponType=='CASH'}">现金券</c:when>
					<c:when test="${couponType=='SINGLE'}">兑换券</c:when>
				</c:choose>
			</p>
		    	<c:choose>
			<c:when test="${not empty showContent}">
				<p class="time"><c:out value="${showContent}"></c:out></p>
				<p class="bottom"><a href="/yzmm/index">进入喵姐早教说</a></p>
			</c:when>
			<c:when test="${not empty leaveSecond}">
				<p class="leaveSecond time">剩余领取时间：  71 时 18 分 23 秒</p>
				<p class="tourl bottom"><a href="/yzmm/account/usercoupon/receiveCoupon?useCouponId=${useCouponId}">立即领取</a></p>
				<script type="text/javascript">
				$(function(){
					var time='${leaveSecond}';//倒计时
					var timer=null;
					clearInterval(timer);
					timer = setInterval(function(){
						if(time<0){
							clearInterval(timer);
							$(".leaveSecond").html("您超时未领取，优惠券已过期");
							$(".tourl").html("<a href='/yzmm/index'>进入喵姐早教说</a>");
						}
						--time;
						var hh = parseInt(time/3600)
						var mm=parseInt(time%3600/60);
						var ss=parseInt(time%3600%60);
						var timetext = "";
						if(hh){
							timetext+=hh+' 时';
						}
						if(mm){
							timetext+=mm+' 分';
						}else{
							if(hh){
								timetext+=' 0分';
							}
						}
						if(ss){
							timetext+=ss+" 秒";
						}else{
							if(mm){
								timetext+=' 0秒';
							}
						}
						$('.leaveSecond').text("剩余领取时间：  "+timetext);
					},1000);
				});
				</script>
			</c:when>
			<c:otherwise>
				<p class="time">您超时未领取，优惠券已过期</p>
				<p class="bottom"><a href="/yzmm/index">进入喵姐早教说</a></p>
			</c:otherwise>
		</c:choose>
        </div>
            </div>
            <div class="cntBlock cntBlockOne">
                <div class="cntTitle">
                    <span class="title"><b>喵姐早教说：</b></span>
                </div>
                <div class="cntContent">
                    <p>喵姐27年早教经验，打造的家庭教育必听课程</p>
                    <p>宝宝0-6岁所有遇见问题的权威答疑库</p>
                    <p>和2000万辣妈一起，培养乐观有竞争力的精英宝宝</p>
                </div>
            </div>
            <div class="cntBlock">
                <div class="cntTitle">
                    <span class="title"><b>特色内容：</b></span>
                </div>
                <div class="cntContent">
                    <table>
                        <tbody><tr>
                            <th rowspan="2" valign="top"><img alt="" src="<b:staticUrl>/res/img/center/u849.png</b:staticUrl>"></th>
                            <td><b>微课</b></td>
                        </tr>
                        <tr>
                            <td><p>让你迅速了解宝宝心里特点，避免错误的教育方式留下遗憾。</p></td>
                        </tr>
                        <tr style="height: 0.5rem;"><td></td></tr>
                        <tr>
                            <th rowspan="2" valign="top"><img alt="" src="<b:staticUrl>/res/img/center/8minyuer.png</b:staticUrl>"></th>
                            <td><b>8分钟经典育儿</b></td>
                        </tr>
                        <tr>
                            <td><p>每周一到周五，从操作方法到背后原理，喵姐手把手教你养孩子。</p></td>
                        </tr>
                        <tr style="height: 0.5rem;"><td></td></tr>
                        <tr>
                            <th rowspan="2" valign="top"><img alt="" src="<b:staticUrl>/res/img/center/sqwdayi.png</b:staticUrl>"></th>
                            <td><b>3000问答疑</b></td>
                        </tr>
                        <tr>
                            <td><p>有问题立马查询靠谱答案，更有12次机会专家一对一为你答疑。</p></td>
                        </tr>
                        <tr style="height: 0.5rem;"><td></td></tr>
                        <tr>
                            <th rowspan="2" valign="top"><img alt="" src="<b:staticUrl>/res/img/center/zycp.png</b:staticUrl>"></th>
                            <td><b>专业测评</b></td>
                        </tr>
                        <tr>
                            <td><p>让你了解宝宝的成长优势，自己的教育风格，大数据为宝宝的未来保驾护航。</p></td>
                        </tr>
                        <tr style="height: 0.5rem;"><td></td></tr>
                        <tr>
                            <th rowspan="2" valign="top"><img alt="" src="<b:staticUrl>/res/img/center/ztkcpackage.png</b:staticUrl>"></th>
                            <td><b>主题课程</b></td>
                        </tr>
                        <tr>
                            <td><p>完全根据自身需求选择，发挥宝宝优势，弥补宝宝成长短板。</p></td>
                        </tr>
                    </tbody></table>
                </div>
                
            </div>
            <div class="cntBlock">
                <div class="cntTitle">
                    <span class="title"><b>你将获得：</b></span>
                </div>
                <div class="cntContent">
                    <p> 移动的“育儿百科全书”，解决所有关于家庭教育的烦恼，成为科学养育的“好妈妈”！</p>
                </div>
            </div>

            <div class="morecoupon">
                <div class="subtitle"><span>优惠券使用说明</span></div>
            </div>

            <div class="ruleDesc">
                    <p>1、每张优惠券只可赠送1次，只限1对1赠送，不可多人重复领取；</p>
                    <p>2、获赠者需在优惠券有效期内使用，过期自动失效；</p>
                    <p>3、优惠券仅可使用于喵姐早教说平台线上收费项目，优惠券不设找零机制，消费金额 小于优惠券面值时系统会一次性抵扣；</p>
                    <p>4、现金券需在活动页面填写手机号领取并激活账户；</p>
                    <p>5、优惠券到账后会有微信消息提醒，请务必已关注【喵姐早教说会员号】才会收到消息通知；</p>
                    <p>6、优惠券查看方式：喵姐早教说会员号-个人中心-优惠券；</p>
                    <p>7、喵姐早教说可在法律允许的范围内对本次活动规则进行解释。</p>
            </div>
        </div>
	</div>
</body>
</html>