<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
 	<link rel="stylesheet" href="<b:staticUrl>/res/css/prekindergarten/sleepTrain.css</b:staticUrl>">
     <script type="text/javascript" src="<b:staticUrl>/res/js/prekindergarten/circle-progress.js</b:staticUrl>"></script>
      <style type="text/css">
		a {
		    color: rgb(255, 142, 45);
		}
		
		
		.circle {
		    position: relative;
		    margin-top: 1rem;
		}
		
		.circle canvas {
		    vertical-align: center;
		    margin-left: auto;
		    margin-right: auto;
		    display: block;
		}
		
		.circle span {
		   position: absolute;
		    line-height: 180px;
		    top: 0px;
		    width: 100%;
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
</head>
<body>
	<div class="fundPopup">
		<div class="popupBox">
            <div class="popupContent">
                <img src='<b:staticUrl>/res/img/prekindergarten/fund/u9743.png</b:staticUrl>' alt="" class="contentImg">
                <h2 class="contentTitH">专属海报已生成</h2>
                <p class="contentLook">前往公众号查看，成功邀请3位好友完成扫码即可免费参与，加油！</p>
                <a href="javascript:void(0);" class="shadoweBtn">去看看</a>
            </div>
            <img src='<b:staticUrl>/res/img/prekindergarten/fund/u1451.png</b:staticUrl>' alt="" class="popupBotImg">
        </div>
	</div>
	<div class="wrapPage wrapPage1">
		<div class="testEnd">
			<p class="babyTit">${babynickname}</p>
			<p class="report">${reportname}</p>
			<c:forEach items="${resultMap}" var="item" varStatus="status" begin="0" end="0">
        		<div class="forth circle">
				    <span></span>
				</div>
				<c:choose>
					<c:when test="${item.value.score==100}">
						 <div class="circleChart" id="circleChart" style="display: none;" data-value="${item.value.score-1}"></div>
					</c:when>
					<c:otherwise>
						<div class="circleChart" id="circleChart" style="display: none;" data-value="${item.value.score}"></div>
					</c:otherwise>
				</c:choose>
	            <p class="reportText">${item.value.analysisTxt1}</p>
				<p class="reportText reportText1">建议：${item.value.adviceTxt1}</p>
            </c:forEach>
			<div class="line"></div>
			  <div class="contentReco clearfix" id="joinFixed">
                  <h3 class="listJoin"><span>免费参与</span>（名额有限）</h3>
                  <!--邀请好友成功之后显示下面的"p"和"ul"-->
                  <c:if test="${carryOut==null}">
	                  <p class="listTextP">点击“领取海报”生成你的专属海报，邀请${carryCount }位好友扫描海报二维码即可领取免费参与资格，加油吧！</p>
	                  <p class="fundvNothing">· 暂无推行记录 ·</p >
	                  <a class="join" id="join">领取海报</a>
                  </c:if>
                  <c:if test="${carryOut!=null}">
                  		<p class="listTextP">点击“我要免费参与”生成你的专属海报，分享海报邀请 <span>${carryOut.kpiNum} 位</span>好友完成测试，即可。</p>
	                  <%-- <p class="listTextP">恭喜已成功邀请 ${carryCount } 位好友完成测评，再邀请 ${carryOut.kpiNum-carryCount<=0?0:carryOut.kpiNum-carryCount } 位好友即可免费参与，加油 ~</p> --%>
	                  <ul class="fundvimplement clearfix">
		    			<%-- <li><img src="<b:staticUrl>/res/img/activity/prekindergarten/default_album_url.png</b:staticUrl>" alt=""></li> --%>
		    			<c:forEach items="${imgUrls}" var="item">
		    				<li><img src="${item==null?'<b:staticUrl>/res/img/activity/prekindergarten/default_album_url.png</b:staticUrl>':item }" alt=""></li>
		    			</c:forEach>
		    		  </ul>
	                  <a class="join" id="join">${ carryOut.kpiNum-carryCount<=0?'马上开始':'我要免费参与' }</a>
                  </c:if>
                  <p class="listBot">今日已有  ${joinpeople} 位家长领取免费参与名额</p>
              </div>
              <div class="line"></div>
            <div class="programme">
            	<h3>根据测评结果，已为您匹配智能化训练方案</h3>
            	<p class="taskNum">总计 <span>${taskCount}项</span> 训练任务</p>
            	<p class="promote">规律睡眠能力预计可提升75%</p>
            	<a href="#" class="planJoin payBtn">付费报名 | ￥ ${isVip?config.vipAmount:config.amount}</a>
            	<p class="timeTxt">你还剩  <span class="lasttime">20:00</span>  分钟支付，逾时恢复原价￥199</p>
            </div>
              <script type="text/javascript">
	                $(function(){
	                	
	                	$('.shadoweBtn').on('click',function(){
	                		wx.closeWindow();
	                	});
	                	
	                	   $('.join').on('click',function(){
	                		   HH.ajax({
	                				url:"/yzmm/account/pyramidSchemeShareCarryOut/checkIsKpiNum",
	                				data:{
	                					shareMan:'${uid}',
	        	             			activityId:'${activityId}',
	        	             			activityType:'PREKINDERGARTEN'
	                				}, 
	                				callback:function(data){
	                					if(data.success) {
	                						HH.href('/yzmm/account/activity/kja/task/receivetasklist?activityId=${activityId}');
	                	                } else {
	                	                	var cbcode='${abcode}';
	                	                	if(cbcode){
	                	                		//发送海报
		                	                	 HH.ajax({
		         	                				url:"/yzmm/account/pyramidSchemeShareCarryOut/sendPoster",
		         	                				data:{
		         	                					shareMan:'${uid}',
		         	        	             			activityId:'${activityId}',
		         	        	             			activityType:'PREKINDERGARTEN',
		         	        	             			configId: '${config.id}',
		        	        	             			abcode:'${abcode}'
		         	                				}, 
		         	                				callback:function(data){
		         	                					if(data.success) {
		         	                						$('.fundPopup').fadeIn();
		         	                					}else{
		         	                						toast("海报生成失败，返回“喵姐早教说会员号”回复“睡眠”重新领取个人专属海报。");
		         	                					}
		         	                				}
		         	                			});
	                	                	}else{
	                	                		//发送海报
		                	                	 HH.ajax({
		         	                				url:"/yzmm/account/pyramidSchemeShareCarryOut/sendPoster",
		         	                				data:{
		         	                					shareMan:'${uid}',
		         	        	             			activityId:'${activityId}',
		         	        	             			activityType:'PREKINDERGARTEN',
		         	        	             			configId: '${config.id}'
		         	                				}, 
		         	                				callback:function(data){
		         	                					if(data.success) {
		         	                						$('.fundPopup').fadeIn();
		         	                					}else{
		         	                						toast("海报生成失败，返回“喵姐早教说会员号”回复“规矩”重新领取个人专属海报。");
		         	                					}
		         	                				}
		         	                			});
	                	                	}
	                	                	
	                	                }
	                				}
	                			});
	                	   });
	                	   $('.popupBotImg').click(function(){
        						$('.fundPopup').fadeOut();
        					});
	                });
	               <%//TODO 生成海报后创建 分享传销执行表 %>
	                /*  HH.ajax({
	             		data:{
	             			shareMan:'${uid}',
	             			activityId:'${activityId}',
	             			activityType:'PREKINDERGARTEN',
	             			configId: $(".cycleCurrent").data("value")
	             		},
	             		url:"/yzmm/account/pyramidSchemeShareCarryOut/create",
	             		async:false,
	             	    callback:function(data){
	             	   		if(data.success){
	                			}else{
	                				//toast(data.msg);
	                			}
	             	    }
	             	}); */
			  </script>
		</div>
	</div>
		<script type="text/javascript">
			$('.forth.circle').circleProgress({
			    startAngle: -Math.PI / 4 * 2,
			    value: $(".circleChart").data("value")/100,
			    size: 180,
			    thickness: 15,
			    lineCap: 'round',
			    fill: { color: 'rgb(255, 142, 45)' }
			}).on('circle-animation-progress', function(event, progress, stepValue) {
			    $(this).find('span').html(String(stepValue.toFixed(2)).substr(1).replace(/./, '') + "<font>分</font>");
			});
		</script>
		<script src="<b:staticUrl>/res/js/wxmppay.js</b:staticUrl>"></script>
       	<jsp:include page="../../../pay/coupon_new.jsp">
			<jsp:param value="PREKINDERGARTEN" name="businessType"/>
			<jsp:param value="${activity.img}" name="imgUrl"/>
			<jsp:param value="${activity.name}" name="name"/>
			<jsp:param value="0" name="count"/>
	        <jsp:param value="${isVip?config.vipAmount:config.amount}" name="money"/>
			<jsp:param value="${activity.id}" name="bizId"/>
		</jsp:include>
		<script type="text/javascript">
		var isWeixin = '${isWeixin}';
		$(function(){
			$(".payBtn").click(function(){
				 if(isWeixin!="true"){
					  toast("请您进入微信支付");
					  return false;
				 }
				showCoupon(callbackPay,".wrapPage1");
			});
			
		});
		function callbackPay(id){
			var type = 'PREKINDERGARTEN';
			 var body = "${activity.name}";
			 var scopeId = '${scopeId}';
			 if(!scopeId){
				 return;
			 }
			 wxmpprekindergartenpay(body,scopeId,id,type,function(orderId,result){
					 if(result=="ok"){
						 var tourl = "/yzmm/account/activity/kja/task/receivetasklist";
					 	window.location.href="/yzmm/wxmppay/order/checkPay?couponId="+id+"&scopeId="+scopeId+"&activityId=${activityId}&orderId="+orderId+"&toPage="+tourl;
					 }
				 });
			}
		</script>
		
	<script type="text/javascript">
		$(function() {
			//点击弹层上面的X号隐藏弹层
			$('.popupBotImg').click(function(){
				$('.fundPopup').fadeOut();
			});
		})
		function timestart(){
		var timeP  = $(".lasttime");
		var m=29;
		var s=59;
		timestartInterval = window.setInterval(function(){
	       if(s<10){
	       		timeP.html(m+':0'+s);
	       }else{
	      	 	timeP.html(m+':'+s);
	       }
	       s--;
			if(0==m && 0==s){
				window.clearInterval(timestartInterval);
	       }
	       if(s<0){
	       	 	s=59;
		        m--;
	       }
	   },1000)
	}
	timestart();
	</script>
</body>
</html>