<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta name="format-detection" content="telephone=no" />
	<meta name="format-detection" content="email=no"/>
	<title>喵姐早教说</title>
	<%@include file="/commons/header-static.jsp" %>
	 <%@include file="../../header_wxjsapi.jsp"%>
	<script src="<b:staticUrl>/res/js/jquery-2.1.1.min.js</b:staticUrl>"></script> 
    <script src="<b:staticUrl>/res/js/hh.js</b:staticUrl>"></script>
    <script type="text/javascript">
	   var la = '${la}';
	   $(function(){
		   if(la){
			   var currentUrl = location.href;
			   if(currentUrl.indexOf("?la=")==-1&&currentUrl.indexOf("&la=")==-1){
				   var newUrl = currentUrl;
				   if(currentUrl.indexOf("?")==-1){
					   newUrl+="?la="+la;
				   }else{
					   newUrl+="&la="+la; 
				   }
				   history.replaceState(null,null,newUrl); 
			   }
		   }
	   })
	</script>
	<style type="text/css">
		.fastAsk {
		    font-size: 0.6rem;
		    line-height: 25px;
		    margin-top: 0;
		    margin-left: 2rem;
		    border: 1px solid #ff9900;
		    border-radius: 20px;
		    width: 177px;
		    height: 30px;
		    text-align: center;
		    color: #ff9900;
		}	
	</style>
	<script>
		var wxfenxiangcb={
				title: '${wxshare.title}', // 分享标题
				desc : '${wxshare.desc}',
			    link: '${wxshare.link}', // 分享链接
			    imgUrl: '${wxshare.imgUrl}', // 分享图标
			    shareTimeline:function(bool){
			    },
			    shareAppMessage:function(bool){
			    }
		};
		initwxfx(wxfenxiangcb);
		</script>
</head>
<body>
	<img alt="" style="width: 100%;" src="<b:staticUrl>/res/img/prekindergarten/comtoschool2.png</b:staticUrl>">
	<div style="width: 100%;text-align: center;color: white;font-size: 1rem;margin: 2rem 0;position: fixed;bottom: 0.32rem;position: relative;margin-top: -4rem;">
		<div class="couponPaybtn" style="width: 11.8rem;background-color: #FF9900;border-radius: 1.5rem;line-height: 2rem;margin: 0 auto;font-size: 1rem;" >开始测试 </div>
	</div>
	<script type="text/javascript">
	$(function(){
		$(".couponPaybtn").click(function(){
			HH.href("/yzmm/account/evaluation/toWelcome?id=${id}");
		});
	})
	</script>
</body>
</html>