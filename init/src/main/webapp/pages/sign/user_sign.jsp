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
	<title>签到</title>
	
	<%@include file="../header_v15.jsp"%>
	<%@include file="../header_wxjsapi.jsp"%>
	<style type="text/css">
		.contailner{
			width: 100%;
			max-width: 540px;
			position: relative ;
		}
		
		.title{
			text-align: center;
			padding: 20px
		}
		.title span{
			font-family: 'Arial-BoldMT', 'Arial Bold', 'Arial';
			font-weight: 700;
			font-style: normal;
			font-size: 20px;
		}
		.signBody{
			font-family: 'ArialMT', 'Arial';
			font-weight: 400;
			font-style: normal;
			font-size: 13px;
			color: #333333;
			text-align: center;
			line-height: normal;
			position: relative;
			left: 0.5rem;
			width: 9rem;
			height: 9.8rem;
			background: url(<b:staticUrl>/res/img/sign/bg_sign.png</b:staticUrl>) no-repeat center;
			background-size: 100%;
		}
		.signBody .div1{
			line-height: normal;
			position: absolute;
			top: 0.3rem;
			left:0.3rem;
			width: 8.4rem;
			height: 7.7rem;
		}
		.signDays{
			width: 98%;
			height: 2rem;
			position: absolute;
			top: 0.4rem;
			left: 1%;
			background-color: red;
			background: url(<b:staticUrl>/res/img/sign/bg_sign_days.png</b:staticUrl>) no-repeat center;
			background-size: 100%;
		}
		.signDays span{
			font-size: 20px;
			font-family: 'PingFangSC-Semibold', 'PingFang SC Semibold', 'PingFang SC';
			font-weight: 650;
			font-style: normal;
			color: #FFFFFF;
			word-wrap: break-word;
			position: absolute;
			left: 0%;
			top: 21%;
			width: 100%;
			height: 51px;
		}
		
		.timelist1 {
		  width: 100%;
		  max-width: 540px;
		  margin: 0 auto;
		  height: 1.66666667rem;
		  position: relative;
		  overflow-x: hidden;
		}
		.timelist1 .timelist1Box {
		  width: 100%;
		  position: absolute;
		  left: 0;
		  overflow: auto;
		}
		.timelist1 ul {
		  float: left;
		  width: 100%;
		}
		.timelist1 li {
		  float: left;
		  width: 14.285%;
		  position: relative;
		  overflow: auto;
		}
		/* .timelist1 li:before {
		  content: '';
		  width: 100%;
		  height: 0;
		  position: absolute;
		  left: 0;
		  bottom: 0.76rem;
		  border-bottom: 1px solid #ccc;
		} */
		.timelist1 .date {
		  	text-align: center;
			font-size: 0.25rem;
			color: #333;
			margin-top: 3px;
		}
		.timelist1 .hui1 {
			width: 0.72rem;
			height: 0.72rem;
			line-height: 0.72rem;
			margin: 0 auto;
			margin-top: 0.16rem;
			position: relative;
			z-index: 2;
			border-radius: 100%;
			width: 28px;
			height: 28px;
			background: url(<b:staticUrl>/res/img/sign/hui1.png</b:staticUrl>) no-repeat;
			background-size: 28px 28px;
		}
		.timelist1 .hui2 {
			width: 0.72rem;
			height: 0.72rem;
			line-height: 0.72rem;
			margin: 0 auto;
			margin-top: 0.16rem;
			position: relative;
			z-index: 2;
			border-radius: 100%;
			width: 28px;
			height: 28px;
			background: url(<b:staticUrl>/res/img/sign/hui2.png</b:staticUrl>) no-repeat;
			background-size: 28px 28px;
		}
		.timelist1 .cheng1 {
			width: 0.72rem;
			height: 0.72rem;
			line-height: 0.72rem;
			margin: 0 auto;
			margin-top: 0.16rem;
			position: relative;
			z-index: 2;
			border-radius: 100%;
			width: 28px;
			height: 28px;
			background: url(<b:staticUrl>/res/img/sign/cheng1.png</b:staticUrl>) no-repeat;
			background-size: 28px 28px;
		}
		.timelist1 .cheng2 {
			width: 0.72rem;
			height: 0.72rem;
			line-height: 0.72rem;
			margin: 0 auto;
			margin-top: 0.16rem;
			position: relative;
			z-index: 2;
			border-radius: 100%;
			width: 28px;
			height: 28px;
			background: url(<b:staticUrl>/res/img/sign/cheng2.png</b:staticUrl>) no-repeat;
			background-size: 28px 28px;
		}
		.timelist1 .end {
			width: 0.72rem;
			height: 0.72rem;
			line-height: 0.72rem;
			margin: 0 auto;
			margin-top: 0.16rem;
			position: relative;
			z-index: 2;
			border-radius: 100%;
			width: 28px;
			height: 28px;
			background: url(<b:staticUrl>/res/img/favicon.ico</b:staticUrl>) no-repeat;
			background-size: 23px 23px;
			background-position-x: 3px;
		}
		.timelist1 .now .date {
		  color: #f57123;
		}
		.timelist1 .now .num {
		  background-color: #f57123;
		  color: #fff;
		}
		.ruleMsg{
	 	    min-height: 2.2rem;
	   		display: block;
	   		background-color:#fff;
		 }
		  .cntTitle1{
			 	display: inline-block;
				text-align: center;
				padding: 0rem 0 0 0;
				width: 50%;
				border-bottom: 0.03rem solid #333;
				position: relative ;
				left:25%;
		 }
		 .cntTitle1 span{
		 	font-family: 'ArialMT', 'Arial';
		 	font-size: 0.40rem;
			position: relative ;
			bottom: -0.4rem;
			color:#333;
			background-color: #fff;
			padding: 0 0.4rem;
		 }
		 .cntContent1{
				color:#333;
			}
			.cntContent1 ul{
				padding: 0.5rem 0.8rem 0.5rem 0.8rem;
				line-height: 0.5rem;
			}
			.cntContent1 li{
				font-size: 0.34rem;
				text-align: left ;
				position: relative ;
			}
			.cntContent1 li .lvd{
				background: url(<b:staticUrl>/res/img/sign/lvd.png</b:staticUrl>) no-repeat;
				background-size: 23px 23px;
				background-position-x: 3px;
			}
			.signButton{
				text-align: center;
				padding: 0.5rem;
			}
			.signButton span{
				background-color: #FF8319;
				color: white;
				padding: 0.2rem 3rem;
				border-radius: 50px;
				font-size: 20px;
				cursor: pointer;
			}
			#prizeList li{
				padding-left: 25px;
				margin-bottom: 10px;
				border-bottom: 1px solid #f2f2f2;
				padding-bottom: 10px;
				line-height: 25px
			}
			#prizeList li .time{
				font-size:13px;
			}
			#prizeList li:before{
				content: '';
				background-color: #0e932e;
				border-radius: 50px;
				background-size: 23px 23px;
				background-position-x: 3px;
				width: 15px;
				height: 15px;
				position: absolute;
				left: 0;
				top: 3px;
				bottom: 0.76rem;
			}
			
			.share1 {
		    display: none;
		    width: 100%;
		    max-width: 540px;
		    margin: 0 auto;
		    height: 100%;
		    position: fixed;
		    top: 0;
		    z-index: 100;
		    background-color: rgba(0, 0, 0, 0.8);
		}
		.share1 .shareBox {
		    width: 100%;
		    padding-top: 1.12rem;
		    position: relative;
		}
		.share1 .sharearrow {
		    display: block;
		    width: 75px;
		    height: 84px;
		    position: absolute;
		    right: 0.48rem;
		    top: 0.21333333rem;
		    background-image: url(<b:staticUrl>/res/img/share/share.png</b:staticUrl>);
		    background-position: right top;
		    background-repeat: no-repeat;
		    background-size: 78px 72px;
		}
		.share1 p {
		    margin-bottom: 0.26666667rem;
		    text-align: center;
		    color: #f8e71c;
		}
	</style>
	 <script type="text/javascript">
			var wxfenxiangcb_dtl={
						title: '${wxshare.title}', // 分享标题
						desc : '${wxshare.desc}',
					    link: '${wxshare.link}', // 分享链接
					    imgUrl: '${wxshare.imgUrl}', // 分享图标
					    shareTimeline:function(bool){
					    	HH.href('/yzmm/account/generalizeactivity/index/ee7c41bc1dd449a2b8137370c8b9f3e0');
					    },
					    shareAppMessage:function(bool){
					    	HH.href('/yzmm/account/generalizeactivity/index/ee7c41bc1dd449a2b8137370c8b9f3e0');
					    }
			};
	
			 initwxfx(wxfenxiangcb_dtl);
			
	</script>
</head>
<body>
<div class="contailner">
	<!-- 标题 -->
	<div class="title">
		<span>签到赢大奖</span>
	</div>
	<!-- 签到部分 -->
	<div class="signBody">
      <div class="div1">
      	<div class="signDays">
      		<span>已连续签到 
      			<c:if test="${empty signRecordTotalDayNum}">
      				0
      			</c:if>
      			<c:if test="${not empty signRecordTotalDayNum}">
      				${signRecordTotalDayNum }
      			</c:if>
      		 天</span>
      	</div>
      	<div class="timelist1" style="position: absolute;top: 40%;">
			<div class="timelist1Box">
				<ul>
					<li class=""><a href="javascript:void(0)">
						<div class="hui2"></div>
						<div class="date">10.13</div>
					</a></li>	
					<li class=""><a href="javascript:void(0)">
						<div class="hui2"></div>
						<div class="date">10.14</div>
					</a></li>	
					<li><a href="javascript:void(0)">
						<div class="hui1"></div>
						<div class="date">10.15</div>
					</a></li>	
					<li><a href="javascript:void(0)">
						<div class="hui2"></div>
						<div class="date">今天</div>
					</a></li>	
					<li><a href="javascript:void(0)">
						<div class="hui2"></div>
						<div class="date">10.17</div>
					</a></li>	
					<li><a href="javascript:void(0)">
						<div class="hui1"></div>
						<div class="date">10.18</div>
					</a></li>	
					<li><a href="javascript:void(0)">
						<div class="hui2"></div>
						<div class="date">10.19</div>
					</a></li>		
				</ul>
			</div>
		</div>
		<div class="timelist1" style="position: absolute;top: 60%;">
			<div class="timelist1Box">
				<ul>
					<li class=""><a href="javascript:void(0)">
						<div class="hui2"></div>
						<div class="date">10.13</div>
					</a></li>	
					<li class=""><a href="javascript:void(0)">
						<div class="hui1"></div>
						<div class="date">10.14</div>
					</a></li>	
					<li><a href="javascript:void(0)">
						<div class="hui2"></div>
						<div class="date">10.15</div>
					</a></li>	
					<li><a href="javascript:void(0)">
						<div class="hui2"></div>
						<div class="date">今天</div>
					</a></li>	
					<li><a href="javascript:void(0)">
						<div class="hui1"></div>
						<div class="date">10.17</div>
					</a></li>	
					<li><a href="javascript:void(0)">
						<div class="hui2"></div>
						<div class="date">10.18</div>
					</a></li>	
					<li><a href="javascript:void(0)">
						<div class="hui2"></div>
						<div class="date">10.19</div>
					</a></li>		
				</ul>
			</div>
		</div>
		<div class="timelist1" style="position: absolute;top: 80%;">
			<div class="timelist1Box">
				<ul>
					<li class=""><a href="javascript:void(0)">
						<div class="hui1"></div>
						<div class="date">10.13</div>
					</a></li>	
					<li class=""><a href="javascript:void(0)">
						<div class="hui2"></div>
						<div class="date">10.14</div>
					</a></li>	
					<li><a href="javascript:void(0)">
						<div class="hui2"></div>
						<div class="date">10.15</div>
					</a></li>	
					<li><a href="javascript:void(0)">
						<div class="hui1"></div>
						<div class="date">今天</div>
					</a></li>	
					<li><a href="javascript:void(0)">
						<div class="hui2"></div>
						<div class="date">10.17</div>
					</a></li>	
					<li><a href="javascript:void(0)">
						<div class="hui2"></div>
						<div class="date">10.18</div>
					</a></li>	
					<li><a href="javascript:void(0)">
						<div class="end"></div>
						<div class="date">10.19</div>
					</a></li>		
				</ul>
			</div>
		</div>
      </div>
    </div>
    <div class="signButton"><span>立即签到</span></div>
     <div class="ruleMsg">
		<div class="cntTitle1">
			<span class="title">领奖记录</span>
		</div>
		<div class="cntContent1">
			<ul id="prizeList">
			</ul>
			<div id="nullPrize"style="font-size: 11px;text-align:center;color: #AEAEAE;">您还没有获得抽奖资格哦</div>
		</div>
	</div>
	<div class="ruleMsg">
		<div class="cntTitle1">
			<span class="title">活动规则</span>
		</div>
		<div class="cntContent1">
			<ul>
				<li>1）凡喵姐早教说手机注册用户均可参与；<li>
				<li>2）连续签到3天即可获得1次抽奖机会，每3天可抽一次，连续21天签可获得终级礼包200元会员卡优惠券<li>
				<li>3）抽奖奖项种类：实物券（可兑换儿童早教益智玩具一份）、会员卡优惠券（可用于购买or续费会员卡）、课程优惠券（可用得购买课程）、提问券（可用于快速提问）、现金券（全平台付费使用）；<li>
				<li>4）如有断签到情况，之前签到天数归零，须重新连续签到3天才可抽奖；<li>
				<li>5）未签满21天不可领取终级礼包；<li>
				<li>6）实物奖品将在获奖后7-10个工作日内发货；<li>
				<li>7）平台优惠券由喵姐早教说平台在1-2个工作日内发放至用户账户，优惠券仅可在喵姐早教说平台使用；<li>
				<li>8）优惠券可在个人中心【我的优惠券】栏中查看全部中奖记录；<li>
				<li>9）如对规则说明或抽奖优惠券有任何疑问的请联系客服热线：010-57207965。<li>
				<li>10）本次活动最终解释权归喵姐早教说官方平台所有。</li>
			</ul>
		</div>
	</div>
</div>
<div class="share1">
	<div class="shareBox">
		<div class="sharearrow"></div>
		<p class="font15" style="margin-top: 40px;">你已成功签到</p>
		<p class="font15">分享页面可获得一次抽奖机会哦</p>
	</div>
</div>
<!--尾部-->
	<jsp:include page="/pages/header_footer.jsp">
		<jsp:param value="1" name="menu"/>
	</jsp:include>
<script>
var signRecordStartTime='${signRecordStartTime}';
var signRecordEndTime='${signRecordEndTime}';
var dayNumber='${dayNumber}';
var signManager=JSON.parse('${signManager}');
var signId=signManager.id;
var intervalDayNum=signManager.intervalDayNum;
var prizeList=JSON.parse('${prizeList}');
var isShowShare='${isShowShare}';

if(dayNumber==signManager.activityDayNum){
	$(".signButton span").css('background-color','#A1A1A1');
	$('.signButton').unbind();
}
if(isShowShare=='true'){
	$(".share1").show();
}else{
	$(".share1").hide();
}

$(function(){
	try{
		var saveSign=function(execp){
			HH.ajax({
				url: "/yzmm/account/sign/saveSign",
				data:{"signId":signId,"dayNumber":parseInt(dayNumber)+1},
				callback:function(data){
					if(data.success){
						if(typeof(execp)=='function'){
							execp();
						}
					}else{
						toast(data.msg);
					}
				}
			});
		}
		$('.signButton').on('click',function(){
			if(dayNumber==''){
				dayNumber=0;
			}
			var execp;//可执行变量声明
			//检查用户是否可以签到
			HH.ajax({
				url: "/yzmm/account/sign/checkSureSign",
				callback:function(data){
					if(data.success){
						if(parseInt((dayNumber+1))%intervalDayNum==0){
							if((parseInt(dayNumber)+1)==signManager.activityDayNum){
								//送大奖
								execp=function(){
									HH.ajax({
										url: "/yzmm/account/sign/receiveCoupon",
										data:{"couponId":signManager.completePrizeId,"businessOriginalId":signId},
										callback:function(data){
											if(data.success){
												HH.href('/yzmm/account/usercoupon/useCouponList');
											}else{
												toast(data.msg);
											}
										}
									});
								}
							}else{
								//送小奖-抽奖
								if(signManager.ongoingPrizeType='SIGINACTIVITY'){
									// 之所以这样写，是因为刚开始没有统一入口，后期做的补丁，所以跟前面的不太一样
									HH.href('/yzmm/account/luckDraw/sudokuLuckDraw/'+signManager.ongoingPrizeId);
								}
							}
						}else{
							execp=function(){
								HH.href('/yzmm/account/sign/toUserSign?isShowShare=true');
							}
						}
						if(typeof(execp)=='function'){
							//保存签到 并执行后续操作
							saveSign(execp);
						}
					}else{
						toast(data.msg);
					}
				}
			});
		});
	}catch (e) {
		// TODO: handle exception
	}
	
	try{
		var prizeul=$("#prizeList");
		if(prizeList.length>0){
			$("#nullPrize").css('display','none');
		}
		for (var i = 0; i < prizeList.length; i++) {
			var prize=prizeList[i];
			$("<li><span class='time'>"+fmtDate(new Date(parseInt(prize.time)*1000),'yyyy.MM.dd')+"</span><br><span>抽中 “ <font style='color:#FF9900'>"+prize.name+"</font> ” 1张</span></li>").appendTo(prizeul);
		}
	}catch (e) {
		// TODO: handle exception
	}
	
	try{
		var startTime=0;
		if(signRecordStartTime!=""){
			startTime=signRecordStartTime*1000;
		}else{
			startTime=new Date().getTime();
		}
		var endIndex=-1;
		var daySecond=60*60*24*1000;
		
		var lis=$('.div1').find('li');
		var liArray=lis.toArray();
		
		lis.each(function(){
			var date=$(this).find('.date');
			var fmt=fmtDate(new Date(startTime),'MM.dd');
			date.text(fmt);
			date.parent().parent().data('date',parseInt(startTime/1000));
			//生成最后签到日期
			var endFmt=fmtDate(new Date(signRecordEndTime*1000),'MM.dd');
			if(fmt==endFmt){
				endIndex=liArray.getIndsByVal(this);
			}
			//console.log(endFmt+' '+fmt+' '+signRecordEndTime);
			startTime=startTime+daySecond;
		});
		var newList=liArray.sub(0,parseInt(endIndex)+1);
		for (var i = 0; i < newList.length; i++) {
			var left=$(newList[i]);
			var className=left.find('a').children()[0].className;
			if(className=='hui1'){
				left.find('a').children()[0].className='cheng1';
			}else{
				left.find('a').children()[0].className='cheng2';
			}
		}
	}catch (e) {
		console.log(e);
	}
	$(".share1").click(function(){
			$(".share1").hide();
	});
});
</script>
</body>
</html>