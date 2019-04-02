<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>喵姐早教说</title>
 <%@include file="../header_v12.jsp" %>
 <link rel="stylesheet" href="<b:staticUrl>/res/css/footer-v2.css</b:staticUrl>">
</head>
    <style type="text/css">
		#allSqw {
		   line-height: 25px; 
		}
	</style>
<body>
	<body>
	<section class="wrapper">
		<div class="miaotit"></div>
		<ul onclick="tosqw_daymiao()" class="miaoList">
			<li>
				<div class="font12 tit">${month}月${day}日</div>
				<div  class="img">
					<img src="${dayMiao.picUrl}" >
					<div class="txt"><p>${dayMiao.title}</p></div>
				</div>
				<div class="font12 viewmore">
					<a href="#">查看全文</a>
				</div>
			</li>
		</ul>
		<a href="/yzmm/account/knowledge/index" id="allSqw" class="font12 alink">进入三千问专区>></a>
	</section>
	
	<!--尾部-->
	<footer class="footer">
		<div class="fixed">
			<div class="font12 fixed-box">
				<a href="#" class="ft1"  onclick="tosqw()"><p>三千问</p></a>
				<a href="#" class="ft2" onclick="tocourse()"><p>喵姐说</p></a>
				<a href="#" class="ft4" onclick="miaoquan()"><p>喵圈</p></a>
				<a href="#" class="ft3" onclick="tome()"><p>我</p></a>
			</div>
		</div>
	</footer>
<script type="text/javascript">
function tosqw_daymiao(){
	window.location = "/yzmm/account/knowledge/viewDetail?knowledgeId=${dayMiao.id}";
}
function tosqw(){
	window.location = "/yzmm/account/knowledge/index?timestamp="+new Date().getTime();
}
function miaoquan(){
	window.location = "/yzmm/account/miaoquan/index?timestamp="+new Date().getTime();
}
function tocourse(){
	window.location = "/yzmm/account/course/list?timestamp="+new Date().getTime();
}
function tome(){
	window.location = "/yzmm/account/user/info?timestamp="+new Date().getTime();
}
</script>
</body>
</html>