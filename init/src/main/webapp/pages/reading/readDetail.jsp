<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head lang="en">
<meta charset="UTF-8">
<title>喵姐早教说</title>
<%@include file="../header_v2.0.jsp"%>
<script src="<b:staticUrl>/res/js/jquery.cookie.js</b:staticUrl>"></script>
</head>
<body>
<iframe class="iframe" width="100%" height="100%" style="border: 0;" src="" >
</iframe> 
<div class="wrap">
	<div class="slideBtn"><span></span></div>
	<div class="slidebar">
		<a hrer="#top" class="toTop"></a>
		<a hrer="javascript:void(0)" class="voteBtn">评价</a>
		<a hrer="#" class="moreBtn">更多精彩</a>
	</div>
	<div class="voteBar">
		<div class="voteBarCont">
			<a href="javascript:void(0)" class="handUp">有用</a>
			<a href="javascript:void(0)" class="handDown">无趣</a>
		</div>
	</div>
	<div class="plusone">+1</div>
</div>
<div class="readList">
	<div class="readListTit"><a href="javascript:void(0)" class="slidedown"></a>女神读物</div>
	<ul class="speakList">
		<!-- 文章列表内容 -->
	</ul>
</div> 

<script type="text/javascript">
var url = "${originUrl }";
	jQuery.ajaxPrefilter(function(options) {
	    if (options.crossDomain && jQuery.support.cors) {
	        options.url = 'https://cors-anywhere.herokuapp.com/' + options.url;
	    }
	});
	var share_link=url;//微信文章地址
	$.get(
	    share_link,
	    function (response) {
	        console.log("> ", response); 
	        var html = response;
	        html=html.replace(/data-src/g, "src"); 
	        var html_src = 'data:text/html;charset=utf-8,' + html;
	        $("iframe").attr("src" , html_src);
	    }
	);
</script>
</body>
</html>