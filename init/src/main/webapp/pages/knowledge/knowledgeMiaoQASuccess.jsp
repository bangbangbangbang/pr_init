<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>喵姐早教说</title>
	<%@include file="../header_v12.jsp"%>
</head>
<body>
	<section class="container">
		<div class="result">
			<div class="icon i_success"></div>
			<div class="font20 resultTit">提交成功</div>
			<div class="font14 resultWord">感谢您的问题，我们将尽快回复您！</div>
			<div class="font16 resultOther"><span id="show">3秒后本页自动关闭</span></div>
		</div>
	</section>
	<script type="text/javascript"> 
		var t=2;//设定跳转的时间 
		setInterval("refer()",1000); //启动1秒定时 
		function refer(){  
    		if(t==-1){ 
        		HH.href("/yzmm/account/miaoqa/tolist");
    		}else{
	    		document.getElementById('show').innerHTML=""+t+"秒后本页自动关闭"; // 显示倒计时 
	    		t--; // 计数器递减 
    		}
		} 
	</script> 
</body>
</html>