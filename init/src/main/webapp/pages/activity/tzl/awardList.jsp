<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta name="format-detection" content="telephone=no" />
	<meta name="format-detection" content="email=no"/>
	<title>行动女神团</title>
	
	 <%@include file="../../header_v14.jsp" %>
	 <script src="<b:staticUrl>/res/js/custom/lightbox/lightbox.js</b:staticUrl>"></script> 
	
	<style type="text/css">
	</style>
</head>
<body id="bgwhite">
	<div class="font17 bigTitle"><div>行动女神团</div></div>
	<div class="font15 bangTit"><div><i class="i-bang"></i>获奖榜单</div></div>
	<ul class="font12 bang-list" id="bang-list">
		<!-- <li>
			<span class="font18">1</span><img src="img/1.png" >喵姐高寿岩
		</li> -->
	</ul>
<!--尾部-->
	<jsp:include page="/pages/header_footer.jsp">
		<jsp:param value="3" name="menu"/>
	</jsp:include>
</body>
<script type="text/javascript">

   var activityId = '${activityId}';
   var floorNum = 0;
   $.post("/yzmm/account/activity/tzl/reply/ajaxtoAwardList", { activityId: activityId},
   function(data){
	   if (data.success) {
			var len = data.list.length;
			var h = "";
			for (var i = 0; i < len; i++) {
				var o = data.list[i];
				floorNum = floorNum +1;
				h += '<li>';
				h += '<span class="font18">'+floorNum+'</span>';
				h += '<img src="'+o.rAlbumUrl+'" >';
				h += ''+o.rNickName+'';
				h += '</li>';
			}
			$("#bang-list").append(h);
		} 
   });
</script>
</html>