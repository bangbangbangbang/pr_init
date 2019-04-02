<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="format-detection" content="telephone=no" />
<meta name="format-detection" content="email=no" />
<title>喵姐早教说</title>
<%@include file="../../../header_v2.4.0.jsp"%>
<%@include file="../../../header_wxjsapi.jsp"%>
	<script>
		var wxfenxiangcb={
				title: '${wxshare.title}', // 分享标题
				desc : '${wxshare.desc}',
			    link: '${wxshare.link}', // 分享链接
			    imgUrl: '${wxshare.imgUrl}', // 分享图标
			    shareTimeline:function(bool){
			    	$('.rewardshow').show();
			    	$('.share1').hide();
					$('.share2').hide();
					$('.share5').hide();
					HH.ajax({
						data:{
							biztype:'SHARETASK',
							week:'${week}',
							weekDay:'${weekDay}',
							activityId:'${activityId}',
	    		        	dayTime:'${backDayTime}'
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
			    	$('.rewardshow').show();
			    	$('.share1').hide();
					$('.share2').hide();
					$('.share5').hide();
					HH.ajax({
						data:{
							biztype:'SHARETASK',
							week:'${week}',
							weekDay:'${weekDay}',
							activityId:'${activityId}',
	    		        	dayTime:'${backDayTime}'
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
	<link rel="stylesheet" href="<b:staticUrl>/res/css/prekindergarten/slide.css</b:staticUrl>">
	<link rel="stylesheet" href="<b:staticUrl>/res/css/prekindergarten/layer.css</b:staticUrl>">
</head>
<body>
    <div class="wrap">
        <!--任务点评卡详情页-->
        <div class="comment">
            <ul class="commentDetails">
                <li class="ContentList">
                    <div class="listDiv clearfix">
                        <div class="leftImg fl">
                             <img src="<b:staticUrl>/res/img/prekindergarten/u4864.png</b:staticUrl>" alt="" class="img1">
                             <img src="<b:staticUrl>/res/img/prekindergarten/u4858.png</b:staticUrl>" alt="" class="img2">
                             <img src="<b:staticUrl>/res/img/prekindergarten/u4858.png</b:staticUrl>" alt="" class="img3">
                      </div>
                        <div class="listText fl">
                            <p class="txt1">恭喜${babynickname}</p>
                            <p class="txt2">完成第${week }阶段·第${weekDay }天训练任务</p>
                        </div>
                        <div class="rightImg fr">
                           <img src="<b:staticUrl>/res/img/prekindergarten/u4858.png</b:staticUrl>" alt="" class="img1">
                            <img src="<b:staticUrl>/res/img/prekindergarten/u4858.png</b:staticUrl>" alt="" class="img2">
                            <img src="<b:staticUrl>/res/img/prekindergarten/u4862.png</b:staticUrl>" alt="" class="img3">
                        </div>
                    </div>
                    <div class="commentCon">
                        <h3 class="tear">导师点评</h3>
                        <c:forEach items="${commentList }" var ="item">
	                        <div class="contentD clearfix">
	                            <div class="dot fl"></div><p class="contentTxt">${item}</p>
	                        </div>
                        </c:forEach>
                    </div>
                    <a href="javascript:void(0);" class="planJoin">炫耀一下</a>
                    <p class="commentBtm">炫耀宝宝今日训练成绩即可领取4枚成长基金币</p>
                    <div class="lifeBottom clearfix">
                        <p class="navLeft" onclick="javascript:HH.href('/yzmm/account/activity/kja/task/toDealTask?activityId=${activityId }&dayTime=${backDayTime}');">返回</p>
                        <c:choose>
                    		<c:when test="${nextweekday==7 }">
									<p class="navRight showWeekReport">查看成绩单</p>
                    		</c:when>
                    		<c:otherwise>
                    			<c:if test="${!isobtain}">
										<p class="navRight">领取新任务</p>
								</c:if>
								<c:if test="${isobtain}">
									<c:if test="${isselftest==false}">
										<p class="navRight">预览新任务</p>
									</c:if>
								</c:if>
                    		</c:otherwise>
                    	</c:choose>
                    </div>
                </li>
                
            </ul>
        </div>   
    </div> 
    
    <!--任务列表  点击显示隐藏   连续3天学习奖励学习认真奖-->
    <div class="share1" style="display:none;">
        <div class="shareBox">
            <div class="conThree">
                <img src="<b:staticUrl>/res/img/prekindergarten/comment/u4775.jpg</b:staticUrl>" alt="" class="conThreeImg">
                <h3 class="conThreeTit">学习认真奖<span>🏆</span></h3>
                <p class="conThreeTxt">本周已连续学习 <span>3</span> 天，很棒很棒哒，继续加油</p>
                <div class="line"></div>
                <div class="seriousPrize">
                    <span class="reward">奖  励</span>
                    <p class="rewardTxt">价值 ￥26.9元课程兑换券一张</p>
                </div>
                <p class="promptTxt">分享奖励单即可领取</p>
                <div class="planJoin">
                    <a href="#">炫耀一下</a>
                </div>
            </div>
            <img src="<b:staticUrl>/res/img/prekindergarten/comment/u4933.png</b:staticUrl>" alt="" class="conThreeBotImg">
        </div>
    </div>
    <!--任务列表  点击显示隐藏   连续3天学习奖励 优秀学员奖🏆-->
    <div class="share2" style="display:none;">
        <div class="shareBox">
            <div class="conThree">
                <img src="<b:staticUrl>/res/img/prekindergarten/comment/u4837.jpg</b:staticUrl>" alt="" class="conThreeImg">
                <h3 class="conThreeTit">学习认真奖<span>🏆</span></h3>
                <p class="conThreeTxt">第${week }周任务已结束，恭喜您完成连续一周学习</p>
                <div class="line"></div>
                <div class="seriousPrize">
                    <span class="reward">奖  励</span>
                    <p class="rewardTxt">价值 ￥29.0元提问券一张</p>
                </div>
                <p class="promptTxt">分享奖励单即可领取</p>
                <div class="planJoin">
                    <a href="#">炫耀一下</a>
                </div>
            </div>
            <img src="<b:staticUrl>/res/img/prekindergarten/comment/u4933.png</b:staticUrl>" alt="" class="conThreeBotImg">
        </div>
    </div>
    <!--任务列表  点击显示隐藏   连续3天学习奖励 奖品领取通知-->
    <div class="share3" style="display:none;">
        <div class="shareBox">
            <div class="conThree">    
                <h3 class="conThreeTit notice">奖品领取通知</h3>
                <div class="seriousPrize">
                    <span class="reward">奖  励</span>
                    <p class="rewardTxt">价值 ￥29.0元提问券一张</p>
                </div>
                <p class="promptTxt">活动奖励领取成功，可在个人中心“优惠券 - 获赠奖券”中查看</p>
                <div class="planJoin">
                    <a href="/yzmm/account/usercoupon/useCouponList">去看看</a>
                </div>
                <div class="planJoin planJoinKnow">
                    <a href="#">我知道了</a>
                </div>
            </div>
        </div>
    </div>
    
    <div class="share5" style="display:none;">
        <div class="sharearrow"></div>
           <p>点击右上角，分享成功即可获得优惠券哦</p>
    </div>
    <script>
			if($('.wrap').height() <  $(window).height()) {
	            $('.lifeBottom').css('position','fixed');
	            $('.lifeBottom').css('bottom',0);
	        }else {
	             $('.lifeBottom').css('position','absolute');
	        }
    </script>
    	<script type="text/javascript">
		$(function(){
			$('.showWeekReport').on('click',function(){
				HH.href('/yzmm/account/activity/kja/showWeekReport?activityId=${activityId}&uid=${uid}&dayTime=${nextDayTime}');
			})
			$(".navRight").on("click",function(){
				HH.href('/yzmm/account/activity/kja/task/receivetasklist?activityId=${activityId}&dayTime=${nextDayTime}');
			});
			$('.planJoinKnow').on('click',function(){
				$('.share3').hide();
			});
			$('.conThreeBotImg').on('click',function(){
				$('.share1').hide();
				$('.share2').hide();
			});
			
			var  share = $('div.share5');
		      share.click(function(){
		          $(this).hide();
		      });
		      
		      $('.share1 .planJoin').on('click',function(){
		    	  $('.share5 p').html('点击右上角，分享成功即可获得优惠券哦');
		    	  $('.share5').show();
		      });
		      
		      $('.share2 .planJoin').on('click',function(){
		    	  $('.share5 p').html('点击右上角，分享成功即可获得优惠券哦');
		    	  $('.share5').show();
		      });
		      $('.ContentList .planJoin').on('click',function(){
		    	  $('.share5 p').html('将宝宝今天的练习自测结果分享给大家看看吧');
		    	  $('.share5').show();
		      });
		      
			 /***
	    	  *判断是否中奖
	    	  */
	    	/* HH.ajax({
				data:{
					'id':'${taskScheduleId}'
				},
				url:"/yzmm/account/activity/kjaShareReceive/checkReward",
				async:true,
			    callback:function(data){
			   		if(data.success){ */
			   			var readMapValue='${readMapValue}';
			   			if(readMapValue!=''){
				   			var obj=JSON.parse(readMapValue);
				   			
				   			//标记中奖天数
				   			var rewardNum=parseInt(obj.rewardNum);
				   			var showdiv;
				   			if(rewardNum>3){
				   				showdiv=$('.share2');
				   			}else{
				   				showdiv=$('.share1');
				   			}
				   			
				   			var couponType=obj.couponType;
				   			var reward=obj.reward;//奖项
				   			$('.share3').addClass('rewardshow');//中奖显示
				   			
							showdiv.find('.conThreeTit').html(reward+'<span>🏆</span>');
				   			
				   			switch (couponType) {
								case 'COURSE':
									showdiv.find('.rewardTxt').html('价值 ￥26.9元课程兑换券一张');
									$('.share3 .rewardTxt').html('价值 ￥26.9元课程兑换券一张');
									break;
								case 'QUIZ':
									showdiv.find('.rewardTxt').html('价值 ￥29元提问券一张');
									$('.share3 .rewardTxt').html('价值 ￥29元课程兑换券一张');
									break;
								case 'MONEY':
									var couponAmount=obj.couponAmount;//现金券金额
									showdiv.find('.rewardTxt').html('全网通 '+couponAmount+'元现金券一张');
									$('.share3 .rewardTxt').html('全网通 '+couponAmount+'元现金券一张');
									break;
								default:
									break;
							}
				   			showdiv.show();
			   			}
		   			/* }else{
		   			}
			    }
			}); */
		})
		
	</script>
</body>
</html>