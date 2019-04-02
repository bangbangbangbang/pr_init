<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>喵姐早教说</title>
<%@include file="header.jsp" %>
</head>

<body>

<div class="wrapper">
    <header>
        <a name="__AD_register-goback" class="left" href="javascript:goBack();">
            <span class="arrow arrow-left"></span>
        </a>
        <h2 class="title">快速注册</h2>
    </header>
    <div class="main login-password">
        <ul class="login-box">
            <li class="code">
                <em class="icon icon-code"></em>
                <input id="code" maxlength="4" placeholder="验证码" name="code" type="tel">
                <a  class="captcha" href="javascript:;"><img id="captcha" src="/yzmm/valid/captcha" width="120" height="40" style="border:0;" alt=" "></a>
            </li>
            <li>
                <em class="icon icon-phone"></em>
                <input id="tel" placeholder="中国大陆地区手机号码" type="tel" name="mobile" maxlength="11">
            </li>
            <li class="code">
                <em class="icon icon-key"></em>
                <input id="key" maxlength="6" placeholder="短信验证码" name="code" type="tel">
                <a id="getCode" class="btn-code disabled" href="javascript:;">获取验证码</a>
                 <input  id="validId" name="validId" type="hidden" value="">
            </li>
            <li>
                <em class="icon icon-lock"></em>
                <input id="pwd" placeholder="设置密码(6-16位数字或字母)" type="password" maxlength="16">
            </li>
        </ul>
        <a name="__AD_register-submit" id="submit" class="btn-submit disabled" href="javascript:;">同意协议并注册</a>
        <p class="agreement"><a name="__AD_register-agreement" href="javascript:alert('用户服务协议');">《用户服务协议》</a></p>
    </div>
</div>
<script type="text/javascript">
    $(function() {
        var captcha = getId('captcha'),
            code = getId('code'),
            tel = getId('tel'),
            key = getId('key'),
            submit = getId('submit'),
            timer, num = 60,
            getCode = getId('getCode'),
            check = getId('check'),
            backInput = getId('backUrl'),
            wechat = getId('wechat'),
            wemask = getId('wemask'),
            backUrl,
            skillUrl = window.sessionStorage.getItem('backUrl'),
            checkbox = getId('checkbox');

        function flushCode(){
       	 	$(captcha).attr("src","/yzmm/valid/captcha?a="+Math.random());
        }
        //- 加载图形验证码~
        $(captcha).on('click', function() {
        		flushCode();
        });

        //- 移除手机验证码的 disabled ~
        $(tel).on('input', function() {
            if(tel.value.length === 11 && code.value.length === 4) {
                getCode.className = 'btn-code';
            } else {
                getCode.className = 'btn-code disabled';
            }
            removeBtnDisabled();
        });

        function checkAccount(){
	        	var result = false;
	        	HH.ajax({
	        		url: "/yzmm/account/checkAccount",
	        		data:{account:tel.value},
	        		async:false,
	        		callback:function(data){
	        			if(data.success){
	        				result = true;
	        			}else{
	        				alert(data.msg);
	        				result = false;
	        			}
	        		}
	        	});
	        	return result;
        }
        
        //- 验证手机格式~
        $(getCode).on('click', function() {
            window.clearInterval(timer);
            if(!ConstReg.mobile.test(tel.value)) {
                alert('手机号格式有误，请重新输入');
                return;
            } else if (code.value.length === '') {
                alert('验证码不能为空');
                return;
            } 
	            if(!checkAccount()){
	            		return ;
	            }
                getCode.className += ' disabled';
                
                HH.ajax({url:'/yzmm/valid/send', 
                	data:{account: tel.value,captcha: code.value}, 
                	callback:function(data) {
                    //判断发送是否成功
                    if(data.success){
                        timer = window.setInterval(function(){
                            --num;
                            if(num === 0) {
                                num = 60;
                                window.clearInterval(timer);
                                getCode.className = 'btn-code';
                                getCode.innerHTML = '获取验证码';
                            } else {
                                getCode.innerHTML = num + '秒'
                            }
                        }, 1000);
                        $("#validId").val(data.ext);
                    }else{
                        alert(data.msg);
                        flushCode();
                        getCode.className = 'btn-code';
                        getCode.innerHTML = '获取验证码';
                    }
                }
                });
        });

        //- 移除按钮上的 disabled
        $(code).on('input', function() {
            if(tel.value.length === 11 && code.value.length === 4) {
                getCode.className = 'btn-code';
            } else {
                getCode.className = 'btn-code disabled';
            }
            removeBtnDisabled()
        });
        $(key).on('input', function() {
            removeBtnDisabled()
        });
        $(pwd).on('input', function() {
            removeBtnDisabled()
        });
        function removeBtnDisabled() {
            if(code.value.length === 4 && tel.value.length === 11 && key.value.length === 6 && pwd.value.length >= 6) {
                submit.className = 'btn-submit';
            } else {
                submit.className = 'btn-submit disabled';
            }
        }
        
    function valid(){
     	var result = false;
        	HH.ajax({
        		url: "/yzmm/valid/valid",
        		data:{account:tel.value,validId:$("#validId").val(),validCode:key.value},
        		async:false,
        		callback:function(data){
        			if(data.success){
        				result =  true;
        			}else{
        				alert(data.msg);
        				flushCode();
        				result = false;
        			}
        		}
        	});
        	return result;
    }
	function submitReg(){
		  	HH.ajax({
	    		url:"/yzmm/account/telreg",
	    		data:{account: tel.value, validCode: key.value, password: pwd.value,validId:$("#validId").val()},
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
	}
        //- 登录~
        $(submit).on('click', function() {
	      if(!valid()){
	    	  	return ;
	      }
	      submitReg();
        });

    })
</script>
</body>
</html>
