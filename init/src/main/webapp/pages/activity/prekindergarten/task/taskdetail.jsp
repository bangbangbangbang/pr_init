<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='j' uri='/jsputil'%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <!--忽略页面中的邮箱格式为邮箱-->
    <meta name="format-detection" content="email=no">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
    <meta name="format-detection" content="telephone=no,address=no,email=no">
    <meta name="keywords" content="喵姐,喵姐早教说,0到6岁早期教育,家庭教育,家长教育,父母课堂,育儿知识,儿童教育,母婴育儿,">
    <meta name="description" content="喵姐早教说是喵姐高寿岩创办的为家庭教育提供专业靠谱的0到6岁早期教育、育儿知识的平台。">
    <%@include file="../../../header_v2.4.0.jsp" %>
 	<%@include file="../../../header_wxjsapi.jsp"%>
 	<title>喵姐早教说</title>
    <link rel="stylesheet" href='<b:staticUrl>/res/css/prekindergarten/lifetable.css</b:staticUrl>'>
     <link rel="stylesheet" href="<b:staticUrl>/res/css/prekindergarten/swiper-3.4.2.min.css</b:staticUrl>">
    <script type="text/javascript" src="<b:staticUrl>/res/js/prekindergarten/swiper-3.4.2.min.js</b:staticUrl>"></script>
    <script src='<b:staticUrl>/res/js/prekindergarten/selectionTime.js</b:staticUrl>'></script>
    <style>
        .show{
            display:block;
        }
        .hidden{
           display:none; 
        }
         .swiper-container {
            width: 50%;
        }
	
        .current{
            color:#ff9963 !important;
        }
        .swiper-slide-next{color: #ff9963;}
        .wrapPage .markDiv {
		    min-height: 15rem;
		}
		.wrapPage .mark h3 {
		 font-size: 0.48rem;
		 padding: 0.61333333rem 0 0.50666667rem;
		 font-weight: bold;
		 color: #141414;
		}
    </style>
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
    <!--任务列表  点击显示隐藏-->
    <div class="share1">
        <div class="shareBox">
            <div class="shareHeader">
                <h3>${babynickname} ${desc}
                <br><span>&nbsp;· 第${week}阶段</span></h3>
            </div>
            <c:if test="${workRestIsWrite=='true'}">
	            <div class="shareHeader clearfix" onclick="HH.href('/yzmm/account/activity/kja/task/viewMyWorkRestSchedule?activityId=${activityId}');">
	                <p class="navLeft timeTable">作息时间表</p>
	                <p class="navRight"><span>></span></p>
	            </div>
             </c:if>
            <div class="shareHeader clearfix" onclick="HH.href('/yzmm/account/activity/kja/task/weekTargetList?activityId=${activityId}&dayTime=${dayTime}');">
                <p class="navLeft">本周目标</p>
                <p class="navRight"><span>></span></p>
            </div>
            <div class="shareHeader clearfix" onclick="HH.href('/yzmm/account/activity/kja/task/calendar?activityId=${activityId}');">
                <p class="navLeft shareSurface">日程表</p>
                <p class="navRight"><span>></span></p>
            </div>
 				<div class="initDiv" style="display: none;">
            	  <div class="shareHeader clearfix completeDiv">
		                <p class="navImg">Day01</p>
		                <div class="navText">
		                </div>
		            </div>
		            <div class="shareHeader clearfix uncommentDiv">
		                <p class="navLeft navImg">Day02</p>
		                <p class="navRight card">未打卡</p>
		            </div>
		            <div class="shareHeader clearfix navCard goingDiv">
		                <p class="navImg">Day03</p>
		                <div class="navText">
		               
		                </div>
		            </div>
            </div>
            <div class="bb">
            
            </div>
        </div>
    </div>
    <!--时间-->
    <div class="choiceDate" style="display:none;">
        <div class="layer"></div>
        <div class="dateBox">
            <!--顶部的确定和时间-->
            <div class="dateHeader clearfix">
                <div class="headerLeft">
                	<img src="" alt="" data-id='1' class="leftImg">
                  	<span class='title' data-id='0'>起床</span>
                    <span class="startTimeCurrent"><span class="show-time">06</span> ：<span class="show-time">30</span></span>  -  
                    <span class="endTimeCurrent"><span class="show-time">07</span> ：<span class="show-time">00</span></span>
                </div>
                <div class="headerRight" id="headerRight">  下一项&nbsp;&nbsp;></div>
            </div>
            <!--时间-->
            <div class="dateTime">
                <div class="timeText clearfix">
                    <p class="startTime">开始时间</p>
                    <p class="endTime">结束时间</p>
                </div>
                 <!--开始时间前面的小时-->
                <div class="timeNum">
                    <ul class="startNum">
                       <!--小时-->
                        <li class="startHour">
                            <div class="swiper-container"  id="dateHourLeft">
                                <div class="swiper-wrapper">
                                    <div class="swiper-slide">00</div>
                                    <div class="swiper-slide">01</div>
                                    <div class="swiper-slide">02</div>
                                    <div class="swiper-slide">03</div>
                                    <div class="swiper-slide">04</div>
                                    <div class="swiper-slide">05</div>
                                    <div class="swiper-slide">06</div>
                                    <div class="swiper-slide">07</div>
                                    <div class="swiper-slide">08</div>
                                    <div class="swiper-slide">09</div>
                                    <div class="swiper-slide">10</div>
                                    <div class="swiper-slide">11</div>
                                    <div class="swiper-slide">12</div>
                                    <div class="swiper-slide">13</div>
                                    <div class="swiper-slide">14</div>
                                    <div class="swiper-slide">15</div>
                                    <div class="swiper-slide">16</div>
                                    <div class="swiper-slide">17</div>
                                    <div class="swiper-slide">18</div>
                                    <div class="swiper-slide">19</div>
                                    <div class="swiper-slide">20</div>
                                    <div class="swiper-slide">21</div>
                                    <div class="swiper-slide">22</div>
                                    <div class="swiper-slide">23</div> 
                                </div>
                            </div>
                        </li>
                        <!--中间的冒号-->
                        <li class="colon">
                            <span>:</span>
                            <span>:</span>
                            <span>:</span>
                            <span>:</span>
                            <!--<span>:</span>-->
                        </li>
                        <!--分钟-->
                        <li class="startMinute">
                            <div class="swiper-container"  id="dateMinuteLeft">
                                <div class="swiper-wrapper">
                                    <div class="swiper-slide">00</div>
                                    <div class="swiper-slide">05</div>
                                    <div class="swiper-slide">10</div>
                                    <div class="swiper-slide">15</div>
                                    <div class="swiper-slide">20</div>
                                    <div class="swiper-slide">25</div>
                                    <div class="swiper-slide">30</div>
                                    <div class="swiper-slide">35</div>
                                    <div class="swiper-slide">40</div>
                                    <div class="swiper-slide">45</div>
                                    <div class="swiper-slide">50</div>
                                    <div class="swiper-slide">55</div>
                                </div>
                            </div>
                        </li>
                        
                    </ul>
                     <ul class="endNum">
                       <li class="endHour">
                            <div class="swiper-container" id="dateHourRight">
                                <div class="swiper-wrapper">
                                    <div class="swiper-slide">00</div>
                                    <div class="swiper-slide">01</div>
                                    <div class="swiper-slide">02</div>
                                    <div class="swiper-slide">03</div>
                                    <div class="swiper-slide">04</div>
                                    <div class="swiper-slide">05</div>
                                    <div class="swiper-slide">06</div>
                                    <div class="swiper-slide">07</div>
                                    <div class="swiper-slide">08</div>
                                    <div class="swiper-slide">09</div>
                                    <div class="swiper-slide">10</div>
                                    <div class="swiper-slide">11</div>
                                    <div class="swiper-slide">12</div>
                                    <div class="swiper-slide">13</div>
                                    <div class="swiper-slide">14</div>
                                    <div class="swiper-slide">15</div>
                                    <div class="swiper-slide">16</div>
                                    <div class="swiper-slide">17</div>
                                    <div class="swiper-slide">18</div>
                                    <div class="swiper-slide">19</div>
                                    <div class="swiper-slide">20</div>
                                    <div class="swiper-slide">21</div>
                                    <div class="swiper-slide">22</div>
                                    <div class="swiper-slide">23</div>  
                                </div>
                            </div>
                        </li>
                        <li class="colon">
                            <span>:</span>
                            <span>:</span>
                            <span>:</span>
                            <span>:</span>
                            <!--<span>:</span>-->
                        <li class="endMinute">
                            <div class="swiper-container"  id="dateMinuteRight">
                                <div class="swiper-wrapper">
                                    <div class="swiper-slide">00</div>
                                    <div class="swiper-slide">05</div>
                                    <div class="swiper-slide">10</div>
                                    <div class="swiper-slide">15</div>
                                    <div class="swiper-slide">20</div>
                                    <div class="swiper-slide">25</div>
                                    <div class="swiper-slide">30</div>
                                    <div class="swiper-slide">35</div>
                                    <div class="swiper-slide">40</div>
                                    <div class="swiper-slide">45</div>
                                    <div class="swiper-slide">50</div>
                                    <div class="swiper-slide">55</div>     
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
      <c:forEach items="${taskList}" var="task" varStatus="status">
    <div class="wrapPage page2 ${taskId==task.id?'show':'hidden'}" id="${task.id}"> 
        <div class="headerImg">
            <!--顶部的导航条-->
            <div class="lifeNav hidden" >
                <p class="navLeft navList">任务列表</p>
                <p class="navRight">${status.index+1} / ${taskList.size()}</p>
            </div>
            <!--顶部的图片-->
            <img src="${empty task.img?'<b:staticUrl>/res/img/prekindergarten/taskdefult.jpg</b:staticUrl></b:staticUrl>':task.img}" alt="">
        </div>
        <div class="markDiv">
        <!--NO.1制作生活常规表-->
        	<div class="mark">
	            <h3>No.${status.index+1} ${task.description}</h3>
	           	<c:if test="${ not empty task.guidetitle}">
	           		<div class="line"></div>
	            	<h4 class="target">${task.guidetitle}</h4>
	           	</c:if> 
	           	<p class="targetCon"><j:codeToLabel value='${empty task.guide?"":task.guide}'></j:codeToLabel></p>
           	</div>
           	<c:if test="${ not empty task.guideOnetitle}">
	           	<div class="markTitle">
		        	<h3>${task.guideOnetitle}</h3>
		        </div>
		    </c:if>
        	<div class="mark">
            	<p class="targetCon"><j:codeToLabel value='${empty task.guideOne?"":task.guideOne}'></j:codeToLabel></p>
  			</div>
  			
  			<c:if test="${ not empty task.guideTwotitle}">
	           	<div class="markTitle">
		        	<h3>${task.guideTwotitle}</h3>
		        </div>
		    </c:if>
        	<div class="mark">
            	<p class="targetCon"><j:codeToLabel value='${empty task.guideTwo?"":task.guideTwo}'></j:codeToLabel></p>
  			</div>
  			
  			<c:if test="${not empty task.guideThreetitle}">
	           	<div class="markTitle">
		        	<h3>${task.guideThreetitle}</h3>
		        </div>
		    </c:if>
        	<div class="mark">
            	<p class="targetCon"><j:codeToLabel value='${empty task.guideThree?"":task.guideThree}'></j:codeToLabel></p>
  			</div>
  			
  			<c:if test="${not empty task.guideFourtitle}">
	           	<div class="markTitle">
		        	<h3>${task.guideFourtitle}</h3>
		        </div>
		    </c:if>
        	<div class="mark">
            	<p class="targetCon"><j:codeToLabel value='${empty task.guideFour?"":task.guideFour}'></j:codeToLabel></p>
  			</div>
  			
  			<c:if test="${ not empty task.guideFivetitle}">
	           	<div class="markTitle">
		        	<h3>${task.guideFivetitle}</h3>
		        </div>
		    </c:if>
        	<div class="mark">
            	<p class="targetCon"><j:codeToLabel value='${empty task.guideFive?"":task.guideFive}'></j:codeToLabel></p>
  			</div>
        <!--作息表-->
        <c:if test="${task.special=='WORKREST'}">
    	       <c:choose>
        	<c:when test="${task.workRestIsWrite}">
        	 	<!-- 初始化用戶任务信息 -->
		        <script type="text/javascript">
		        	$(function(){
	        		   $(".editBtn").show();
	        		   $(".saveDiv").hide();
	        		   $(".editParent").removeClass("edit");
	        		   $(".timeD p").addClass("current");
		        	})
		        </script>
        	</c:when>
        	<c:otherwise>
        		<!-- 初始化时间任务 -->
		        <script type="text/javascript">
		        
		        </script>
        	</c:otherwise>
        </c:choose>
        <div class="surface editParent edit">
	        <div class="surfaceDiv clearfix">
				<h4 class="surTitle fl">定制 <span>${babynickname}</span> 的作息时间表</h4>
				<p class="workSurfaceRight editBtn" style="display: none;" onclick="edit();">编辑</p >
			</div>
            <!--起床-->
            <c:forEach items="${task.workRestConfigRespArray}" var="workrestconfig" varStatus="s">
             <c:if test="${!s.last}">
	              <div class="surTime clearfix workrestinfo" data-id='${s.index}'>  
		                <div class="pos"></div>      
		                <img src="${workrestconfig.iconImg}" alt="">
		                <div class="timeArrange">
		                    <p class="timeP ">${workrestconfig.name}</p>
		                    <div class="timeD clearfix ">
		                    	<input class="wrid" value="${workrestconfig.id}" type="hidden"/>
		                        <p  class="fl timeLeft startTimeString">${workrestconfig.startTimeString}</p>
		                        <img src="<b:staticUrl>/res/img/prekindergarten/lifetable/u2025.png</b:staticUrl>" alt="" class="timeImg">
		                        <p  class="fr timeRight endTimeString">${workrestconfig.endTimeString}</p>
		                    </div>
		                </div>
		            </div>
		           </c:if>
	          	<c:if test="${s.last}">
		            <div class="clearfix surTime timeNit workrestinfo" data-id='${s.index}'>
		                <img src="${workrestconfig.iconImg}" alt="">
		                <div class="timeArrange">
		                    <p class="arran" class="timeP">${workrestconfig.name}</p>
		                    <div class="timeD arranDiv">
		                    	<input class="wrid" value="${workrestconfig.id}" type="hidden"/>
		                        <p  class="fl timeLeft arranImg startTimeString">${workrestconfig.startTimeString}</p>
		                    </div>
		                </div>
		            </div>
	          	</c:if>
          </c:forEach>
            <div class="line"></div>
        </div>
        <!--下面的按钮-->
        <div class="liftBot saveDiv">
            <p>宝宝作息时间表可在日程表里随时查看，接下来就让咱们和宝宝一起开始自律的生活吧</p>
            <div class="planJoin" onclick="save();">
                <a href="javascript:void(0);">提 交</a>
            </div>
        </div>
        <div class="homeLine">             
        </div>
        </c:if>
        </div>
           <c:choose>
      		<c:when test="${status.index==0 &&status.index+1==taskList.size()}">
      			 <div class="lifeBottom lifeBottomLast clearfix">
		            <p class="navLeft" onclick="HH.href('/yzmm/account/activity/kja/task/receivetasklist?activityId=${activityId}&dayTime=${dayTime}');">返回</p>
		           <c:if test="${kedaka=='true'}">
		           		<c:if test="${isself=='true'}">
		           			<p class="navRight" onclick="HH.href('/yzmm/account/activity/kjaSelfTest/list?activityId=${activityId}&dayTime=${dayTime}');">查看点评</p>
		           		</c:if>
		           		<c:if test="${isself=='false'}">
		           			<p class="navRight" onclick="HH.href('/yzmm/account/activity/kjaSelfTest/list?activityId=${activityId}&dayTime=${dayTime}');">完成任务，再来测试</p>
		           		</c:if>
		           </c:if>
	        	</div>
      		</c:when>
       		 <c:when test="${status.index==0}">
        	  <div class="lifeBottom clearfix">
	            <p class="navLeft" onclick="HH.href('/yzmm/account/activity/kja/task/receivetasklist?activityId=${activityId}&dayTime=${dayTime}');">返回</p>
	            <p class="navRight nextOne">下一任务</p>
	        	</div>
	        </c:when>
	         <c:when test="${status.index+1==taskList.size()}">
	        	  <div class="lifeBottomLast lifeBottom clearfix">
		            <p class="navLeft prevOne">上一任务</p>
            		 <c:if test="${kedaka=='true'}">
		            	<c:if test="${isself=='true'}">
		           			<p class="navRight" onclick="HH.href('/yzmm/account/activity/kjaSelfTest/list?activityId=${activityId}&dayTime=${dayTime}');">查看点评</p>
		           		</c:if>
		           		<c:if test="${isself=='false'}">
		           			<p class="navRight" onclick="HH.href('/yzmm/account/activity/kjaSelfTest/list?activityId=${activityId}&dayTime=${dayTime}');">完成任务，再来测试</p>
		           		</c:if>
		           </c:if>
		        </div>
	        </c:when>
	         <c:otherwise>
	        	  <div class="lifeBottom clearfix">
		              <p class="navLeft prevOne">上一任务</p>
			          <p class="navRight nextOne">下一任务</p>
		        </div>
	        </c:otherwise>
       </c:choose>
    </div>  
    </c:forEach>

    <script type="text/javascript">
	   $(function(){
           if($('.show').height() >= $(window).height()) {
                $('.lifeBottom').css('position','absolute');
            }else {
                 $('.lifeBottom').css('position','fixed');
                 $('.lifeBottom').css('bottom','0');
            }
         /*   if($('.share1').height() <= $(window).height()) {
               $('.share1').css('height','100%');
           } */
            // 下拉页面  显示隐藏任务列表的导航栏
            var share = $('div.share1');
            var shareBox = $('.shareBox');
            var widthP = $(window).width();
            var temp = 0;
            $(window).scroll(function(){
                var topDistance = $(window).scrollTop(); 
                if($(window).scrollTop() > temp && $(window).scrollTop()!=0){
                            $("div.lifeNav").fadeIn();  
                            // 点击任务列表显示隐藏弹层 
                            $(".navList").off();
                            $(".navList").click(function(){
                                share.show()
                                shareBox.animate({left: '0'}, 'slow');  
                                $('.wrapPage').css('position','fixed');
                                $('.wrapPage').css('top',-topDistance); 
                                $('.share1').css('position','absolute');
                                $('.share1').css('top',topDistance);                        
                            $(window).scroll(function(){
                                if($(window).scrollTop()>=topDistance){
                                    $('.share1').css('top',topDistance);
                                }else{
                                    $('.share1').css('top',0);     
                                }
                            })
                        });  
                        share.off();
                        share.click(function(){   
                        	shareBox.animate({left: '-5rem'}, "slow");  
                            $(this).css('display', "none");  
                            $('.wrapPage').css('position','relative'); 
                            $('.wrapPage').css('top',0);
                        });  
                        }else{
                            $("div.lifeNav").fadeOut();
                               
                    }  
                    temp =  topDistance;
                    //console.log(temp);
            })     
	    });

        function changeImg(a){
            var obj=$(a);
            if(obj.hasClass("selfTxtCurrent")){
                $(obj).removeClass("selfTxtCurrent");
            }else{
                $(obj).addClass("selfTxtCurrent");
            }
            obj.siblings("div.selfTxt").each(function(){
                if($(this).removeClass("selfTxtCurrent")){
                }
            })
        
            
        }
    </script>
	    <script type="text/javascript">
    $(function(){
    	
    	$(".nextOne").click(function(){
    		var self=$(this);
			var index=self.parent().parent('.wrapPage');
			var next = index.next(".wrapPage");
			index.removeClass("show").addClass("hidden");
			$(window).scrollTop(0);
			next.removeClass("hidden").addClass("show");
    	});
    	$(".prevOne").click(function(){
    		var self=$(this);
			var index=self.parent().parent('.wrapPage');
			var prev = index.prev(".wrapPage");
			index.removeClass("show").addClass("hidden");
			$(window).scrollTop(0);
			prev.removeClass("hidden").addClass("show");
    	});
    	var completeDiv = $(".completeDiv");
    	var uncommentDiv = $(".uncommentDiv");
    	var goingDiv = $(".goingDiv");
    	HH.ajax({
    		url:'/yzmm/account/activity/kja/task/weektasklist',
    		 type: "POST",
             data:{
            	 activityId:'${activityId}',
            	 dayTime:'${dayTime}'
             	},
             async: true,
             success: function(data) {
            	 if(data.success){
            		 var len = data.list.length;
     				if(len==0){
     					return;
     				}
     				for(var i=0;i<len;i++){
     					var o = data.list[i];
     					if(o.complete=='COMPLETE'){
     						//判断是否存在该daytime
     						if($(".bb .shareHeader").hasClass("daytime"+o.dayTime)){
     							var d = parseInt($(".daytime"+o.dayTime).data("num"))+1;
     							if(d<8){
     								$(".daytime"+o.dayTime).find(".navText").append("<p onclick='todetail("+o.id+");'>No.0"+d+" "+o.name+"</p>");
         							$(".daytime"+o.dayTime).data("num",d);
     							}
     						}else{
     							var c = completeDiv.clone();
     							c.addClass("daytime"+o.dayTime);
     							c.data("num","1")
     							c.find(".navImg").html("Day0"+o.weekDay);
     							c.find(".navText").html("<p onclick='todetail("+o.id+");'>No.01 "+o.name+"</p>");
     							$(".bb").prepend(c);
     						}
     					}else if(o.complete=='NOT'){
     						//判断是否存在该daytime
     						if($(".bb .shareHeader").hasClass("daytime"+o.dayTime)){
     							var d = parseInt($(".daytime"+o.dayTime).data("num"))+1;
     							if(d<8){
	     							$(".daytime"+o.dayTime).find(".navText").append("<p onclick='todetail("+o.id+");'>No.0"+d+" "+o.name+"</p>");
	     							$(".daytime"+o.dayTime).data("num",d);
     							}
     						}else{
     							var c = goingDiv.clone();
     							c.addClass("daytime"+o.dayTime);
     							c.data("num","1")
     							c.find(".navImg").html("Day0"+o.weekDay);
     							c.find(".navText").html("<p onclick='todetail("+o.id+");'>No.01 "+o.name+"</p>");
     							$(".bb").prepend(c);
     						}
     					}else if(o.complete=='NOT_SIGN_IN'){
     						if($(".bb .shareHeader").hasClass("daytime"+o.dayTime)){
     							
     						}else{
     							var c = uncommentDiv.clone();
     							c.addClass("daytime"+o.dayTime);
     							c.find(".navImg").html("Day0"+o.weekDay);
     							$(".bb").prepend(c);
     						}

     					}
     				}
     				 if($('.share1').height() <= $(window).height()) {
     		               $('.share1').css('height','100%');
     		           }
		   		}
             }
    	});
    });
   function todetail(id){
	   if(id){
		   HH.href("/yzmm/account/activity/kja/task/taskdetail?scheduleId="+id);
	   }
   }
   function  save(){

        var list = $(".workrestinfo");
        var workrestList = new Array();
        try{
        	   list.each(function(e){
               	
             	   var wr =$(this);
             	   var map = {};
             	   var id = wr.find(".timeArrange").find(".wrid").val();
             	   var name =  wr.find(".timeArrange").find(".timeP").text();
             	   var starttime = wr.find(".timeArrange").find(".startTimeString");
             	   if(starttime.length > 0){
             		   if(!starttime.hasClass("current")){
             			  throw (name+"时间不能为空");
             			   return;
             		   }
             	   }
             	   var startTimeString = starttime.text();
             	   var endtime =  wr.find(".timeArrange").find(".endTimeString");
             	  if(endtime.length > 0){
            		   if(!endtime.hasClass("current")){
            			   throw (name+"时间不能为空");  
            			   return;
            		   }
            	   }
             	   var endTimeString =endtime.text();
             	   map.id=id;
             	   map.startTimeString = startTimeString;
             	   map.endTimeString = endTimeString;
             	   workrestList.push(map); 
                })
        }catch(e){  
            toast(e);  
            return;  
        } 
     
        var json = JSON.stringify(workrestList);
     	HH.ajax({
             type: "POST",
             url:'/yzmm/account/activity/kja/task/commentWorkRestInfo',
             data:{
             	workrestList:json,
             	activityId:'${activityId}'
             	},// 你的formid
             async: false,
             success: function(data) {
            	 toast("保存成功...");
            	 $(".editBtn").show();
      		   $(".saveDiv").hide();
      		   $(".editParent").removeClass("edit");
             }
         });
     }
   function edit(){
	   $(".editBtn").hide();
	   $(".saveDiv").show();
	   $(".editParent").addClass("edit");
   }
    </script>
</body>
</html>
