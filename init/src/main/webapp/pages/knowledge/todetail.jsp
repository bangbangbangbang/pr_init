<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="../header_v12.jsp"%>
<link rel="stylesheet" href="<b:staticUrl>/res/css/footer-v2.css</b:staticUrl>">
<title>喵姐早教说</title>
</head>
<body>
	<section class="container"> 
	<c:if test="${miaoDetail.isSqw==1}">
		<div class="font15 qaTit">
			<span class="i_essence">精</span>已收录进三千问
		</div>
	</c:if>

	<div class="userInfo">
		<div class="photo">
			<img src="${albumUrl}" class="pic"></img>
		</div>
		<div class="word">
			<p class="font15">${realName}</p>

			<c:if test="${sex==1}">
				<div class="font12 boy">
					<a>&nbsp</a>${age}</div>
			</c:if>
			<c:if test="${sex==2}">
				<div class="font12 gril">
					<a>&nbsp</a>${age}</div>
			</c:if>

		</div>
	</div>

	<div class="ask">
		<div class="font12 tag">
			<span>${pbage}</span>
			<c:if test="${miaoDetail.babySex ==1}">
				<span>小王子</span>
			</c:if>
			<c:if test="${miaoDetail.babySex== 2}">
				<span>小公主</span>
			</c:if>
		</div>
		<div class="font15 question">
			<span class="i_ques"></span>
			<p>${miaoDetail.questionTxt}</p>
			<div class="font12 time">${time}</div>
		</div>
	</div>

	<c:if test="${miaoDetail.replyState==1}">
		<!-- 普通回答 -->
		<c:if test="${miaoDetail.replyType == 0}">
			<div class="ask answer_normal">
				<div class="font15 answerTit">喵姐回复</div>
				<div class="font15 question">
					<p>${miaoDetail.replyTxt}</p>
					<div class="font12 time">${replytime}</div>
				</div>
			</div>
			</c:if>
			<c:if test="${miaoDetail.replyType == 1}">
				<c:forEach items="${knowledgeList}" var="knowledge" varStatus="status" step='1' begin="0" end="${knowledgeList.size()}"   >
				<div class="answer" onclick="to_sqw(${knowledge.id})" style="">
				<c:if test="${status.index == 0}">
					<div class="font15 tit">（请点此收听）</div>
				</c:if>
					<a href="#" class="font18 answerCont">
						<span class="i_audio"></span>
						<p>${knowledge.title}</p>
					</a>
				<c:if test="${knowledgeList.size() eq status.index +1 }">
					<div class="font12 time">${replytime}</div>
				</c:if>
				</div>
			</c:forEach>
			</c:if>
			<!-- 混合类型 -->
			<c:if test="${miaoDetail.replyType == 3}">
				<div class="ask answer_normal" style="margin-bottom: 1px;">
					<div class="font15 answerTit">喵姐回复</div>
					<div class="font15 question">
						<p>${miaoDetail.replyTxt}</p>
					</div>
				</div>
			<c:forEach items="${knowledgeList}" var="knowledge" varStatus="status" step='1' begin="0" end="${knowledgeList.size()}"   >
				<div class="answer" onclick="to_sqw(${knowledge.id})" style="">
				<c:if test="${status.index == 0}">
					<div class="font15 tit">（请点此收听）</div>
				</c:if>
					<a href="#" class="font18 answerCont">
						<span class="i_audio"></span>
						<p>${knowledge.title}</p>
					</a>
				<c:if test="${knowledgeList.size() eq status.index +1 }">
					<div class="font12 time">${replytime}</div>
				</c:if>
				</div>
			</c:forEach>
<%-- 			<div class="font12 time" style="Float:right; padding-right: 15px; width: 300px;">
			<span style="margin-left: 220px;">${replytime}</span></div>
 --%>			</c:if>
		</c:if>
		
	</section>
<!--尾部-->
	<jsp:include page="/pages/header_footer.jsp">
		<jsp:param value="4" name="menu"/>
	</jsp:include>
<script type="text/javascript">
function to_sqw(knowledgeId) {
	HH.href("/yzmm/account/knowledge/viewDetail?showTips=true&knowledgeId="+knowledgeId);
}
function tosqw() {
	HH.href("/yzmm/account/knowledge/index");
}
function tocourse() {
	HH.href("/yzmm/account/course/list");
}
function tome() {
	HH.href("/yzmm/account/user/info");
}
</script>
</body>
</html>