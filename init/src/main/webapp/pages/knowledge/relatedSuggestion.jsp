<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<div class="section knowledgeArea">
		<div class="sectionTit">
			<a href="javascript:void(0)" class="more moreactive moreKnowledge">
				全部<span class="txtyellow knowledgeCount"></span>答疑
			</a>
			<span class="icon-ask"></span>三千问
		</div>
		<ul class="recommendList" id ="knowledgeList">
			
		</ul>
	</div>
	<div class="section courseArea" style="display:none;">
		<div class="sectionTit">
			<a href="javascript:void(0)" class="more moreactive moreCourse">
				全部<span class="txtyellow courseCount"></span>课程
			</a>
			<span class="icon-speak"></span>喵姐说
		</div>
		<ul class="speakList" id="courseList">
			<li><a href="#">
				<div class="photo"><span><img src="" ></span></div>
				<p>孩子上亲子课亲子课不敢说亲子课不不敢说话...</p>
			</a></li>
		</ul>
	</div>
	<div class="section activityArea" style="display:none;">
		<div class="sectionTit">
			<a href="javascript:void(0)" class="more moreactive moreActivity">
				相关<span class="txtyellow activityCount"></span>活动
			</a>
			<span class="icon-activity"></span>喵活动
		</div>
		<ul class="activityList activityUlList" id="activityList">
			<li>
				<div class="photo"><a href="#"><img src="" ></a></div>
				<div class="info">
					<h2 class="tit">孩子上亲子课孩子课孩话怎么办？</h2>
					<p>时间：8月12日－9月12日</p>
					<div class="other"><a href="#" class="join">我要参与</a></div>
				</div>
			</li>
		</ul>
	</div>
	<div class="section sectionBorder0 topicArea" style="display:none;">
		<div class="sectionTit">
			<a href="javascript:void(0)" class="more moreactive moreTopic">
				全部<span class="txtyellow topicCount"></span>话题
			</a>
			<span class="icon-topic"></span>喵话题
		</div>
		<ul class="activityList topicList" id="topicList">
			<li>
				<div class="photo"><a href="#"><img src="" ></a></div>
				<div class="info">
					<p class="word">每天晚上怎样教孩子自己吃饭？妈妈希望他喜欢吃的食物都是什么的食物都是什么</p>
					<div class="num">2221人看过</div>
				</div>
			</li>
		</ul>
	</div>
<script type="text/javascript">
function viewKnowledgeDetail(id){
	top.location="/yzmm/account/knowledge/viewDetail?knowledgeId="+id;
		return;
}
function viewLiveCourseDetail(id){
	window.location.href="/yzmm/account/course/liveDetail?courseId="+id;
	return;
}
function viewVodCourseDetail(id){
	window.location.href="/yzmm/account/course/toVodDetail?courseId="+id;
	return;
}
function viewTopicDetail(id){
	window.location.href="/yzmm/account/miao/topic/viewDetailIncludeReply?id="+id;
	return;
}
function viewActivityDetail(id){
	window.location.href="/yzmm/account/activity/daysPlan/everyDayList?activityId="+id;
	return;
}
function toActivityPart(id){
	//防止冒泡
	stopevt();
	window.location.href="/yzmm/account/activity/daysPlan/index?id="+id;
	return;
}
</script>
<script src="<b:staticUrl>/res/js/recommend/sqwRelatedSuggestion.js</b:staticUrl>"></script>