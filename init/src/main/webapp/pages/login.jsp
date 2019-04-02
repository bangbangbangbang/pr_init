<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>喵姐早教说</title>
<%@include file="header.jsp" %>
<script>
if(self.parent && self.parent!=self)self.parent.location.href=self.location.href;
</script>
</head>

<body>
<div class="wrapper" style="">
    <header>
        <a name="__AD_user-login-goback" class="left" href="javascript:goBack();">
            <span class="arrow arrow-left"></span>
        </a>
        <h2 class="title">登录</h2>
    </header>
    <div class="main login-password">
        <ul class="login-box">
            <li>
                <em class="icon icon-phone"></em>
                <input id="tel" placeholder="手机号码" type="tel" maxlength="11">
            </li>
            <li>
                <em class="icon icon-lock"></em>
                <input id="pwd" placeholder="密码" type="password" maxlength="16">
            </li>
        </ul>
        <a name="__AD_user-login-submit" id="submit" class="btn-submit disabled" href="javascript:;">登录</a>
    </div>
</div>
<script type="text/javascript">
    $(function() {
        var tel = $('#tel').get(0),
            pwd = $('#pwd').get(0),
            telVal, pwdVal,
            submit = $('#submit').get(0),
            backUrl = window.sessionStorage.getItem('backUrl');
        
        $(submit).on('click', function() {
            telVal = tel.value;
            pwdVal = pwd.value;
            	HH.ajax({
            		url: "/yzmm/account/login",
            		data:{username:telVal,password:pwdVal},
            		callback:function(data){
            			if(data.success){
            				if("${loginReferer}"){
            					window.location.href="${loginReferer}";
            				}else{
            					window.location.href="/yzmm/index";
            				}
            			}else{
            				alert(data.msg);
            			}
            		}
            	});
        });

    });
</script>
</body>
</html>
