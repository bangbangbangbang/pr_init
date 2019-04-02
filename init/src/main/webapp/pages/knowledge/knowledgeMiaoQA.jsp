<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>喵姐早教说</title>
	<%@include file="../header_v12.jsp"%>
	<link rel="stylesheet" href="<b:staticUrl>/res/css/footer-v2.css</b:staticUrl>">
	<link rel="stylesheet" href="<b:staticUrl>/res/css/activity-v2.0.css</b:staticUrl>" >
	<script src="<b:staticUrl>/res/js/miaoqa/miaoqa.js</b:staticUrl>"></script>
	<style type="text/css">
	.askmain{
		height: 3.5rem;
		box-orient:vertical;
	}
	.questionAsk {
	    font-size: 19px;
	    line-height: 19px;
	    text-align: center;
	}
	.askimg{
		width: 8rem;
   		margin-top: 0.5rem;
	}
	.myAskTit {
	  position: relative;
	  top: 0;
	  padding: 3px 15px;
	  background-color: #efeff4;
	  font-size: 12px;
	  color: #333;
	}
	.notVipDiv{
		height: 200px;
		width: 400px;
		margin: 0 auto;
		text-align: center;
	}
	.notVipDiv span{
		font-family: 'AlTarikh', 'Al Tarikh';
		font-weight: 400;
		font-style: normal;
		font-size: 18px;
		color: #D7D7D7;
	}
	.marginTop{
		margin-top:10px;
	}
	.background-color-f2x3{
		background-color: #F2F2F2;
	}
	.color-f39d39{
		color: #F39D39;
	}
	.span-prompt{
		font-size: 10px;
		color: #AEAEAE;
		text-align: center;
	}
	.blockitem{
		padding: 0.18rem 0.37333333rem;
	}
	.textAlign{
		text-align: center
	}
	.icon{
	    float: left;
	    width: 12px;
	    height: 12px;
	    margin-right: 0.10666667rem;
	    background-size: 11px 11px;
	    background-repeat: no-repeat;
	    background-position: center 1px;
	    background-image: url(../../../res/img/dotted_bg4.png);
	}
	.floatLeft{
		float: left;
	}
	.floatRight{
		float: right;
	}
	.paySubmitBtn{
		display: block;
	    width: 82%;
	    height: 1.04rem;
	    line-height: 1.04rem;
	     background-color: #F39D39;
	    text-align: center;
	    text-decoration: none;
	    color: #fff;
	    border-radius: 100px;
	    margin: 0.7rem auto 0 auto;
	}
	.history_list_p{
		font-size: 0.32rem;
		color: #666;
		line-height: 20px;
	}
	.tipInfo{
		bottom: 5px;
	    position: absolute;
	    margin: 0 auto;
	    width: 100%;
	    text-align: center;
	}
	</style>
</head>
<body>
<div class="wrap">
	<div class="askmain">
		<c:if test="${isVip}">
			<div class="questionAsk"><img class="askimg" alt="" src="<b:staticUrl>/res/img/miao_vip.png</b:staticUrl>" /></div>
		</c:if>
		<c:if test="${not isVip}">
			<div class="questionAsk"><img class="askimg" alt="" src="<b:staticUrl>/res/img/miao_notvip.png</b:staticUrl>" /></div>
			<script type="text/javascript">
				$(function(){
					$('.askmain').css('height','2.9rem');
					$('.divhwm').css('padding','2px 15px');
				});
			</script>
		</c:if>
	</div>
	<div class="myAskTit"></div>
	<section class="container marginTop">
		<div class="newask">
			<form id="form" action="/yzmm/account/miaoqa/createMiaoQA" name="form" method="post" onsubmit="return vfn()">
					<input type="hidden" name="uid" value="${uid}">
					<input type="hidden" name="realName" value="${realName}">
					<input class="fYear" type="hidden" name="fYear" value="${year}">
					<input class="fMonth" type="hidden" name="fMonth" value="${month}">
					<input class="fDay" type="hidden" name="fDay" value="${day}">
					<input class="fSex" type="hidden" name="fSex" value="${sex}">
					<input type="hidden" name="telephone" value="${telephone}">
					<input type="hidden" name="babyInfo" class='babyInfo' value="">
					<div class="font13 textarea">
						<textarea class="font13" onkeyup="fn()" onblur="fn()" name="questionTxt" maxlength="200" placeholder="育儿路上的所有困惑，统统写这里~"></textarea>
						<span>0/200</span>
					</div>
			</form>
		</div>
					<ul class="border0 baoHandle marginTop" style="background-color: #e1e1e1;">
						<li style="text-align: center;">
								<div class="cont idenfyValue"><span class="txt2">
									<c:if test="${babyOrNot==0}">
										<a class='font13' style='line-height: 1.04rem;display: block;color:#3399ff' href="#">添加宝宝信息</a>
									</c:if><c:if test="${babyOrNot==1}"></c:if>
									<c:if test="${babyOrNot==2}">
									</c:if>
								</span>
								</div>
						</li>
						<c:if test="${babyOrNot==1}">
							<li class="blockitem">
								<div class="name">已怀孕 <span class="baobao" >${babyBirthday}</span></div>
								<div class="cont"><span class="txt2"><a href="#" style="color:#3399ff" onclick="modifyIdenfy()">修改</a></span></div>
							</li>
						</c:if>
						<c:if test="${babyOrNot==2}">
							<c:if test="${hasCount==1}">
								<li class="blockitem">
									<div class="name">大宝：<span class="txt2 sex" >${sex}</span><span class="baobao" >${firstBabyBirthday}</span></div>
									<div class="cont"><span class="txt2"><a href="#" style="color:#3399ff" onclick="modifyIdenfy()">修改</a></span></div>
								</li>
							</c:if>
						</c:if>
					</ul>
					<a href="#" class="font16  submitBtn">提 问 | ￥${money}/次<span style="font-size: 13px;text-decoration: line-through;">&nbsp;&nbsp;原价￥99&nbsp;</span></a>
					
					<input name="payType" value="${payType}" type="hidden" form="form"/>
					<div style="text-align: center" class='marginTop'>
						<span class="span-prompt">喵姐将在1 - 3个工日内给出解答，周末和法定节假日向后顺延</span>
						<br>
						<span class="span-prompt">会员特权：提问可使用提问兑换券抵扣！</span>
					</div>
					
	 <c:if test="${list.size()>0}">
		 <div class="myAskTit marginTop"></div>
			<div class="font15 marginTop textAlign" style="visibility: visible;">
			  <p><b><span>您的历史提问</span></b></p>
			</div>
			<ul style="padding: 16px;">
				<c:forEach var="i" items="${list}">
				<li class="marginTop" onclick="todetail(${i.id})">
					<div style="width:100%;height:30px;">
						<span class="icon"></span><span class='font13 floatLeft span-prompt createTime'>${i.createTime }</span>
						<c:if test="${i.replyState == 0||i.replyState == 3}">
						    <span class="font15 floatRight color-f39d39" style="font-size: 10px">待回复</span>
						</c:if>
						<c:if test="${i.replyState == 2||i.replyState == 4}">
						    <span class="font15 floatRight span-prompt" >已完成</span>
						</c:if>
						<c:if test="${i.replyState == 1}">
						    <span class="font15 floatRight color-f39d39" style="font-size: 10px">待评价</span>
						</c:if>
					</div>
					<div class="history_list_p">
						<p>${i.questionTxt}</p>
					</div>
				</li>
			</c:forEach>
			</ul>
	 </c:if>
	</section>
	 <!--身份选择-->
	<div class="font18 idenfy">
		<div class="idenfyList">
			<div class="idenfyItem">
				<div class="perCont">
					<span>孕妈／爸</span>
					<span class="active">宝妈／爸</span>
				</div>
			</div>
			<div class="handleBtn">
				<a href="javascript:void(0)" class="btn_cancle">取消</a>
				<a href="javascript:void(0)" class="btn_sure">确定</a>
			</div>
		</div>
	</div>
	<!--日历控件-->
	<div class="font18 scroll" style="display:none;">
		<div class="scrollList">
			<div class="scrollTit">
				<span class="per33">年</span>
				<span class="per33">月</span>
				<span class="per33">日</span>
			</div>
			<div class="line"></div>
			<div class="scollItem per33 year">
				<div class="perCont">
					<span>2014</span>
					<span>2015</span>
					<span>2016</span>
					<span class="active">2017</span>
					<span>2019</span>
					<span>2020</span>
					<span>2021</span>
					<span>2022</span>
					<span>2023</span>
				</div>
			</div>
			<div class="scollItem per33 month">
				<div class="perCont">
					<span>1</span>
					<span class="active">2</span>
					<span>3</span>
					<span>4</span>
					<span>5</span>
					<span>6</span>
					<span>7</span>
					<span>8</span>
					<span>9</span>
					<span>10</span>
					<span>11</span>
					<span>12</span>
				</div>
			</div>
			<div class="scollItem per33 day">
				<div class="perCont">
					<span>1</span>
					<span>2</span>
					<span>3</span>
					<span>4</span>
					<span>5</span>
					<span>6</span>
					<span>7</span>
					<span>8</span>
					<span>9</span>
					<span>10</span>
					<span>11</span>
					<span>12</span>
					<span>13</span>
					<span>14</span>
					<span>15</span>
					<span>16</span>
					<span>17</span>
					<span>18</span>
					<span>19</span>
					<span>20</span>
					<span>21</span>
					<span>22</span>
					<span>23</span>
					<span>24</span>
					<span>25</span>
					<span>26</span>
					<span>27</span>
					<span>28</span>
					<span>29</span>
					<span>30</span>
					<span>31</span>
				</div>
			</div>
			<div class="scollItem per25" style="display:none"></div>
			<div class="clearfloat"></div>
			<div class="handleBtn">
				<a href="javascript:void(0)" class="btn_cancle">取消</a>
				<a href="javascript:void(0)" class="btn_sure">确定</a>
			</div>
			<div class="tipInfo"><span class="span-prompt">请选择宝宝出生日期</span></div>
		</div>
	</div>
	<!--尾部-->
	<jsp:include page="/pages/header_footer.jsp">
		<jsp:param value="4" name="menu"/>
	</jsp:include>
</div>
<jsp:include page="../pay/coupon.jsp">
	<jsp:param value="MIAOQA" name="businessType"/>
	<jsp:param value="${money}" name="money"/>
</jsp:include>
<script type="text/javascript">
$(function(){
	var tishi = "嗨，本次提问可以使用提问券兑换哦！";
	HH.ajax({
		url:"/yzmm/wxmppay/coupon",
		async:false,
		data:{businessType:'MIAOQA',bizId:'',pageSize:100},
		callback:function(data){
			if(data.success && data.totalRows > 0 ){
				toast(tishi);	 
			}
		}
	});
	
	
})

</script>
<script src="<b:staticUrl>/res/js/wxmppay.js</b:staticUrl>"></script>
<script type="text/javascript">
function onpay(){
		 if(isWeixin!="true"){
			  toast("请您进入微信支付");
			  return false;
		 }
		showCoupon(callbackPay,".wrap");
	}
function callbackPay(id){
		var params = {};
	    var t = $('#form').serializeArray();
	    $.each(t, function() {
	    	params[this.name] = this.value;
	    });
	    if(id){
	    	params["couponId"] = id;
	    }
		if(isWeixin!="true"){
			toast("请您进入微信支付");
			return false;
		}
		wxmpmiaoqapay(params,function(orderId,result){
		if(result=="ok"){
			var tourl = "/yzmm/wxmppay/miaoqa/toPage";
			var url="/yzmm/wxmppay/order/checkPay?"
			if(id){
				url+="couponId="+id+"&";
			}
			if(orderId){
				url+="orderId="+orderId+"&";
			}
			url+="toPage="+tourl;
			window.location.href=url;
		}
		});
	}
</script>
	<script type="text/javascript">
	var submitEvents;
	var isWeixin = '${isWeixin}';
	//小白or会员 执行不同js
		submitEvents=function(){
				var money = '${money}';
				if(!money){
					return;
				}
				var flag = vfn();
				if(!flag){
					return;
				}
				if(babyInfo){
					if(babyInfo.fYear){
						$('.fYear').val(babyInfo.fYear);
					}
					if(babyInfo.fMonth){
						$('.fMonth').val(babyInfo.fMonth);
					}
					if(babyInfo.fDay){
						$('.fDay').val(babyInfo.fDay);
					}
					if(babyInfo.fSex){
						$('.fSex').val(babyInfo.fSex);
					}
					$('.babyInfo').val(JSON.stringify(babyInfo));
				}
			    onpay();
		}	
</script>
<script type="text/javascript">
	$(function(){
		babyInfo.idenfy='${babyOrNot==1?"孕妈／爸":"宝妈／爸"}';
		//绑定事件
		$(".submitBtn").click(submitEvents);
	})
	//是否有宝宝判断
	<c:if test="${babyOrNot==0}">
		$(function(){
			$('.submitBtn').css('background-color','#afadab');
			$('.submitBtn').unbind();
			$('.submitBtn').on('click',function(){
				toast('没有宝宝信息，导师可能无法做答哦~');
				return;
			});
		});
	</c:if>
	</script>
	<script type="text/javascript">
		function tosqw() {
			HH.href("/yzmm/account/knowledge/index?timestamp="
					+ new Date().getTime());
			return;
		}
		function tocourse() {
			HH.href("/yzmm/account/course/list?timestamp="
					+ new Date().getTime());
			return;
		}
		function tome() {
			HH.href("/yzmm/account/user/info?timestamp="
				+ new Date().getTime());
			return;
		}
		function newMiao() {
			$(".tabTitCont a").each(function(){
				$(this).removeClass("active")
			})
			$(".newMiao").addClass("active")
			HH.href("/yzmm/account/miaoqa/index");
			return;
		}
	</script>
	<script type="text/javascript">
		$(".btn_sure").click(function(){
			$(".year span").each(function(){
				if($(this).hasClass("active")){
					$(".fYear").val($(this).text())
				}
			})
			$(".month span").each(function(){
				if($(this).hasClass("active")){
					$(".fMonth").val($(this).text())
				}
			})
			$(".day span").each(function(){
				if($(this).hasClass("active")){
					$(".fDay").val($(this).text())
				}
			})
			$(".sex span").each(function(){
				if($(this).hasClass("active")){
					$(".fSex").val($(this).text())
				}
			})
		})
	</script>
	<script type="text/javascript">
		function fn(){
			
			var len = $(".textarea textarea").val().length
			$(".textarea span").text(len + "/200")
		}
		
		function vfn(){
			var len = $(".textarea textarea").val().length
			if(len < 5){
				toast("至少输入5个字符");
				return false;
			}
			
			var today = new Date();
			if(babyInfo.fYear < today.getFullYear()){
				if(today.getFullYear() - babyInfo.fYear > 10){
					toast("输入年龄过大");
					return false;
				}
			}else if (babyInfo.fYear > today.getFullYear()) {
				if(babyInfo.idenfy!='孕妈／爸'){
					toast("输入生日不正确");
					return false
				}
			}else if (babyInfo.fMonth > (today.getMonth()+1)) {
				if(babyInfo.idenfy!='孕妈／爸'){
					toast("输入生日不正确");
					return false
				}
			}
			
			//预产期判断
			if(babyInfo.idenfy=='孕妈／爸'){
				if(!checkGestationPeriod()){
					return false;
				}
			}
			
			
			var txt = $(".textarea textarea").val();
			//校验位
			var check = false;
			//后台校验集
			HH.ajax({
	        		url:"/yzmm/account/miaoqa/check",
	        		async:false,
	        		data:{
	    		    	txt:txt
	        		},
	        		callback:function(data){
	        			if(data.code == 200){
	        				check = true;
	        				}
	        			else{
	        				toast(data.msg);
							check =  false;
	        			}
	        		}
	        	});
			 return check;
			 
		}
	</script>
	<script>
		var idenfy="${babyOrNot}";//身份信息 0喵  1孕 2宝妈
		var idenfyNum="${babyOrNot}";//身份信息 0喵  1孕 2宝妈
	</script>
	<script type="text/javascript">
		function todetail(id){
			HH.href("/yzmm/account/miaoqa/myMiaoQaDetail?id="+id);
		}
	</script>
</body>
</html>