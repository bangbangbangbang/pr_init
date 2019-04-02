<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix='j' uri='/jsputil'%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta name="format-detection" content="telephone=no" />
	<meta name="format-detection" content="email=no"/>
	<title>喵姐早教说</title>
	<%@include file="../../../header_v2.4.0.jsp" %>
	
	<link rel="stylesheet" href="<b:staticUrl>/res/css/prekindergarten/selfrating.css</b:staticUrl>">
	<script src="<b:staticUrl>/res/js/prekindergarten/ion.checkRadio.min.js</b:staticUrl>"></script>
	<link rel="stylesheet" href="<b:staticUrl>/res/css/prekindergarten/layer.css</b:staticUrl>">
	
	<%@include file="../../../header_wxjsapi.jsp"%>
	 <style type="text/css">
        dd {
            float:left;
            line-height:37px;
        }
        dd:nth-child(3n+1) {
            text-align:right;
            width:164px;
        }
        input[type="radio"]{
            display:none;
        }
        input[type="radio"]+label{
            display: block;
            position:relative;
            padding-left:0.7rem;
            line-height:20px;
            color:#333;
            font-weight:normal;
            margin-left:0.1rem;
        }
        label {
            display:inline-block;
            max-width:100%;
            margin-bottom:5px;
            font-weight:700;
        }
        input[type="radio"]+label::before {
            content:"";
            width:0.3rem;
            height:0.3rem;
            border-radius:50%;
            border:1px solid #cecece;
            position:absolute;
            top: 0.2rem;
            left:0;
        }
        input[type="radio"]:checked+label::after {
            top:0.29rem;
            left:0.09rem;
            content:"";
            background-color:#ff9963;
            width:0.18rem;
            height:0.18rem;
            border-radius:50%;
            position:absolute;
            vertical-align:middle;
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
  <body>
<!--自评列表页面-->
    <div class="wrapPage">
        <!--任务点评卡详情页-->
        <div class="selfrating">
            <div class="frating">
                <div class="selfHeader">
                    <h5>自  测</h5>
                    <p class="headerText">${soundbite }</p>
                    <p class="headerBot">【 第${week }阶段 · 第${weekDay }天 】</p>
                    <div class="headerImg">
                            <img src="<b:staticUrl>/res/img/prekindergarten/selfrating/u4937.png</b:staticUrl>" alt="">
                    </div>
                    <div class="headerImg headerImgEnve">
                            <img src="<b:staticUrl>/res/img/prekindergarten/selfrating/u4945.png</b:staticUrl>" alt="">
                    </div>
                </div>
                <!--挑选幼儿园绘本-->
                <div class="selfDiv">
                    <c:forEach var="item" items="${selftestList }" varStatus="status">
						<form action="" class="selfForm clearfix ${status.index==0?'': 'selfForm3' }">
	                        <div class="selfTop">
	                            <h3>${status.index+1 }</h3><span>${item.description }</span>
	                        </div>
	                        <div class="selfTxt">
	                        	<c:forEach var="self" items="${item.selftestItemList }" >
		                            <input id="adType${self.id }" ${specialTaskCount==2?(item.special=='WORKREST'?(specialTaskAlreadyDone?(self.code=='A'?'checked':''):(self.code=='B'?'checked':'')):''):'' } class="testitemid${self.id }" onclick="changeImg1(this)" name="adType" type="radio" data-itemid="${item.id }" data-code="${self.code }" data-taskid="${self.taskId }" data-testitemid='${self.id }' data-taskscheduleid="${item.taskScheduleId }" >
		                            <label for="adType${self.id }" onclick='changeColor(this)' class="${specialTaskCount==2?(item.special=='WORKREST'?(specialTaskAlreadyDone?(self.code=='A'?'selfTxtCurrent':''):(self.code=='B'?'selfTxtCurrent':'')):''):'' }">
		                                <p class="txtOpt">${self.code }.</p><p class="txtSize">${self.description }</p>
		                            </label>
	                            </c:forEach>
	                        </div>
	                        <div class="selfUnexe">
		                        <c:if test="${item.special=='NOT'}">
		                            <span class="unexeDeta" data-taskscheduleid="${item.taskScheduleId }" onclick="showDetail('${item.id}')" >详情&nbsp;&nbsp;></span>
		                        </c:if>
		                        <c:if test="${item.special=='WORKREST'}">
		                        	<c:if test="${specialTaskAlreadyDone }">
			                            <span class="unexeDeta" data-taskscheduleid="${item.taskScheduleId }" onclick="javascript:HH.href('/yzmm/account/activity/kja/task/viewMyWorkRestSchedule?activityId=${activityId}')" >详情&nbsp;&nbsp;></span>
		                        	</c:if>
		                        </c:if>
	                        </div>
	                    </form>
                    </c:forEach>
                </div>
                <div class="selfBottom">
                    <p class="selfTips"># 小贴士</p>
                    <p class="tipsTxt">${desc}</p>
                </div>
                <div class="btn">
                    <div class="planJoin" onclick="sub()">
                        <a href="javascript:vv(0)">提 交</a>
                    </div>
                </div>
            </div>
        </div>   
    </div>   
    
    <div class="detaillist">
    	<c:forEach var="item" items="${selftestList }" varStatus="status">
	    	<div class="share detail${item.id }"> 
	    		<div class="headerImg">
		            <!--顶部的图片-->
		            <c:if test="${empty item.img}">
			    		<img src="<b:staticUrl>/res/img/prekindergarten/taskdefult.jpg</b:staticUrl>" alt="">
		            </c:if>
		            <c:if test="${not empty item.img}">
			    		<img src="${item.img}" alt="">
		            </c:if>
		        </div>
		        
		        <div class="mark">
		            <h3>NO.${status.index+1} ${item.description}</h3>
		           	<p>
		           		<j:codeToLabel value='${empty item.guide?"":item.guide}'></j:codeToLabel>
		           		<j:codeToLabel value='${empty item.guideOne?"":item.guideOne}'></j:codeToLabel>
		           		<j:codeToLabel value='${empty item.guideTwo?"":item.guideTwo}'></j:codeToLabel>
		           		<j:codeToLabel value='${empty item.guideThree?"":item.guideThree}'></j:codeToLabel>
		           		<j:codeToLabel value='${empty item.guideFour?"":item.guideFour}'></j:codeToLabel>
		           		<j:codeToLabel value='${empty item.guideFive?"":item.guideFive}'></j:codeToLabel>
		           	</p>
		           	<%-- <c:if test="${item.special=='WORKREST'}">
			    	  		<c:choose>
					        	<c:when test="${item.workRestIsWrite}">
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
					            <!--起床-->
					            <c:forEach items="${item.workRestConfigRespArray}" var="workrestconfig" varStatus="s">
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
					        <div class="homeLine">             
					        </div>
			        </c:if> --%>
			        
			        <div class="subject subject${item.id }">
			         <h4 class="subH">自测题目</h4>
	                	  <h3>${item.description}</h3>
		                    <c:forEach var="self" items="${item.selftestItemList }" >
			                     <c:if test="${self.code != 'Z'}">
				                    <div class="selfTxt ${item.special=='WORKREST'?(specialTaskAlreadyDone?(self.code=='A'?'selfTxtCurrent':''):(self.code=='B'?'selfTxtCurrent':'')):'' } testitemid${self.id }" onclick="changeImg(this)" data-code="${self.code }" data-itemid="${item.id }" data-testitemid='${self.id }' data-taskscheduleid="${item.taskScheduleId }">
				                        <p class="txtOpt">${self.code }. </p><p class="txtSize">${self.description }</p>
				                    </div>
			                     </c:if>
		                    </c:forEach>
			        </div>
			        <div class="planJoin zplist" data-itemid="${item.id }">
		                <a href="#">返回自评列表</a>
		            </div>
		        </div>
	    	</div>
            </c:forEach>
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
    <script type="text/javascript">
    
    $(function(){
    	$('.zplist').on('click',function(){
    		var self=$(this);
    		var itemid=self.data('itemid');
    		var csid='detail'+itemid;
        	$('.'+csid).hide();
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
    });
    
    function showDetail(itemid){
    	var csid='detail'+itemid;
    	$('.'+csid).show();
    }
    
    function sub(){
    	
    	var list=$('.selfDiv input:radio:checked');
    	
    	var selftestListLen=parseInt('${selftestListLen}');
    	
    	if(list.length<selftestListLen){
    		toast('亲，还有自测题没勾选哦，请完成后再提交吧。');
    		return;
    	}
    	
    	var unexList=$('.UnexeSpanCurrent');
    	
    	var selfTestReqList=new Array();
    	
    	list.each(function(a){
    		var e=$(this); 
    		var map={};
    		var code=e.data('code'); 
    		var taskscheduleid=e.data('taskscheduleid');
    		var taskid=e.data('taskid');
    		map.code=code;
    		map.taskScheduleId=taskscheduleid;
    		map.taskId=taskid;
    		selfTestReqList.push(map);
    	});
    	
    	
    	 HH.ajax({
				data:{
					selfTestReqList:JSON.stringify(selfTestReqList),
					'activityId':'${activityId}'
				},
				url:"/yzmm/account/activity/kjaSelfTest/selfRating",
				async:true,
			    callback:function(data){
			   		if(data.success){
			   			if(data.msg){
			   				toast(data.msg);
			   			}
			   			setTimeout(function(){
			   				HH.href('/yzmm/account/activity/kjaSelfTest/tcCommentListPage?dayTime=${newDayTime}&&activityId=${activityId}');
			   			},2000);
		   			}else{
		   				HH.href('/yzmm/account/activity/kjaSelfTest/list?activityId=${activityId }&dayTime=${oldDaytime}');
		   			}
			    }
			});
    	
    }

    function changeImg(a){
        var obj=$(a);
        var testitemid=obj.data('testitemid');
        var itemid=obj.data('itemid');
        
        var subject=$('.subject'+itemid);
        
        var sel=$('.testitemid'+testitemid);
        
        subject.find(".selfTxt").each(function(){
            $(this).removeClass("selfTxtCurrent");
        });
        
        sel.addClass("selfTxtCurrent");
        $('#adType'+testitemid).click();
        
    }
    
    function changeImg1(a){
        var obj=$(a);
        var testitemid=obj.data('testitemid');
        var itemid=obj.data('itemid');
        
        var subject=$('.subject'+itemid);
        
        var sel=$('.testitemid'+testitemid);
        
        subject.find(".selfTxt").each(function(){
            $(this).removeClass("selfTxtCurrent");
        });
        
        sel.addClass("selfTxtCurrent");
    }
    function changeColor(a) {
        var obj = $(a);
        if(obj.hasClass("selfTxtCurrent")) {
            $(obj).removeClass("selfTxtCurrent");
        }else{
            $(obj).addClass("selfTxtCurrent");
        }
        obj.siblings(obj).each(function(){
             if($(this).removeClass("selfTxtCurrent")){
                 return;
             }
        })
    }
    $(function(){
		var  share = $('div.share1');
		$('.wrapPage').click(function(){
			$(share).show();
		});
        share.click(function(){
			$(this).hide();
		});
    });

	function vv(t){
		
	}
</script>
</body>
</html>
