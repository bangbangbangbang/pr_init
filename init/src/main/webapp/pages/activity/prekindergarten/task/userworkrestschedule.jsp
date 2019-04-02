<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='j' uri='/jsputil'%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--忽略页面中的邮箱格式为邮箱-->
<meta name="format-detection" content="email=no"/>
 <%@include file="../../../header_v2.4.0.jsp" %>
 <%@include file="../../../header_wxjsapi.jsp"%>
 	<title>喵姐早教说</title>
 	<link rel="stylesheet" href="<b:staticUrl>/res/css/prekindergarten/layer.css</b:staticUrl>">
    <link rel="stylesheet" href="<b:staticUrl>/res/css/prekindergarten/timeTable.css</b:staticUrl>">
     <link rel="stylesheet" href="<b:staticUrl>/res/css/prekindergarten/swiper-3.4.2.min.css</b:staticUrl>">
    <script type="text/javascript" src="<b:staticUrl>/res/js/prekindergarten/swiper-3.4.2.min.js</b:staticUrl>"></script>
    <script src='<b:staticUrl>/res/js/prekindergarten/selectionTime_new.js</b:staticUrl>'></script>
     <style>
         .swiper-container {
            width: 50%;
        }
        .current{
            color:#ff9963 !important;
        }
        .swiper-slide-next{color: #ff9963;}
        .hidden {
            display:none;
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
    <!--朦层-->
    <div class="layerRemind  hidden">
        <div class="layerBox">
            <p class="layerTit">确定要取消吗？</p>
            <p class="layerText"> 编辑好的内容还没有提交，直接取消会丢失数据哦。建议你先提交，（页面底部有提交按钮）</p>
            <ul class="submBtn clearfix">
                <li class="deterBtn" onclick="window.location.reload();">恩，确定取消</li>
                <li class="cancelBtn"><a href="#submitBtn">不，先去提交</a></li>
            </ul>
        </div>
    </div>
    <!--时间-->
    <div class="choiceDate" style="display:none;">
        <div class="layer"> 
            <p>点击阴影区域关闭时间选择器</p>
        </div>
        <div class="dateBox">
            <!--顶部的确定和时间-->
            <div class="dateHeader clearfix">
                <div class="headerLeft">
                    <img src="" alt="" data-id='1' class="leftImg">
                    <span class='title' data-id='0'>起床</span>
                    <span class="startTimeCurrent"><span class="show-time">06</span> ：<span class="show-time">30</span></span>  -  
                    <span class="endTimeCurrent"><span class="show-time">07</span> ：<span class="show-time">00</span></span>
                </div>
                <div class="headerRight" id="headerRight">确定</div>
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
    <div class="wrapPage"> 
        <!--作息表-->
        <div class="timeTable">
             <!--标题-->
             <div class="tableHeader">
                 <h3 class="headerTit fl"><span>${babynickname}</span> 的作息时间表</h3>
                 <span class="headerEdit fr">编辑</span>
                 <span class="fr headerCancel hidden">取消</span>
             </div>
             <div class="tableDetails loadTable" id="tableDetails">
                 <!--起床-->
              <c:forEach items="${list}" var="workrestconfig" varStatus="s">
	            <c:if test="${!s.last}">
                 <div class="surTime clearfix workrestinfo" data-id='${s.index}'>   
                    <div class="timeHeaderImg clearfix">
                        <img src="${workrestconfig.iconImg}" alt="">
                        <p class="timeP">${workrestconfig.name}</p>
                        <script type="text/javascript">
                        	$(function(){
                        		var tp = $(".timeP");
                        		tp.each(function(){
                        			 var titie = ($(this).text());
	                        			var titleSlice =  titie.split('（')[0];
	                         			$(this).text(titleSlice);
                        		  });
                        	  
                        	})
                        </script>
                    </div>
                    <div class="timeArrange">  
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
               <!--入睡-->
                <div class="clearfix surTime timeNit workrestinfo" data-id='${s.index}'>
                    <div class="timeHeaderImg clearfix">
                        <img src="${workrestconfig.iconImg}" alt="">
                        <p class="arran" class="timeP">${workrestconfig.name}</p>
                    </div>
                    <div class="timeArrange">
                        <div class="timeD arranDiv">
                        	<input class="wrid" value="${workrestconfig.id}" type="hidden"/>
                            <p  class="fl timeLeft arranImg startTimeString">${workrestconfig.startTimeString}</p>
                        </div>
                    </div>
                </div>
                </c:if>
                </c:forEach>
             </div>
              <div style="display:none" class="submitBtn" id="submitBtn" onclick="save();">提 交</div>
           <!--   <div  class="joinBtn" onclick="$('.share5').show()">分 享</div>
             <p class="btnText">加班不在家没办法照顾孩子怎么办，时间表分享孩子其他监护人，邀请大家一起行动</p> -->
        </div>
    </div>
    <div class="share5" style="display:none;">
        <div class="sharearrow"></div>
           <p>点击右上角，分享成功即可获得优惠券哦！</p>
    </div>
    <script type="text/javascript">
    /*朦层*/
    $(function(){
        var  share = $('div.share5');
        $('.freebtn5').click(function(){
            $(share).show();
        });
        share.click(function(){
            $(this).hide();
        });
    });  
    </script>
    <script>
        $(function() {
            // 点击编辑按钮
            $('.headerEdit').click(function() {
                $(this).hide();
                $('.joinBtn').hide();
                $('.headerCancel').show();
                $('.submitBtn').show();
                $(this).parent().next().removeClass().addClass('tableEdit');
            })
            
            // 点击取消
            $('.headerCancel').click(function() {
                $('.layerRemind').show();
            })
            // 点击弹层上的先去提交按钮
            $('.cancelBtn').click(function() {
                $('.layerRemind').hide(); 
            })
        })
    </script>
    <script type="text/javascript">
    function  save(){

        var list = $(".workrestinfo");
        var workrestList = new Array();
        try{
        	   list.each(function(e){
               	
             	   var wr =$(this);
             	   var map = {};
             	   var id = wr.find(".wrid").val();
             	   var name =  wr.find(".timeP").text();
             	   var starttime = wr.find(".startTimeString");
             	   /* if(starttime.length > 0){
             		   if(!starttime.hasClass("current")){
             			  throw (name+"时间不能为空");
             			   return;
             		   }
             	   } */
             	   var startTimeString = starttime.text();
             	   var endtime =  wr.find(".timeArrange").find(".endTimeString");
             	  /* if(endtime.length > 0){
            		   if(!endtime.hasClass("current")){
            			   throw (name+"时间不能为空");  
            			   return;
            		   }
            	   } */
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
	   			setTimeout(function(){
	   				window.location.reload();
	   			},1000);
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