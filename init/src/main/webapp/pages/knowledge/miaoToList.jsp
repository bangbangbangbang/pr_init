<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>喵姐早教说</title>
    <%@include file="../header_v12.jsp" %>
    <link rel="stylesheet" href="<b:staticUrl>/res/css/footer-v2.css</b:staticUrl>">
    <style type="text/css">
    	.quesList .tag {
		    height: 0.45rem;
		}
    </style>
</head>
<body style="background-color:#e7e7e7">
	<section class="container">
		<div class="font16 tabTit">
			<div class="tabTitCont">
				<a onclick="tonewmiaoqa()">新的喵问</a>
				<a onclick="tooldmiaoqa()" class="active">历史喵问</a>
			</div>
		</div>
		<div class="quesList">
			<ul id="todetail">
			<c:forEach var="i" items="${list}">
				<li data-id="${i.id}">
					<div class="font15 top todetail">
					    <c:if test="${i.replyState == 1}">
					    <span class="status s_unanswered">已回答</span>
					    </c:if>
						<c:if test="${i.replyState == 0}">
					    <span class="status s_answered">未回答</span>
					    </c:if>
					
						<span class="font12 tag" style="margin-right: 5px;">${i.age}</span>
						<c:if test="${i.babySex==1}">
						<span class="font12 tag">小王子</span>
						</c:if>
						<c:if test="${i.babySex==2}">
						<span class="font12 tag">小公主</span>
						</c:if>
					</div>
					<div class="font15 word todetail"><span class="i_ques"></span><p>${i.questionTxt}</p></div>
				
				    <c:if test="${i.replyState == 1}">
					<div class="ansinfo todetail">
						<!-- <span class="i_arrow"></span> -->
						<span class="i_right"></span>
						<div class="font15 ansinfoTxt">${i.replyTxt}</div>
					</div>
					</c:if>
					<c:if test="${not empty i.knowledgeList}">
					<div>
						<c:forEach items="${i.knowledgeList}" var="knowledge" varStatus="status">
						<div class="answer" onclick="to_sqw(${knowledge.id})" style="">
						<c:if test="${status.index == 0}">
							<div class="font15 tit">（请点此收听）</div>
						</c:if>
							<a href="#" class="font18 answerCont" style="background-color: #ff9615">
								<span class="i_audio" style="background-color: #ff9615"></span>
								<p style="padding-top:0;">${knowledge.title}</p>
							</a>
						</div>
					</c:forEach>
					</div>
					</c:if>
					
					<div class="font12 time">${i.time}</div>
				</li>
            </c:forEach>				
			</ul>
		</div>
	</section>
	<!--尾部-->
	<jsp:include page="/pages/header_footer.jsp">
		<jsp:param value="4" name="menu"/>
	</jsp:include>
<script type="text/javascript">
$("#todetail li .todetail").click(function(){
     var id=$(this).parent().data("id");
     HH.href("/yzmm/account/miaoqa/todetail?id="+id);
     return;
});
function tooldmiaoqa(){
	HH.href("/yzmm/account/miaoqa/tolist");
	return;
}
function tonewmiaoqa(){
	HH.href("/yzmm/account/miaoqa/index");
	return;
}
function to_sqw(knowledgeId) {
	HH.href("/yzmm/account/knowledge/viewDetail?showTips=true&knowledgeId="+knowledgeId);
}
</script>
	
</body>
</html>