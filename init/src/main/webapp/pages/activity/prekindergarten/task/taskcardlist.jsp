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
		    },
		    shareAppMessage:function(bool){
		    }
	};
	initwxfx(wxfenxiangcb);
	</script>
</head>
<body>
    <div class="wrap">
        <div class="public">
            <!--任务卡  正常状态 -->
            <div class="slideHeader clearfix">
                <p class="headerLfet fr" style="display: none">第2阶段&nbsp;·&nbsp;<e>Day 03</e></p>
                    <!--顶部的导航条-->
                <p class="navLeft fl" style="display:none">任务列表</p>
            </div>
            <div class="swiper-container">
                <div class="swiper-wrapper"> 
                <!--单日任务分享后首页-->
                    <div class="swiper-slide slide">
                    	<c:choose>
                    		<c:when test="${type=='KINDERGARTEN'}">
                    			 <ul class="slideContent">
		                            <li class="ContentList aloneHome">
		                                <div class="homeTop clearfix">
		                                    <img src="${albumUrl }" alt="">
		                                    <div class="topText">
		                                        <p class="textName">${nickname }</p>
		                                        <p class="textBaby">宝宝：<span>${babyNickname }</span></p>
		                                        <p class="textBaby1">入园准备训练：第${week }阶段·第${weekDay }天</p>
		                                    </div>
		                                </div>
		                                <div class="homeBottom" style="height: 5.5rem;background-color: #f2f2f2;padding: 0.66666667rem 0.4rem 0;">
		                                    <p>初入幼儿园是宝宝将要踏上的新征程，拥有入园必备的四大关键能力才能开开心心迈出人生重要一步。今天我们已完成了<span>${completeTaskCount }</span>项任务练习，自律使我们快乐！右滑可查看训练项目详情，你要不要一起 ？
		                                    </p>
		                                </div>
		                            </li>
		                        </ul>
                    		</c:when>
                    		<c:when test="${type=='SLEEP'}">
                    			 <ul class="slideContent">
		                            <li class="ContentList aloneHome">
		                                <div class="homeTop clearfix">
		                                    <img src="${albumUrl }" alt="">
		                                    <div class="topText">
		                                        <p class="textName">${nickname }</p>
		                                        <p class="textBaby">宝宝：<span>${babyNickname }</span></p>
		                                        <p class="textBaby1">好好睡觉：第${week }阶段·第${weekDay }天</p>
		                                    </div>
		                                </div>
		                                <div class="homeBottom" style="height: 5.5rem;background-color: #f2f2f2;padding: 0.66666667rem 0.4rem 0;">
		                                    <p>孩子的睡眠虽然总是出现迷之混乱，但是并非无解。只要你方法正确，坚持到底，很多问题都能够得到巨大改善。我和宝宝一起完成了今天的训练任务，我们的目标是：好好睡觉，健康成长！</p>
		                                </div>
		                            </li>
		                        </ul>
                    		</c:when>
                    		<c:when test="${type=='RULE'}">
                    			 <ul class="slideContent">
		                            <li class="ContentList aloneHome">
		                                <div class="homeTop clearfix">
		                                    <img src="${albumUrl }" alt="">
		                                    <div class="topText">
		                                        <p class="textName">${nickname }</p>
		                                        <p class="textBaby">宝宝：<span>${babyNickname }</span></p>
		                                        <p class="textBaby1">守规矩：第${week }阶段·第${weekDay }天</p>
		                                    </div>
		                                </div>
		                                <div class="homeBottom" style="height: 5.5rem;background-color: #f2f2f2;padding: 0.66666667rem 0.4rem 0;">
		                                    <p>守规矩是基本教养，只有做有原则的父母，孩子才能优秀，14天帮助父母养出守规矩的好孩子！我和宝宝一起完成了今天的训练任务，我们的目标是：帮宝宝把守规矩变成一种自觉。</p>
		                                </div>
		                            </li>
		                        </ul>
                    		</c:when>
                    	</c:choose>
                    </div>
                    <!--第一天-->
                    <c:forEach items="${taskList}" var="task" varStatus="status">
	                    <c:choose>
	                    	<c:when test="${preview!='true'}">
	                    		   <div class="swiper-slide slide" data-index="${status.index+1}" onclick="HH.href('/yzmm/account/activity/kja/task/shareTaskDetail?scheduleId=${task.scheduleId}');">
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
                    <!--单日任务分享后尾页-->
                    <div class="swiper-slide slide">
                    	<c:choose>
                    		<c:when test="${type=='KINDERGARTEN'}">
                    			<ul class="slideContent" onclick="javascript:">
		                            <li class="ContentList aloneShadowe">
		                                <h3 class="shadoweTitle detail">试读完毕</h3>
		                                <p class="shadoweText detail">  
								                                    家庭版入园准备训练<br>
								                                    国内第一套智能化入园准备
		                                </p>
		                                <ul class="detail">
		                                    <li>• 社会交往</li>
		                                    <li>• 语言表达</li>
		                                    <li>• 生活自理</li>
		                                    <li>• 家庭准备</li>
		                                </ul>
		                                <p class="shadoweBtnP detail">
		                                    	点击了解详情可免费测试宝宝入园适应能力现在报名还有减免优惠哦
		                                </p>
		                                <a href='javascript:HH.href("/yzmm/account/activity/prekindergarten/testordetail?id=${activityId}");' class="shadoweBtn">了解详情</a>
		                            </li>
		                        </ul>
                    		</c:when>
                    		<c:when test="${type=='SLEEP'}">
                    			 <ul class="slideContent" onclick="javascript:">
		                            <li class="ContentList aloneShadowe">
		                                <h3 class="shadoweTitle detail">试读完毕</h3>
		                                <p class="shadoweText detail">  
								              14天睡眠引导训练<br>养成安睡好习惯，妈妈告别黑眼圈！
		                                </p>
		                                
		                                <ul class="detail">
		                                    <li>• 找出宝宝无法安睡原因</li>
		                                    <li>• 定制宝宝睡眠时间表</li>
		                                    <li>• 养成安睡好习惯</li>
		                                    <li>• 帮助妈妈摆脱“哄睡”困扰</li>
		                                 </ul>
		                                <p class="shadoweBtnP detail">
		                                    	点击了解详情可免费测试宝宝规律睡眠能力，现在报名还有减免优惠哦
		                                </p>
		                                <a href='javascript:HH.href("/yzmm/account/activity/prekindergarten/testordetail?id=${activityId}");' class="shadoweBtn">了解详情</a>
		                            </li>
		                        </ul>
                    		</c:when>
                    		<c:when test="${type=='RULE'}">
                    			 <ul class="slideContent" onclick="javascript:">
		                            <li class="ContentList aloneShadowe">
		                                <h3 class="shadoweTitle detail">试读完毕</h3>
		                                <p class="shadoweText detail">  
								              	14天规矩训练，帮宝宝把守规矩变成一种自觉。
		                                </p>
		                                
		                                <ul class="detail">
		                                    <li>• 确立各项家规</li>
		                                    <li>• 树立规则意识</li>
		                                    <li>• 学会遵守规则</li>
		                                    <li>• 与世界更好的相处</li>
		                                </ul>
		                                <p class="shadoweBtnP detail">
		                                    	 每天陪宝宝完成一个小任务，共同成长一大步。
		                                </p>
		                                <a href='javascript:HH.href("/yzmm/account/activity/prekindergarten/testordetail?id=${activityId}");' class="shadoweBtn">了解详情</a>
		                            </li>
		                        </ul>
                    		</c:when>
                    	</c:choose>
                    </div>
                </div>
            </div>
            <p class="headerRight"><span class="nowNum">1</span>&nbsp;/&nbsp;${taskcount+2}</e></p>
            <!--任务卡  正常状态-->
            <div class="slideFooter">版权归北京七个小孩教育科技有限公司所有</div>
        </div>
    <script>
	    // 朦层上的点击事件
	    $(function() {
	        $('.layerBtn').click(function() {
	            $('.coverLayer').fadeOut();
	        });
	        $('.detail').on('click',function(){
	        	HH.href('/yzmm/account/activity/kja/task/shadoweDetails?activityId=${activityId}');
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
  </script>  
</body>
</html>