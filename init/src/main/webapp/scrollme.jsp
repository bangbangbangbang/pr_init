<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no">
<meta name="keywords" content="" />
<meta name="description" content="" />
<%@include file="/pages/header_v12.jsp" %>
<script src="<b:staticUrl>/res/js/scrollpaginationme.js</b:staticUrl>"></script> 
<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>
<title>index</title>
<style type="text/css">
#bb{
font-size: medium;
}
</style>
</head>
<body>
asdfasdf
<input type="text" onclick="reload()" value="111111"></input>
<br>
<div id="bb"></div>
<div id="showloaddiv" style="display: none;">正在加载数据</div>

<script type="text/javascript">
var pageIndex = 1;
var sm = {};
$(function(){
	sm = $(window).scrollme({
		target:$("#bb"),
		data:{pageSize:15},
		url:"/yzmm/account/knowledge/ajaxList",
		beforeLoad:function(){
			//查询之前调用
			if(1!=pageIndex){
				$("#showloaddiv").show();
			}
		},
		callback:function(data,params){
			$("#showloaddiv").hide();
			var h = "";
			if (data.success) {
				//是否为空
				if (!data.totalPage && data.curPage == 1) {
					$(".noresult").remove();
					h =  '<div class="ui-font18 noresult">没有找到对应的问题</div>';
				} else {
					$(".noresult").hide();
					var len = data.list.length;
					if (len) {
						//增加页码
						params.pageIndex = ++pageIndex;
					}
					for (var i = 0; i < len; i++) {
						var o = data.list[i];
						h +=  pageIndex+" "+o.title+"<br><hr><br>";
					}
				}
			} 
			$("#bb").append(h);
		}
	});
	//加载数据
	sm.reload();
})
function reload(){
	pageIndex = 1;
	sm.reload({pageIndex:1});
}

</script>
</body>
</html>