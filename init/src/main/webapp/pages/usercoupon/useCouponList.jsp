<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>喵姐早教说</title>
    <%@include file="../header_v15.jsp" %>
    <link rel="stylesheet" href="<b:staticUrl>/res/css/center-v1.1.css</b:staticUrl>">
    <script src="<b:staticUrl>/res/js/scrollpaginationme.js</b:staticUrl>"></script>
    <style type="text/css">
    	.emptyDiv .emptyImg{
    		margin: 100px auto 0;
    		text-align: center;
    	}
    	.emptyDiv .emptyImg img{
    		width:100px;
    	}
    	.emptyDiv .emptyImg p{
    		margin-top: 10px;
		    font-size: 0.42rem;
		    color: #BFBFBF;
    	}
    	.emptyDiv .button {
		    width: 70%;
		    margin: 0 auto;
		    margin-top: 2.13333333rem;
		    padding: 0 0.4rem;
		}
		.emptyDiv .button a {
		    display: block;
		    height: 0.9rem;
		    line-height: 0.9rem;
		    background-color: white;
		    border: 1px solid#ffc21c;
		    border-radius: 1.33333333rem;
		    text-align: center;
		    color: #ffc21c;
		    font-size: 0.38rem;
		}
		.mainDiv{
			padding: 15px 12px;
    		background-color: rgba(242, 242, 242, 1);
		}
		.mainDiv .headImg img{
			width: 100%;
		}
		.fengexian {
			width: 99%;
			height: 1px;
			background-repeat: repeat-x;
			background-image:url("<b:staticUrl>/res/img/cp/wd/onexuxian2.png</b:staticUrl>");
			margin: 10px;
		}
		.mainDiv .section{
			margin: 10px;
		    font-size: 12px;
		    background: white;
		    padding: 0 20px 10px 20px;
		    line-height:15px;
		}
		.mainDiv .section .title img{
			width:12px;
		}

		.mainDiv .section .title a{
			 color: #000;
		}
		.overdue .section .title a{
			 color: #868686;
		}
		.mainDiv .section .content2{
			font-size: 0.8rem;
			margin: 0.6rem 0px;
		}
		.mainDiv .section .content2 sup{
			font-size: 10px;
   			 margin-left: 5px;
		}
		.mainDiv .section .content2 span{
			font-size: 10px;
			margin-left: 12px;
		}
		.mainDiv .section .content2 label{
			font-size: 12px;
		}
		  
		.mainDiv .section .forgive{
			float:right;
			color:#0099ff;
			margin-right: -20px;
			margin-top: 13px;
		}
		.mainDiv .section .isoverday{
			float: right;
		    color: #000;
		    font-weight: 500;
		    margin-right: -15px;
		    margin-top: 13px;
		}
		.overdue .section {
			    border-bottom: 5px solid #979797;
			    box-shadow: 0 4px 0px #cccccc;
		}
		.mainDiv .section .foot{
			margin: 12px 0 0 0;
			color:#0099ff;
			font-weight: 500;
		}
		.mainDiv .section .foot .give{
			float:right;
		}
		.mainDiv .section .foot .time{
			color:#aeaeae;
		}
		.mainDiv .section .yuan{
			top: 30px;
		    left: -25px;
		    position: relative;
		}
		.mainDiv .section .yuan2{
			float: right;
		    position: relative;
		    top: 33px;
		    left: 25px;
		}
		.mainDiv .section .outdate{
		        float: right;
			    position: relative;
			    left: 20px;
		}
		.cardList,.effectiveList{
			margin-top: 0.6rem;
		}
		.effectiveList .section{
			border-bottom: 5px solid rgba(255, 194, 28, 1);
			box-shadow: 0 4px 0px #cccccc;
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
		    width: 4.2rem;
		    position: relative;
		    margin: 0 auto;
		    text-align: center;
		    font-size: 0.3rem;
		    color: #979797;
		}
		.subtitle span:before,.subtitle span:after{
			    content: '';
			    width: 1.2rem;
			    height: 0;
			    position: absolute;
			    top: 50%;
			    border-top: 0.01333333rem solid #979797;
			    margin: 0 100px;
		}
		.overdue{
			    color: #868686;
		}
    </style>
<style type="text/css">
table {
	width: 100%;
	border: 0px;
	border-color: transparent;
	border-collapse: collapse;
	border-spacing: 0;
	font-size: 0.3rem;
}

table.one td {
	padding: 0.2rem 0.1rem;
	position: relative;
	font-size: 0.4rem;
}

table.two td {
	padding: 0.1rem 0.1rem;
	position: relative;
	font-size: 0.32rem;
}

.td1 {
	width: 10%
}
</style>
</head>
<body id="bgwhite">
	<c:if test="${count==0}">
		<section class="emptyDiv">
			<div class="emptyImg">
				<img alt="" src="<b:staticUrl>/res/img/center/u749.png</b:staticUrl>">
				<p>您还没有优惠券</p>
			</div>
			<!-- //TODO 注掉优惠券入口，重新开启需要重新整理需求，慎重+慎重 -->
			<!-- <div class="button" id="receive">
				<a href="#">马上去领券></a>
			</div> -->
		</section>
	</c:if>
	<c:if test="${count!=0}">
		<section class="mainDiv">
			<div class="headImg">
				<img alt="" src="<b:staticUrl>/res/img/center/quan_header.jpg</b:staticUrl>">
			</div>
			<div class="cardList" style="display: none">
				<div style="width: 100%;height: 0.8rem;font-size: 0.36rem;margin-top: 0.32rem;background: url(<b:staticUrl>/res/img/vip1.png</b:staticUrl>);background-repeat: no-repeat;padding-left: 1rem;background-size: contain;line-height: 0.8rem;font-weight: bold;color: #333333;">
				VIP会员专享券
				<div onclick="showVipInfo()" style="float: right;border: 1px #0099FF solid;color: #0099FF;width: 0.5rem;height: 0.5rem;line-height: 0.5rem;border-radius: 50%;padding-left: 0.12rem;margin-right: 0.3rem;">?</div>
				</div>
			</div>
			<div class="effectiveList"style="display: none">
				<div style="width: 100%;height: 0.8rem;font-size: 0.36rem;margin-top: 0.32rem;background: url(<b:staticUrl>/res/img/u271.png</b:staticUrl>);background-repeat: no-repeat;padding-left: 1rem;background-size: contain;line-height: 0.8rem;font-weight: bold;color: #333333;">
				获赠奖券
				<div onclick="showNoneVipInfo()" style="float: right;border: 1px #0099FF solid;color: #0099FF;width: 0.5rem;height: 0.5rem;line-height: 0.5rem;border-radius: 50%;padding-left: 0.12rem;margin-right: 0.3rem;">?</div>
				</div>
			</div>
			<div class="morecoupon">
				<div class="subtitle"><span>点击查看历史优惠券<img style="width: 16px;" src="<b:staticUrl>/res/img/center/u589.png</b:staticUrl>"></span></div>
			</div>
			<div class="overdue" >
			</div>
		</section>
	</c:if>
	 <jsp:include page="/pages/header_footer.jsp">
		<jsp:param value="4" name="menu"/>
	</jsp:include>
	
<div class="showVipInfo" style="z-index: 9999;position: fixed;top: 0;width: 100%;background-color: white;height: 100%;overflow: auto;display: none;">
<div style="width: 100%;height: 3rem;text-align: center;background-color: rgba(255, 153, 51, 1);padding-top: 0.5rem;">
	<img style="width: 1rem;  height: 1rem;" src="<b:staticUrl>/res/img/u405.png</b:staticUrl>">
	<p style="color: white;font-weight: bold;font-size: 0.4rem;">VIP会员专享券使用规则</p>
</div>
<div style="padding: 0.7rem;font-size: 0.32rem;line-height: 0.5rem;">
	<p style="color:#FF9933;font-size: 0.36rem;">VIP专属优惠券包含：</p>
	<table class="one">
		<tr><td class="td1">1.</td><td>微课兑换券 x 24张</td></tr>
		<tr><td class="td1">2.</td><td>提问兑换券 x 12张</td></tr>
		<tr><td class="td1">3.</td><td>主题课包兑换券 x 4张</td></tr>
	</table>
	<p style="color: #A1A1A1">点击「<span style="color:#0099FF;">立即使用</span>」即可使用优惠券。</p>
	<p style="color: #A1A1A1">想要赠送优惠券给好友，请点击「<span style="color:#0099FF;">转赠</span>」按钮。</p>
	<br>
	<p style="color:#FF9933;font-size: 0.36rem;">注意事项：</p>
	<table class="two">
		<tr><td valign="top">1.</td><td>优惠券只能在适用范围内使用，具体可查看优惠券的说明。</td></tr>
		<tr><td valign="top">2.</td><td>优惠券仅限于在喵姐早教说平台内订购时使用。</td></tr>
		<tr><td valign="top">3.</td><td>优惠券仅限在有效期间内使用，过期作废。</td></tr>
		<tr><td valign="top">4.</td><td>优惠券不能兑换现金，不找零，不退换。</td></tr>
		<tr><td valign="top">5.</td><td>一次只能使用一张优惠券，无法使用两张或以上的优惠券。</td></tr>
		<tr><td valign="top">6.</td><td>使用了优惠券情况下发生退款时，优惠券不可退还。</td></tr>
		<tr><td valign="top">7.</td><td>赠送后的优惠券，无法退回。</td></tr>
		<tr><td valign="top">8.</td><td>最终解释权由喵姐早教说所有。</td></tr>
	</table>
</div>
<div style="width: 100%;">
	<div onclick='$(".showVipInfo").slideUp()' style="background-color: rgba(255, 153, 51, 1);width: 80%;margin: 0.3rem auto;text-align: center;padding: 0.2rem;border-radius: 0.6rem;color: white;font-size: 0.4rem;">朕知道啦</div>
</div>
</div>

<div class="showNoneVipInfo" style="z-index: 9999;position: fixed;top: 0;width: 100%;background-color: white;height: 100%;overflow: auto;display: none;">
<div style="width: 100%;height: 3rem;text-align: center;background-color: rgba(255, 153, 51, 1);padding-top: 0.5rem;">
	<img style="width: 0.7rem;  height: 0.7rem;" src="<b:staticUrl>/res/img/youhuiquan6.png</b:staticUrl>">
	<p style="color: white;font-weight: bold;font-size: 0.4rem;margin-top: 0.3rem;">获赠奖券使用规则</p>
</div>
<div style="padding: 0.7rem;font-size: 0.32rem;line-height: 0.5rem;">
	<p style="color:#FF9933;font-size: 0.36rem;">获赠优惠券规则：</p>
	<p style="color: #A1A1A1">点击「<span style="color:#0099FF;">立即使用</span>」即可使用优惠券。</p>
	<p style="color: #A1A1A1">想要赠送优惠券给好友，请点击「<span style="color:#0099FF;">转赠</span>」按钮。</p>
	<br>
	<p style="color:#FF9933;font-size: 0.36rem;">注意事项：</p>
	<table class="two">
		<tr><td valign="top">1.</td><td>优惠券只能在适用范围内使用，具体可查看优惠券的说明。</td></tr>
		<tr><td valign="top">2.</td><td>优惠券仅限于在喵姐早教说平台内订购时使用。</td></tr>
		<tr><td valign="top">3.</td><td>优惠券仅限在有效期间内使用，过期作废。</td></tr>
		<tr><td valign="top">4.</td><td>优惠券不能兑换现金，不找零，不退换。</td></tr>
		<tr><td valign="top">5.</td><td>一次只能使用一张优惠券，无法使用两张或以上的优惠券。</td></tr>
		<tr><td valign="top">6.</td><td>使用了优惠券情况下发生退款时，优惠券不可退还。</td></tr>
		<tr><td valign="top">7.</td><td>获赠优惠券，无法再次赠送。</td></tr>
		<tr><td valign="top">8.</td><td>最终解释权由喵姐早教说所有。</td></tr>
	</table>
</div>
<div style="width: 100%;">
	<div onclick='$(".showNoneVipInfo").slideUp()' style="background-color: rgba(255, 153, 51, 1);width: 80%;margin: 0.3rem auto;text-align: center;padding: 0.2rem;border-radius: 0.6rem;color: white;font-size: 0.4rem;">朕知道啦</div>
</div>
</div>
	
</body>
<script type="text/javascript">
function showVipInfo(){
	$(".showVipInfo").slideDown();
}
function showNoneVipInfo(){
	$(".showNoneVipInfo").slideDown();
}

function giveother(obj){
	var id = $(obj).data("id");
	if(id){
		var url = "/yzmm/account/usercoupon/toShareCoupon?id="+id;
		HH.href(url);
	}
}
function gotogongneng(obj){
	var url = $(obj).data("url");
	if(url){
		HH.href(url);
	}
}

function toCompleteInfo(obj){
	var id = $(obj).data("id");
	if(id){
		var url = "/yzmm/account/usercoupon/toCompleteDeliverInfo?id="+id;
		HH.href(url);
	}
}

function cardList(list){
	if(!list){
		return;
	}
	var h = "";
	for(var i=0; i<list.length; i++){
		var o  = list[i];
		console.dir(o)
		var zhang = o.ext;
		h += createQuan(o,11111,zhang);
	}
	console.log(h)
	if(h){
		$(".cardList").show();
		$(".cardList").append(h);
	}
	
}

function createQuan(o,pageIndex,zhang){
	if(!o){
		return  "";
	}
	var h = "";
	h+='<div class="section">';
	h+='<img class="yuan" src="<b:staticUrl>/res/img/center/u485.png</b:staticUrl>">';
	if(o.validEndTime>timestamp+86400){
		h+='<img class="yuan2" src="<b:staticUrl>/res/img/center/u485.png</b:staticUrl>">';
	}else {
		h+='<img class="outdate" src="<b:staticUrl>/res/img/center/u579.png</b:staticUrl>">';
	}
	h+='<div class="title">';
		if("SINGLE" == o.type){
			h+="兑换券 |";
			
	  	}else{
	  		h+="现金券 |";//+o.name;
	  	}
		var ljsy = "";
		if("YEARCARD"==o.businessType){
			ljsy = "/yzmm/account/VIPStatus";
			h+='<a href="#">';
				h+=' VIP会员卡专场';
			h+='</a>';
		}else if("COURSE"==o.businessType||"COURSEPACKAGE"==o.businessType){
			ljsy = "/yzmm/account/course/list";
			h+='<a href="#">';
				h+=' 喵姐说专场';
			h+='</a>';
		}else if("MIAOQA"==o.businessType){
			ljsy = "/yzmm/account/miaoqa/index";
			h+='<a href="#">';
				h+=' 1对1咨询专场';
			h+='</a>';
		}else if("GODDESSACTIVITY"==o.businessType){
			ljsy = "/yzmm/account/activitytype/list";
			h+='<a href="#">';
				h+=' 行动计划专场';
			h+='</a>';
		}else if("ALL"==o.businessType){
			ljsy = "/yzmm/index";
			h+='<a href="#">';
				h+=' 全网通';
			h+='</a>';
		}else if("OBJECT"==o.businessType){
			ljsy = "/yzmm/index";
			h+='<a href="#">';
			h+='实物';
			h+='</a>';
		}else if("PREKINDERGARTEN"==o.businessType){
			ljsy = "/yzmm/index";
			h+='<a href="#">';
			h+='入园适应训练专用券';
			h+='</a>';
		}
		
		if(o.originalType!='DONATION'&&"OBJECT"!=o.businessType){
			h+="<div data-id='"+o.id+"' onclick='giveother(this)' style='float: right;background: url(\"<b:staticUrl>/res/img/u327.png</b:staticUrl>\") no-repeat; background-size: contain; padding-left: 0.5rem;'>";
			h+="转 赠</div>";
		}
		
	h+='</div>';
	h+='<div class="fengexian"></div>';
	h+='<div class="content2">';
		if("SINGLE" == o.type){
			h+=o.name;
			if("OBJECT"!=o.businessType){
				h+='<label>/'+(zhang?" x "+zhang:"")+'张</label>';
			}
	  	}else{
	  		h+='<i><sup>￥</sup>'+(o.typeAmount/100)+'</i>';
	  		if("OBJECT"!=o.businessType){
				h+='<label>/'+(zhang?" x "+zhang:"")+'张</label>';
			}
	  		if(o.description){
				h+='<span>'+o.description+'</span>';
			}	
	  	}
	h+='</div>';
	h+='<div class="foot">';
		
		if("OBJECT"!=o.businessType && ljsy){
			h+='<div data-id='+o.id+' data-url="'+ljsy+'" class="give rulebuttom rulebuttomindex'+pageIndex+'" onclick="gotogongneng(this);">立即使用</div>';
		}else if("OBJECT"==o.businessType){
			if("NODELIVERYINFO"==o.deliveryStatus){
				h+='<div data-id='+o.id+' class="give rulebuttom rulebuttomindex'+pageIndex+'" onclick="toCompleteInfo(this);">填写收货地址></div>';
			}
		}
		h+='<div class="time">有效期：'+fmtSecondyyyMMDDdot(o.validStartTime)+' - '+fmtSecondyyyMMDDdot(o.validEndTime)+'</div>';
	h+='</div>';
h+='</div>';

return h;
}


var count = '${count}';
var timestamp = Date.parse(new Date())/1000;
$(function(){

	if(count>0){
		var pageIndex = 1;
		var sm = {};
		sm = $(window).scrollme({
		//target:$(".effectiveList"),
		  url:'/yzmm/account/usercoupon/ajaxUsefulCouponList',
		    data:{
		    	pageIndex:pageIndex,
		    	pageSize:5
		    },
		    callback:function(data,params){
		      	var h = "";
	    		if(data.success){
	    			//vipcard
	    			cardList(data.ext)
	    			
	    			var len = data.list.length + data.ext.length;
	    			if (len) {
						//增加页码
						params.pageIndex = ++pageIndex;
					}
					for(var i=0;i< len;i++){
						var o = data.list[i];
						h += createQuan(o,pageIndex);
					} 
	    		}
	    			if(h){
	    				$(".effectiveList").show();
	    				$(".effectiveList").append(h);
	    			}
	       		
		    }
		 });
		sm.reload();
	}
	
	$(".morecoupon").click(function(){
		$(this).hide();
		var pageIndex2 = 1;
		var sm2 = {};
		$(window).unbind();
		sm2 = $(window).scrollme({
		target:$(".overdue"),
		  url:'/yzmm/account/usercoupon/ajaxUselessCouponList',
		    data:{
		    	pageIndex:pageIndex2,
		    	pageSize:5
		    },
		    callback:function(data,params){
		      	var h = "";
	    		if(data.success){
	    			var len = data.list.length;
	    			if (len) {
						//增加页码
						params.pageIndex = ++pageIndex2;
					}
					for(var i=0;i< len;i++){
						var o = data.list[i];
						h+='<div class="section"  data-id='+o.id+'>';
							h+='<img class="yuan" src="<b:staticUrl>/res/img/center/u485.png</b:staticUrl>">';
							h+='<img class="yuan2" src="<b:staticUrl>/res/img/center/u485.png</b:staticUrl>">';
							if(o.validEndTime<timestamp){
								h+='<div class="isoverday">已过期</div>';
							}else{
								if(o.businessType!="OBJECT"){
									if(o.giveStatus=='DONATIONING'){
										h+='<div class="forgive" >等待好友领取></div>';
									}else if(o.useStatus=='YES'){
										h+='<div class="forgive">已使用</div>';
									}
								}else if(o.businessType=="OBJECT"){
									if(o.deliveryStatus=='PERFECTINFO'){
										h+='<div class="forgive" data-id='+o.id+' onclick="toCompleteInfo(this);">等待发货</div>';
									}else if(o.deliveryStatus=='PERFECTINFO'){
										h+='<div class="forgive" data-id='+o.id+' onclick="toCompleteInfo(this);">已经发货</div>';
									}
								}
							}
							h+='<div class="title">';
								if("SINGLE" == o.type){
									h+="兑换券 |";
									
							  	}else{
							  		h+="现金券 |";//+o.name;
							  	}
								if("YEARCARD"==o.businessType){
									h+='<a href="/yzmm/account/VIPStatus">';
										h+=' VIP会员卡专场';
										h+=' <img alt="" src="<b:staticUrl>/res/img/center/u519.png</b:staticUrl>">';
									h+='</a>';
								}else if("COURSE"==o.businessType||"COURSEPACKAGE"==o.businessType){
									h+='<a href="/yzmm/account/course/list">';
										h+=' 喵姐说专场';
										h+=' <img alt="" src="<b:staticUrl>/res/img/center/u519.png</b:staticUrl>">';
									h+='</a>';
								}else if("MIAOQA"==o.businessType){
									h+='<a href="/yzmm/account/miaoqa/index">';
										h+=' 1对1咨询专场';
										h+=' <img alt="" src="<b:staticUrl>/res/img/center/u519.png</b:staticUrl>">';
									h+='</a>';
								}else if("GODDESSACTIVITY"==o.businessType){
									h+='<a href="/yzmm/account/activitytype/list">';
										h+=' 行动计划专场';
										h+=' <img alt="" src="<b:staticUrl>/res/img/center/u519.png</b:staticUrl>">';
									h+='</a>';
								}else if("ALL"==o.businessType){
									h+='<a href="/yzmm/index">';
										h+='全网通';
										h+=' <img alt="" src="<b:staticUrl>/res/img/center/u519.png</b:staticUrl>">';
									h+='</a>';
								}else if("OBJECT"==o.businessType){
									h+='<a href="/yzmm/index">';
									h+='实物';
									h+=' <img alt="" src="<b:staticUrl>/res/img/center/u519.png</b:staticUrl>">';
									h+='</a>';
								}else if("PREKINDERGARTEN"==o.businessType){
									h+='<a href="/yzmm/index">';
									h+='入园适应训练专用券';
									h+=' <img alt="" src="<b:staticUrl>/res/img/center/u519.png</b:staticUrl>">';
									h+='</a>';
								}
							h+='</div>';
							h+='<div class="fengexian"></div>';
							h+='<div class="content2">';
								if("SINGLE" == o.type){
									h+=o.name;
									h+='<label>/张</label>';
							  	}else{
							  		h+='<i><sup>￥</sup>'+(o.typeAmount/100)+'</i>';
							  		if(o.description){
										h+='<span>'+o.description+'</span>';
									}	
							  	}
							h+='</div>';
							h+='<div class="foot">';
								if(o.giveStatus=='DONATIONEND'){
									h+='<div data-id='+o.id+' class="give" style="color: #a1a1a1;">';
									if(o.memo){
										h+=o.memo+'已领取';
									}
									h+='</div>';
									h+='<div class="time">有效期：'+fmtSecondyyyMMDDdot(o.validStartTime)+' - '+fmtSecondyyyMMDDdot(o.validEndTime)+'</div>';
								}else if(o.useStatus=='YES'){
									if(o.businessType!="OBJECT"){
									h+='<div data-id='+o.id+' data-usetargetid='+o.useTargetId+' data-usetargettype='+o.useTargetType+' class="give couponUseDetail" style="color: #a1a1a1;">详情></div>';
									h+='<div class="time">使用时间：'+fmtSecond(o.useTime)+'</div>';
									}else if(o.businessType=="OBJECT"){
										//已使用 包括 已经完善信息 和已经投递
										if(o.deliveryStatus=='PERFECTINFO'){
											h+='<div data-id='+o.id+' class="give" style="color: #a1a1a1;" onclick="toCompleteInfo(this);">详情></div>';
											h+='<div class="time">使用时间：'+fmtSecond(o.useTime)+'</div>';
										}else if(o.deliveryStatus=='PERFECTINFO'){
											h+='<div data-id='+o.id+' class="give" style="color: #a1a1a1;" onclick="toCompleteInfo(this);">详情></div>';
											h+='<div class="time">投递时间：'+fmtSecond(o.deliveryTime)+'</div>';
										}
									}
								}	
								
							h+='</div>';
						h+='</div>';
					} 
	    		}
	       		$(".overdue").append(h);
	       		$(".couponUseDetail").on("click",function(){
					var useTargetType = $(this).data("usetargettype");
					var useTargetId = $(this).data("usetargetid");
					if(useTargetType=='YEARCARD'){
						HH.href("/yzmm/account/VIPStatus");
					}else if(useTargetType=='COURSE'){
						HH.href("/yzmm/account/course/jump/"+useTargetId);
					}else if(useTargetType=='MIAOQA'){
						HH.href("/yzmm/account/miaoqa/myMiaoQaByGroupId?groupId="+useTargetId);
					}else if(useTargetType=='GODDESSACTIVITY'){
						HH.href("/yzmm/account/activity/goddessplan/detail/statusSeleter?activityId="+useTargetId);
					}else{
						HH.href("/account/index");
					}
				});
		    }
		 });
		sm2.reload();
	});
	
	//由分享进来的用户显示 isVip
	if('${showToast}'=='true'){
		_successTips("恭喜你，领取成功");
	}else if('${showToast}'=='false'){
		_errorTips("遗憾，您手慢了一步");
	}
});
</script>
</html>