<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>喵姐早教说</title>
    <%@include file="../header_v15.jsp" %>
    <link rel="stylesheet" href="<b:staticUrl>/res/css/center-v1.1.css</b:staticUrl>">
    <style type="text/css">
    	.editUserInfo {
    		border-radius: 0.05rem;
		    border-left: 0;
	        background-color: #e51812;
		    border: 1px solid #e51812;
		    color: #fff;
	        display: inline-block;
		    width: 1.75rem;
		    height: 0.575rem;
		    line-height: 0.6rem;
		    text-align: center;
		    margin-top: 0.2rem;
    	}
    </style>
    
</head>
<body id="bgwhite">
<div class="memberTop">
	<!-- <a href="/yzmm/account/message/messagelist" class="mmail"><i id="point" class="font12" style="display:none;"></i></a> -->
	<img src="${album}" class="bg" >
	<div class="memberTopBox">
		<div class="photo"><img src="${album}" onclick="window.location.href='/yzmm/account/user/infoDetail'"></div>
		<div class="font18 name">${nickName}</div>
		<!--男孩用boy-->
		<div class="font12 other">
			<c:if test="${babyOrNot == 0}">
				<span class="i-other"></span>${babySex}
			</c:if>
			<c:if test="${babyOrNot == 1}">
				<span class="i-yun"></span>${babyAge}
			</c:if>
			<c:if test="${babyOrNot == 2}">
				<c:if test="${babySex == '小公主'}">
					<span class="girl"></span>${babySex}${babyAge}
				</c:if>
				<c:if test="${babySex == '小王子'}">
					<span class="boy"></span>${babySex}${babyAge}
				</c:if>
			</c:if>
			<c:if test="${babyOrNot == 3}">
			</c:if>
		</div>
		
		<!-- h5页面到了替换 -->
		<c:if test="${editUserInfo == 'show'}">
			<div align="center" style="font-size: 12px;">
				<a class="editUserInfo" onclick="window.location.href='/yzmm/account/toPhoneReg?noToast=true'">编辑</a>
			</div>
		</c:if>
		
		<ul class="num">
			<li onclick="window.location.href='/yzmm/account/tip/tiplist'">
				<p class="font24">${count}</p>
				<p class="font12">打赏</p>
			</li>
			<li onclick="window.location.href='/yzmm/account/sqwFoot/toFootmarkList'">
				<p class="font24">${footmarkCount}</p>
				<p class="font12">足迹</p>
			</li>
		</ul>
	</div>
</div>
<ul class="font15 memberLink">
	<li><a href="/yzmm/account/course/orderLiveList">
		<div class="ml"><i class="i1"></i>最新直播课</div>
		<div class="mr txtright">本月<span class="red">${live}</span>节</div>
	</a></li>
	<li><a href="/yzmm/account/miaoqa/tomiao">
		<div class="ml"><i class="i2"></i>我的提问</div>
		<div class="mr txtright">
			<c:if test="${YesAnswerCount != 0}">
				已回复<span class="red">${YesAnswerCount}</span>条
			</c:if>
		</div>
	</a></li>
	<li><a href="/yzmm/account/VIPStatus">
		<div class="ml"><i class="i3"></i>会员状态</div>
		<div class="mr"></div>
	</a></li>
	<li><a href="/yzmm/account/user/collectList">
		<div class="ml"><i class="i4"></i>我的收藏</div>
		<div class="mr"></div>
	</a></li>
	<li><a href="/yzmm/account/user/infoDetail">
		<div class="ml"><i class="i5"></i>我的资料</div>
		<div class="mr"></div>
	</a></li>
	<li><a href="/yzmm/account/feedback/index">
		<div class="ml"><i class="i6"></i>意见反馈</div>
		<div class="mr"></div>
	</a></li>
	<li><a href="/yzmm/account/user/toAbout">
		<div class="ml"><i class="i7"></i>关于</div>
		<div class="mr"></div>
	</a></li>
</ul>
<c:if test="${isNotWeixin}">
	<div onclick="loginout()" style="line-height: 45px;color: #999999;border-radius:4px;border: 1px solid #cccccc; font-size:17px; text-align: center;margin: 15px auto;width: 345px;">
		 退出 
	</div>
</c:if>
 <jsp:include page="/pages/header_footer.jsp">
		<jsp:param value="4" name="menu"/>
</jsp:include>
</body>
<script type="text/javascript">
$(function(){
	
	var url = '/yzmm/account/message/ajaxList';
	HH.ajax({
		waiting:false,
		data:{},
		url:url,
		success:function(data){
			if(data.bool){				
				$("#point").show();
			}
		},
	});
})
function loginout(){
	var url = '/yzmm/account/ajaxLogout';
	HH.ajax({
		waiting:false,
		data:{},
		url:url,
		success:function(data){
			if(data.success){				
				window.location.href="/yzmm/index";
			}
		},
	});
}
</script>
</html>