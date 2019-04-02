<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/commons/header-static.jsp" %>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no">
<meta name="keywords" content="喵姐,喵姐早教说,0到6岁早期教育,家庭教育,家长教育,父母课堂,育儿知识,儿童教育,母婴育儿,${metaKeywords}" />
<meta name="description" content="喵姐早教说是喵姐高寿岩创办的为家庭教育提供专业靠谱的0到6岁早期教育、育儿知识的平台。${metaDescription}" />
<link rel="shortcut icon" type="image/x-icon" href="<b:staticUrl>/res/img/favicon.ico</b:staticUrl>" media="screen">
<link rel="apple-touch-icon" href="<b:staticUrl>/res/img/favicon.ico</b:staticUrl>">

<script src="<b:staticUrl>/res/js/jquery-2.1.1.min.js</b:staticUrl>"></script> 
<script src="<b:staticUrl>/res/js/custom/authorise/authorise.js</b:staticUrl>"></script>
<link rel="stylesheet" href="<b:staticUrl>/res/css/custom/userAuthorise/userAuthorise.css</b:staticUrl>">
<script src="<b:staticUrl>/res/js/hh.js</b:staticUrl>"></script> 
<script src="<b:staticUrl>/res/js/toast-v1.js</b:staticUrl>"></script>  
<script src="<b:staticUrl>/res/js/common.js</b:staticUrl>"></script> 
<script src="<b:staticUrl>/res/js/myValidity.js</b:staticUrl>"></script>   

<script src="<b:staticUrl>/res/js/scroll-v1.2.2.js</b:staticUrl>"></script>

<link rel="stylesheet" href="<b:staticUrl>/res/css/swiper.css</b:staticUrl>"> 
<link rel="stylesheet" href="<b:staticUrl>/res/css/common-v2.css</b:staticUrl>">
<link rel="stylesheet" href="<b:staticUrl>/res/css/group.css</b:staticUrl>">

<script src="<b:staticUrl>/res/js/imgshow.js</b:staticUrl>"></script>
<script src="<b:staticUrl>/res/js/flexible.js</b:staticUrl>"></script>

<%	
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>
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
<link rel="stylesheet" href="<b:staticUrl>/res/css/loginBar.css</b:staticUrl>">
<script src="<b:staticUrl>/res/js/loginBar.js</b:staticUrl>"></script>
