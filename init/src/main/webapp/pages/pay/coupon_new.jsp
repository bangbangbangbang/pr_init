<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='j' uri="/jsputil"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <%@include file="/commons/header-static.jsp" %>
    <title>喵姐早教说</title>
      <title>喵姐早教说-幼儿园活动首页</title>
    <link rel="stylesheet" href="<b:staticUrl>/res/css/base.css</b:staticUrl>">
	<script src="<b:staticUrl>/res/js/jquery-2.1.1.min.js</b:staticUrl>"></script> 
    <link rel="stylesheet" href="<b:staticUrl>/res/css/payment.css</b:staticUrl>">
    <style type="text/css">
    .activityTitle {
  width: 100%;
  max-width: 540px;
  margin: 0 auto;
  position: relative;
  margin-bottom: -0.8rem;
  padding: 0.53333333rem 0.8rem;
  background-color: #fff;
  font-size: 0.4rem;
  line-height: 0.45333333rem;
  font-weight: normal;
  text-align: center;
  color: #666;
}
.activityTitle .backBtn {
  position: absolute;
  right: 0.4rem;
  top: 50%;
  margin-top: -7px;
  display: block;
  width: 14px;
  height: 14px;
  display: inline-block;
  background: url(<b:staticUrl>/res/img/common/clear2@2x.png</b:staticUrl>) center center no-repeat;
  background-size: 14px 14px;
}
    </style>
</head>
<body>
    <div class="wrapPage couponPage" style="display:none;">
    	<c:if test="${'GODDESSACTIVITY'!=param.businessType}">
			<h1 id="clearDetailDiv" style="background-color: transparent" class="activityTitle" onclick="hideCoupon()"><span class="backBtn"></span></h1>
		</c:if>
        <div class="paymentHeader">
            <p class="surplus">支付剩余时间 </p>
            <p id="timeP" class="payTime">30 : 00</p>
        </div>
     <%--    <!--关于大小便训练，听这节课就够了！-->
        <div class="paymentHeader clearfix paymentMon" style="display:none;">
            <div class="imgLeft">
                <img src="<b:staticUrl>/res/img/coupon/u28.png</b:staticUrl>" alt="">
            </div>
            <div class="textRight">
                <h4>关于大小便训练，听这节课就够了！</h4>
                <p class="audience">4913人已看过</p>
                <p class="money">￥26.9</p>
            </div>
        </div>
        <!--1 对 1 个性化咨询服务-->
        <div class="paymentHeader clearfix paymentMon" style="display:none;">
            <div class="imgLeft">
                <img src="<b:staticUrl>/res/img/coupon/u64.png</b:staticUrl>" alt="" class="payImg">
            </div>
            <div class="textRight">
                <h4>1 对 1 个性化咨询服务</h4>
                <p class="payTxt">喵姐量身定制，给出靠谱家庭教育建议</p>
                <p class="money">￥29.9 <span> / 次</span></p>
            </div>
        </div>
        <!--喵姐早教说 - VIP会员卡-->
        <div class="paymentHeader clearfix paymentMon" style="display:none;">
            <div class="imgLeft">
                <img src="<b:staticUrl>/res/img/coupon/u150.png</b:staticUrl>" alt="" class="payImg">
            </div>
            <div class="textRight">
                <h4>1 对 1 个性化咨询服务</h4>
                <p class="payTxt">喵姐量身定制，给出靠谱家庭教育建议</p>
                <p class="money">￥499</p>
            </div>
        </div> --%>
         <!--第8期 - 手刃坏脾气，重做奶茶妈-->
         <c:choose>
         	<c:when test="${'YEARCARD'==param.businessType}">
         		 <div class="paymentHeader clearfix paymentMon">
		            <div class="imgLeft">
		                <img src="<b:staticUrl>/res/img/coupon/u150.png</b:staticUrl>" alt="" class="payImg">
		            </div>
		            <div class="textRight">
		                <h4>喵姐早教说 - VIP会员卡</h4>
		                <p class="payTxt">服务时长：365天</p>
		                <p class="money">￥${param.money}</p>
		            </div>
		        </div>
         	</c:when>
         	<c:when test="${'PREKINDERGARTEN'==param.businessType}">
         		  <div class="paymentHeader clearfix paymentMon">
		            <div class="imgLeft">
		                <img style="width:2.6rem;border-radius: 0.2rem;" src="<b:staticUrl>/res/img/prekindergarten/width.jpg</b:staticUrl>" alt="" class="payKing">
		            </div>
		            <div class="textRight">
		                <h4>${param.name}</h4>
		                <p class="money">￥${param.money}</p>
		            </div>
		        </div>
         	</c:when>
         </c:choose>
        <div class="line"></div>
        <!--有 2 张优惠券可用：-->
        <div class="paymentHeader clearfix totleP">
            <h4 class="voucherLeft">有  <span class="totleSpen">0</span>张优惠券可用：</h4><a href="#" class="voucherRight" onclick="noneCoupon()">不用优惠，直接支付&nbsp;&nbsp;&nbsp;></a>
        </div>
        <!--优惠券列表-->
        <div class="initDiv" style="border: 1px solid rgba(142, 128, 128, 0.278431); border-radius: 0.2rem;min-height: 2.3rem; display: none;">
            <table style="min-height: 2.3rem;margin-left: 0;">
                <tbody><tr>
                    <td style="border-radius:0.2rem 0 0 0.2rem; background-color:#FF9900;width: 2%;">
                        <div style="min-height: 2rem;"></div>
                    </td>
                    <td style="padding: 0 0.3rem 0 0.6rem;width: 36%;">
                        <span style="position:absolute;top: 28%;left: 0.2rem;font-weight: bold;">￥</span>
                        <span class="mnSpen">5.99</span>
                    </td>
                    <td class="gelixian" style="width: 0.3rem;padding: 0;width: 2%;"></td>
                    <td style="width: 70%;">
                        <div class="couponName" ><p class="listMon">现金券 <span>| 全网通</span></p></div>
                        <p class="listTime couponValidTime">有效期：2017.04.15 - 2.017.04.18</p>    
                    </td>
                    <td style="padding:0.3rem 0.2rem; width:5%;" valign="top">
                        <input type="radio" class="couponIdRadio" name="couponId" value="28434">
                    </td>
                </tr>
            </tbody></table>
        </div>
    <!--     <div class="initDiv initTop" style="border: 1px solid rgba(142, 128, 128, 0.278431); border-radius: 0.2rem;min-height: 2.3rem;">
            <table style="min-height: 2.3rem;">
                <tbody><tr>
                    <td style="border-radius:0.2rem 0 0 0.2rem; background-color:#FF9900;width: 2%;">
                        <div style="min-height: 2rem;"></div>
                    </td>
                    <td style="padding: 0 0.3rem 0 0.6rem;width: 30%;">
                        <span style="position:absolute;top: 28%;left: 0.2rem;font-weight: bold;">￥</span>
                        <span class="mnSpen">5.99</span>
                    </td>
                    <td class="gelixian" style="width: 0.3rem;padding: 0;width: 2%;"></td>
                    <td style="width: 70%;">
                        <div class="couponName" ><p class="listMon">现金券 <span>| 全网通</span></p></div>
                        <p class="listTime">有效期：2017.04.15 - 2.017.04.18</p>    
                    </td>
                    <td style="padding:0.3rem 0.2rem; width:5%;" valign="top">
                        <input type="radio" class="couponIdRadio" name="couponId" value="28434">
                    </td>
                </tr>
            </tbody></table>
        </div>
		   <div class="initDiv initTop" style="border: 1px solid rgba(142, 128, 128, 0.278431); border-radius: 0.2rem;min-height: 2.3rem;">
            <table style="min-height: 2.3rem;">
                <tbody><tr>
                    <td style="border-radius:0.2rem 0 0 0.2rem; background-color:#FF9900;width: 2%;">
                        <div style="min-height: 2rem;"></div>
                    </td>
                    <td style="padding: 0 0.3rem 0 0.6rem;width: 30%;">
                        <span style="position:absolute;top: 28%;left: 0.2rem;font-weight: bold;">￥</span>
                        <span class="mnSpen">5.99</span>
                    </td>
                    <td class="gelixian" style="width: 0.3rem;padding: 0;width: 2%;"></td>
                    <td style="width: 70%;">
                        <div class="couponName" ><p class="listMon">现金券 <span>| 全网通</span></p></div>
                        <p class="listTime">有效期：2017.04.15 - 2.017.04.18</p>    
                    </td>
                    <td style="padding:0.3rem 0.2rem; width:5%;" valign="top">
                        <input type="radio" class="couponIdRadio" name="couponId" value="28434">
                    </td>
                </tr>
            </tbody></table>
        </div>
		   <div class="initDiv initTop" style="border: 1px solid rgba(142, 128, 128, 0.278431); border-radius: 0.2rem;min-height: 2.3rem;">
            <table style="min-height: 2.3rem;">
                <tbody><tr>
                    <td style="border-radius:0.2rem 0 0 0.2rem; background-color:#FF9900;width: 2%;">
                        <div style="min-height: 2rem;"></div>
                    </td>
                    <td style="padding: 0 0.3rem 0 0.6rem;width: 30%;">
                        <span style="position:absolute;top: 28%;left: 0.2rem;font-weight: bold;">￥</span>
                        <span class="mnSpen">5.99</span>
                    </td>
                    <td class="gelixian" style="width: 0.3rem;padding: 0;width: 2%;"></td>
                    <td style="width: 70%;">
                        <div class="couponName" ><p class="listMon">现金券 <span>| 全网通</span></p></div>
                        <p class="listTime">有效期：2017.04.15 - 2.017.04.18</p>    
                    </td>
                    <td style="padding:0.3rem 0.2rem; width:5%;" valign="top">
                        <input type="radio" class="couponIdRadio" name="couponId" value="28434">
                    </td>
                </tr>
            </tbody></table>
        </div>
		   <div class="initDiv initTop" style="border: 1px solid rgba(142, 128, 128, 0.278431); border-radius: 0.2rem;min-height: 2.3rem;">
            <table style="min-height: 2.3rem;">
                <tbody><tr>
                    <td style="border-radius:0.2rem 0 0 0.2rem; background-color:#FF9900;width: 2%;">
                        <div style="min-height: 2rem;"></div>
                    </td>
                    <td style="padding: 0 0.3rem 0 0.6rem;width: 30%;">
                        <span style="position:absolute;top: 28%;left: 0.2rem;font-weight: bold;">￥</span>
                        <span class="mnSpen">5.99</span>
                    </td>
                    <td class="gelixian" style="width: 0.3rem;padding: 0;width: 2%;"></td>
                    <td style="width: 70%;">
                        <div class="couponName" ><p class="listMon">现金券 <span>| 全网通</span></p></div>
                        <p class="listTime">有效期：2017.04.15 - 2.017.04.18</p>    
                    </td>
                    <td style="padding:0.3rem 0.2rem; width:5%;" valign="top">
                        <input type="radio" class="couponIdRadio" name="couponId" value="28434">
                    </td>
                </tr>
            </tbody></table>
        </div>
		   <div class="initDiv initTop" style="border: 1px solid rgba(142, 128, 128, 0.278431); border-radius: 0.2rem;min-height: 2.3rem;">
            <table style="min-height: 2.3rem;">
                <tbody><tr>
                    <td style="border-radius:0.2rem 0 0 0.2rem; background-color:#FF9900;width: 2%;">
                        <div style="min-height: 2rem;"></div>
                    </td>
                    <td style="padding: 0 0.3rem 0 0.6rem;width: 30%;">
                        <span style="position:absolute;top: 28%;left: 0.2rem;font-weight: bold;">￥</span>
                        <span class="mnSpen">5.99</span>
                    </td>
                    <td class="gelixian" style="width: 0.3rem;padding: 0;width: 2%;"></td>
                    <td style="width: 70%;">
                        <div class="couponName" ><p class="listMon">现金券 <span>| 全网通</span></p></div>
                        <p class="listTime">有效期：2017.04.15 - 2.017.04.18</p>    
                    </td>
                    <td style="padding:0.3rem 0.2rem; width:5%;" valign="top">
                        <input type="radio" class="couponIdRadio" name="couponId" value="28434">
                    </td>
                </tr>
            </tbody></table>
        </div>
		   <div class="initDiv initTop" style="border: 1px solid rgba(142, 128, 128, 0.278431); border-radius: 0.2rem;min-height: 2.3rem;">
            <table style="min-height: 2.3rem;">
                <tbody><tr>
                    <td style="border-radius:0.2rem 0 0 0.2rem; background-color:#FF9900;width: 2%;">
                        <div style="min-height: 2rem;"></div>
                    </td>
                    <td style="padding: 0 0.3rem 0 0.6rem;width: 30%;">
                        <span style="position:absolute;top: 28%;left: 0.2rem;font-weight: bold;">￥</span>
                        <span class="mnSpen">5.99</span>
                    </td>
                    <td class="gelixian" style="width: 0.3rem;padding: 0;width: 2%;"></td>
                    <td style="width: 70%;">
                        <div class="couponName" ><p class="listMon">现金券 <span>| 全网通</span></p></div>
                        <p class="listTime">有效期：2017.04.15 - 2.017.04.18</p>    
                    </td>
                    <td style="padding:0.3rem 0.2rem; width:5%;" valign="top">
                        <input type="radio" class="couponIdRadio" name="couponId" value="28434">
                    </td>
                </tr>
            </tbody></table>
        </div> -->
        <div class="initDivP">
 	
  		</div> 
      <!--底部-->
      <div class="paymentFooter">
            <p>优惠券不可叠加使用</p>
            <div class="planJoin">
            	<div class="couponPaybtn" style="width: 6.8rem;background-color: #FF9900;border-radius: 0.5rem;line-height: 1rem;margin: 0 auto;font-size: 0.45rem;"></div>
                <a class="couponPaybtn" href="#">支付 <span>${param.money}</span> 元</a>
            </div>
      </div>
    </div>
    <script type="text/javascript">
    var timestartInterval2="";
    function timestart2(){
    		var timeP  = $("#timeP");
		var m=29;
		var s=59;
		timestartInterval2 = window.setInterval(function(){
	        if(s<10){
	        		timeP.html(m+':0'+s);
	        }else{
	       	 	timeP.html(m+':'+s);
	        }
	        s--;
			if(0==m && 0==s){
				window.clearInterval(timestartInterval2);
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
	/* if(isWeixin!="true"){
		toast("请您进入微信支付");
		return false;
	} */
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
					timestart2();
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
	window.clearInterval(timestartInterval2);
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