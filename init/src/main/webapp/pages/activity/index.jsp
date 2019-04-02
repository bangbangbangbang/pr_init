<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta name="format-detection" content="telephone=no" />
	<meta name="format-detection" content="email=no"/>
	<title>喵姐早教说</title>
	<%@include file="../header_v2.4.0.jsp" %>
	<%@include file="../header_wxjsapi.jsp"%>
 	<link rel="stylesheet" href="<b:staticUrl>/res/css/prekindergarten/index.css</b:staticUrl>">
    <script src="<b:staticUrl>/res/js/activity/activity.js</b:staticUrl>"></script>
    <link rel="stylesheet" href="<b:staticUrl>/res/css/activity-v2.0.css</b:staticUrl>">
    <style type="text/css">
   .fundPopup {
  display: none;
  width: 100%;
  max-width: 540px;
  margin: 0 auto;
  height: 100%;
  position: fixed;
  top: 0;
  z-index: 100;
  background-color: rgba(0, 0, 0, 0.6);
}
.fundPopup .popupBox {
  width: 100%;
  height: 100%;
  position: relative;
}
.fundPopup .popupBox .popupContent {
  width: 8rem;
  height: 10rem;
  background-color: #fff;
  position: absolute;
  top: 50%;
  left: 50%;
  padding: 0.4rem;
  margin-left: -4rem;
  margin-top: -6rem;
  -webkit-border-radius: 0.21333333rem;
  -moz-border-radius: 0.21333333rem;
  -o-border-radius: 0.21333333rem;
  border-radius: 0.21333333rem;
}
.fundPopup .popupBox .popupContent .contentImg {
  width: 3rem;
  display: block;
  margin: 0.66666667rem auto 0.4rem;
}
.fundPopup .popupBox .popupContent .contentTitH {
  text-align: center;
  font-size: 0.6rem;
  font-weight: bold;
}
.fundPopup .popupBox .popupContent .contentLook {
  padding: 0.4rem;
  color: #868686;
  line-height: 0.6rem;
  font-size: 0.38rem;
}
.fundPopup .popupBox .popupContent .shadoweBtn {
  width: 70%;
  display: block;
  padding: 0.25rem 0;
  margin: 0.5rem auto;
  text-align: center;
  -webkit-border-radius: 1.33333333rem;
  -moz-border-radius: 1.33333333rem;
  -ms-border-radius: 1.33333333rem;
  border-radius: 1.33333333rem;
  background-color: #FF9900;
  color: #fff;
  font-size: 0.4rem;
}
.fundPopup .popupBotImg {
  width: 0.8rem;
  position: absolute;
  bottom: 2rem;
  left: 50%;
  margin-left: -0.4rem;
}
.intelligence {
  display: none;
  width: 100%;
  max-width: 540px;
  margin: 0 auto;
  height: 100%;
  position: fixed;
  top: 0;
  z-index: 100;
  background-color: rgba(0, 0, 0, 0.6);
}
.intelligence .inteBox {
  width: 100%;
  height: 100%;
  position: relative;
}
.intelligence .inteBox .inteContent {
  width: 8.5rem;
  height: 13rem;
  background-color: #fff;
  position: absolute;
  top: 50%;
  left: 50%;
  margin-left: -4.25rem;
  margin-top: -7.2rem;
  padding: 0.53333333rem;
  -webkit-border-radius: 0.21333333rem;
  -moz-border-radius: 0.21333333rem;
  -o-border-radius: 0.21333333rem;
  border-radius: 0.21333333rem;
}
.intelligence .inteBox .inteContent .inteTitle {
  text-align: center;
  color: #FF9900;
  font-size: 0.68rem;
}
.intelligence .inteBox .inteContent .inteText {
  color: #333;
  font-size: 0.36rem;
  padding: 0.4rem 0 0.8rem;
}
.intelligence .inteBox .inteContent .inteImg {
  width: 4rem;
  display: block;
  margin: 0 auto;
}
.intelligence .inteBox .inteContent .inteMethod {
  color: #333;
  font-size: 0.36rem;
  padding: 0.8rem 0 0.3rem;
}
.intelligence .inteBox .inteContent .inteStep {
  font-size: 0.3rem;
  color: #333;
  line-height: 0.6rem;
  margin-left: -0.15rem;
}
.intelligence .popupBotImg {
  width: 0.8rem;
  position: absolute;
  bottom: 0.8rem;
  left: 50%;
  margin-left: -0.4rem;
}
    </style>
    <link rel="stylesheet" href="<b:staticUrl>/res/css/prekindergarten/fund.css</b:staticUrl>">
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
</head>
<body  style="background-color: #f2f2f2;">
	<%-- <div class="pupopFund shadoweBtnFund" style="display: none;">
		<div class="pupopBox">
			<p class="fundLook">你获得基金币都在这里可以查看哦</p>
			<img src="<b:staticUrl>/res/img/prekindergarten/arrow.png</b:staticUrl>" alt="" class="fundArrow"/>
			<div class="parkFund">
				<p>入园基金</p>
			</div>
			<a href="javascript:void(0);" class="shadoweBtn shadoweBtnFund">知道啦</a>
		</div>
	</div> --%>
	<div class="pupopFund1 shadoweBtnFund" style="display: ${hasprompt=='true'?'none':'block'}">
		<div class="pupopBox clearfix">
			<li class="botTwo">
                <span class="botOneSpan">3</span>
                <p>成长基金</p>
            </li>
			<img src="<b:staticUrl>/res/img/prekindergarten/arrow.png</b:staticUrl>" alt="" /  class="fundArrow">
			<div class="parkFund">
				<p class="parkTitle">重要通知</p>
				<p class="parkText">原“入园基金”正式更名为“成长基金”</p>
				<a href="javascript:void(0);" class="shadoweBtn shadoweBtnFund">知道啦</a>
			</div>
		</div>
	</div>
	<!--智能小贴士-->
	<div class="intelligence" style="display: none;">
		<div class="inteBox">
			<div class="inteContent">
				<h3 class="inteTitle">智能小贴士</h3>
				<p class="inteText">亲，你还未关注“喵姐早教说会员号”，无法生成专属海报，请长按关注哟！</p>
				<img src="<b:staticUrl>/res/img/prekindergarten/fund/erm.jpg</b:staticUrl>" alt="" class="inteImg">
				<h4 class="inteMethod">方法：</h4>
				<p class="inteStep">【第1步】长按识别图中二维码，并关注</p>
				<p class="inteStep">【第2步】关注成功后点击“入园适应-进入活动”</p>
				<p class="inteStep">【第3步】点击“入园基金-我的海报”即可</p>
			</div>
			<img src="<b:staticUrl>/res/img/prekindergarten/fund/u1451.png</b:staticUrl>" alt="" class="popupBotImg">
		</div>
	</div>
	<!--生成海报弹层-->
	<div class="fundPopup" style="display: none;">
		<div class="popupBox">
            <div class="popupContent">
                <img src="<b:staticUrl>/res/img/prekindergarten/fund/u9743.png</b:staticUrl>" alt="" class="contentImg">
                <h2 class="contentTitH">专属海报已生成</h2>
                <p class="contentLook">前往公众号查看，成功邀请好友加入即可领取200枚基金币哦</p>
                <a href="javascript:void(0);" id="closeShadowBtn" class="shadoweBtn">去看看</a>
            </div>
            <img src="<b:staticUrl>/res/img/prekindergarten/fund/u1451.png</b:staticUrl>" alt="" class="popupBotImg" id="popupBotImg">
        </div>
	</div>
    <div class="wrap containerOther">
        <div class="public">
            <div class="homePage">
                <!--幼儿园首页的头部开始-->
                <div class="homeHeader clearfix">
                    <!--左边的头像-->
                    <div class="headerImg">
                        <img src="${album}" alt="">
                    </div>
                    <!--右边的个人信息-->
                    <div class="headerRight">
                        <div class="rightTop clearfix">
                            <p class="topName">${username}</p>

                        </div>
                        <div class="rightBottom">
                            <ul>
                                <li class="botOne">
                                    <span class="botOneSpan">${joinCount}</span>
                                    <p>已报名的活动</p>
                                </li>
                                <li class="botTwo">
                                    <span class="botOneSpan">${joindoneCount}</span>
                                    <p>已结束的活动</p>
                                </li>
                                <li class="botThree">
                                    <span class="botOneSpan">${medalcount}</span>
                                    <p>成长基金</p>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!--幼儿园首页的头部结束-->
                <!--行动计划开始-->
                <div class="initPlanPage" style="display: none;">
                	<div class="homePlan completed all" >
	                    <div class="planTit clearfix">
	                        <div class="tit">
	                            <div></div><h4 style="font-size:0.4rem">幼儿园入园适应训练营<span>（家庭版）</span></h4>
	                        </div>
	                        <div class="planContent clearfix">
	                            <img src="<b:staticUrl>/res/img/prekindergarten/u29.jpg</b:staticUrl>" alt="" class="unpaidImg">
	                            <div class="unpaidText">
	                                <div class="textP">
	                                   <h4 class="participateStar participateTit">第 1 期<span>&nbsp; <e>|</e>  幼儿园入园适应训练</span></h4>
	                                    <p class="work one">结业成绩：<span>92 <e>分</e></span></p>
	                                    <p class="work two">班级排名：<span>4 <e>名</e></span></p>
	                                    <div class="task taskBot">
	                                        <div class="taskTxt">
	                                            <span class="txtDate">2017.06.18</span>
	                                        </div>
	                                        <a href="#" class="completedDet">查看详情</a>
	                                    </div>
	                                </div> 
	                            </div>
	                        </div>
	                    </div>
                	</div>
                	<div class="homePlan alreadyPaid all">
	                    <div class="planTit  clearfix">
	                        <div class="tit">
	                            <div></div><h4 style="font-size: 0.4rem;">幼儿园入园适应训练营<span>（家庭版）</span></h4>
	                        </div>
	                        <div class="planContent2">
	                        <div class="planContent clearfix">
	                            <img class="unpaidImg" alt="" src="<b:staticUrl>/res/img/prekindergarten/u29.jpg</b:staticUrl>">
	                            <div class="unpaidText">
	                                <div class="textP">
	                                    <h4 class="textTit">入营准备阶段</h4>
	                                    <p class="miaosoundbite">专属定制入园适应训练，帮助宝宝顺利入园</p>
	                                    <div class="unpaidBtn">
	                                        <%-- <img alt="" src="<b:staticUrl>/res/img/prekindergarten/u232.png</b:staticUrl>"><span>未打卡</span>  --%>
	                                    </div>
	                                    <div class="task">
	                                        <div class="taskTxt">
	                                            <!-- <span class="txtClass">训练日程表</span> -->
	                                        </div>
	                                        <a href="#"></a>
	                                    </div>
	                                </div>
	                                
	                            </div>
	                        </div>
	                        <div class="line"></div>
	                        <div class="planJoin">
	                            <a href="#">查看详情</a>
	                        </div>
	                        </div>
	                    </div>
	                </div>
	                <div class="homePlan all">
	                    <div class="planTit clearfix">
	                        <div class="tit">
	                            <div></div><h4>幼儿园入园适应训练营<span>（家庭版）</span></h4>
	                        </div>
	                        <div class="planContent">
	                            <img src="<b:staticUrl>/res/img/prekindergarten/u81.png</b:staticUrl>" alt="" class="planIcon">
	                            <img src="<b:staticUrl>/res/img/prekindergarten/u29.jpg</b:staticUrl>" alt="" class="planImg">
	                            <div class="planText">
	                                <div class="textP">
	                                    <p>活动介绍：宝宝要入园了，吃喝拉撒睡样样不行，那你还不来？</p>
	                                    <p>活动目标：解决秋季入园宝宝的入园适应难题</p>
	                                    <p>适合人群：家有3岁左右准备9月入园的宝妈/爸</p>
	                                </div>
	                                <div class="planJoin">
	                                    <a href="#">了解详情</a>
	                                </div>
	                            </div>
	                        </div>
	                    </div> 
	                </div>
                	<div class="homePlan nocp all">
	                    <div class="planTit clearfix">
	                        <div class="tit">
	                            <div></div><h4>幼儿园入园适应训练营<span>（家庭版）</span></h4>
	                        </div>
	                        <div class="planContent">
	                            <img src="<b:staticUrl>/res/img/prekindergarten/u81.png</b:staticUrl>" alt="" class="planIcon">
	                            <img src="<b:staticUrl>/res/img/prekindergarten/width.jpg</b:staticUrl>" alt="" class="planImg">
	                            <div class="planText">
	                                <div class="textP">
	                                    <p>活动介绍：宝宝要入园了，吃喝拉撒睡样样不行，那你还不来？</p>
	                                    <p>活动目标：解决秋季入园宝宝的入园适应难题</p>
	                                    <p>适合人群：家有3岁左右准备9月入园的宝妈/爸</p>
	                                </div>
	                                <div class="planJoin">
	                                    <a href="#">了解详情</a>
	                                </div>
	                            </div>
	                        </div>
	                    </div> 
	                </div>
	                  <div class="homePlan unpaid all">
	                    <div class="planTit clearfix">
	                        <div class="tit">
	                            <div></div><h4 style="font-size:0.4rem">幼儿园入园适应训练营<span>（家庭版）</span></h4>
	                        </div>
	                        <div class="planContent2">
	                        <div class="planContent clearfix" style="margin-bottom:0.18rem;">
	                            <img src="<b:staticUrl>/res/img/prekindergarten/u29.jpg</b:staticUrl>" alt="" class="unpaidImg">
	                            <div class="unpaidText">
	                                <div class="textP">
	                                    <h4 class="textTit">入营准备阶段</h4>
	                                    <p >专属定制入园适应训练，帮助宝宝顺利入园</p>
	                                    <%-- <div class="unpaidBtn clearfix">
	                                        <img src="<b:staticUrl>/res/img/prekindergarten/u232.png</b:staticUrl>" alt=""><span>未打卡</span> 
	                                    </div> --%>
	                                </div>
	                            </div>
	                        </div>
	                        <div class="line"></div>
	                        <div class="planJoin">
	                            <a href="#">查看详情</a>
	                        </div>
	                        </div>
	                    </div>
	                </div>
	                
	            	<div class="homePlan all going">
	                   <%--  <div class="planTit clearfix">
	                        <div class="tit">
	                             <div></div><h4 style="font-size:0.4rem">幼儿园入园适应训练营<span>（家庭版）</span></h4>
	                        </div>
	                        <div class="planContent2">
	                        <div class="planContent clearfix">
	                            <img src="<b:staticUrl>/res/img/prekindergarten/u29.jpg</b:staticUrl>" alt="" class="unpaidImg">
	                            <div class="unpaidText">
	                                <div class="textP">
	                                    <h4 class="textTit">第1阶段  · 第1天</h4>
	                                    <p class="miaosoundbite"></p>
	                                    <div class="task">
	                                        <div class="taskTxt">
	                                           <span class="txtClass">训练日程表</span> • <span class="txtTask">可查看全部任务完成情况</span> 
	                                        </div>
	                                        <a href="#"></a>
	                                    </div>
	                                </div>
	                                
	                            </div>
	                        </div>
	                        <div class="line"></div>
	                        <div class="planJoin">
	                            <a href="#">查看详情</a>
	                        </div>
	                        </div>
	                    </div> --%>
	                    <div class="planTit clearfix">
	                        <div class="tit">
	                            <div></div><h4 style="font-size:0.4rem">幼儿园入园适应训练营<span>（家庭版）</span></h4>
	                        </div>
	                        <div class="planContent clearfix">
	                            <img src="<b:staticUrl>/res/img/prekindergarten/u29.jpg</b:staticUrl>" alt="" class="unpaidImg">
	                            <div class="unpaidText">
	                                <div class="textP">
	                                    <h4 class="textTit">第1阶段 </h4>
	                                    <p class="miaosoundbite">专属定制入园适应训练，帮助宝宝顺利入园.</p>
	                                    <div class="unpaidTask clearfix">
	                                        <p class="taskT clearfix">
		                                        <span class="taskQ">2</span>
		                                        <span class="taskLine"> / </span>
		                                        <span class="taskH">7天</span>
	                                        </p>
	                                        <div class="taskJoin">
	                                             <a href="javascript:void(0);">查看详情</a>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                        <div class="line"></div>

	                        <div class="taskTxt clearfix taskDate">
	                             <p class="txtClass">日程表</p>
	                             <p class="txtR shadoweBtnPage">专属海报</p>
	                        </div>
	                        <!--<div class="planJoin">
	                            <a href="#">查看详情</a>
	                        </div>-->
	                    </div>
		             </div>
	             </div>
                <div class="homePlanPage">
                	<%--  <div class="homePlan">
	                    <div class="planTit clearfix planSkill">
	                        <div class="tit">
	                            <div></div><h4>30天育儿技巧提升班</h4>
	                        </div>
	                        <div class="planContent">
	                            <img src="<b:staticUrl>/res/img/prekindergarten/u45.jpg</b:staticUrl>" alt="" class="planImg">
	                            <div class="planText">
	                                <div class="textP">
	                                    <p>活动介绍：宝宝要入园了，吃喝拉撒睡样样不行，那你还不来？</p>
	                                    <p>活动目标：解决秋季入园宝宝的入园适应难题</p>
	                                    <p>适合人群：家有3岁左右准备9月入园的宝妈/爸</p>
	                                </div>
	                                <div class="skillBottom ">
	                                    <a href="#">了 解 详 情</a>
	                                </div>
	                            </div>  
	                        </div>
	                        
	                    </div>  
	                </div>
	                <div class="homePlan">       
	                    <div class="planTit clearfix planSkill planEmotion">
	                        <div class="tit">
	                            <div></div><h4>情绪管理训练营</h4>
	                        </div>
	                        <div class="planContent">
	                            <img src="<b:staticUrl>/res/img/prekindergarten/u63.jpg</b:staticUrl>" alt="" class="planImg">
	                            <div class="planText">
	                                <div class="textP">
	                                    <p>活动介绍：宝宝要入园了，吃喝拉撒睡样样不行，那你还不来？</p>
	                                    <p>活动目标：解决秋季入园宝宝的入园适应难题</p>
	                                    <p>适合人群：家有3岁左右准备9月入园的宝妈/爸</p>
	                                </div>
	                                <div class="skillBottom ">
	                                    <a href="#">了 解 详 情</a>
	                                </div>
	                            </div>
	                        </div>
	                    </div> 
	                </div> --%>
                </div>
                <div class="homeLine"></div>
            </div>
        </div>
    </div>
    <div class="containerAct" style="display: none; top: 100%;">
		<h1 class="activityTitle">女神之路<span class="backBtn"></span></h1>
		<ul class="honorTag">
			<!-- 荣誉勋章内容 -->
		</ul>
		<ul class="workcardList">
			<li class="workcardItem">
				<div class="il">
					<div class="tit">作业补交卡</div>
					<div class="name">【第5期】手刃坏脾气，重做奶茶妈荣获优秀学员卡</div>
				</div>
				<div class="ir">
					<div class="tag"><span>未使用</span></div>
					<div class="date">有效期<br>2017.1.12-2017.9.12</div>
				</div>
			</li>
			<li class="workcardItem workcardItemGray">
				<div class="il">
					<div class="tit">作业补交卡</div>
					<div class="name">【第5期】手刃坏脾气，重做奶茶妈荣获优秀学员卡</div>
				</div>
				<div class="ir">
					<div class="tag tag1"><span>已使用（第5天使用）</span></div>
					<div class="date">有效期<br>2017.1.12-2017.9.12</div>
				</div>
				<div class="used"></div>
			</li>
			<li class="workcardItem workcardItemGray">
				<div class="il">
					<div class="tit">作业补交卡</div>
					<div class="name">【第5期】手刃坏脾气，重做奶茶妈荣获优秀学员卡</div>
				</div>
				<div class="ir">
					<div class="tag tag2"><span>已过期</span></div>
					<div class="date">有效期<br>2017.1.12-2017.9.12</div>
				</div>
				<div class="timed"></div>
			</li>
		</ul>
	</div>
	
     <!--尾部-->
	<jsp:include page="/pages/header_footer.jsp">
		<jsp:param value="3" name="menu"/>
	</jsp:include>
	<script type="text/javascript">
	$(function(){
		//初始化活动列表
		{
			var initnocpDiv = $(".nocp");
			var initnocpContentDiv = $(".nocp .planContent");
			var initunpaidDiv = $(".unpaid");
			var initunpaidContentDiv = $(".unpaid .planContent2");
			var initgoingDiv = $(".going");
			var initgoingContentDiv = $(".going planContent2");
			HH.ajax({
				url:"/yzmm/account/activity/ajaxActivityList",
				callback:function(data){
					var len = data.length;
					if(len==0){
						
					}else{
						for(var i=0;i<len;i++){
							var o = data[i];
							//判断是否存在分类
							if($(".homePlanPage .all").hasClass("classifiylabel"+o.labelId)){
								if(o.isJoinIn=='NOCP'){
									var t = initnocpContentDiv.clone();
									t.find(".participateTit").html(o.title);
									if(o.activityType=='DAYS'){
									}else if(o.activityType=='PREKINDERGARTEN'){
										t.find(".textP").html("<p>"+o.description+"</p>");
										t.find(".planJoin").on("click",{"id":o.id},function(e){
											HH.href("/yzmm/account/activity/prekindergarten/index?id="+e.data.id+"&let=true");
										});
									}
									t.find(".planImg").attr("src",o.activityImg);
									//alert(o.activityImg+"111");
									$(".classifiylabel"+o.labelId).find(".planTit").append(line).append(t);
									t.show();
								}else if(o.isJoinIn=='YESCP'){
									var t = initunpaidContentDiv.clone();
									t.find(".participateTit").html(o.title);
									if(o.activityType=='DAYS'){
									}else if(o.activityType=='PREKINDERGARTEN'){
										t.find(".textP").find(".textTit").html("活动准备阶段");
										t.find(".textP").find("p").html(o.description);
										t.find(".planJoin").on("click",{"id":o.id},function(e){
											HH.href("/yzmm/account/activity/prekindergarten/index?id="+e.data.id+"&let=true");
										});
									}
										t.find(".unpaidImg").attr("src",o.activityImg);
									$(".classifiylabel"+o.labelId).find(".planTit").append(line).append(t);
									t.show();
								}else if(o.isJoinIn=='YESJOINE'){
									var t = initalreadyPaidContentDiv.clone();
									t.find(".textTit").html("活动准备阶段");
									if(o.activityType=='DAYS'){
										//todo
									}else if(o.activityType=='PREKINDERGARTEN'){
										t.find(".miaosoundbite").html(o.description);
										t.find(".taskTxt .txtClass").on("click",{"id":o.id},function(e){
											HH.href("/yzmm/account/activity/kja/task/calendar?activityId="+e.data.id);
										});
										t.find(".taskTxt .txtR").on("click",{"id":o.id},function(e){poster(e.data.id)});
										t.find(".planJoin").on("click",{"id":o.id},function(e){
											HH.href("/yzmm/account/activity/prekindergarten/index?id="+e.data.id+"&let=true");
										});
									}
									t.find(".unpaidImg").attr("src",o.activityImg);
									$(".classifiylabel"+o.labelId).find(".planTit").append(line).append(t);
									t.show();
								}else if(o.isJoinIn=='DOING'){
									var t = initgoingContentDiv.clone();
									t.find(".textTit").html(o.title);
									if(o.activityType=='DAYS'){
										//todo
									}else if(o.activityType=='PREKINDERGARTEN'){
										t.find(".miaosoundbite").html(o.description);
										t.find(".taskTxt .txtClass").on("click",{"id":o.id},function(e){
											HH.href("/yzmm/account/activity/kja/task/calendar?activityId="+e.data.id);
										});
										t.find(".taskTxt .txtR").on("click",{"id":o.id},function(e){poster(e.data.id)});
										if(o.score){
											t.find(".taskJoin").find("a").html(o.score);
										}
										t.find(".taskJoin").on("click",{"id":o.id},function(e){
											HH.href("/yzmm/account/activity/prekindergarten/index?id="+e.data.id+"&let=true");
										});
										if(!o.hasprompt){
											$(".pupopFund").data("activityId",o.id).show();
										};
									}
									t.find(".unpaidImg").attr("src",o.activityImg);
									$(".classifiylabel"+o.labelId).find(".planTit").append(line).append(t);
									t.show();
								}
							}else{
								if(o.isJoinIn=='NOCP'){
									var n = initnocpDiv.clone();
									initP.prepend(n);
									n.addClass("classifiylabel"+o.labelId);
									n.find(".tit").find("h4").html(o.labelname);
									n.find(".planContent").find(".participateTit").html(o.title);
									if(o.activityType=='DAYS'){
									}else if(o.activityType=='PREKINDERGARTEN'){
										n.find(".planContent").find(".textP").html("<p>"+o.description+"</p>");
										n.find(".planContent").find(".planJoin").on("click",{"id":o.id},function(e){
											HH.href("/yzmm/account/activity/prekindergarten/index?id="+e.data.id+"&let=true");
										});
									}
									n.find(".planContent").find(".planImg").attr("src",o.activityImg);
									//alert(o.activityImg+"111");
									n.show();
								}else if(o.isJoinIn=='YESCP'){
									var n = initunpaidDiv.clone();
									n.addClass("classifiylabel"+o.labelId);
									n.find(".tit").find("h4").html(o.labelname);
									n.find(".planContent2").find(".participateTit").html(o.title);
									if(o.activityType=='DAYS'){
									}else if(o.activityType=='PREKINDERGARTEN'){
										n.find(".planContent2").find(".textP").find(".textTit").html("活动准备阶段");
										n.find(".planContent2").find(".textP").find("p").html(o.description);
										n.find(".planContent2").find(".planJoin").on("click",{"id":o.id},function(e){
											HH.href("/yzmm/account/activity/prekindergarten/index?id="+e.data.id+"&let=true");
										});
									}
									n.find(".planContent2").find(".unpaidImg").attr("src",o.activityImg);
									initP.prepend(n);
									n.show();
								}else if(o.isJoinIn=='YESJOINE'){
									var n = initalreadyPaidDiv.clone();
									n.addClass("classifiylabel"+o.labelId);
									n.find(".tit").find("h4").html(o.labelname);
									n.find(".planContent").find(".textTit").html("活动准备阶段");
									if(o.activityType=='DAYS'){
										
									}else if(o.activityType=='PREKINDERGARTEN'){
										n.find(".planContent").find(".miaosoundbite").html(o.description);
										n.find(".taskTxt .txtClass").on("click",{"id":o.id},function(e){
											HH.href("/yzmm/account/activity/kja/task/calendar?activityId="+e.data.id);
										});
										n.find(".taskTxt .txtR").on("click",{"id":o.id},function(e){poster(e.data.id)});
										n.find(".planJoin").on("click",{"id":o.id},function(e){
											HH.href("/yzmm/account/activity/prekindergarten/index?id="+e.data.id+"&let=true");
										});
									}
									n.find(".planContent").find(".unpaidImg").attr("src",o.activityImg);
									initP.prepend(n);
									n.show();
								}else if(o.isJoinIn=='DOING'){
									var n = initgoingDiv.clone();
									n.addClass("classifiylabel"+o.labelId);
									n.find(".tit").find("h4").html(o.labelname);
									n.find(".planContent").find(".textTit").html(o.title);
									if(o.activityType=='DAYS'){
										
									}else if(o.activityType=='PREKINDERGARTEN'){
										n.find(".planContent").find(".taskQ").html(o.classrank);
										n.find(".planContent").find(".miaosoundbite").html(o.description);
										n.find(".taskTxt .txtClass").on("click",{"id":o.id},function(e){
											HH.href("/yzmm/account/activity/kja/task/calendar?activityId="+e.data.id);
										});
										n.find(".taskTxt .txtR").on("click",{"id":o.id},function(e){poster(e.data.id)});
										if(o.score){
											n.find(".taskJoin").find("a").html(o.score);
										}
										n.find(".taskJoin").on("click",{"id":o.id},function(e){
											HH.href("/yzmm/account/activity/prekindergarten/index?id="+e.data.id+"&let=true");
										});
										if(!o.hasprompt){
											$(".pupopFund").data("activityId",o.id).show();
										};
									}
									n.find(".planContent").find(".unpaidImg").attr("src",o.activityImg);
									initP.prepend(n);
									n.show();
								}
							}
						}
						
					}
					
				}
		
			});
		}
		$(".botThree").click(function(){
			if('${flag}'=='true'){
				HH.href("/yzmm/account/activity/kja/fund/index");
    		}else{
    			toast("抱歉，您还没有参加任何成长基金项目。");
			}
		});
		var initCompletedDiv = $(".completed");
		var initcompleteContentDiv = $(".completed .planContent");
		var initP = $(".homePlanPage");
		var line = '<div class="line"></div>';
		$(".botTwo").click(function(){
			initP.html("");
			HH.ajax({
				waiting:true,
				url:"/yzmm/account/activity/historyList",
				callback:function(data){
					var len = data.length;
					if(len==0){
						toast("您没参加活动，请关注其他活动");
						return;
					}else{
						for(var i=0;i<len;i++){
							var o = data[i];
							//判断是否存在分类
							if($(".homePlanPage .completed").hasClass("classifiylabel"+o.labelId)){
								var t = initcompleteContentDiv.clone();
								t.find(".participateTit").html(o.title);
								if(o.activityType=='DAYS'){
									t.find(".one").html("作业完成：<span>"+o.homeworkcount+" <e>份</e></span>");
									t.find(".two").html("班级排名：<span>"+o.classrank+" <e>名</e></span>");
									t.find(".taskBot").find(".completedDet").attr("href","/yzmm/account/activity/goddessplan/detail/statusSeleter?activityId="+o.id);
								}else if(o.activityType=='PREKINDERGARTEN'){
									t.find(".one").html("<br>");
									t.find(".two").html("<br>");
									t.find(".taskBot").find(".completedDet").attr("href","/yzmm/account/activity/prekindergarten/index?id="+o.id+"&let=true");
								}
								t.find("img").attr("src",o.activityImg);
								t.find(".txtDate").html(o.endTime);
								$(".classifiylabel"+o.labelId).find(".planTit").append(line).append(t);
								t.show();
								
							}else{
								var n = initCompletedDiv.clone();
								n.addClass("classifiylabel"+o.labelId);
								n.find(".tit").find("h4").html(o.labelname);
								n.find(".planContent").find(".participateTit").html(o.title);
								if(o.activityType=='DAYS'){
									n.find(".planContent").find(".one").html("作业完成：<span>"+o.homeworkcount+" <e>份</e></span>");
									n.find(".planContent").find(".two").html("班级排名：<span>"+o.classrank+" <e>名</e></span>");
									n.find(".planContent").find(".taskBot").find(".completedDet").attr("href","/yzmm/account/activity/goddessplan/detail/statusSeleter?activityId="+o.id);
								}else if(o.activityType=='PREKINDERGARTEN'){
									n.find(".planContent").find(".one").html("<br>");
									n.find(".planContent").find(".two").html("<br>");
									n.find(".planContent").find(".taskBot").find(".completedDet").attr("href","/yzmm/account/activity/prekindergarten/index?id="+o.id+"&let=true");
								}
								n.find(".planContent").find("img").attr("src",o.activityImg);
								n.find(".planContent").find(".txtDate").html(o.endTime);
								initP.append(n);
								n.show();
							}
						}
						
					}
					
				}
		
			});
			$(this).parent().children().removeClass("active");
			$(this).addClass("active");
		});
		var initalreadyPaidDiv = $(".alreadyPaid");
		var initalreadyPaidContentDiv = $(".alreadyPaid .planContent2");
		$(".botOne").click(function(){
			initP.html("");
			HH.ajax({
				waiting:true,
				url:"/yzmm/account/activity/joinList",
				callback:function(data){
					var len = data.length;
					if(len==0){
						toast("您没参加活动，请关注其他活动");
						return;
					}else{
						for(var i=0;i<len;i++){
							var o = data[i];
							//判断是否存在分类
							if($(".homePlanPage .alreadyPaid").hasClass("classifiylabelpad"+o.labelId)){
								var t = initalreadyPaidContentDiv.clone();
								t.find(".textTit").html(o.title);
								if(o.activityType=='DAYS'){
									//todo
								}else if(o.activityType=='PREKINDERGARTEN'){
									t.find(".miaosoundbite").html(o.description);
								
									t.find(".taskBot").find(".completedDet").attr("href","/yzmm/account/activity/prekindergarten/index?id="+o.id+"&let=true");
								}
								t.find("img").attr("src",o.activityImg);
								$(".classifiylabelpad"+o.labelId).find(".planTit").append(line).append(t);
								t.show();
								
							}else{
								var n = initalreadyPaidDiv.clone();
								n.addClass("classifiylabelpad"+o.labelId);
								n.find(".tit").find("h4").html(o.labelname);
								n.find(".planContent").find(".textTit").html(o.title);
								if(o.activityType=='DAYS'){
									
								}else if(o.activityType=='PREKINDERGARTEN'){
									n.find(".planContent").find(".miaosoundbite").html(o.description);
									n.find(".taskTxt .txtClass").on("click",{"id":o.id},function(e){
										HH.href("/yzmm/account/activity/kja/task/calendar?activityId="+e.data.id);
									});
									n.find(".taskTxt .txtR").on("click",{"id":o.id},function(e){poster(e.data.id)});
									n.find(".planJoin").on("click",{"id":o.id},function(e){
										HH.href("/yzmm/account/activity/prekindergarten/index?id="+e.data.id+"&let=true");
									});
								}
								n.find(".planContent").find("img").attr("src",o.activityImg);
								initP.append(n);
								n.show();
							}
						}
					}
				}
			});
			$(this).parent().children().removeClass("active");
			$(this).addClass("active");
		});
		$('.shadoweBtnFund').click(function() {
			$.ajax({
	    		url:'/yzmm/account/activity/closekjaFundprompt',
	    		 type: "POST",
	             async: true,
	             success: function(data) {
	            	 $('.pupopFund1').fadeOut();
	             }
	    	});
		});
		
		//点击弹层上面的X号隐藏弹层
		$('.popupBotImg').click(function(){
			$('.fundPopup').fadeOut();
			$('.cashPopup').fadeOut();
			$('.goodsPopup').fadeOut();
			$('.succExchangecash').fadeOut();
			$('.succExchangeGoods').fadeOut();
			$('.intelligence').fadeOut();
		});
		//点击我的海报按钮显示弹层
		function poster(id){
			HH.ajax({
	    		data:{activityId:id},
				url:"/yzmm/account/activity/kja/fund/sendPoster",
			    callback:function(data){
			   		if(data.success){
			   			$('.fundPopup').fadeIn();
		   			}else{
		   				if(data.code=='100064'){
		   					$(".intelligence").fadeIn();
		   				}else{
		   					toast("海报生成失败，前往“喵姐早教说会员号”点击“入园基金 - 进入活动”，查看当前活动详情并生成海报。");
		   				}
		   			}
			    }
			});
		}
		//点击弹层上面的X号隐藏弹层
		$('#popupBotImg').click(function(){
			$('.fundPopup').fadeOut();
		});
		$("#closeShadowBtn").click(function(){
			wx.closeWindow();
		});
		$(".openredpack").click(function(){
			wx.closeWindow();
		});
	});
	</script>
</body>
</html>