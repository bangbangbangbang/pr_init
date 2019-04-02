<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='j' uri="/jsputil"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <%@include file="/commons/header-static.jsp" %>
    <title>喵姐早教说</title>
    <style type="text/css">
		.couponPage{
			z-index: 9999;
			width: 100%;
			height: 100%;
			position: fixed;
			overflow: auto;
			display: block;
			background-color: white;
		}   
		table {
			width: 100%;
			border: 0px; 
		  	border-color: transparent;
		 	border-collapse: collapse; 
			border-spacing: 0;
			font-size: 0.3rem;
		}
		table td{
			 padding: 0 0.1rem;
			 position: relative;
			 font-size:0.4rem;
		}
		.bizDiv td{
		 padding: 0 0.3rem;
		}
		.td1{
			width: 40%
		}
		.td1 img{
			border-radius:0.2rem;
		}
		.td2{
			width: 60%
		}
		.moneyP{
			color: #FF9900;
			font-size:0.32rem;
			margin-top: 0.1rem;
		}
		.countP{
			color:#A1A1A1;
			font-size:0.32rem;
			background: url(<b:staticUrl>/res/img/common/listen2@2x.png</b:staticUrl>) left center no-repeat;
			background-size: 0.32rem 0.3rem;
			padding-left: 0.32rem;
			margin-top: 0.1rem;
		}
		.td3{
			width: 20%
		}
		.td4{
			width: 80%;
			line-height: 0.5rem;
		}
		.shuomingP{
			color:#A1A1A1;
			font-size:0.32rem;
			margin-top: 0.1rem;
		}
		.totleP{
			font-size: 0.32rem;
			padding-left: 0.32rem;
		}
		.mnSpen{
			font-style: italic;
			font-size: 0.7rem;
		}
		.gelixian{
			background: url(<b:staticUrl>/res/img/u1257.png</b:staticUrl>) left center repeat-y;
		}
		.couponIdRadio{
		    width: 0.5rem;
		    height: 0.5rem;
		    display: inline-block;
		    float: left;
		    margin: 3px 7px 0 0;
		    cursor: pointer;
		    position: relative;
		    -webkit-border-radius: 100%;
		    -moz-border-radius: 100%;
		    border-radius: 100%;
		    border: 1px solid #ccc;
		    box-shadow: 0 0 1px #ccc;
		    background: rgb(255, 255, 255);
		    background: -moz-linear-gradient(top, rgba(255, 255, 255, 1) 0%, rgba(246, 246, 246, 1) 47%, rgba(237, 237, 237, 1) 100%);
		    background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, rgba(255, 255, 255, 1)), color-stop(47%, rgba(246, 246, 246, 1)), color-stop(100%, rgba(237, 237, 237, 1)));
		    background: -webkit-linear-gradient(top, rgba(255, 255, 255, 1) 0%, rgba(246, 246, 246, 1) 47%, rgba(237, 237, 237, 1) 100%);
		    background: -o-linear-gradient(top, rgba(255, 255, 255, 1) 0%, rgba(246, 246, 246, 1) 47%, rgba(237, 237, 237, 1) 100%);
		    background: -ms-linear-gradient(top, rgba(255, 255, 255, 1) 0%, rgba(246, 246, 246, 1) 47%, rgba(237, 237, 237, 1) 100%);
		    background: linear-gradient(to bottom, rgba(255, 255, 255, 1) 0%, rgba(246, 246, 246, 1) 47%, rgba(237, 237, 237, 1) 100%);
		    filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffff', endColorstr='#ededed', GradientType=0);
				}
    </style>
</head>
<body>
<div class="couponPage" style="display:none;">
<c:if test="${'GODDESSACTIVITY'!=param.businessType}">
<h1 id="clearDetailDiv" style="background-color: transparent" class="activityTitle" onclick="hideCoupon()"><span class="backBtn"></span></h1>
</c:if>
	<div style="width: 100%;text-align: center;padding: 0.3rem;">
		 <p style="color: #868686;font-size:0.32rem;margin: 0.2rem auto;">支付剩余时间 </p>
		 <p id="timeP" style="color: #0099FF;font-weight:bold;font-size:0.8rem">30:00</p>
		 <div style="height:1px;width: 100%;background-color: rgba(142, 128, 128, 0.28);margin-top: 0.3rem;"></div>
	</div>
	<div class="bizDiv">
	<c:choose>
		<c:when test="${'COURSE'==param.businessType}">
			<table>
				<tr>
					<td class="td1"><img src="${param.imgUrl}" width="100%"></td>
					<td class="td2">
					${name}
					<p class="countP" style="display: ${param.count==0?'none':''}" >${param.count}人已看过</p>
					<p class="moneyP">￥${param.money}</p>
					</td>
				</tr>
			</table>
		</c:when>
		<c:when test="${'MIAOQA'==param.businessType}">
			<table>
				<tr>
					<td class="td3"><img src="<b:staticUrl>/res/img/u1291.png</b:staticUrl>" width="100%"></td>
					<td class="td4">
					1 对 1 个性化咨询服务
					<p class="shuomingP">喵姐量身定制，给出靠谱家庭教育建议</p>
					<p class="moneyP">￥${param.money} / 次</p>
					</td>
				</tr>
			</table>
		</c:when>
		<c:when test="${'YEARCARD'==param.businessType}">
			<table>
				<tr>
					<td class="td3"><img src="<b:staticUrl>/res/img/u1377.png</b:staticUrl>" width="100%"></td>
					<td class="td4">
					喵姐早教说 - VIP会员卡
					<p class="shuomingP">服务时长：365天</p>
					<p class="moneyP">￥${param.money}</p>
					</td>
				</tr>
			</table>
		</c:when>
		<c:when test="${'GODDESSACTIVITY'==param.businessType}">
			<table>
				<tr>
					<td class="td3"><img src="<b:staticUrl>/res/img/vip1.png</b:staticUrl>" width="100%"></td>
					<td class="td4">
					21天改掉坏脾气，遇见最好的自己
					<p class="shuomingP">21天改掉坏脾气，遇见最好的自己</p>
					<p class="moneyP">￥${param.money+param.baozhengjin}（报名费：￥${param.money} + 保证金：￥${param.baozhengjin}）</p>
					</td>
				</tr>
			</table>
		</c:when>
		<c:when test="${'COURSEPACKAGE'==param.businessType}">
			<table>
				<tr>
					<td class="td1"><img src="${param.imgUrl}" width="100%"></td>
					<td class="td2">
					${name}
					<p class="countP" style="display: ${param.count==0?'none':''}" >${param.count}人已看过</p>
					<p class="moneyP">￥${param.money}</p>
					</td>
				</tr>
			</table>
		</c:when>
	</c:choose>
	</div>
 <div style="height:4px;width: 100%;margin:0.6rem 0; background-color: rgba(142, 128, 128, 0.28);"></div>
 <p class="totleP">
 	有 <span class="totleSpen">0</span> 张优惠券可用：<a style="float: right;margin-right: 0.32rem;color: #0099FF;" onclick="noneCoupon()">不用优惠，直接支付 > </a>
 </p>
 <div style="padding:0.3rem">
  <div style="height:1px;width: 100%; background-color: rgba(142, 128, 128, 0.28);margin-bottom: 0.4rem;"></div>
  <div class="initDiv" style="border: 1px rgba(142, 128, 128, 0.28) solid;border-radius:0.2rem;margin: 0.2rem 0;display: none">
	  <table>
	  	<tr>
	  		<td style="border-radius:0.2rem 0 0 0.2rem; background-color:#FF9900;">
	  			<div style="min-height: 2rem;"></div>
	  		</td>
	  		<td  style="padding: 0 0.3rem 0 0.6rem;">
				<span style="position:absolute;top: 28%;left: 0.2rem;font-weight: bold;">￥</span>
				<span class="mnSpen">26.9</span>
			</td>
			<td class="gelixian" style="width: 0.3rem;padding: 0;"></td>
	  		<td style="">
	  			<div class="couponName" style="padding: 0.5rem 0.01rem 0.3rem 0rem;"><span class="leixing" style="font-weight: bold;font-size: larger;"></span> | <span class="name" style="font-size:small;">喵姐说微课专场</span></div>
	  			<div class="couponValidTime" style="padding: 0.1rem 0.01rem 0.3rem 0rem;color: rgb(161, 161, 161);font-size: 0.32rem;">有效期：2017.04.13 - 2.017.04.16</div>
	  		</td>
	  		<td style="padding:0.3rem 0.2rem;" valign="top">
	  			<input type="radio" class="couponIdRadio" name="couponId" value="">
	  		</td>
	  	</tr>
	  </table>
  </div>
  
 	<div class="initDivP">
 	
  	</div> 	
 </div>
 <p style="font-size: 0.32rem;color: rgb(188, 188, 188);text-align: center;margin-bottom: 2rem;">
 优惠券不可叠加使用
 </p>
<div style="width: 100%;text-align: center;color: white;font-size: 0.5rem;margin: 0.3rem 0;position: fixed;bottom: 0.32rem;">
	<c:choose>	
		<c:when test="${'GODDESSACTIVITY'==param.businessType}">
			<div class="couponPaybtn" style="width: 6.8rem;background-color: #FF9900;border-radius: 0.5rem;line-height: 1rem;margin: 0 auto;font-size: 0.45rem;">支付 <span>${param.money+param.baozhengjin}</span> 元</div>
		</c:when>
		<c:otherwise>
			<div class="couponPaybtn" style="width: 6.8rem;background-color: #FF9900;border-radius: 0.5rem;line-height: 1rem;margin: 0 auto;font-size: 0.45rem;"">支付 <span>${param.money}</span> 元</div>
		</c:otherwise>
	</c:choose>
</div> 
</div>
  <script type="text/javascript">
    var timestartInterval="";
    function timestart(){
    		var timeP  = $("#timeP");
		var m=29;
		var s=59;
		timestartInterval = window.setInterval(function(){
	        if(s<10){
	        		timeP.html(m+':0'+s);
	        }else{
	       	 	timeP.html(m+':'+s);
	        }
	        s--;
			if(0==m && 0==s){
				window.clearInterval(timestartInterval);
	        }
	        if(s<0){
	        	 	s=59;
		        m--;
	        }
	    },1000)
    }
    
    var money =  "${param.money}";
    var baozhengjin = "${param.baozhengjin}";
	</script>
<script type="text/javascript">
function dealnum9(num){
	var isF = false;
	if(num<0){
		isF=true;
	}
	var n = isF ? num*-100 : num*100;
	var m = parseInt(n+"");
	var r = m+"";
	if(n-m >= 0.9){
		r = parseInt(m)+1;
		r = ""+r;
	}
	var l = r.length;
	if(l<2){
		r = "0.0"+r;
	}else if(l<3){
		r = "0."+r;
	}else{
		r = r.substr(0,l-2)+"."+r.substr(l-2)
	}
	if(isF){
		r = "-"+r;
	}
	return r;
}
var callbackFn = function(){};
var couponWrap ;
function showCoupon(_callbackFn,wrap){
	if(isWeixin!="true"){
		toast("请您进入微信支付");
		return false;
	}
	couponWrap = $(wrap);
	callbackFn = _callbackFn;
	var initDivP = $(".initDivP");
	initDivP.empty();
  	var initDiv = $(".initDiv");
	$(".totleP").find(".totleSpen").html(0);
	HH.ajax({
		waiting:true,
		data:{businessType:'${param.businessType}',bizId:'${param.bizId}',pageSize:100},
		url:"/yzmm/wxmppay/coupon",
		callback:function(data){
			if (data.success) {
				//是否为空
				if (!data.totalPage) {
					hideCoupon();
					callbackFn("");
				} else {
					$(".totleP").find(".totleSpen").html(data.totalRows);
					var len = data.list.length; 
					for(var i=0;i<len;i++){
						var o = data.list[i];
					  	var n = initDiv.clone();
					  	if("SINGLE" == o.type){
					  		n.find(".couponIdRadio").data("money",money);
					  		n.find(".mnSpen").html(money);
					  	}else{
					  		var sm = dealnum9(o.typeAmount/100);
					  		n.find(".couponIdRadio").data("money",sm);
					  		n.find(".mnSpen").html(sm);
					  	}
					  	n.find(".couponIdRadio").val(o.id);
					  	n.find(".couponName .leixing").html(o.typeName);
					  	//现金券 兑换券
					  	n.find(".couponName .name").html(o.name);
					  	n.find(".couponValidTime").html('有效期：'+fmtSecondyyyMMDDdot(o.validStartTime)+' - '+fmtSecondyyyMMDDdot(o.validEndTime));
					  	initDivP.append(n);
					  	n.show();
					}
					
					<c:choose>	
						<c:when test="${'GODDESSACTIVITY'==param.businessType}">
							$(".couponIdRadio").on("click",function(){
								var money2 = $(this).data("money");
								var oldmoney = money;
								var newmoney = oldmoney - money2;
								newmoney = newmoney > 0 ? newmoney : 0;
								var baozhengjin = '${param.baozhengjin}';
								$(".couponPaybtn").find("span").html((parseFloat(dealnum9(newmoney))+parseFloat(baozhengjin)).toFixed(2));
							});
						</c:when>
						<c:otherwise>
						$(".couponIdRadio").on("click",function(){
							var money2 = $(this).data("money");
							var oldmoney = money;
							var newmoney = oldmoney - money2;
							newmoney = newmoney > 0 ? newmoney : 0;
							if("true" == "${'YEARCARD'==param.businessType}"){
								newmoney = newmoney < 6 ? "6.00" :newmoney;
							}
							$(".couponPaybtn").find("span").html(dealnum9(newmoney));
						});
						</c:otherwise>
					</c:choose>
					$(".couponPage").show();
					couponWrap.hide();
					timestart();
				}
			} 
		}
	});
}

function noneCoupon(){
	hideCoupon();
	callbackFn("");
}

function hideCoupon(){
	couponWrap.show();
	window.clearInterval(timestartInterval);
	$(".couponPaybtn").find("span").html(dealnum9(money));
	$(".couponPage").hide();
}

$(function(){
	$(".couponPaybtn").click(function(){
		 var chkRadio = $('input:radio[name="couponId"]:checked').val();
		 if(!chkRadio){
			 toast("请选择优惠券！")
			 return;
		 }
		if(typeof callbackFn =='undefined' || !callbackFn){
			return;
		}
		hideCoupon();
		callbackFn(chkRadio);
	});
})

</script>
</body>
</html>