<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
.activityMain{
    width: 100%;
    max-width: 540px;
    margin: 0 auto;
    height: 100%;
    overflow: auto;
    position: fixed;
    top: 0;
    z-index: 102;
    background-color: rgba(0, 0, 0, 0.5);
	}
.activityMain .activityruleBox{
    width: 8.8rem;
    margin: 0.48rem auto;
    overflow: auto;
    position: relative;
    top: 40%;
    transform: translateY(-50%);
    -webkit-transform: translateY(-50%);
    background-color: #fff;
    border-radius: 0.10666667rem;
}

.activityMain .close {
    display: block;
    width: 30px;
    height: 30px;
    position: absolute;
    right: 5px;
    top: 5px;
    background: url(<b:staticUrl>/res/img/common/clear2@2x.png</b:staticUrl>) center center no-repeat;
    background-size: 14px 14px;
}
.activityMain  .activityruleBox .tit, .sortruleBox .tit {
    width: 100%;
    padding: 0.5rem 0;
    text-align: center;
    font-size: 0.45333333rem;
    color: #666;
    font-weight: normal;
}
.activityMain .activityruleBox .stit, .sortruleBox .stit {
    margin-bottom: 0.4rem;
    line-height: 0.58666667rem;
    font-weight: normal;
    font-size: 0.34666667rem;
    color: #666;
}
.activityMain .activityruleBox .word, .sortruleBox .word {
    line-height: 0.50666667rem;
    font-size: 0.32rem;
    color: #666;
}
.activityMain .activityruleBox .price, .sortruleBox .price {
    margin-top: 1.06666667rem;
    text-align: center;
    line-height: 0.58666667rem;
    font-size: 0.48rem;
    color: #d0021b;
}
.activityMain .activityruleBox .pricenote, .sortruleBox .pricenote {
    text-align: center;
    line-height: 0.50666667rem;
    font-size: 0.4rem;
    color: #d0021b;
}
.activityMain  .invitationTop{
	 	background-color: #FFA12E;
	 	text-align: center;
	 	min-height: 4rem;
	 }
.activityMain .invitationTop .content{
	 	width: 85%;
	 	display: inline-block;
	 	margin:0.6rem 0;
	 }
.activityMain  .invitationTop .headImg{
	 	width: 1.3rem;
		height: 1.3rem;
		display: inline-block;
		border-radius: 1.2rem;
		border: 0.06rem solid #efeff4;
	 }
.activityMain .invitationTop span{
	 	color:white;
	 }
.activityMain .invitationTop .content .spanBottom{
		font-size: 30%;
		background-color: #FFA12E;
		position: relative;
		bottom: -0.3rem;
		padding: 0 0.6rem 0 0.6rem;
	 }
.activityMain  .userInfo{
	 	width: 100%;
		display: inline-block;
		background-color: #FFA12E;
		left: 36%;
		top: 2.3%;
	 }
.activityMain .ruleMsg{
 	    min-height: 7.2rem;
   		display: block;
   		background-color:rgba(242, 242, 242, 1);
	 }
.activityMain  .ruletitle{
	 	margin: -3px 0;
	    font-size: 15px;
	    text-align: center;
	    padding: 30px 0 20px 0;
	    font-weight: 500;
	 }
.activityMain  .rulecontent{
	 	font-size: 12px;
	    padding: 10px 32px;
	    color: #9b9b9b;
	 }
.activityMain  .rulebuttom{
	width: 100%;
    max-width: 540px;
    margin: 0 auto;
    margin-top: 1.8rem;
    padding: 0 2rem;
}
.activityMain  .rulebuttom a{
	display: block;
    height: 1rem;
    line-height: 1rem;
    background-color: rgba(255, 161, 46, 1);
    border-radius: 1.33333333rem;
    text-align: center;
    color: #fff;
}
.activityMain  .carmsg{
 	    color: #fff;
   		font-size: 0.33rem;
}
.activityMain  .closediv{
	 	text-align: center;
	 }
.share {
    display: none;
    width: 100%;
    max-width: 540px;
    margin: 0 auto;
    height: 100%;
    position: fixed;
    top: 0;
    z-index: 100;
    background-color: rgba(0, 0, 0, 0.8);
}
.share .shareBox {
    width: 100%;
    padding-top: 1.12rem;
    position: relative;
}
.share .arrow {
    display: block;
    width: 75px;
    height: 84px;
    position: absolute;
    right: 0.48rem;
    top: 0.21333333rem;
    background-image: url(<b:staticUrl>/res/img/share/share.png</b:staticUrl>);
    background-position: right top;
    background-repeat: no-repeat;
    background-size: 78px 72px;
}
.share p {
    margin-bottom: 0.26666667rem;
    text-align: center;
    color: #f8e71c;
}
.semi {
   width:100px;
   height:50px;
   border-radius:0 0 50px 50px;
   background:red;
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
		    		waiting:false,
		    		data:{activityId:'${activityId}'},
		    		url:"/yzmm/account/virtualcard/giveRecommendActivity",
		    		callback:function(data){
		    			window.location.reload();
		    		}
		    	});
		    },
		    shareAppMessage:function(bool){
		    	
		    	HH.ajax({
		    		waiting:false,
		    		data:{activityId:'${activityId}'},
		    		url:"/yzmm/account/virtualcard/giveRecommendActivity",
		    		callback:function(data){
		    			window.location.reload();
		    		}
		    	});
		    }
		};
initwxfx(wxfenxiangcb_dtl);

		
</script>
<div class="activityMain" style="display:none;">
	<div class="activityruleBox">
		<!-- <a href="javascript:void(0)" class="close"></a> -->
	<div class="invitationTop">
		<div class="content">
			<div class="userInfo">
				<div class="headImg"><img style="width: 1.2rem;height: 1.2rem;border-radius: 1rem;" src="${album}" />
				</div>
				<p style="margin-top: 4px;"><span style="font-size:0.32rem;">${name}</span></p>
			</div>
			<div class="carmsg">
				<br/>
				<p>恭喜你，已获得喵姐早教说3天VIP体验会员资格。</p>
		 		<p style="margin-top: 4px; color:rgba(242, 242, 242, 1);">
		 			<c:if test="${not empty saYear}">
						${saYear}.${saMonth}.${saDay}  - ${enYear}.${enMonth}.${enDay}
					</c:if>
		 		</p>
			</div>
		</div>
	</div>
	<div class="ruleMsg">
		<h3 class="ruletitle">您有一次体验会员天数翻倍的机会</h3>
		<p class="rulecontent">独乐乐，不如众乐乐，分享1元体验会员活动给好友，即可领取体验会员天数翻倍+1天奖励。好内容值得被分享！</p>
		<div class="rulebuttom"><a class="font12">分享立即赢取会员</a></div>
	</div>

	</div>
	<div class="closediv">
		<img style="width: 25px;height: 25px;margin-top:20px;" src="<b:staticUrl>/res/img/closeimg.png</b:staticUrl>">
	</div>
	<div class="share">
			<div class="shareBox">
				<div class="arrow"></div>
				<p class="font15" style="margin-top: 40px;">点击右上角分享</p>
				<p class="font15">会员期限即可翻倍并加1天哦！</p>
			</div>
	</div>
</div>
<script>
	$(function(){
		$(".closediv").click(function(){
			$(".activityMain").hide();
		});
		$(".share").click(function(){
			$(".share").hide();
		});
		$(".rulebuttom").click(function(){
			$(".share").show();
		});
		if('${showshare}'=='true'){
			$(".activityMain").show();
		}
		$(".sharegift").click(function(){
			$(".activityMain").show();
		})
	});
</script>