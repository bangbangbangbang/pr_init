<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<!--忽略页面中的数字识别为电话号码-->
<meta name="format-detection" content="telephone=no" />
<title>喵姐早教说</title>
<%@include file="header_b.jsp"%>
</head>

<body style="background: #fff;">
	<section class="ui-container">
		<div class="logo"></div>
		<div id="regSuccess" style="display: none;">恭喜您,验证成功!</div>
		<div class="bind-phone">
			<div class="bind-input">绑定手机号</div>
			<div class="bind-input">
				<div class="name icon-phone"></div>
				<div class="cont">
					<input class="ui-font14" type="tel" name="telephone" id="telephone"
						placeholder="请输入11位数字手机号">
				</div>
			</div>
			<div class="bind-input">
				<div class="name icon-safe"></div>
				<div class="cont">
					<input type="text" placeholder="请输入6位验证码" class="ui-font14" maxlength="6" name="validCode" id="validCode">
				</div>
				<a href="javascript:void(0)" style="display: inline;" class="ui-font14 get-code">获取验证码</a>
			</div>
		</div>
		<a href="javascript:;" class="ui-font16 bind-btn" id="submit">提交</a> 
			<a href="${refer}" class="ui-font16 bind-btn" id="next" style="display: none">下一步</a>
	</section>
	<input type="hidden" name="validId" id="validId" />
	<input type="hidden" name="password" id="password" />

	<script type="text/javascript">
	
		var time = 59;
		//验证码
		$(function() {
			
			var timer = null;
			$('.get-code').click(function() {
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
				$('.get-code').text(time + "s后重发");
				timer = setInterval(function() {
					time--;
					if (time == 0) {
						$('.get-code').text("获取验证码");
						time = 59;
						clearInterval(timer);
					} else {
						$('.get-code').text(time + "s后重发");
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
		
			});

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

		$("#submit").click(function() {
		
			HH.ajax({
				url : "/yzmm/account/telreg",
				data : {
					account : $("#telephone").val(),
					password : $("#telephone").val(),
					validCode : $("#validCode").val(),
					validId : $("#validId").val()
				},
				callback : function(data) {
					if (data.success) {
						toast("验证成功!");
						$("#regSuccess").show();
						$(".bind-phone").hide();
						$("#submit").hide();
						$("#next").show();
					} else {
						toast("验证失败!");
					}
				}
			});
		})
		});
	</script>
</body>
</html>
