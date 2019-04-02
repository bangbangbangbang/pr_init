<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--忽略页面中的邮箱格式为邮箱-->
<meta name="format-detection" content="email=no" />
<%@include file="../../header_b.jsp"%>
<script src="<b:staticUrl>/res/js/flexible.js</b:staticUrl>"></script>
<!-- jquery自动完成js与样式 -->


<link rel="stylesheet"
	href="<b:staticUrl>../../../res/css/jquery-ui/jquery-ui.min.css</b:staticUrl>">
<link rel="stylesheet"
	href="<b:staticUrl>../../../res/css/jquery-ui/jquery-ui.structure.min.css</b:staticUrl>">
<link rel="stylesheet"
	href="<b:staticUrl>../../../res/css/jquery-ui/jquery-ui.theme.min.css</b:staticUrl>">
<script
	src="<b:staticUrl>../../../res/js/jquery-ui/jquery-ui.min.js</b:staticUrl>"></script>
<style>
.ui-autocomplete-category {
	font-weight: bold;
	padding: .2em .4em;
	margin: .8em 0 .2em;
	line-height: 1.5;
}

html .ui-autocomplete {
	z-index: 11111;
	height: auto !important;
	height: 277px;
	overflow-y: auto;
	//
	超过高度出现滚动条 /* prevent horizontal scrollbar */
	overflow-x
	:
	hidden;
	//
	横向超出隐藏，如果要出现横向滚动，设置为auto即可
}
</style>
<title>喵姐早教说</title>

</head>
<body>
	<section class="index_tab_wrap" style="width: 300px; padding: 30px;">
		<input id="sqwName" placeholder="请输入三千问名称" style="width: 300px">
		<input type="text" id="project-id">
	</section>

</body>
<script>
	$(function() {
		//延迟时间,第一次1000ms，这期间默认使用本身的延迟
		var delay = 1000; // 单位ms
		var last;

		$("#sqwName")
				.keyup(
						function(event) {
							//查询ajax获取下拉框内容
							//#1.初始化查询参数
							var title = $("#sqwName").val();
							var kdata = {
								"pageSize" : 5,
								"title" : title
							};
							var url = "/yzmm/account/knowledge/ajaxList";
							//查询
							$("#sqwName").autocomplete({
								delay : 1500,
								max : 12,//列表条目数
								width : 400,//提示的宽度
								scrollHeight : 300,//提示的高度
								autoFill : false,//自动填充
								minLength : 1,
								autoFocus : false,
								source : function(request, response) {
									HH.ajax({
										waiting : false,
										url : url,
										data : kdata,
										callback : function(data) {
											response(data.list);
										}
									});
								},
								matchContains : true,//是否只要包含文本框里的就可以
								focus : function(event, ui) {
									$("#sqwName").val(ui.item.title);
									return false;
								},
								select : function(event, ui) {
									$("#sqwName").val(ui.item.title);
									$("#project-id").val(ui.item.id);
									return false;
								},
								change : function(event, ui) {
									//第一次操作后禁用
									//$("#sqwName").autocomplete("disable");
									return false;
								}
							}).autocomplete("instance")._renderItem = function(
									ul, item) {
								return $("<li>").append(
										"<div>" + item.title + "</div>")
										.appendTo(ul);
							};
							//启用
							//$("#sqwName").autocomplete("search");

							//利用event的timeStamp来标记时间，这样每次的keyup事件都会修改last的值，注意last必需为全局变量
							last = event.timeStamp;
							setTimeout(function() {
								//设时延迟执行,如果正在输入则不执行
								if (last - event.timeStamp == 0) {
								}
							}, delay);
						});
	});
</script>


</html>