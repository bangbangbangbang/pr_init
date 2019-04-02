<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='j' uri='/jsputil'%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <!--忽略页面中的邮箱格式为邮箱-->
    <meta name="format-detection" content="email=no">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
    <meta name="format-detection" content="telephone=no,address=no,email=no">
    <meta name="keywords" content="喵姐,喵姐早教说,0到6岁早期教育,家庭教育,家长教育,父母课堂,育儿知识,儿童教育,母婴育儿,">
    <meta name="description" content="喵姐早教说是喵姐高寿岩创办的为家庭教育提供专业靠谱的0到6岁早期教育、育儿知识的平台。">
    <title>喵姐早教说</title>
     <%@include file="../../../header_v2.4.0.jsp" %>
    <%@include file="../../../header_wxjsapi.jsp"%>
    <link rel="stylesheet" href="<b:staticUrl>/res/css/prekindergarten/slide.css</b:staticUrl>">
    <link rel="stylesheet" href="<b:staticUrl>/res/css/prekindergarten/swiper-3.4.2.min.css</b:staticUrl>">
    <script type="text/javascript" src="<b:staticUrl>/res/js/prekindergarten/swiper-3.4.2.min.js</b:staticUrl>"></script>
    <link rel="stylesheet" href="<b:staticUrl>/res/css/prekindergarten/layer.css</b:staticUrl>">
    <style>
        body {
                background-color: #F4F4F4;
        }

    </style>
    <script>
	var wxfenxiangcb={
			title: '${wxshare.title}', // 分享标题
			desc : '${wxshare.desc}',
		    link: '${wxshare.link}', // 分享链接
		    imgUrl: '${wxshare.imgUrl}', // 分享图标
		    shareTimeline:function(bool){
		    	HH.ajax({
					data:{
						biztype:'SHARETASK',
						week:$("#week").val(),
						weekDay:$("#weekDay").val(),
						activityId:'${activityId}',
    		        	dayTime:'${dayTime}'
					},
					url:"/yzmm/account/activity/kja/fund/shareTaskCard",
					async:false,
				    callback:function(data){
				    	if(data.success){
				    		toast(data.msg);
			   			}
			    		var  share = $('div.share5');
					    $(share).hide();
				    }
				});
		    },
		    shareAppMessage:function(bool){
		    	HH.ajax({
					data:{
						biztype:'SHARETASK',
						week:$("#week").val(),
						weekDay:$("#weekDay").val(),
						activityId:'${activityId}',
    		        	dayTime:'${dayTime}'
					},
					url:"/yzmm/account/activity/kja/fund/shareTaskCard",
					async:false,
				    callback:function(data){
				    	if(data.success){
				    		toast(data.msg);
			   			}
			    		var  share = $('div.share5');
					    $(share).hide();
				    }
				});
		    }
	};
	initwxfx(wxfenxiangcb);
	</script>
</head>
<body>
	<c:if test="${!hasGide}">
		<div class="coverLayer">
	        <p class="layerText">左右滑动浏览任务列表</p>
	        <img src="<b:staticUrl>/res/img/prekindergarten/u4886.png</b:staticUrl>" alt="" class="layerImg">
	        <div class="layerBtn iknowguide">
	            <a href="#">知道了</a>
	        </div>
    	</div>
	</c:if>
	  <c:if test="${preview!='true'}">
	    <div class="menuDiv">
        <div class="shareBox">
            <div class="shareHeader">
            	<c:forEach items="${taskList}" var="task" varStatus="status" begin="0" end="0">
                	<h3>${babynickname} ${desc}<br/><span>&nbsp;第${task.week}阶段</span></h3>
                	<input id="week" type="hidden" value="${task.week}">
                	<input id="weekDay"  type="hidden" value="${task.weekDay}">
                </c:forEach>
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
    <script type="text/javascript">
    	$(function(){
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
    		 				 if($('.menuDiv').height() <= $(window).height()) {
    		 		               $('.menuDiv').css('height','100%');
    		 		           }
    			   		}
    		         }
    			});
    	});
    </script>
    </c:if>
    <div class="wrap">
        <div class="public">
            <!--头部的时间开始-->
             <c:forEach items="${taskList}" var="task" varStatus="status" begin="0" end="0">
	            <div class="slideHeader clearfix">
					<p class="headerLfet fr">第${task.week}阶段&nbsp;·&nbsp;<e>第${task.weekDay}天</e></p>
					  <c:if test="${preview!='true'}">
				      	<p class="navLeft fl">任务列表</p>
				      </c:if>
					<%-- <p class="headerRight fr"><span class="nowNum">1</span>&nbsp;/&nbsp;${taskcount}</e></p> --%>
	            </div>
            </c:forEach>
            <!--头部的时间结束-->
            <!--任务卡  正常状态 -->
            <div class="swiper-container">
                <div class="swiper-wrapper"> 
                    <!--第一天-->
                    <c:forEach items="${taskList}" var="task" varStatus="status">
	                    <c:choose>
	                    	<c:when test="${preview!='true'}">
	                    		   <div class="swiper-slide slide" data-index="${status.index+1}" onclick="HH.href('/yzmm/account/activity/kja/task/taskdetail?scheduleId=${task.scheduleId}');">
	                    	</c:when>
	                    	<c:otherwise>
	                    			 <div class="swiper-slide slide" data-index="${status.index+1}" >
	                    	</c:otherwise>
	                    </c:choose>
                        <ul class="slideContent">
                            <li class="ContentList">
                                <img src="${empty task.img?'<b:staticUrl>/res/img/prekindergarten/taskdefult.jpg</b:staticUrl>':task.img}" alt="" class="contentImg">
                                <div class="contentTask">
                                		<h2><span>No.${status.index+1}</span> ${task.description}</h2>
	                                	<p class="contentTaskDetail">
	                                		<j:codeToLabel value='${empty task.guide?"":task.guide}'></j:codeToLabel>
	                                		<j:codeToLabel value='${empty task.guideOne?"":task.guideOne}'></j:codeToLabel>
	                                		<j:codeToLabel value='${empty task.guideTwo?"":task.guideTwo}'></j:codeToLabel>
	                                		<j:codeToLabel value='${empty task.guideThree?"":task.guideThree}'></j:codeToLabel>
	                                		<j:codeToLabel value='${empty task.guideFour?"":task.guideFour}'></j:codeToLabel>
	                                		<j:codeToLabel value='${empty task.guideFive?"":task.guideFive}'></j:codeToLabel>
	                                	</p>
                                    <div class="bacImg"></div>
                                </div>
                                <c:if test="${preview!='true'}">
				            		 <div class="contentBot">
                                    • 查看任务详情  &nbsp;&nbsp;&nbsp;>
                               		</div>
				            	</c:if>
                            </li>
                        </ul>
                         </div>
                    </c:forEach>
                    <c:if test="${not empty tclist}">
                    	  <!--任务点评卡-->
	                   <div class="swiper-slide slide">
                        <ul class="slideContent slideContentTask">
                            <li class="ContentList">
                                <div class="contentDiv clearfix teachcomment">
                                    <div class="leftImg fl">
                                        <img src="<b:staticUrl>/res/img/prekindergarten/u4864.png</b:staticUrl>" alt="" class="img1">
                                        <img src="<b:staticUrl>/res/img/prekindergarten/u4858.png</b:staticUrl>" alt="" class="img2">
                                        <img src="<b:staticUrl>/res/img/prekindergarten/u4858.png</b:staticUrl>" alt="" class="img3">
                                    </div>
                                    <div class="listText fl">
                                        <p class="txt1">恭喜${babynickname}</p>
                                        <p class="txt2">完成今日训练任务</p>
                                    </div>
                                    <div class="rightImg fr">
                                        <img src="<b:staticUrl>/res/img/prekindergarten/u4858.png</b:staticUrl>" alt="" class="img1">
                                        <img src="<b:staticUrl>/res/img/prekindergarten/u4858.png</b:staticUrl>" alt="" class="img2">
                                        <img src="<b:staticUrl>/res/img/prekindergarten/u4862.png</b:staticUrl>" alt="" class="img3">
                                    </div>
                                </div>
                                <p class="listClick teachcomment">点击看查看导师点评</p>
                                <a href="javascript:void(0);" class="showBtn">炫耀一下</a>
                            </li>
                        </ul>
                    </div>
                    </c:if>
                </div>
            </div>
            <p class="headerRight"><span class="nowNum">1</span>&nbsp;/&nbsp;${taskcount}</e></p>
            <!--任务卡  正常状态-->
            <c:choose>
            	<c:when test="${preview=='true'}">
            		  <div class="slideBot">
		                <p>预览状态任务未正式开启，如需立马启动任务请点击下方按钮</p>
			                <div class="planJoin">
			                    <a href="#">立即开启</a>
			                </div>
			            </div>
            	</c:when>
            	<c:otherwise>
            		<div class="slideFooter">版权归北京七个小孩教育科技有限公司所有</div>
            	</c:otherwise>
            </c:choose>
        </div>
    </div> 
    <!--任务列表  点击显示隐藏   任务有中断，再次进入时提示-->
    <div class="share4" style="display:none;">
        <div class="shareBox">
            <div class="interrupt">
                <img src="<b:staticUrl>/res/img/prekindergarten/comment/u4689.png</b:staticUrl>" alt="" class="interruptImg">
                <p class="interruptTit">嗨 <span>O(∩_∩)O~~星星 ☆</span></p>
                <p class="interruptTxt">3天没见，最近宝宝乖乖不乖呀，上次留下的问题，小喵还等你来处理呢，既然来了，我们就开始吧~</p>
                <p class="interruptBtn"><span>3</span>秒后自动开始</p>
            </div>
        </div>
    </div>
    <div class="share5" style="display:none;">
        <div class="sharearrow"></div>
           <p>将宝宝今天的练习自测结果分享给大家看看吧</p>
    </div>
    <script>
	    // 朦层上的点击事件
	    $(function() {
	        $('.layerBtn').click(function() {
	            $('.coverLayer').fadeOut();
	        });
	        
	        /***
	    	*判断是否登陆过
	    	*/
	    	HH.ajax({
					data:{
						'activityId':'${activityId}'
					},
					url:"/yzmm/account/activity/kjaShareReceive/loginCheck",
					async:true,
				    callback:function(data){
				   		if(data.success){
				   			
			   			}else{
			   			    var str=data.msg;
				  			var arr=str.split('|');
				  			$('.interruptTit').html(arr[0]+'<span>'+arr[1]+'</span>');
				  			$('.interruptTxt').html(arr[2]);
				  			
			   				//弹框
			   				$('.share4').show();
			   				var mls=5;
			   				var timer = setInterval(function(){
			   				     mls-=1;
			   					$('.interruptBtn span').html(mls);
			   				     if(mls<=0){
			   	  				   		 //删除定时器
			   			   			$('.share4').hide();
			   			   			clearInterval(timer);
			   				     }
			   				},1000);//1000为1秒钟
			   			}
				    }
				});
	    }) 
       var swiper = new Swiper('.swiper-container', {
            slidesPerView: 'auto',
            centeredSlides: true,
            paginationClickable: true,
            spaceBetween: 30,
            normalizeSlideIndex:true,
            onSlideChangeEnd:function(swiper){
                var nowNum = swiper.activeIndex+1;
                $(".nowNum").html(nowNum);
                // swiper.activeIndex 这个就是索引， 从 0 开始！ 可看一共有多少元素！
             },
        });

		$(function(){
			$(".planJoin").on("click",function(){
				HH.href("/yzmm/account/activity/kja/task/receivetasklist?activityId=${activityId}");
			})
			$(".teachcomment").on("click",function(){
				HH.href("/yzmm/account/activity/kjaSelfTest/tcCommentListPage?dayTime=${dayTime}&&activityId=${activityId}");
			})
			var  share = $('div.share5');
		      share.click(function(){
		          $(this).hide();
		      });
			$(".showBtn").on("click",function(){
				$('.share5').show();
			})
			$(".iknowguide").on("click",function(){
			  	$.ajax({
		    		url:'/yzmm/account/activity/kja/task/iknowguide',
		    		 type: "POST",
		             data:{
		            	 activityId:'${activityId}',
		             	},
		             async: true,
		             success: function(data) {
		            	 
		             }
		    	});
			});
		});
		
	       $(function(){
	           /*  if($('.menuDiv').height() <= $(window).height()) {
	                $('.menuDiv').css('height','100%');
	            } */
	            var  share = $('div.menuDiv');
	            var shareBox = $('.shareBox');
	            var topDistance = $(window).scrollTop(); 
	            $(".navLeft").click(function(){
	                  share.show();
	                  shareBox.animate({left: '0'}, 'slow'); 
	                  $('.wrap').css('position','fixed');
	                  $('.wrap').css('top',-topDistance); 
	                  $('.menuDiv').css('position','absolute');
	                  $('.menuDiv').css('top',topDistance);                        
	                 
	            });
	            share.click(function(){   
	                  shareBox.animate({left: '-5rem'}, "slow");  
	                  $(this).css('display', "none");  
	                  $('.wrap').css('position','relative'); 
	                  $('.wrap').css('top',0);
	             });     
		    });
	       function todetail(id){
	    	   if(id){
	    		   HH.href("/yzmm/account/activity/kja/task/taskdetail?scheduleId="+id);
	    	   }
	       }
  </script>  
</body>
</html>