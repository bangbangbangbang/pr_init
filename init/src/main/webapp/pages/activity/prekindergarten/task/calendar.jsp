<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--忽略页面中的邮箱格式为邮箱-->
<meta name="format-detection" content="email=no"/>
 <%@include file="../../../header_v2.4.0.jsp" %>
 <%@include file="../../../header_wxjsapi.jsp"%>
    <title>喵姐早教说</title>
 <link rel="stylesheet" href="<b:staticUrl>/res/css/prekindergarten/calendar.css</b:staticUrl>">
<script>
	var wxfenxiangcb={
			title: '${wxshare.title}', // 分享标题
			desc : '${wxshare.desc}',
		    link: '${wxshare.link}', // 分享链接
		    imgUrl: '${wxshare.imgUrl}', // 分享图标
		    shareTimeline:function(bool){
		    },
		    shareAppMessage:function(bool){
		    }
	};
	initwxfx(wxfenxiangcb);
</script>
</head>
<body>
	<c:forEach var="cal" items="${weekcalendar}" varStatus="status">
		<div class="wrapPage cal${cal.key}" style="display: ${cal.key==0?'block;':'none;'}">
	        <h3 class="calendarTitle">${name} - 日程表</h3>
	        <p class="calendarSubtitle">第 ${cal.key+1} 阶段</p>
	        <!--周列表-->
	        <ul class="calendarWeek">
	        	<c:forEach items="${cal.value}" var="day" begin="0" end="5">
	        		<c:if test="${day.calendarStatus=='TODAY'}">
			             <li class="listWeek reciveTask" data-daytime='${day.dayTime}'>
			                <p class="listGrayMon listOrangeMon">${day.dayTimeString}</p> 
			                <p class="listTody">今 日</p>
			                <p class="listDay">第${day.weekDay}天</p>  
			            </li>
			            <script>
			            $(function(){
			            	$(".wrapPage").css("display","none");
			            	$(".cal${cal.key}").css("display","block");
			            });
			            </script>
	        		</c:if>
	        		<c:if test="${day.calendarStatus=='FAIL'}">
	        			<li class="listWeek">
			                <p class="listGrayMon">${day.dayTimeString}</p>   
			                <img src="<b:staticUrl>/res/img/prekindergarten/calendar/u3267.png</b:staticUrl>" alt="" class="listGrayImg ">
			                <p class="listDay">第${day.weekDay}天</p>
			            </li>
	        		</c:if>
	        		<c:if test="${day.calendarStatus=='SUCCESS'}">
	        			<li class="listWeek reciveTask"  data-daytime='${day.dayTime}'>
			                <p class="listGrayMon listOrangeMon">${day.dayTimeString}</p>   
			                	 <img src="<b:staticUrl>/res/img/prekindergarten/calendar/u3259.png</b:staticUrl>" alt="" class="listOrangeImg">
			                <p class="listDay">第${day.weekDay}天</p>
			            </li>
	        		</c:if>
	        		<c:if test="${day.calendarStatus=='NOTSTARTED'}">
	        			<li class="listWeek unstart">
			                <p class="listGrayMon">${day.dayTimeString}</p>   
			                	<img src="<b:staticUrl>/res/img/prekindergarten/calendar/u3263.png</b:staticUrl>" alt="" class="listNotbeginImg">
			                <p class="listDay listDayPad">第${day.weekDay}天</p>
			            </li>
	        		</c:if>
	        	</c:forEach>
	        </ul>
	        <!--成绩单-->
	        <c:forEach items="${cal.value}" var="day" begin="6" end="6">
	        <ul class="calendar clearfix">
	        	 <div class="calendarLeft">
		        	<c:if test="${!status.first}">
		                	<img  class="prev" src="<b:staticUrl>/res/img/prekindergarten/calendar/u3287.png</b:staticUrl>" alt="">
		        	</c:if>
	        	</div>
	        	<c:if test="${day.calendarStatus=='NOTSTARTED'}">
	        		<li class="calendarReport unstart">
	        	</c:if>
	            <c:if test="${day.calendarStatus!='NOTSTARTED'}">
	        		<li class="calendarReport showWeekReport" data-daytime='${day.dayTime}'>
	        	</c:if>
	                <p class="listRedMon">${day.dayTimeString}</p> 
	                <p class="listDay">第${day.weekDay}天</p>  
	                <p class="listReport">成绩单</p>
	            </li>
	            <div class="calendarRight">
		            <c:if test="${!status.last}">
		                <img class="next" src="<b:staticUrl>/res/img/prekindergarten/calendar/u3287.png</b:staticUrl>" alt="">
		        	</c:if>
	        	</div>
	        </ul>
	        </c:forEach>
	        <p class="calendarBtn">点击可查看对应日期的任务详情，左右箭头可切换训练周期</p>
	    </div>
	</c:forEach>
	<script type="text/javascript">
	$(function(){
		$(".next").on("click",function(){
			var self=$(this);
			var index=self.parent().parent().parent('.wrapPage');
			var next = index.next(".wrapPage");
			index.hide();
			next.show();
		});
		$(".prev").on("click",function(){
			var me = $(this).parent().parent().parent(".wrapPage");
			me.hide();
			me.prev(".wrapPage").show();
		})
		$(".unstart").on("click",function(){
			toast("还未开始哟");
		})
		$(".reciveTask").on("click",function(){
			var daytime = $(this).data('daytime');
			if(daytime){
				HH.href('/yzmm/account/activity/kja/task/receivetasklist?activityId=${activityId}&dayTime='+daytime);
			}
		})
		$(".showWeekReport").on("click",function(){
			var daytime = $(this).data('daytime');
			if(daytime){
				HH.href('/yzmm/account/activity/kja/showWeekReport?activityId=${activityId}&uid=${uid}&dayTime=' + daytime);
			}
		})
	})
	</script>
</body>
</html>