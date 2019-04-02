<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>喵姐早教说</title>
     <%@include file="../header.jsp" %>
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"/>
    <meta content="yes" name="apple-mobile-web-app-capable"/>
    <meta content="black" name="apple-mobile-web-app-status-bar-style"/>
    <meta content="telephone=no" name="format-detection"/>
    <style type="text/css">
    .removegt{
  	  background-image: none !important;
    }
    
    </style>
</head>
<body>
<section class="my_account">
<!--     <h1>我的账号</h1> -->
    <section class="my_account_con">
        <dl class="cf my_account_con1">
            <a href="/yzmm/account/toUploadLogo">
                <dt>头像</dt>
                <dd><span><img src="${album}" style="border-radius:50%"/></span><i></i></dd>
            </a>
        </dl>
        <dl class="cf">
            <a href="/yzmm/account/toModifyNickName">
                <dt>昵称</dt>
                <dd><span>${nickName}</span><i></i></dd>
            </a>
        </dl>
        <dl class="cf">
            <a href="javascript:;">
                <dt>姓名</dt>
                <dd><span>${realName}</span><i class="removegt"></i></dd>
            </a>
        </dl>
        <dl class="cf">
            <a href="javascript:;">
                <dt>性别</dt>
                <dd><span>${sex}</span><i class="removegt"></i></dd>
            </a>
        </dl>
        <dl class="cf">
            <a href="javascript:;">
                <dt>手机</dt>
                <dd><span>${telephone}</span><i class="removegt"></i></dd>    
            </a>
        </dl>
        <dl class="cf">
            <a href="javascript:;">
                <c:if test="${babyOrNot==0}">
                	<dt>喵星人</dt>
                	<dd><span></span><i class="removegt"></i></dd>
				</c:if>
				<c:if test="${babyOrNot==1}">
					<dt>孕妈/爸</dt>
                	<dd><span>${babyAge}</span><i class="removegt"></i></dd>
				</c:if>
				<c:if test="${babyOrNot==2}">
					<c:if test="${hasCount==1}">
						<dt>大喵</dt>
	                	<dd><span>${firstBabySex}&nbsp&nbsp${firstBabyBirthday}</span><i class="removegt"></i></dd>
					</c:if>
					<c:if test="${hasCount==2}">
						<dt>大喵</dt>
	                	<dd><span>${firstBabySex}&nbsp&nbsp${firstBabyBirthday}</span><i class="removegt"></i></dd>
						<dt>二喵</dt>
	                	<dd><span>${secondBabySex}&nbsp&nbsp${secondBabyBirthday}</span><i class="removegt"></i></dd>
					</c:if>
				</c:if>
				<c:if test="${babyOrNot==3}">
				</c:if>
            </a>
        </dl>
    </section>
  <div class="buttonDiv" >
  	<a class="button" href="/yzmm/account/user/info">返回</a>
  </div>

</section>
<script>
$(function(){
	//日历
	$(".main").scrollEve({
		selectors:{
			obj:".birth",
			scrollitem:".scollItem",
			item:"span",
			sure:".btn_sure",
			cancle:".btn_cancle",
			active:".active"
		}
	})
})
</script>
</body>
</html>