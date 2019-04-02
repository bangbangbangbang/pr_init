<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <!--忽略页面中的邮箱格式为邮箱-->
    <meta name="format-detection" content="email=no">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
    <meta name="format-detection" content="telephone=no,address=no,email=no">
    <meta name="keywords" content="喵姐,喵姐早教说,0到6岁早期教育,家庭教育,家长教育,父母课堂,育儿知识,儿童教育,母婴育儿,">
    <meta name="description" content="喵姐早教说是喵姐高寿岩创办的为家庭教育提供专业靠谱的0到6岁早期教育、育儿知识的平台。">
    <title>喵姐早教说-幼儿园学籍卡</title>
     <%@include file="../../header_v2.4.0.jsp" %>
    <%@include file="../../header_wxjsapi.jsp"%>
    <link rel="stylesheet" href="<b:staticUrl>/res/css/style-v2.0.css</b:staticUrl>">
    <link rel="stylesheet" href="<b:staticUrl>/res/css/activity/prekindergarten/qualify.css</b:staticUrl>">
    <style type="text/css">
		.share1 {
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
		.share1 .shareBox {
		    width: 100%;
		    padding-top: 1.12rem;
		    position: relative;
		}
		.share1 .sharearrow {
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
		.share1 p {
		    margin-bottom: 0.26666667rem;
		    text-align: center;
		    color: #f8e71c;
		}
		.showname{
			font-size: 0.5rem;
			padding: 0.1rem 0.1rem 0rem;
			color: #000;
			line-height: 0.9rem;
			font-weight: bold;
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
							shareMan:'${uid}',
							activityId:'${activityId}',
							activityType:'PREKINDERGARTEN'
						},
						url:"/yzmm/account/pyramidSchemeShareCarryOut/create",
						async:false,
					    callback:function(data){
					   		if(data.success){
					   			HH.href('/yzmm/account/activity/prekindergarten/checkinPage?scopeId=${scopeId}&&configId=${configId}');
				   			}else{
				   				toast(data.msg);
				   			}
					    }
					});
			    },
			    shareAppMessage:function(bool){
			    	HH.ajax({
						data:{
							shareMan:'${uid}',
							activityId:'${activityId}',
							activityType:'PREKINDERGARTEN'
						},
						url:"/yzmm/account/pyramidSchemeShareCarryOut/create",
						async:false,
					    callback:function(data){
					   		if(data.success){
					   			HH.href('/yzmm/account/activity/prekindergarten/checkinPage?scopeId=${scopeId}&&configId=${configId}');
				   			}else{
				   				toast(data.msg);
				   			}
					    }
					});
			    }
		};
		initwxfx(wxfenxiangcb);
	</script>
</head>
<body>
    <div class="wrap">
        <div class="public">
            <div class="schoolCard">
                <!--上面的学籍卡内容-->
                <div class="cardMess">
                    <div class="messContent">
                        <div class="contentHeader">
                            <h2>学 籍 卡</h2>
                            <p >宝宝：<span>${babynickname }</span></p>
                            <p class="headerParent">家长：<span>${nickname}</span></p>
                        </div>
                        <div class="contentTarget">
                            <h4>训练目标：</h4>
                            <ul>
                                <li>• 语言是社交能力提升</li>
                                <li>• 社会适应能力提升</li>
                                <li>• 语言是社交能力提升</li>
                                <li>• 社会适应能力提升</li>
                            </ul>
                            <p>训练周期：${studyCircle }</p>
                        </div>
                    </div>  
                </div>
                <!--链接图片-->
                <div class="connect">
                  <%--   <img src="<b:staticUrl>/res/img/activity/prekindergarten/u874.png</b:staticUrl>" alt="" class="connectLeft">
                    <img src="<b:staticUrl>/res/img/activity/prekindergarten/u874.png</b:staticUrl>" alt="" class="connectRight"> --%>
                </div>
                <!--志愿者记录-->
                <div class="obtainMess volunteer" style="display: none;">
                    <div class="messContent cardContent">
                        <div class="contentHeader volunteerHeader">
                            <h3>志愿者记录</h3>
                            <div class="volunteerText">
                                <p><font>7月14日</font>之前邀请3位好友成功报名家庭版入园适应训练活动，即可获取免费学习资格。</p>
                            </div>
                            <ul class="clearfix">
                                <li><img src="<b:staticUrl>/res/img/activity/prekindergarten/u1041.png</b:staticUrl>" class="" alt=""></li>
                                <li><img src="<b:staticUrl>/res/img/activity/prekindergarten/u1041.png</b:staticUrl>" class="" alt=""></li>
                                <li><img src="<b:staticUrl>/res/img/activity/prekindergarten/u1041.png</b:staticUrl>" class="" alt=""></li>
                            </ul>
                            <div class="volunteerBtn weiStartActivity" onclick="$('.share1').show()">
                                <a href="#">邀请好友加入</a>
                            </div>
                            <div class="volunteerTime">
                                <span></span>
                            </div>
                            <div class="volunteerBtn startActivity" style="display:none;">
                                <a href="javascript:HH.href('/yzmm/account/activity/prekindergarten/checkinSuccessPage?scopeId=${scopeId }')">开启活动</a>
                            </div>
                        </div>
                    </div>  
                </div>
                <!--付费学员通道-->
                <div class="cardMess payStudentPassageway" style="display:block;">
                    <div class="messContent">
                        <div class="payContent">
                            <h4>付费学员通道（付费成功立即开营）</h4>
                            <div class="choiceCycle">
                                <div class="costMon">
                                    <span class="costCur">￥</span>
                                      <c:if test="${isVip}">
                                      	   <span class="costNum">${vipAmount}</span>
                                    		<span class="costOrig">/ 原价 ￥199</span>
                                    </c:if>
                                    <c:if test="${!isVip}">
                                    	 <span class="costNum">${amount}</span>
                                    	 <span class="costOrig">/ 原价 ￥199</span>
                                    </c:if>
                                </div>
                            </div>
                            <p>你还剩  <span class="lasttime">29:32</span>  分钟支付，逾时恢复原价</p>
                            <div class="volunteerBtn payBtn">
                                <a href="#">支付学费</a>
                            </div>
                        </div>
                    </div>  
                </div>
                <!--下面的获取通道内容-->
                <div class="obtainMess qudao">
                    <div class="messContent cardContent">
                        <div class="contentHeader">
                            <h3>  报名方式</h3>
                            <div class="cardPay clearfix payBtn">
                                <div class="payText">
                                    <h4>限时优惠抢购通道</h4>
                                   <p>原价199，限时折扣${amount}，会员折上5折，报名成功后，不可退换。</p>
                                </div>
                                <img src="<b:staticUrl>/res/img/activity/prekindergarten/u900.png</b:staticUrl>" alt="">
                            </div>
                            <div class="cardPay clearfix">
                                <div class="payText">
                                    <h4>宣传志愿者通道(少量名额)</h4>
                                    <p>分享活动链接，邀请3位好友成功报名，即可免费参与本次活动</p>
                                </div>
                                <img src="<b:staticUrl>/res/img/activity/prekindergarten/u900.png</b:staticUrl>" onclick="$('.share1').show()" alt="">
                            </div>
                        </div>
                    </div>  
                </div>
            </div>
        </div>
    </div>
    <div class="share1">
		<div class="shareBox">
			<div class="sharearrow"></div>
				<p class="font15" style="margin-top: 40px;">邀请三位好友成功报名“家庭版入园适应训练”活动</p>
				<p class="font15">即可免费参与！</p>
		</div>
	</div>
	<script src="<b:staticUrl>/res/js/wxmppay.js</b:staticUrl>"></script>
	<jsp:include page="../../pay/coupon_new.jsp">
		<jsp:param value="PREKINDERGARTEN" name="businessType"/>
		<jsp:param value="${activity.img}" name="imgUrl"/>
		<jsp:param value="${activity.name}" name="name"/>
		<jsp:param value="0" name="count"/>
			<jsp:param value="${money}" name="money"/>
		<jsp:param value="${activity.id}" name="bizId"/>
	</jsp:include>
	<script type="text/javascript">
	var isWeixin = '${isWeixin}';
	var money = '${money}';
	$(function(){
		$(".payBtn").click(function(){
			 if(isWeixin!="true"){
				  toast("请您进入微信支付");
				  return false;
			 }
			showCoupon(callbackPay,".wrap");
		});
		
	})
	
	function callbackPay(id){
		var type = 'PREKINDERGARTEN';
		 var money = '${money}';
		 var body = "家庭版入园适应训练";
		 var scopeId = '${scopeId}';
		 if(!scopeId){
			 return;
		 }
		 wxmpprekindergartenpay(money,body,scopeId,id,type,function(orderId,result){
				 if(result=="ok"){
					 var tourl = "/yzmm/account/activity/prekindergarten/checkinSuccessPage";
				 	window.location.href="/yzmm/wxmppay/order/checkPay?couponId="+id+"&scopeId="+scopeId+"&orderId="+orderId+"&toPage="+tourl;
				 }
			 });
		}
    var timestartInterval="";
    
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
    <script type="text/javascript">
    var kpiNum=0;//完成指标数量
    var imgUlrsLeng=-1;//被分享人，报名成功头像数量，默认-1
    var 
    $(function(){
    	$(".share1").click(function(){
 			$(".share1").hide();
 		});
    	
    	//显隐渠道or志愿者记录
    	if('${carryOut.id }'!=''){
    		$('.volunteer').css('display','block');
    		$('.qudao').css('display','none');
    		kpiNum=parseInt('${carryOut.kpiNum }');
    	}
    	
    	//渠道显示则直接支付不显示
    	var qudao=$('.qudao').css('display');
    	if(qudao=='block'){
    		$('.payStudentPassageway').css('display','none');
    	}
    	
   		var actDays=parseInt('${actDays}')*24*60*60;//活动周期 换算成秒
   		
    	if('${startGoSchoolTime}'!=''&&'${carryOut.endTime }'!=''&&'${actDays}'!=''){
    		var startGoSchoolTime=parseInt('${startGoSchoolTime}');//开园时间
    		var endTime=parseInt('${carryOut.endTime }');
    		var sa=startGoSchoolTime-actDays-endTime;//开园时间-活动周期-分享活动结束时间
    		if(sa<0){
    			$('.volunteer').css('display','none');
    		}
    	}else{
    		var startGoSchoolTime=parseInt('${startGoSchoolTime}');//开园时间
    		var unixTime=new Date().getTime()/1000;
    		var sanDaym=3*60*60*24;
    		var num=startGoSchoolTime-unixTime-actDays-sanDaym;
    		if(num<0){
    			$('.payStudentPassageway').css('display','block');
    			$('.qudao').css('display','none');
    		}
    	}
    	
    	//志愿者被分享头像
    	if('${imgUrls}'!=''){
    	 	var imgUrls=JSON.parse('${imgUrls}');
        	var clearfix = $('.volunteerHeader').find('.clearfix').find('img');
        	for(var i=0;i<imgUrls.length;i++){
        		clearfix[i].src=imgUrls[i];
        		$(clearfix[i]).addClass("volunteerImg");
        		
        	}
        	imgUlrsLeng=imgUrls.length;
    	}
    	if(kpiNum<=imgUlrsLeng){
    		$('.weiStartActivity').css('display','none');
    		$('.volunteerTime').css('display','none');
    		$('.startActivity').css('display','block');
    		$('.payStudentPassageway').css('display','none');
    	}
    	
    	//志愿者记录截止有效日期
    	$('.volunteerText font').html(fmtDate(new Date(parseInt('${carryOut.endTime }')*1000),'MM月dd日'));
    	//倒计时
    	var endTime='${carryOut.endTime }';
    	var time=parseInt(endTime)-new Date().getTime()/1000;
    	var timer = setInterval(function(){
    		var dateStr=formatSecondsDDHHmmss(time);
    		$('.volunteerTime span').html("⏳ "+dateStr);
    		time--;
    		if(time<0){
    			//删除定时器
    	    	clearInterval(timer);
    		}
    	},1000);//1000为1秒钟
    })
    </script>
</body>
</html>