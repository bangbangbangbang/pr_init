<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>喵姐早教说</title>
<%@include file="../header.jsp" %>
</head>
<body>
<div class="wrapper">
    <header>
        <a class="left" href="javascript:goBack();">
            <span class="arrow arrow-left"></span>
        </a>
        <h2 class="title">修改密码</h2>
    </header>
    <div class="main login-password">
        <ul class="login-box">
            <li>
                <em class="icon icon-phone"></em>
                <input id="tel" class="disabled" placeholder="手机号码" type="text" name="mobile" value="${account}" maxlength="11">
            </li>
            <li class="code">
                <em class="icon icon-key"></em>
                <input id="key" type="password" name="code"  placeholder="原密码(6-16位数字或字母)" type="tel" maxlength="16">
            </li>
            <li>
                <em class="icon icon-lock"></em>
                <input id="pwd" type="password" placeholder="设置新密码(6-16位数字或字母)" type="tel" maxlength="16">
            </li>
            <li>
                <em class="icon icon-check"></em>
                 <input id="repwd" type="password" placeholder="再次输入新密码" type="tel" maxlength="16">
            </li>
        </ul>
       <a id="submit" class="btn-submit disabled" href="javascript:;">保存密码</a>
    </div>
</div>
<script type="text/javascript">
	$(function() {
		var key = getId('key'),
			pwd = getId('pwd'),
	        repwd = getId('repwd'),
	        submit = getId('submit');
			
	    $(pwd).on('input', function () {
	        removeDisabled()
	    });

	    $(repwd).on('input', function () {
	        removeDisabled();
	    });			
	    
		$(key).on('input', function() {
			removeDisabled()
		});
		
		 function removeDisabled() {
		        if (pwd.value === repwd.value && ConstReg.pwd.test(pwd.value) && ConstReg.pwd.test(key.value)) {
		            submit.className = 'btn-submit'
		        } else {
		            submit.className = 'btn-submit disabled';
		        }
		    }

		//- 登录~
		$(submit).on('click', function() {
			if(!ConstReg.pwd.test(key.value)){
				alert('请输入6-16位数字或字母的原密码');
			} else if (!ConstReg.pwd.test(pwd.value)) {
	            alert('请输入6-16位数字或字母的新密码');
	        } else if (pwd.value != repwd.value) {
	            alert('两次密码不一致，请重新输入');
	        } else {
				HH.ajax({
					url:'/yzmm/account/modifyPwd', 
					data:{oldPassword: key.value,newPassword:pwd.value}, 
					callback:function(data){
						//判断发送是否成功
						if(data.success) {
	                			location.href='/yzmm/index';
		                } else {
		                    alert(data.msg);
		                }
					}
				});
	        }
		})
	})
</script>
</body>
</html>