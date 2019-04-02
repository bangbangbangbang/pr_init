<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta name="format-detection" content="telephone=no" />
	<meta name="format-detection" content="email=no"/>
	<%@include file="../header_v15.jsp"%>
	<script src="<b:staticUrl>/res/js/process/phoneReg.js</b:staticUrl>"></script>
</head>
<body id="bgwhite" class="hidden">
<form id="activeForm" onSubmit="return sub()">
	<input type="hidden" name="validId" id="validId" value="" />
	<input type="hidden" name="hUrl" id="hUrl" value="${hUrl }" />
	<div class="font15 regTit"><span class="i-note"></span>您的信息将有助您获得更准确的育儿知识</div>
	<div class="font15 form">
		<div class="item form-item">
			<div class="item-tit">手机号：</div>
			<div class="item-cont">
			<input name="telephone" type="tel" id="telephone" placeholder="请输入手机号" class="font15" >
			</div>
			<span class="i-arrow"></span>
		</div>	
		<div class="item form-item valid-code">
			<div class="item-tit">验证码：</div>
			<div class="item-cont">
			<input type="tel" name="validCode" id="validCode" placeholder="请输入验证码" class="font15" ></div>
			<div class="item-tit send">获取验证码</div>
			<span class="i-arrow"></span>
		</div>
		
		<div class="item form-item">
			<div class="item-tit">激活码：</div>
			<div class="item-cont">
			<input type="tel" name="activateCodeIpt" id="activateCodeIpt" maxlength="19" placeholder="请输入16位激活码" class="font15" >
			<input type="hidden" name="activateCode" id="activateCode" maxlength="19" placeholder="请输入16位激活码" class="font15" >
			</div>
			<span class="i-arrow"></span>
		</div>	
	</div>
	</form>
	<div class="btn"><a href="javascript:void(0)" class="font18 submit" onclick="activate();">激活</a></div>
<!--尾部-->
<jsp:include page="/pages/header_footer.jsp">
	<jsp:param value="4" name="menu"/>
</jsp:include>
<script type="text/javascript">
function dealValue(v){
	var len = v.length;
	if(len <= 4){
		return v;
	}
	var r = "";
	r += v.substr(0,4)
	var i = 4;
	for(;i<len;){
		r+=" ";
		r += v.substr(i,4)
		i+=4;
	}
	return r;
}

function replaceIpt(v){
	return  v.replace(/ /g,"");
}

$("#activateCodeIpt").on("input",function(){
	try{
	var v = this.value;
	v = replaceIpt(v);
	this.value = dealValue(v);
	}catch(e){}
});

	var telphone = "${telphone}";
	if(telphone != ""){
		//回显
		$("#telephone").val(telphone);
		$('#telephone').attr("readonly","readonly");
		$(".valid-code").hide();
	}else{
		
	}
		
	function activate(){
		if(telphone == ""){
			//身份值
			if($("#validCode").val().length<6){
				toast("请输入正确的验证码");
				return;
			}
		}
		//校验正确的手机号
		var phone = $("telephone").val();
		if(!phone && /^1[3|4|5|8]\d{9}$/.test(phone)){
			return
		} 
		$("#activateCode").val(replaceIpt($("#activateCodeIpt").val()));
		//校验激活码长度
		if($("#activateCode").val().length<16){
			toast("请输入16位激活码");
			return;
		};
		
		HH.ajax({
			form:$("#activeForm"),
			url:"/yzmm/account/entityCard/activate",
			callback:function(data){
				if(data.success){
					//成功跳转页面
					HH.href("/yzmm/account/VIPStatus");
				}else{
					toast(data.msg);
				}
			}
		});
	
		
	}
</script>
</body>
</html>