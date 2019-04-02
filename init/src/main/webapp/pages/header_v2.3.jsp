<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/commons/header-static.jsp" %>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
<meta name="format-detection" content="telephone=no,address=no,email=no">
<meta name="keywords" content="" />
<meta name="description" content="" />
<link rel="shortcut icon" type="image/x-icon" href="<b:staticUrl>/res/img/favicon.ico</b:staticUrl>" media="screen">
<link rel="apple-touch-icon" href="<b:staticUrl>/res/img/favicon.ico</b:staticUrl>">
<link rel="stylesheet" href="<b:staticUrl>/res/css/our.css</b:staticUrl>">
<link rel="stylesheet" href="<b:staticUrl>/res/css/evaluation/base.css</b:staticUrl>">
<link rel="stylesheet" href="<b:staticUrl>/res/css/evaluation/test.css</b:staticUrl>">
<script src="<b:staticUrl>/res/js/jquery-2.1.1.min.js</b:staticUrl>"></script> 
<script src="<b:staticUrl>/res/js/hh.js</b:staticUrl>"></script> 
<script src="<b:staticUrl>/res/js/toast-v1.js</b:staticUrl>"></script>  
<script src="<b:staticUrl>/res/js/common.js</b:staticUrl>"></script> 
<script src="<b:staticUrl>/res/js/myValidity.js</b:staticUrl>"></script>
<script src="<b:staticUrl>/res/js/scrollpaginationme.js</b:staticUrl>"></script>
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

