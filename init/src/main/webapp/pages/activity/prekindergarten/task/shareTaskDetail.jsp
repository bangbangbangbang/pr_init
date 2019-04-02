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
        .wrapPage .mark {
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
    <!--时间-->
      <c:forEach items="${taskList}" var="task" varStatus="status">
    <div class="wrapPage ${taskId==task.id?'show':'hidden'}" id="${task.id}"> 
        <!--NO.1制作生活常规表-->
        <div class="mark">
            <h3>No.${status.index+1} ${task.description}</h3>
           	<p>
           		<j:codeToLabel value='${empty task.guide?"":task.guide}'></j:codeToLabel>
           		<j:codeToLabel value='${empty task.guideOne?"":task.guideOne}'></j:codeToLabel>
           		<j:codeToLabel value='${empty task.guideTwo?"":task.guideTwo}'></j:codeToLabel>
           		<j:codeToLabel value='${empty task.guideThree?"":task.guideThree}'></j:codeToLabel>
           		<j:codeToLabel value='${empty task.guideFour?"":task.guideFour}'></j:codeToLabel>
           		<j:codeToLabel value='${empty task.guideFive?"":task.guideFive}'></j:codeToLabel>
           	</p>
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
        </div>
        <div class="homeLine">             
        </div>
        </c:if>
           <c:choose>
      		<c:when test="${status.index==0 &&status.index+1==taskList.size()}">
      			 <div class="lifeBottom lifeBottomLast clearfix">
		            <p class="navLeft" onclick="HH.href('/yzmm/account/activity/kja/task/taskCardShare?uid=${uid }&activityId=${activityId}&dayTime=${dayTime}');">返回</p>
	        	</div>
      		</c:when>
       		 <c:when test="${status.index==0}">
        	  <div class="lifeBottom clearfix">
	            <p class="navLeft" onclick="HH.href('/yzmm/account/activity/kja/task/taskCardShare?uid=${uid }&activityId=${activityId}&dayTime=${dayTime}');">返回</p>
	            <p class="navRight nextOne">下一任务</p>
	        	</div>
	        </c:when>
	         <c:when test="${status.index+1==taskList.size()}">
	        	  <div class="lifeBottomLast lifeBottom clearfix">
		            <p class="navLeft prevOne">上一任务</p>
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
