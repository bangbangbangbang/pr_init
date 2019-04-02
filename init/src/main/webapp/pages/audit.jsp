<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta name="format-detection" content="telephone=no" />
	<meta name="format-detection" content="email=no"/>
	<title>个人完善信息</title>
	<%@include file="header_v12_2.jsp"%>
	<link rel="stylesheet" type="text/css" href="<b:staticUrl>/res/css/common-v4.css</b:staticUrl>" />
	
	<link rel="stylesheet" type="text/css"
	href="<b:staticUrl>/res/css/mobiscroll.2.13.2.css</b:staticUrl>" />
	<script type="text/javascript"
	src="<b:staticUrl>/res/js/mobiscroll.2.13.2.js</b:staticUrl>"></script>
	<script type="text/javascript"
	src="<b:staticUrl>/res/js/slide.js</b:staticUrl>"></script>
</head>
<body id="bgwhite">
<c:choose>
<c:when test="${audit}">
<section>
<br><br><br>
	<div style="text-align: center;font-size: 20px;">
		<p>请耐心等待资料审核结果<br><br>如有疑问请微信：miaojieshuo</p>
	</div>
	<br><br><br>
	<div style="text-align: center;">
		<a href="/yzmm/index" >刷新</a>
	</div>
</section>
</c:when>
<c:when test="${'AUDIT' == info.status}">
<form id="activeForm" action="/yzmm/account/doAudit" onSubmit="return sub()">
	<!-- 请求参数 -->
	<input type="hidden" name="validId" id="validId" value="" /> 
	<input type="hidden" name="uid" id="uid" value="" /> 
	<input type="hidden" name="babySex" id="babySex" value="" /> 
	<input type="hidden" name="sBabySex" id="sBabySex" value="" />
	<input type="hidden" name="babyBirthdayString" id="babyBirthdayString" value="" />
	<input type="hidden" name="sBabyBirthdayString" id="sBabyBirthdayString" value="" />
	<input type="hidden" name="identity" id="identity" value="${info.identity}" />
	<input type="hidden" name="haveTwoChildren" id="haveTwoChildren" value="" />
	<!-- 接受孩子信息参数,以后添加孩子时，可以在此处进行延续等 -->
	<input type="hidden" name="childrenNumber" id="childrenNumber" value="${childrenNumber}" />
	<input type="hidden" name="fBirthdayString" id="fBirthdayString" value="${bbbd}" />
	<input type="hidden" name="sBirthdayString" id="sBirthdayString" value="${sbbbd}" />
	<input type="hidden" name="bbs" id="bbs" value="${bbs }" /> 
	<input type="hidden" name="sbbs" id="sbbs" value="${sbbs }" />
	
	
	<div class="font15 memberinfo-tit">
		<span class="i-note"></span>您的信息将有助您获得更准确的育儿知识
	</div>
	<div class="font15 form">
		<div class="item form-item">
			<div class="item-tit">姓名：</div>
			<div class="item-cont">
			<input value="${info.realName}" name="realName" id="realName" ${not empty info.realName ? "readonly" : ""}  placeholder="请输入姓名" class="font15" ></div>
			<span class="i-arrow"></span>
		</div>	
		<div class="item form-item">
			<div class="item-tit">手机号：</div>
			<div class="item-cont"><input type="tel" value="${info.telephone}" name="telephone" id="telephone" ${not empty info.telephone ? "readonly" : ""}  placeholder="请输入手机号" class="font15" ></div>
			<span class="i-arrow"></span>
		</div>	
		<div id="validCodeShow" class="item form-item" style="display: ${not empty info.telephone ? 'none' : ''};">
			<div class="item-tit" >验证码：</div>
			<div class="item-cont">
			<input type="text" type="tel" name="validCode" id="validCode" value=""
				maxlength="6" placeholder="6位数字" placeholder="请输入验证码" class="font15" ></div>
			<div class="item-tit" style="display: ${not empty info.telephone ? 'none' : ''}">
				<a href="javascript:void(0)" style="color: black;display: ${not empty info.telephone ? 'none' : ''}"
					class="ui-safe-btn vip_yzm">获取验证码</a>
			</div>
			<span class="i-arrow"></span>
		</div>
		<div class="item form-item">
			<div class="item-tit">您的身份是：</div>
			<div class="item-cont">
				<span class="radio"><i class="i-radio i-radioactive"></i><i class="iMOM">宝妈</i></span>
				<!-- <span class="radio"><i class="i-radio"></i><i class="iGRAVIDA">孕妈</i></span> -->
				<span class="radio"><i class="i-radio"></i><i class="iNURSEDAD">奶爸</i></span>
				<span class="radio other"><i class="i-radio"></i><i class="iOTHER">其他</i></span>
			</div>
		</div>	
	</div>
	<div class="font15 addmiao" id="sbabyInfo">
		<a href="javascript:void(0)" class="addbtn">
			<span class="i-add"></span><span class="i-remove"></span>添加宝贝
		</a>
		<div class="item">
			<div class="item-tit">大喵：</div>
			<div class="item-cont">
				<span class="radio"><i class="i-radio i-radioactive"></i>男</span>
				<span class="radio"><i class="i-radio"></i>女</span>
			</div>
			<div class="birth">请选择生日</div>
			<span class="i-arrow"></span>
		</div>	
	</div>
	<div class="btn" onclick="active()"><input type="submit" class="font18 submit" ></div>
	
	<div class="choose-other">
		<div class="font18 othercont">
			<a href="javascript:void(0)" class="active">奶妈</a>
			<a href="javascript:void(0)">助手</a>
			<a href="javascript:void(0)">爷爷</a>
			<a href="javascript:void(0)">奶奶</a>
			<a href="javascript:void(0)">外公</a>
			<a href="javascript:void(0)">外婆</a>
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
					<span class="active">2015</span>
					<span>2016</span>
					<span>2017</span>
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
				</div>
			</div>
			<div class="scollItem per25" style="display:none"></div>
			<div class="clearfloat"></div>
			<div class="handleBtn">
				<a href="javascript:void(0)" class="btn_cancle">取消</a>
				<a href="javascript:void(0)" class="btn_sure">确定</a>
			</div>
		</div>
	</div>
	</form>
</c:when>

<c:when test="${'BEGINNER' == info.status}">
<section>
<br>
	<div class="ui-font14" style="text-align: center;">
		<p  style="text-align: left;">很抱歉，我们暂时无法为非会员提供服务。想成为会员，了解更多有关喵姐的故事，请点击下面的传送门。</p>
		<br>
		<br>
		<p class="csm"><a href="http://mp.weixin.qq.com/s?__biz=MzIzNDI2MTk5OA==&mid=100000032&idx=1&sn=a0387c939098b169dd70c023f2d8faf0&scene=18#wechat_redirect">我是传送门</a></p>
	</div>
</section>
</c:when> 
<c:otherwise>
<section class="ui-container">
	<div class="ui-font14 ui-notepage">
		<p>您的状态不正常，请微信：miaojieshuo</p>
	</div>
</section>
</c:otherwise>
</c:choose>
</body>
<script>
	//日历
	$(".addmiao").scrollEve({
		selectors:{
			obj:".birth",
			scrollitem:".scollItem",
			item:"span",
			sure:".btn_sure",
			cancle:".btn_cancle",
			active:".active"
		}
	})
	//单选按钮
	$(".radio").on("click",function(){
		$(this).find(".i-radio").addClass("i-radioactive");
		$(this).siblings(".radio").find(".i-radio").removeClass("i-radioactive");
		if($(this).hasClass("other")){
			$(".choose-other").show();
			$(".othercont").animate({"bottom":"0"},300);
		}
	})
	//选择其他
	$(".othercont a").on("click",function(){
		$(this).addClass("active").siblings().removeClass("active");
		$(".other i").last().text($(this).text());
		$(".othercont").animate({"bottom":"-100%"},300,function(){
			$(".choose-other").hide();
		});
	})
	</script>
	<script type="text/javascript">
		//添加宝贝
		//初始化宝贝数量
		var num =["一","二"];
		//初始化baby接收名称
		var birthday = ["babyBirthdayString","sBabyBirthdayString"]
		////初始化sex接收名称
		var sex = ["babySex","sBabySex"]
		var sexArray = ["MALE","FAMALE"];
		//默认初始化第一个日期框与性别
		//初始化第一个的性别 ，从.radio第四个开始 ，4/5[男/女]成组向后排列 数组：$(".radio")
		$($(".radio")[3]).children("i").attr({ name: sex[0], value: sexArray[0] });
		$($(".radio")[4]).children("i").attr({ name: sex[0], value: sexArray[1] });
		//日期从第一个开始，数组：$(".birth")
		$($(".birth")[0]).attr({ name: birthday[0] });
		
		$(".addmiao .addbtn").on("click",function(){
			var str = ''
			str += '<div class="item-tit">大喵：</div>'
			str += '<div class="item-cont">'
			str += '<span class="radio" onclick="selectSex(this)">'
			str += '<i class="i-radio i-radioactive" ></i>';
			str += '男</span>';
			str += '<span class="radio" onclick="selectSex(this)">';
			str += '<i class="i-radio" ></i>';
			str += '女</span>'
			str += '</div>'
			str += '<div class="birth">请选择生日</div>'
			str += '<span class="i-arrow"></span>'
			
			var len = $(".addmiao .item").length;
			if(!$(this).hasClass("remove")){
				if(len<num.length){
					$(".addmiao").append("<div class='item'>"+str+"</div>");
					$(".addmiao .item").eq(len).find(".item-tit").text(num[len]+"喵"+"：");	
					//初始化选择属性
					$($("#sbabyInfo .item:last-child .radio")[0]).children("i").attr({ name: sex[len], value: sexArray[0] });
					$($("#sbabyInfo .item:last-child .radio")[1]).children("i").attr({ name: sex[len], value: sexArray[1] });
					//日期从第一个开始，数组：$(".birth")
					$($(".birth")[len]).attr({ name: birthday[len] });
					if(len<2){
						$(this).addClass("remove")
					}
				}
				else{
					return false;
				}
			}else{
				$(".addmiao .item").last().remove();
				$(this).removeClass("remove")
			}
			
		})
		
		//身份信息转义
		function getIdentity(identityName){
			var identityType = "";
			if(identityName == "宝爸"){
				identityType = "DAD";
			}else if(identityName == "爷爷"){
				identityType = "GRANDPA";
			}else if(identityName == "奶奶"){
				identityType = "GRANDMA";
			}else if(identityName == "外公"){
				identityType = "MATERNALDAD";
			}else if(identityName == "外婆"){
				identityType = "MATERNALMOM";
			}else if(identityName == "助手"){
				identityType = "HELPER";
			}else if(identityName == "宝妈"){
				identityType = "MOM";
			}else if(identityName == "孕妈"){
				identityType = "GRAVIDA";
			}else if(identityName == "奶爸"){
				identityType = "NURSEDAD";
			}else if(identityName == "奶妈"){
				identityType = "NURSEMOM";
			}
			
			return identityType;
		}
		//身份信息转义
		function getIdentityName(identityType){
			var identityName = "";
			if(identityType == "DAD"){
				identityName = "宝爸";
			}else if(identityType == "GRANDPA"){
				identityName = "爷爷";
			}else if(identityType == "GRANDMA"){
				identityName = "奶奶";
			}else if(identityType == "MATERNALDAD"){
				identityName = "外公";
			}else if(identityType == "MATERNALMOM"){
				identityName = "外婆";
			}else if(identityType == "HELPER"){
				identityName = "助手";
			}else if(identityType == "MOM"){
				identityName = "宝妈";
			}else if(identityType == "GRAVIDA"){
				identityName = "孕妈";
			}else if(identityType == "NURSEDAD"){
				identityName = "奶爸";
			}else if(identityType == "NURSEMOM"){
				identityName = "奶妈";
			}
			return identityName;
		}
		//给身份选择绑定click方法，如果选择孕妈，则隐藏宝宝信息选择，选择其他则显示
		$(".i-radio").click( function () { 
			var identityType= getIdentity($(this).siblings().text());
			if(identityType == "GRAVIDA"){
				//隐藏
				$("#sbabyInfo").hide();
			}else{
				$("#sbabyInfo").show();
			}
			});
		//给身份选择绑定click方法,绑定子的i
		$(".radio").click( function () { 
				var identityType = getIdentity($($(this).children("i")[1]).text());
				if(identityType == "GRAVIDA"){
					//隐藏
					$("#sbabyInfo").hide();
				}else{
					$("#sbabyInfo").show();
				}
			});
		//取消添加宝贝
		$(".delbtn").click( function () { 
				//如果宝贝信息数组大于1，则删除最后一个元素
				if($("#sbabyInfo .item").length > 1){
					$("#sbabyInfo .item:last-child").remove();
				}
				$("#haveTwoChildren").val("");
			});
		//给添加宝贝后追加的div进行绑定onclick事件
		function selectSex(thet){
			//将class = i-radioactive 重置到当前,并取消同级的class
			//当前点击子类i[0]增加属性
			$(thet).children(":first").addClass("i-radioactive");
			//当前点击同级别类的子类i[0]删除属性
			$(thet).siblings().children(":first").removeClass("i-radioactive");
		}
		
	</script>
	<script>
		var time = 59;
		//验证码
		$(function() {
			var timer = null;
			$('.vip_yzm').click(function() {
				if (!isPhone($("#telephone").val())) {
					toast("请填写正确的手机号");
					return;
				}
				if (!checkAccount()) {
					toast($("#telephone").val() + "手机号已经存在");
					return;
				}
				if (time != 59) {
					return;
				}
				clearInterval(timer);
				$('.vip_yzm').text(time + "s后重发");
				timer = setInterval(function() {
					time--;
					if (time == 0) {
						$('.vip_yzm').text("获取验证码");
						time = 59;
						clearInterval(timer);
					} else {
						$('.vip_yzm').text(time + "s后重发");
					}
				}, 1000);

				HH.ajax({
					url : "/yzmm/valid/send",
					params : {
						account : $("#telephone").val()
					},
					callback : function(data) {
						if (data.success) {
							$("#validId").val(data.ext);
						} else {
							toast(data.msg);
						}
					}
				});
			})
		})

		function checkAccount() {
			var result = false;
			HH.ajax({
				url : "/yzmm/account/checkAccount",
				data : {
					account : $("#telephone").val()
				},
				async : false,
				callback : function(data) {
					if (data.success) {
						result = true;
					} else {
						result = false;
					}
				}
			});
			return result;
		}
	</script>
	<script type="text/javascript">
		function active() {
			//姓名realName
			if($("#realName").val() == "" || $("#realName").val().length > 50){
				toast("请输入姓名");
				return;
			}
			//如果有电话，不验证验证码
			if(!$("#validCodeShow[style='display: none;']").size() >0 ){
				if($("#validCode").val().length<6){
					toast("请输入正确的验证码");
					return;
				}
			}
			
			//获取身份信息
			var identityType = getIdentity($($(".i-radioactive")[0]).siblings().text());
			//如果是非孕妈，则不验证孩子信息
			//if(identityType != "GRAVIDA"){
				//根据有的儿童数组长度进行验证
				var len = $(".addmiao .item").length;
				//标识，有多个孩子
				if(len>1){
					$("#haveTwoChildren").val("true");
				}else{
					$("#haveTwoChildren").val("");
				}
				for (var i = 0; i < len; i++) {
					if($($('.birth')[i]).text().trim() == "" || $($('.birth')[i]).text().trim() == "请选择生日"){
						toast("请填写宝宝生日");
						return;
					}
				}
					
				//手动向隐藏域赋值，通过隐藏域向后台传值，孩子的信息
				//babySex以后可以获取js全局数组取得，此处不多写
				if($($($("#sbabyInfo .radio").find("i[name='babySex']"))[0]).hasClass("i-radioactive")){
					//val()内性别可以使用jquery获取单选框value获取，此处不多写
					$("#babySex").val("MALE");
				}else{
					$("#babySex").val("FAMALE");
				}
				//替换年月日
				var fAge = $($('.birth')[0]).text().trim();
				fAge = fAge.replace("年","-");
				fAge = fAge.replace("月","-");
				fAge = fAge.replace("日","");
				$("#babyBirthdayString").val(fAge);
				
				if(len>1){
					if($($($("#sbabyInfo .radio").find("i[name='sBabySex']"))[0]).hasClass("i-radioactive")){
						//val()内性别可以使用jquery获取单选框value获取，此处不多写
						$("#sBabySex").val("MALE");
					}else{
						$("#sBabySex").val("FAMALE");
					}

					//替换年月日
					var sAge = $($('.birth')[1]).text().trim();
					sAge = sAge.replace("年","-");
					sAge = sAge.replace("月","-");
					sAge = sAge.replace("日","");
					$("#sBabyBirthdayString").val(sAge);
				}
				
			//}
			//身份值
			if(identityType.trim() == ""){
				toast("请选择您的身份");
				return;
			}
			$("#identity").val(identityType);
			
			if (!isPhone($("#telephone").val())) {
				toast("请填写正确的手机号");
				return;
			}
			<c:if test="${empty info.telephone}">
				if (!$("#validId").val()) {
					toast("请验证手机号");
					return;
				}
			</c:if>
			
			HH.ajax({
				form:$("#activeForm"),
				callback:function(data){
					if(data.success){
						toast("请稍后,即将进入首页",function(){
							window.location.href="/yzmm/index";
						});
					}else{
						//已经激活
						if(100052 == data.code){
							toast("你已经提交成功，即将进入首页",function(){
								window.location.href="/yzmm/index";
							});
						}
						toast(data.msg);
					}
				}
			});
		}
	</script>
	<!-- 工具 -->
	<script type="text/javascript">
	function isNotANumber(inputData) {
			//isNaN(inputData)不能判断空串或一个空格
			//如果是一个空串或是一个空格，而isNaN是做为数字0进行处理的，而parseInt与parseFloat是返回一个错误消息，这个isNaN检查不严密而导致的。
			if (parseFloat(inputData).toString() == "NaN") {
				return false;
			} else {
				return true;
			}
		}
	</script>
	<!-- 不修改h5样式，禁止表单直接被提交 -->
	<script type="text/javascript">
	function sub()  
	{  
	    return false;
	}  
	</script>
	<script type="text/javascript">
		var identityName = getIdentityName(myIdentity);
		if(identityName != ""){
			//根据身份触发身份按钮点击,
			var myIdentity = $("#identity").val();
			if(myIdentity == "GRAVIDA"){
				$(".iGRAVIDA").click()
			}else if(myIdentity == "MOM"){
				$(".iMOM").click();
			}else if(myIdentity == "NURSEDAD"){
				$($($(".radio")[0]).children()[0]).removeClass("i-radioactive");
				$($($(".radio")[1]).children()[0]).addClass("i-radioactive");
				$($($(".radio")[2]).children()[0]).removeClass("i-radioactive");
			}else{
				//触发其他按钮，赋值,并且触发其它的activity
				$($($(".radio")[0]).children()[0]).removeClass("i-radioactive");
				$($($(".radio")[1]).children()[0]).removeClass("i-radioactive");
				$($($(".radio")[2]).children()[0]).addClass("i-radioactive");
				//修改值
				$($($(".radio")[2]).children()[1]).text(identityName);
			}
			//孩子的年龄
			$($('.birth')[0]).text($("#fBirthdayString").val());
			//孩子性别
			if($("#bbs").val() == "女"){
				$($(".i-radio")[3]).removeClass("i-radioactive");
				$($(".i-radio")[4]).addClass("i-radioactive");
			}
			//初始化用户信息
			if($("#childrenNumber").val() > 1){
				$(".addmiao .addbtn").click();
				$($('.birth')[1]).text($("#sBirthdayString").val());
				if($("#sbbs").val() == "女"){
					$($(".i-radio")[5]).removeClass("i-radioactive");
					$($(".i-radio")[6]).addClass("i-radioactive");
				}
			}
		}
		
	</script>
	<%//TODO 缺少协议内容 %>
</html>