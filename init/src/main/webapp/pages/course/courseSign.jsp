<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--忽略页面中的邮箱格式为邮箱-->
<meta name="format-detection" content="email=no"/>
 <%@include file="../header_v2.0.jsp" %>
<link rel="stylesheet" href="<b:staticUrl>/res/css/footer-v2.css</b:staticUrl>">
<link rel="stylesheet" href="<b:staticUrl>/res/css/animate.css</b:staticUrl>">
 <script src="<b:staticUrl>/res/js/flexible.js</b:staticUrl>"></script>
<title>喵姐早教说</title>
</head>
<body>

<div class="wrap">
	<div class="subjectBanner subjectBanner2">
		<img src="${teacherInfo.img}" >
		<div class="subjectTit2">${teacherInfo.type}</div>
	</div>
	<div class="subjectMeb">
		<div class="photo" onclick="window.location.href='/yzmm/account/teacher/tcInfo?tcUid=${teacherInfo.tcuid}';return false"><img src="${teacherInfo.teacherImg}" ></div>
		<div class="name">主讲人：${teacherInfo.name}</div>
	</div>
	<div class="subjectDetail">
	<p>
	${teacherInfo.content}
	</p>
	</div>
	<div class="lessonList">
		<div class="lessonListTit">课程目录</div>
		<ul id="morecourselist">
			
		</ul>
	</div>
</div>
<footer class="footer">
	<div class="fixed">
		<div class="font12 fixed-box">
			<a onclick="tosqw()" class="ft1 "><p>三千问</p></a>
			<a onclick="tocourse()" class="ft2 active"><p>喵姐说</p></a>
			<a onclick="miaoquan()" class="ft4"><p>喵圈</p></a>
			<a onclick="tome()" class="ft3"><p>我</p></a>
		</div>
	</div>
</footer>
<jsp:include page="/pages/header_footer.jsp">
		<jsp:param value="2" name="menu"/>
	</jsp:include>
<script src='<b:staticUrl>/res/js/scrollpaginationme.js</b:staticUrl>'></script>
<script>
var pageIndex = 1;
var sm = {};
var lableId='${lableId}';
$(function(){
	 sm = $(window).scrollme({
		    url:'/yzmm/account/course/moretitle',
		    data:{pageIndex:pageIndex,pageSize:10,lableId:lableId},
		    callback:function(data,params){
		    	var h = "";
	    		if(data.success){
	    			var len = data.list.length;
					if(len){
						//增加页码
						params.pageIndex = ++pageIndex;
					} 
					for(var i=0;i< len;i++){
						var o = data.list[i];
						var icont=i+1;
						if(i%2==1){
							h+='<li>';
							h+='<div class="lessLeft">';
							h+='<p class="num">'+icont+'</p>';
							h+='<p class="txt">课程</p>';
							h+='</div>';
					    	h+='<div class="lessRight" onclick="tocourselist(this);" data-cid="'+o.courseId+'">';
							h+='<h2 class="bigtit"><span class="tag">【喵姐说】</span>'+o.courseName+'</h2>';
							if(o.sqwFirst){
								h+='<P><a href="#"><span class="tag"></span>'+o.sqwFirstName+'</a></P>';
								if(o.sqwSecond){
									h+='<P><a href="#"><span class="tag"></span>'+o.sqwSecondName+'</a></P>';	
								}
							}
							h+='</div>';
							h+='</li>';
						}
						if(i%2==0){
							h+='<li>';
							h+='<div class="lessLeft">';
							h+='<p class="num">'+icont+'</p>';
							h+='<p class="txt">课程</p>';
							h+='</div>';
							h+='<div class="lessRight" onclick="tocourselist(this);" data-cid="'+o.courseId+'">';
							h+='<h2 class="bigtit"><span class="tag">【喵姐说】</span>'+o.courseName+'</h2>';
							if(o.sqwFirst){
								h+='<P><a href="#"><span class="tag"></span>'+o.sqwFirstName+'</a></P>';
								if(o.sqwSecond){
									h+='<P><a href="#"><span class="tag"></span>'+o.sqwSecondName+'</a></P>';
								}
							}
							h+='</div>';
							h+='</li>';
						}
					} 
	    		}
	    		$("#morecourselist").append(h);
		    }
		 });
		 sm.reload(); 
});
function reload(){
	pageIndex = 1;
	sm.reload({pageIndex:1});
}
function tocourselist(obj){
	window.location.href="/yzmm/account/course/toVodDetail?courseId="+$(obj).data('cid');
	window.location.href="/yzmm/account/course/toCoursePath?courseId="+$(obj).data('cid');
}
</script>
</body>
</html>