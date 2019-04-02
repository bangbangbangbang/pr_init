<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<div class="section" style="line-height: 0.6rem;font-size: 0.34rem;color: #333333;">
	<p style="font-size: 0.45rem;font-weight: bold;margin-bottom: 0.32rem;">课程介绍</p>	
	<p style="color: #949494;position: absolute;right: 0.1rem;top:0.42rem;">${subscribe}人订阅</p>
	<p>${description}</p>
</div>
<c:if test="${not empty syllabusList}">
	<div class="section" style="line-height: 0.6rem;font-size: 0.34rem;color: #333333;">
		<p style="font-size: 0.45rem;font-weight: bold;margin-bottom: 0.32rem;">课程大纲</p>
		<c:forEach items="${syllabusList}" var="syllabus" varStatus="status">
			<c:if test="${not empty syllabus.title}">
				<p style="font-weight: bold;">第${status.index+1}课  ${syllabus.title}</p>
				<p>${syllabus.content}</p>
				<c:if test="${!status.last}">
					<br>
				</c:if>
			</c:if>
		</c:forEach>
	</div>
</c:if>
<div class="section" style="line-height: 0.6rem;font-size: 0.34rem;color: #333333;">
	<p style="font-size: 0.45rem;font-weight: bold;margin-bottom: 0.32rem;">导师介绍</p>	
	<p style="font-weight: bold;">喵姐-高寿岩</p>
	<p>●&nbsp;北京师范大学学前教育硕士，资深学霸；</p>
	<p>●&nbsp;早教圈的活久见，在儿童教育领域折腾和创新了27年；</p>
	<p>●&nbsp;原全国最大的儿童教育机构红黄蓝高级副总裁；</p>
	<p>●&nbsp;央视、腾讯教育专家及各母婴杂志嘉宾、顾问、专栏作家；</p>
	<p>●&nbsp;学期教育领域研发产品最多的产品大牛：</p>
	<p>&nbsp;&nbsp;&nbsp;&nbsp;✔&nbsp;早教课程体系服务1500+机构，100万0-6岁宝宝；</p>
	<p>&nbsp;&nbsp;&nbsp;&nbsp;✔&nbsp;竹兜早教套装是巧虎在中国区最大的竞争对手；</p>
	<p>&nbsp;&nbsp;&nbsp;&nbsp;✔&nbsp;大嘴呱呱说唱语言课程服务10000+幼儿园，让300万+幼儿园宝宝用语言闯世界；</p>
	<p>&nbsp;&nbsp;&nbsp;&nbsp;✔&nbsp;在全国做过讲座500+场，著有图书、文章若干。</p>
	<p>●&nbsp;创办喵姐早教说，在移动互联网时代用专业帮助全国2000万中产0-6岁新手妈妈“搞定熊孩子，继续做女神”。</p>
</div>
<c:if test="${not empty title1}">
	<div class="section" style="line-height: 0.6rem;font-size: 0.34rem;color: #333333;">
		<p style="font-size: 0.45rem;font-weight: bold;margin-bottom: 0.32rem;">${title1}</p>	
		<p>${content1}</p>
	</div>
</c:if>
<c:if test="${not empty title2}">
	<div class="section" style="line-height: 0.6rem;font-size: 0.34rem;color: #333333;">
		<p style="font-size: 0.45rem;font-weight: bold;margin-bottom: 0.32rem;">${title2}</p>	
		<p>${content2}</p>
	</div>
</c:if>
<c:if test="${not empty title3}">
	<div class="section" style="line-height: 0.6rem;font-size: 0.34rem;color: #333333;">
		<p style="font-size: 0.45rem;font-weight: bold;margin-bottom: 0.32rem;">${title3}</p>	
		<p>${content3}</p>
	</div>
</c:if>
<c:if test="${not empty title4}">
	<div class="section" style="line-height: 0.6rem;font-size: 0.34rem;color: #333333;">
		<p style="font-size: 0.45rem;font-weight: bold;margin-bottom: 0.32rem;">${title4}</p>	
		<p>${content4}</p>
	</div>
</c:if>
<c:if test="${not empty title5}">
	<div class="section" style="line-height: 0.6rem;font-size: 0.34rem;color: #333333;">
		<p style="font-size: 0.45rem;font-weight: bold;margin-bottom: 0.32rem;">${title5}</p>	
		<p>${content5}</p>
	</div>
</c:if>
</body>
</html>