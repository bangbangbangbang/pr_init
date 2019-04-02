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
		<img src="${courseGroup.imgUrl}" >
		<div class="subjectTit">
		  	<div class="tit2" style="text-align: center;">${courseGroup.name}</div>
		  	<c:if test="${!auth}">
		  		<p class="priceword">单次付费，永久收听</p>
		  		<c:if test="${empty money}">
		  		<div class="price"><span>请联系小喵付费</span></div>
		  		</c:if>
		  		<c:if test="${not empty money}">
		  		<div class="price"><span>￥</span>${money}</div>
		  		</c:if>
			   <c:if test="${not empty money}">
			   	<a href="javascript:void(0)" class="payBtn" data-money="0.02" data-body="单次购买课程组【￥${money}】=groupId:${courseGroup.id}">支付</a>
			   </c:if>
		  	</c:if>
		</div>
	</div>
	<div class="subjectMeb">
		<div class="photo"><img src="<b:staticUrl>/res/img/miaojie.jpg</b:staticUrl>"/></div>
		<div class="name">主讲人：喵姐</div>
	</div>
	<div class="subjectDetail">
	<p>
	${courseGroup.description}
	</p>
	</div>
	<div class="lessonList">
		<div class="lessonListTit">课程目录</div>
		<ul id="morecourselist">
			<c:forEach items="${resList}" var="course" varStatus="status">
				<li>
				<div class="lessLeft">
					<p class="num"><c:out value="${status.index+1}"></c:out></p>
					<p class="txt">课程</p>
				</div>
				<c:if test="${auth}">
					<div class="lessRight"  onclick="toCourseDetail('${course.courseId}','${course.isLive}');">
				</c:if>
				<c:if test="${!auth}">
					<div class="lessRight" onclick="toast('请先购买哟');" data-cid="${course.courseId}">
				</c:if>
					<h2 class="bigtit"><span class="tag">【喵姐说】</span>${course.courseName}</h2>
					<c:if test="${course.sqwFirst}">
						<P><a href="#"><span class="tag"></span>${course.sqwFirstName}</a></P>
					</c:if>
					<c:if test="${course.sqwSecond}">
						<P><a href="#"><span class="tag"></span>${course.sqwSecondName}</a></P>
					</c:if>
				</div>
			</li>
			</c:forEach>
		</ul>
	</div>
</div>
<jsp:include page="/pages/header_footer.jsp">
		<jsp:param value="2" name="menu"/>
	</jsp:include>
<script src="<b:staticUrl>/res/js/wxmppay.js</b:staticUrl>"></script>
<script type="text/javascript">
$(function(){
	var isWeixin = '${isWeixin}';
	var groupId='${courseGroup.id}';
	$(".payBtn").click(function(){
		if(isWeixin!="true"){
			toast("请您进入微信支付");
			return false;
		}
		var type = 'COURSEGROUPBUY';
		var obj = $(this);
		var content = "￥"+obj.data("money");
		wxmpcoursegrouppay(obj.data("money"),obj.data("body"),groupId,type,function(orderId,result){
		if(result=="ok"){
			window.location.href="/yzmm/wxmppay/coursegroup/checkPay?groupId="+groupId+"&orderId="+orderId;
		}
		});
	});
});
function toCourseDetail(id,flag){
	HH.href("/yzmm/account/coursegroup/forwardCourseDetail?courseId="+id+"&isLive="+flag);	
}
</script>
</body>
</html>