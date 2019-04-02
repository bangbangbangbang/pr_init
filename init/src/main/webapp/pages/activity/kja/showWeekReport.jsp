<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>喵姐早教说</title>
	<%@include file="../../header_v2.4.0.jsp" %>
	<%@include file="../../header_wxjsapi.jsp"%>
	 <link rel="stylesheet" href="<b:staticUrl>/res/css/prekindergarten/scoreShare.css</b:staticUrl>">
	 <link rel="stylesheet" href="<b:staticUrl>/res/css/prekindergarten/layer.css</b:staticUrl>">
   	<script type="text/javascript" src="<b:staticUrl>/res/js/prekindergarten/circle-progress.js</b:staticUrl>"></script>
   	<style type="text/css">
		a {
		    color: rgb(255, 142, 45);
		}
		
		.circle {
		    position: relative;
    		margin: 0 0.5rem;
		}
		.circle  .proText {
            padding-top: 0.4rem;
            text-align: center;
            font-size: 0.36rem;
            color: #ff9900;
        }
		.circle canvas {
		    vertical-align: center;
		    margin-left: auto;
		    margin-right: auto;
		    display: block;
		}
		
		.circle span {
		   position: absolute;
		    line-height: 160px;
		    top: 0px;
		    left: 50%;
		    -webkit-transform: translate(-50%,0);
		    -moz-transform: translate(-50%,0);
		    -o-transform: translate(-50%,0);
		    transform: translate(-50%,0);
		    margin: 0px;
		    padding: 0px;
		    color: rgb(255, 142, 45);
		    text-align: center;
		    font-size: 1.2rem;
		    font-weight: normal;
		    font-family: sans-serif;
		}
		
		.circle span font {
		    font-style: normal;
		    font-size: 0.65rem;
		    font-weight: normal;
		}
    </style>
    <script type="text/javascript">
	var wxfenxiangcb_dtl={
				title: '${wxshare.title}', // 分享标题
				desc : '${wxshare.desc}',
			    link: '${wxshare.link}', // 分享链接
			    imgUrl: '${wxshare.imgUrl}', // 分享图标
			    shareTimeline:function(bool){
					HH.ajax({
						data:{
							biztype:'SHAREWEEKREPORT',
							week:'${week}',
							weekDay:7,
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
							biztype:'SHAREWEEKREPORT',
							week:'${week}',
							weekDay:7,
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
	
			 initwxfx(wxfenxiangcb_dtl);
			
	</script>
</head>
<body>
    <div class="wrapPage">
    	<div class="scoreShare">
    		<!--顶部的头像和昵称-->
    		<div class="tranHeader clearfix">
                <div class="headerLeft clearfix">
                    <div class="leftImg">
                        <img src="${albumUrl}" alt="">
                    </div>
                    <div class="leftTxt">
                        <p class="txtName">${nickName}</p>
                        <p class="txtBaby">宝宝：<span>${babyNickname}</span></p>
                    </div>
                </div>
            </div>
            <!--提升百分比-->
            <div class="tranContent">
                <h3 class="conTitle">${name}</h3>
                <p class="conSingle">第 <span>${week}</span> 阶段</p>
                <!--总成绩-->
                <div class="achievement">
                	<%-- <div class="achievePro jq22-container">
                		<div class="circleChart" id="circleChart" data-value="${totalscore}"></div>
                		<p class="proText">本阶段训练成绩</p>
                	</div> --%>
                	<div class="forth circle">
                		<c:choose>
							<c:when test="${totalscore==100}">
								  <span class="circleChart" id="circleChart" data-value="${totalscore-1}"></span>
							</c:when>
							<c:otherwise>
								 <span class="circleChart" id="circleChart" data-value="${totalscore}"></span>
							</c:otherwise>
						</c:choose>
					    <p class="proText">本阶段训练成绩</p>
					</div>
                	<div class="achieveRight">
                		<div class="project">
                			<p class="projectNum">${totaltask}个</p>
                			<p class="projectTxt">训练项目</p>
                		</div>
                		<div class="project project1">
                			<p class="projectNum">${couponSize}项</p>
                			<p class="projectTxt">本阶段荣誉</p>
                		</div>
                	</div>
                </div>
            </div>
    	</div>
    	<!--点评  -->
    	<c:if test="${formShare=='false'}">
    		<div class="evaluate clearfix" onclick="HH.href('/yzmm/account/activity/kja/toEditUserComment?activityId=${activityId}&dayTime=${dayTime}')">
				<div class="evalText">评价本阶段任务，让我们更好的为你服务 ~</div>
				<img src="<b:staticUrl>/res/img/prekindergarten/rightArr.png</b:staticUrl>" alt="" class="evalImg"/>
				<div class="shadowDiv">
					<div class="triangle">
						
					</div>
				</div>
	    	</div>
    	</c:if>
    	<!--荣誉奖单-->
    	<c:if test="${not empty couponlist}">
    		   	<div class="scoreShare shareTop">
    		<!--标题-->
			<div class="award clearfix">
				<img src="<b:staticUrl>/res/img/prekindergarten/u9054.png</b:staticUrl>" alt="" class="fl awardImg">
				<p class="awardText fl">
					<span>本阶段荣誉</span><br />
					<sapn class="textSpan">PERSONAL HONOR</sapn>
				</p>
			</div>
			<!--卡片-->
			<c:forEach items="${couponlist}" var="coupon" varStatus="status">
				<div class="shareCard clearfix">
					<c:choose>
						<c:when test="${status.first}">
							<div class="cardLeft">
								<p class="leftPic">${coupon.name}</p>
								<p class="leftCard">连续打卡3天</p>
							</div>
						</c:when>
						<c:otherwise>
							<div class="cardLeft">
								<p class="leftPic">${coupon.name}</p>
								<p class="leftCard">连续打卡6天</p>
							</div>
						</c:otherwise>
					</c:choose>
					<div class="cardRight">
						<c:if test="${coupon.type=='CASH'}">
							<p class="rightPic">赠${coupon.typeAmount/100}元</p>
							<p class="rightCard">现金券1张</p>
						</c:if>
						<c:if test="${coupon.type=='SINGLE'}">
							<c:if test="${coupon.businessType=='MIAOQA'}">
								<p class="rightPic">赠价值29元</p>
								<p class="rightCard">提问券1张</p>
							</c:if>
							<c:if test="${coupon.businessType=='COURSE'}">
								<p class="rightPic">赠价值26.9元</p>
								<p class="rightCard">课程券1张</p>
							</c:if>
						</c:if>
					</div>
				</div>
				<div class="line"></div>
			</c:forEach>
    	</div>
    	</c:if>
    	<!--喵姐寄语-->
    	<div class="scoreShare clearfix">
    		<div class="message clearfix">
                <img src="<b:staticUrl>/res/img/prekindergarten/transcript/u4209.png</b:staticUrl>" alt="" class="messImg">
                <p class="messText">${soundbite}</p>
                <img src="<b:staticUrl>/res/img/prekindergarten/transcript/u4209.png</b:staticUrl>" alt="" class="messImg1 fr">
            </div>
            <div class="shareBtm fr">
            	<img src="<b:staticUrl>/res/img/prekindergarten/u9096.png</b:staticUrl>" alt="" />
            	<p class="teacher fr"> 喵姐寄语</p>
            </div>
    	</div>
    	<!--分享按钮-->
    	<c:choose>
    		<c:when test="${formShare=='true'}">
    			<a class="planJoin activityDetail">查看详情</a>
    			 <div class="evaluateOccupy"></div>
    		</c:when>
    		<c:when test="${last=='true'}">
    			<a class="planJoin reciveDiploma">领取毕业证书</a>
    		</c:when>
    		<c:otherwise>
    			<a class="planJoin shareWeekReport">炫耀一下</a>
    		</c:otherwise>
    	</c:choose>
        <c:if test="${formShare=='false'}">
	        <div class="whiteLine"></div>
	        <p class="remindText">
				宝宝又完成了一阶段的入园适应训练，真的很棒！今天带宝宝休息放松一下，当然如果能巩固本周训练内容是最好的啦。小喵相信，只要宝宝能坚持完成所有训练项目，一定能轻轻松松入园。那么我们明早7点半见咯！
	        </p>
	        <p class="schedule">训练日程表&nbsp;&nbsp;&nbsp;》</p>
        </c:if>
    </div>
    <div class="share5" style="display:none; z-index: 999;">
        <div class="sharearrow"></div>
        <p>独乐乐不如众乐乐<br>好知识值得分享！</p>
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
    	/* $("#circleChart").circleChart({
            size: 180,
            value: '${totalscore}',
			color: "#FF8E2D",
			backgroundColor: "#e6e6e6",
            text: 0,
            startAngle: 75,
            onDraw: function(el, circle) {
                circle.text(Math.round(circle.value) + "分");
            }
       }); */
	   	$('.forth.circle').circleProgress({
		    startAngle: -Math.PI / 4 * 2,
		    value: $(".circleChart").data("value")/100,
		    size: 160,
		    thickness: 15,
		    lineCap: 'round',
		    fill: { color: '#FF8E2D' }
				}).on('circle-animation-progress', function(event, progress, stepValue) {
				    $(this).find('span').html(String(stepValue.toFixed(2)).substr(1).replace(/./, '') + "<font>分</font>");
		});
    	$(function(){
    		 $(".schedule").on("click",function(){
   				HH.href("/yzmm/account/activity/kja/task/calendar?activityId=${activityId}");
   			});
    		 $(".activityDetail").on("click",function(){
    			 HH.href("/yzmm/account/activity/prekindergarten/index?id=${activityId}");
    		 })
   		    var  share = $('div.share5');
		      $('.shareWeekReport').click(function(){
		          $(share).show();
		      });
		      share.click(function(){
		          $(this).hide();
		      });
		      $(".reciveDiploma").click(function(){
		    	  	HH.ajax({
						data:{
							'activityId':'${activityId}',
							'dayTime':'${dayTime}'
						},
						url:"/yzmm/account/activity/kja/reciveDiploma",
					    callback:function(data){
					   		if(data.success){
					   			wx.closeWindow();
				   			}else{
				   			   toast("遗憾~ 证书领取不成功，别急，返回“喵姐早教说会员号” 进入入园适应训练重试。");
				   			}
					    }
					});
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
	</script>
</body>
</html>