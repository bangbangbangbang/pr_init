<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head lang="en">
<meta charset="UTF-8">
<title>喵姐早教说</title>
<%@include file="../header_v2.0.jsp"%>
<%@include file="../header_wxjsapi.jsp"%>
<script src="<b:staticUrl>/res/js/scrollpaginationme.js</b:staticUrl>"></script>
<link rel="stylesheet"
	href="<b:staticUrl>/res/css/footer-v2.css</b:staticUrl>">
<style type="text/css">
.cancelImg{
	    display: inline;
    width: 1rem;
    float: right;
    vertical-align: middle;
    margin-top: -5px;
	}
</style>
</head>
<body>
	<div class="wrap">
		<form class="search keywordSearch" target="hideSearchIframe">
			<div class="searchBox">
				<a href="javascript:void(0)" class="cancleBtn backBtn cancelShow" style="display:none;">取消</a>
				<input type="submit" class="cancleBtn submitShow" value="搜索" style="display:block">
				<div class="searchTxt">
					<a href="javascript:void(0)" class="clear"></a>
					<img class="cancelImg cancelImgDiv" alt="" src="<b:staticUrl>/res/img/cancelSearch.png</b:staticUrl>">
					<input type="text" onkeyup="fn()" onblur="fn()" placeholder="请输入关键字" id="keyword" class="inputFocus searchTitle searchTitleArea" >
				</div>
			</div>
		</form>
		<iframe id="hideSearchIframe" name="hideIframe" style="display: none"></iframe>
		<%@include file="openSearchShow.jsp"%>
	</div>
	<!-- 底脚 -->
	<jsp:include page="/pages/header_footer.jsp">
		<jsp:param value="1" name="menu" />
	</jsp:include>
	<!-- 搜索框 -->
	<%@include file="../custom/search.jsp"%>
	<script src="<b:staticUrl>/res/js/package/index/indexKeyword.js</b:staticUrl>"></script>
	<script type="text/javascript">
	var wxfenxiangcb_list={
			title: '${wxshare.title}', // 分享标题
		    link: '${wxshare.link}', // 分享链接
		    imgUrl: '${wxshare.imgUrl}', // 分享图标
		    desc : '${wxshare.desc}',
		    shareTimeline:function(bool){
		    },
		    shareAppMessage:function(bool){
		    }
	}
	initwxfx(wxfenxiangcb_list);
	</script>
	<script type="text/javascript">
	//初始化
	var enableDefaultImage = "${enableDefaultImage}";
	var userAuthorise = "${userAuthorise}";
	var keyword = "${keywordOnly.keyword}";
	var minScope = "${keywordOnly.minScope}";
	var maxScope = "${keywordOnly.maxScope}";
	init({pageIndex : 1,pageSize:2,keyword:keyword,minScope:minScope,maxScope:maxScope});
	//初始化list查询sm
	var knowledgeListsm = {};
	var knowledgePageIndex = 1;
	var courseListsm = {};
	var coursePageIndex = 1;
	var activityListsm = {};
	var activityPageIndex = 1;
	var topicListsm = {};
	var topicPageIndex = 1;
	//检查是否有返回值
	var ajaxQueryNumber = 0;
	//检测是否唯一的查询记录数
	var onlyQueryNumber = 0;
	
	function fn(){
		var len = $("#keyword").val().length;
		if(len){
			$(".cancelShow").hide();
			$(".submitShow").show();
		}else{
			$(".cancelShow").show();
			$(".submitShow").hide();
		}
	}
	$(".cancelImgDiv").click(function(){
		$("#keyword").val("");
		$(".cancelShow").show();
		$(".submitShow").hide();
		$(".cancelImgDiv2").hide();
	});
	</script>
</body>
</html>