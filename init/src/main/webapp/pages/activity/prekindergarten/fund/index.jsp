<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--忽略页面中的邮箱格式为邮箱-->
<meta name="format-detection" content="email=no"/>
<%@include file="../../../header_v2.4.0.jsp" %>
<%@include file="../../../header_wxjsapi.jsp"%>
    <title>喵姐早教说</title>
    <link rel="stylesheet" href="<b:staticUrl>/res/css/prekindergarten/fund.css</b:staticUrl>">
    	<style type="text/css">
	    	.hidden{
	    		display: none;
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
	<!--智能小贴士-->
	<div class="intelligence" style="display: none;">
		<div class="inteBox">
			<div class="inteContent">
				<h3 class="inteTitle">智能小贴士</h3>
				<p class="inteText">亲，你还未关注“喵姐早教说会员号”，无法生成专属海报，请长按关注哟！</p>
				<img src="<b:staticUrl>/res/img/prekindergarten/fund/erm.jpg</b:staticUrl>" alt="" class="inteImg">
				<h4 class="inteMethod">方法：</h4>
				<p class="inteStep">【第1步】长按识别图中二维码，并关注</p>
				<p class="inteStep">【第2步】关注成功后点击“入园适应-进入活动”</p>
				<p class="inteStep">【第3步】点击“入园基金-我的海报”即可</p>
			</div>
			<img src="<b:staticUrl>/res/img/prekindergarten/fund/u1451.png</b:staticUrl>" alt="" class="popupBotImg">
		</div>
	</div>
	<!--生成海报弹层-->
	<div class="fundPopup">
		<div class="popupBox">
            <div class="popupContent">
                <img src="<b:staticUrl>/res/img/prekindergarten/fund/u9743.png</b:staticUrl>" alt="" class="contentImg">
                <h2 class="contentTitH">专属海报已生成</h2>
                <p class="contentLook">前往公众号查看，成功邀请好友加入即可领取200枚基金币哦</p>
                <a href="javascript:void(0);" id="closeShadowBtn" class="shadoweBtn">去看看</a>
            </div>
            <img src="<b:staticUrl>/res/img/prekindergarten/fund/u1451.png</b:staticUrl>" alt="" class="popupBotImg" id="popupBotImg">
        </div>
	</div>
		<!--现金兑换朦层-->
	<div class="cashPopup">
        <div class="exchangeBox">
			<div class="popupContent">
                <img src="<b:staticUrl>/res/img/prekindergarten/fund/u10498.png</b:staticUrl>" alt="" / class="exchangeImg">
                <h2 class="exchangeTitH3">现金兑换</h2>
                <p class="exchangeFund">（<span>10</span> 基金币  = <span>1</span> 元）</p>
                <ul class="fundNum">
                	
                	<li class="numReduce <c:if test="${fundtotal>=15}">current</c:if>" id="numReduce">-</li>
                	<li class="numPic">${fundtotal}</li>
                	<li class="numReduce" id="numPlus">+</li>
                </ul>
                <p class="available">可用基金币<span class="fundtotal">${fundtotal}</span>（枚）</p>
                <a href="javascript:void(0);" class="shadoweBtn exchange" id="cashPopupBtn">确认兑换</a>
                <p class="exchangeTextBtn">以现金红包形式发放到您微信账户，兑换成功后请及时领取，超时未领取基金币自动退还。</p>
            </div>
            <img src="<b:staticUrl>/res/img/prekindergarten/fund/u1451.png</b:staticUrl>" alt="" class="popupBotImg">
		</div>
	</div>
	<!--实物兑换朦层-->
	<div class="goodsPopup">
		<div class="goodsBox">
			<div class="goodsPopupContent">
				<div class="goodsHeader">
					<img src="<b:staticUrl>/res/img/prekindergarten/fund/u10688.jpeg</b:staticUrl>" alt="" class="headerLeftImg"/>
					<div class="headerRightCon">
						<p class="goodsName">米奇小书包</p>
						<p class="goodsFund"><span>800</span> 枚基金币</p>
						<p class="goodsAvailable">当前可用基金币<span>880</span>（枚）</p>
					</div>
				</div>
				<h3 class="exchangeMode">兑换方式：</h3>
				<p class="foodsText">1.  兑换成功将获得一张实物奖品券</p>
				<p class="foodsText">2. 点击券面“填写收货地址”按钮，填写有效收货信息，</p>
				<p class="foodsText">【注】小喵会第一时间帮您安排发货，发货后以短信形式通知您</p>
				<h3 class="nonRefundable">不可退，商品一经兑换，一律不退换基金币；</h3>
				<div  class="shadoweBtn justExchange"  id="goodsPopupBot">
					<a href="javascript:void(0);">立即兑换</a>
				</div>
				<div  class="shadoweBtn1 hidden">
					<a href="javascript:void(0);">立即兑换</a>
				</div>
				<p class="goodsBtn hidden">可用基金币不足</p>
			</div>
			<img src="<b:staticUrl>/res/img/prekindergarten/fund/u1451.png</b:staticUrl>" alt="" class="popupBotImg">
		</div>
	</div>
	<!--现金兑换成功-->
	<div class="succExchangecash">
		<div class="succBox">
			<div class="succPopupContent">
				<img src="<b:staticUrl>/res/img/prekindergarten/fund/u10498.png</b:staticUrl>" alt="" / class="exchangeImg">
				<h3 class="succExchangeTit">现金兑换成功</h3>
				<p class="succExchangeText">恭喜兑换成功，现金红包已发放，返回公众号拆红包</p>
				<a href="javascript:void(0);" class="shadoweBtn openredpack">去拆红包</a>
			</div>
			<img src="<b:staticUrl>/res/img/prekindergarten/fund/u1451.png</b:staticUrl>" alt="" class="popupBotImg">
		</div>
	</div>
	<!--实物兑换成功-->
	<div class="succExchangeGoods">
		<div class="succGoodsBox">
			<div class="succExchangeContent">
				<img src="<b:staticUrl>/res/img/prekindergarten/fund/u10688.jpeg</b:staticUrl>" alt="" / class="succGoodsImg">
				<h3 class="succGoodsTit">米奇小书包兑换成功</h3>
				<div class="succGoodsCard">
					<div class="cardContent">
			    		<h3 class="conTitle">兑换券 | 实物</h3>
			    		<!--左右圆-->
			    		<div class="circular">
			    			<div class="circularLeft"></div>
			    			<div class="circularRight"></div>
			    		</div>
						<p class="costMon">米奇小书包</p>
						<p class="effective">有效期：<span class="starttime">2017.07.25</span> - <span class="endtime">2018.07.24</span></p>
			    	</div>
				</div>
				<a href="javascript:void(0);" class="shadoweBtn">填写收货地址</a>
				<p class="btnLook">该兑换券可在个人中心 - 优惠券中查看</p>
			</div>
			<img src="<b:staticUrl>/res/img/prekindergarten/fund/u1451.png</b:staticUrl>" alt="" class="popupBotImg">
		</div>
	</div>
    <div class="wrapPage">
    	<!--基金二期-->
    	<div class="fund fund_v2">
    		<div class="fundvTitle">
    			<h3 class="titH3">宝宝成长基金</h3>
    			<%-- <p class="titBaby">受益人：<span>${babyNickname }</span></p> --%>
    			<p class="titBaby">喵姐早教说为全国2000万0-6岁宝宝的成长保驾护航</p>
    			<p class="titBaby">出品方：喵姐早教说</p>
    		</div>
    		<div class="detailMon clearfix">
    			<span>${fundtotal}</span> <p>当前可用基金币（枚）</p>
    		</div>
    		<div class="fundGray"></div>
    		<!--基金币明细标题-->
    		<div class="fundvDetailTitle">
    			<div class="detailLine clearfix">
    				<div class="titleLeft fl">基金币明细</div>
    				<a class="titleRight fr" href="/yzmm/account/activity/kja/fund/detail?activityId=${activityId}">查看更多&nbsp;&nbsp;&gt;</a>
    			</div>
    		</div>
    		<div id="bb"></div>
    		<div class="fundGray"></div>
    		<!--推行记录-->
    		<div class="fundvDetailTitle">
    			<div class="detailLine">
    				<div class="titleLeft titleRecord">推行记录</div>
    			</div>
    		</div>
    		<ul class="fundPoster">
    			<li class="posterArrow">生成个人专属海报</li>
    			<li class="posterArrow">分享海报邀请好友加入</li>
    			<li class="posterColor">基金币奖励自动到账</li>
    		</ul>
    		
    		<!-- <a href="javascript:void(0);" class="shadoweBtn" id="shadoweBtnPage">生成我的海报</a> -->
    		
    		<c:if test="${listsize>0 }">
	    		<p class="fundvNothing">·  推行记录  ·</p>
	    		<ul class="fundvimplement clearfix">
	    			 <c:forEach items="${list }" var="item">
		    			<li><img src="${item.passiveShareAlbumUrl }" alt="" /></li>
		    		</c:forEach>
	    		</ul>
    		</c:if>
    		<c:if test="${listsize<=0 }">
	    		<p class="fundvNothing">· 暂无推行记录 ·</p>
    		</c:if>
    		<!-- <div class="fundGray"></div>
    		基金币获取途径
    		<div class="fundvDetailTitle">
    			<div class="detailLine clearfix">
    				<div class="titleLeft fl titleChannel">基金币获取途径</div>
    			</div>
    		</div>
    		来源途径
    		<div class="fundvSource">
    			<h4>每日按时提交任务自测题</h4>
    			<p class="sourceText">提交成功，领取 5 枚基金币</p>
    		</div>
    		<div class="fundvSource fundvSourcePad">
    			<h4>分享单日任务卡</h4>
    			<p class="sourceText">分享成功，领取 4 枚基金币</p>
    		</div>
    		<div class="fundvSource fundvSourcePad">
    			<h4>生成我的海报</h4>
    			<p class="sourceText">点击“我的海报”成功生成即可领取 1 枚基金币，每人每日限领1次</p>
    		</div>
    		<div class="fundvSource fundvSourcePad">
    			<h4>分享专属海报邀请好友加入</h4>
    			<p class="sourceText">生成个人专属海报，分享并邀请好友加入，每成功一位即可领取 200 枚基金币，邀请好友无上限限定</p>
    		</div> -->
    		<div class="fundGray"></div>
    		<div class="fundvDetailTitle">
    			<div class="detailLine clearfix">
    				<div class="titleLeft fl titleExchange">超值兑换</div>
    			</div>
    		</div>
    		<!--超值兑换下面的图片-->
    		<ul class="exchangeGift">
    			<div id="cc"></div>
				<!--现金兑换-->
			<!-- 	<li class="exchangeLi clearfix">
					<div class="exchangeLeft fl">
						<img src="./img/u757.png" alt="">
						<p class="leftText">现 金</p>
					</div>
					<div class="exchangeRight fr">
						<p class="rightText"><span>10</span> 基金币 = <span>1</span>元</p>
						<a href="javascript:void(0)" class="rightBtnOrange">兑&nbsp;&nbsp;换</a>
					</div>
				</li>
				提问券
				<li class="exchangeLi clearfix">
					<div class="exchangeLeft fl">
						<p class="leftMoney">￥26.9</p>
						<p class="leftText">提问券</p>
					</div>
					<div class="exchangeRight fr">
						<p class="rightTop">剩余89份</p>
						<p class="rightText"><span>80</span> 基金币</p>
						<a href="javascript:void(0)" class="rightBtnOrange">兑&nbsp;&nbsp;换</a>
					</div>
				</li>
				课程券
				<li class="exchangeLi clearfix">
					<div class="exchangeLeft fl">
						<p class="leftMoney">￥29.9</p>
						<p class="leftText">课程券</p>
					</div>
					<div class="exchangeRight fr">
						<p class="rightTop">剩余89份</p>
						<p class="rightText"><span>100</span> 基金币</p>
						<a href="javascript:void(0)" class="rightBtnGray">兑&nbsp;&nbsp;换</a>
					</div>
				</li>
				铅笔兑换
				<li class="exchangeLi clearfix">
					<div class="exchangeLeft fl">
						<img src="./img/u1430.jpeg" alt="" class="goodsImg">
						<p class="goods">彩色铅笔</p>
					</div>
					<div class="exchangeRight fr">
						<p class="rightTop">剩余89份</p>
						<p class="rightText"><span>500</span> 基金币</p>
						<a href="javascript:void(0)" class="rightBtnGray">兑&nbsp;&nbsp;换</a>
					</div>
				</li>
				米奇书包
				<li class="exchangeLi clearfix">
					<div class="exchangeLeft fl">
						<img src="./img/u1442.jpeg" alt="" class="goodsImg">
						<p class="goods">米奇书包</p>
					</div>
					<div class="exchangeRight fr">
						<p class="rightTop">剩余89份</p>
						<p class="rightText"><span>800</span> 基金币</p>
						<a href="javascript:void(0)" class="rightBtnGray">兑&nbsp;&nbsp;换</a>
					</div>
				</li>
				保温水杯
				<li class="exchangeLi clearfix">
					<div class="exchangeLeft fl">
						<img src="./img/u1454.jpg" alt="" class="goodsImg">
						<p class="goods">保温水杯</p>
					</div>
					<div class="exchangeRight fr">
						<p class="rightTop topEnd">已兑完</p>
						<p class="rightText"><span>1500</span> 基金币</p>
						<a href="javascript:void(0)" class="rightBtnGray">兑&nbsp;&nbsp;换</a>
					</div>
				</li>
				年卡兑换
				<li class="exchangeLi">
					<h3 class="yearVip">喵姐早教说VIP年卡/张</h3>
					<p class="yearMoney">价值￥499</p>
					<div class="exchangeYear clearfix">
						<p class="rightText fl"><span>3000</span> 基金币</p>
						<a href="javascript:void(0)" class="rightBtnGray fr">兑&nbsp;&nbsp;换</a>
					</div>
				</li> -->
			</ul>
    		<!-- <ul class="fundExchange clearfix">
    		
    			<li class="fundDiv fundDiv1" style="padding-left: 0.6rem;">
    				<div class="changePic changePicBor">
	    				<img src="<b:staticUrl>/res/img/prekindergarten/fund/u9567.png</b:staticUrl>" alt="" />
	    				<p class="cash">现 金</p>
	    			</div>
	    			<div class="changeText clearfix">
	    				<p class="textLeft"><span>10 </span>基金币 = <span>1 </span>元</p>
	    				<p class="textRight">兑换</p>
	    			</div>
    			</li>
    			 <li class="fundDiv">
    				<div class="changeImg">
	    				<img src="./img/f1.jpg" alt="" />
	    			</div>
	    			<p class="changeText"><span>1900</span> 基金币</p>
    			</li>
    			<li class="fundDiv">
    				<div class="changeImg">
	    				<img src="./img/f2.jpg" alt="" />
	    			</div>
	    			<p class="changeText"><span>2500</span> 基金币</p>
    			</li>
    			<li class="fundDiv">
    				<div class="changeImg">
	    				<img src="./img/f3.jpg" alt="" />
	    			</div>
	    			<p class="changeText"><span>4500</span> 基金币</p>
    			</li>
    			<div id="cc"></div>
    		</ul> -->
    		<div class="fundGray"></div>
    		<h3 class="exchangeRules">兑换规则：</h3>
    		<div class="fundRule">
    			<p class="ruleText">&nbsp;【现金红包兑换】10基金币=1元现金，待训练结束，兑换功能自动开启，点击“兑换”按钮，确认金额，公众号会自动将相应金额现金红包发送到您的微信中。</p>
    			<p class="ruleText">&nbsp;【实物奖品兑换】当您的累计基金币≥实物奖品基金币时，兑换功能自动开启，点击“兑换”按钮，确认兑换后并填写收货地址，小喵会尽快安排发货。（注：基金币兑换不找零）
				</p>
    		</div>
    	</div>
    </div>
    <script type="text/javascript">
    $(function(){
    	var fundtotal = parseInt('${fundtotal}');	
    	var numPic = $('.numPic').text();
		var n = parseInt(numPic);
		console.log(n);
		//点击我的海报按钮显示弹层
/* 		$('#shadoweBtnPage').click(function(){
			$('.fundPopup').fadeIn();
		}); */
		//点击现金兑换
	/* 	$('#cashExchange').click(function(){
			$('.cashPopup').fadeIn();
		}); */
		//点击实物兑换
	/* 	$('.goodsExchange').click(function(){
			$('.goodsPopup').fadeIn();
		}); */
		//点击确认兑换现金
		/* $('#cashPopupBtn').click(function(){
			$('.succExchangecash').fadeIn();
			$('.cashPopup').hide();
		}); */
		//点击实物立即兑换弹层
/* 		$('#goodsPopupBot').click(function(){
			$('.succExchangeGoods').fadeIn();
			$('.goodsPopup').hide();
		}); */
		//点击减，基金数字减少
		$('#numReduce').click(function(){
			if(n>=15) {
				n-=5;
				$('.numPic').html(n);
				$('.fundNum').children().eq(0).addClass('current');
				$('.fundNum').children().eq(2).addClass('current');
				if(n==10) {
					$('.fundNum').children().eq(0).removeClass('current');
				}
			}else {
				$('.fundNum').children().eq(0).removeClass('current');
			}
		});
		//点击加 ，基金币增加  最多不能超过用户总共拥有的基金币数			
		$('#numPlus').click(function(){
			if(n<fundtotal ||n<0){
				n+=5;
				$('.numPic').html(n);
				$('.fundNum').children().eq(2).addClass('current');
				$('.fundNum').children().eq(0).addClass('current');
				if(n==fundtotal) {
					$('.fundNum').children().eq(2).removeClass('current');
				}
			}else {
				$('.fundNum').children().eq(2).removeClass('current');
			}
				
		});
		//点击弹层上面的X号隐藏弹层
		$('.popupBotImg').click(function(){
			$('.fundPopup').fadeOut();
			$('.cashPopup').fadeOut();
			$('.goodsPopup').fadeOut();
			$('.succExchangecash').fadeOut();
			$('.succExchangeGoods').fadeOut();
			$('.intelligence').fadeOut();
		});
			//点击我的海报按钮显示弹层
			$('#shadoweBtnPage').click(function(){
				HH.ajax({
		    		data:{activityId:'${activityId}'},
					url:"/yzmm/account/activity/kja/fund/sendPoster",
				    callback:function(data){
				   		if(data.success){
				   			$('.fundPopup').fadeIn();
			   			}else{
			   				if(data.code=='100064'){
			   					$(".intelligence").fadeIn();
			   				}else{
			   					toast(data.msg);
			   				}
			   			}
				    }
				});
			});
			//点击弹层上面的X号隐藏弹层
			$('#popupBotImg').click(function(){
				window.location.reload();
				$('.fundPopup').fadeOut();
			});
			$("#closeShadowBtn").click(function(){
				wx.closeWindow();
			});
			$(".openredpack").click(function(){
				wx.closeWindow();
			});
			HH.ajax({
	    		data:{pageSize:2,activityId:'${activityId}'},
				url:"/yzmm/account/activity/kja/fund/ajaxDetail",async:false,
			    callback:function(data){
			   		if(data.success){
			   			var h = "";
			   			var len = data.list.length;
			   			for (var i = 0; i < len; i++) {
							var o = data.list[i];
							//h +=  pageIndex+" "+o.title+"<br><hr><br>";
							var conn = (o.type=='OUT'?"-":"+");
							var numcolor = (o.type=='OUT'?"detailColor":"");
							h += '<div class="fundvDetailTitle clearfix">';
			    				h+='<div class="detailLine clearfix">';
		    					h+='<p class="titleTask">'+o.info+'</p>';
		    					h+='<div class="detaildate fl">'+fmtSecond(o.createTime)+'</div>';
		    					h+='<div class="detailNum fr '+numcolor+'">'+conn+' '+(o.balance/100)+' <span>枚</span></div>';
		    				h+='</div>';
		    			h+='</div>';
						}
			   			$("#bb").append(h);
		   			}
			    }
			});
			HH.ajax({
				url:"/yzmm/account/activity/kja/fund/ajaxGetFundPrize",
			    callback:function(data){
			   		if(data.success){
			   			var h = "";
			   			var len = data.list.length;
			   			for (var i = 0; i < len; i++) {
							var o = data.list[i];
							var cs=(i%2)?"padding-left: 0.6rem;":"padding-right: 0.6rem;";
							if(o.prizeType=='CASH'){
								h+='<li class="exchangeLi clearfix">';
									h+='<div class="exchangeLeft fl">';
										h+='<img src="<b:staticUrl>/res/img/prekindergarten/fund/u9567.png</b:staticUrl>" alt="">';
										h+='<p class="leftText">现 金</p>';
									h+='</div>';
									h+='<div class="exchangeRight fr">';
										h+='<p class="rightText"><span>10</span> 基金币 = <span>1</span>元</p>';
										h+='<a href="javascript:void(0)" data-bizid="'+o.id+'" id="cashExchange" class="rightBtnOrange cashExchange">兑&nbsp;&nbsp;换</a>';
									h+='</div>';
								h+'</li>';
							}else if(o.prizeType=='OBJECT'){
								/* h+='<li class="fundDiv fundDiv1" style="'+cs+';">';
				    				h+='<div class="changeImg">';
					    				h+='<img src="'+o.imgUrl+'" alt="" />';
					    			h+='</div>';
				    				h+='<div class="changeText clearfix">';
					    				h+='<p class="textLeft"><span>'+o.fundNum/100+'</span> 基金币</p>';
					    				h+='<p class="textRight objectExchange" data-name="'+o.name+'" data-img="'+o.imgUrl+'" data-bizid="'+o.id+'" data-fundnum="'+o.fundNum/100+'" style="color:#0099ff;">兑换</p >';
					    			h+='</div>';
					    		h+='</li>'; */
								h+='<li class="exchangeLi clearfix">';
									h+='<div class="exchangeLeft fl">';
										h+='<img src="'+o.imgUrl+'" alt="" class="goodsImg">';
										h+='<p class="goods">'+o.name+'</p>';
									h+='</div>';
									h+='<div class="exchangeRight fr">';
										h+='<p class="rightTop">剩余'+o.surplusPrizeNum+'份</p>';
										h+='<p class="rightText"><span>'+o.fundNum/100+'</span> 基金币</p>';
										h+='<a href="javascript:void(0)"  data-name="'+o.name+'" data-img="'+o.imgUrl+'" data-bizid="'+o.id+'" data-fundnum="'+o.fundNum/100+'" class="rightBtnGray objectExchange">兑&nbsp;&nbsp;换</a>';
									h+='</div>';
								h+='</li>';
							}else if(o.prizeType=='COUPON'){
								var namee = o.name;
								if(namee.length>10){
									h+='<li class="exchangeLi">';
										h+='<h3 class="yearVip">'+o.name+'</h3>';
										h+='<p class="yearMoney">'+o.rule+'</p>';
										h+='<div class="exchangeYear clearfix">';
											h+='<p class="rightText fl"><span>'+o.fundNum/100+'</span> 基金币</p>';
											h+='<a href="javascript:void(0)" data-bizid="'+o.id+'" class="rightBtnGray fr justExchangeCoupon">兑&nbsp;&nbsp;换</a>';
										h+='</div>';
									h+='</li>';
								}else{
									h+='<li class="exchangeLi clearfix">';
										h+='<div class="exchangeLeft fl">';
											h+='<p class="leftMoney">'+o.rule+'</p>';
											h+='<p class="leftText">'+o.name+'</p>';
										h+='</div>';
										h+='<div class="exchangeRight fr">';
											h+='<p class="rightTop">剩余'+o.surplusPrizeNum+'份</p>';
											h+='<p class="rightText"><span>'+o.fundNum/100+'</span> 基金币</p>';
											h+='<a href="javascript:void(0)" data-bizid="'+o.id+'" class="rightBtnGray justExchangeCoupon">兑&nbsp;&nbsp;换</a>';
										h+='</div>';
									h+='</li>';
								}
							}
						}
			   			$("#cc").append(h);
			   			//点击现金兑换
			   			$('.cashExchange').on("click",function(){
			   				if(fundtotal<10){
			   					toast("基金币10枚起兑，请加油~");
			   					return;
			   				}
			   				var bizid = $(this).data("bizid");
			   				$('.cashPopup .exchange').data("bizid",bizid);
			   				$('.cashPopup').fadeIn();
			   			});
			   			$(".objectExchange").on("click",function(){
			   				var num = $(this).data("fundnum");
			   				if(fundtotal<num){
			   					$(".shadoweBtn").hide();
			   					$(".shadoweBtn1").show();
			   				}else{
			   					$(".shadoweBtn").show();
			   					$(".shadoweBtn1").hide();
			   				}
			   				var img = $(this).data("img");
			   				$('.goodsPopup').find(".headerLeftImg").attr('src',img);
			   				var name = $(this).data("name");
			   				$(".goodsPopup").find(".goodsName").html(name);
			   				//
			   				$(".goodsPopup").find(".goodsFund").find("span").html(num);
			   				$(".goodsPopup").find(".goodsAvailable").find("span").html(fundtotal);
			   				
			   				var bizid = $(this).data("bizid");
			   				$(".goodsPopup").find(".justExchange").data("bizid",bizid);
			   				$('.goodsPopup').fadeIn();
			   			});
			   			$(".justExchange").on("click",function(){
			   				var bizid = $(this).data("bizid");
			   				HH.ajax({
			   		    		data:{bizId:bizid},
			   					url:"/yzmm/account/activity/kja/fund/objectExchange",
			   				    callback:function(data){
			   				   		if(data.success){
			   				   		var o =	data.ext;
			   				   		var img = $('.goodsPopup').find(".headerLeftImg").attr('src');
			   				   		$('.succExchangeGoods').find('.succGoodsImg').attr('src',img);
			   				   		$('.succExchangeGoods').find('.succGoodsTit').html($(".goodsPopup").find(".goodsName").html());
			   				   		$('.succExchangeGoods').find('.costMon').html($(".goodsPopup").find(".goodsName").html());
			   				   		$('.succExchangeGoods').find('.shadoweBtn').attr('href','/yzmm/account/usercoupon/toCompleteDeliverInfo?id='+o.id+"&backgroundImg="+img);
			   				 		var validStartTime='${o.validStartTime}';
			   			        	if(validStartTime){
			   			        		$(".starttime").html(fmtSecondyyyMMDDdot(validStartTime));
			   			        	}
			   			        	var validEndTime='${o.validEndTime}';
			   			        	if(validEndTime){
			   			        		$(".endtime").html(fmtSecondyyyMMDDdot(validEndTime));
			   			        	}
			   				   		$('.succExchangeGoods').fadeIn();
					   				$('.goodsPopup').hide();
			   			   			}else{
			   			   				toast(data.msg);
			   			   			}
			   				    }
			   				});
			   			
			   			});
			   			
			   			$(".justExchangeCoupon").on("click",function(){
			   				var bizid = $(this).data("bizid");
			   				HH.ajax({
			   		    		data:{bizId:bizid},
			   					url:"/yzmm/account/activity/kja/fund/objectExchange",
			   				    callback:function(data){
			   				    	if(data.success){
			   				    		toast("兑换成功，请去【我】--【优惠券】下，查看使用~");
			   			   			}else{
			   			   				toast(data.msg);
			   			   			}
			   				    }
			   				});
			   			
			   			});
		   			}
			    }
			});
			$(".exchange").on("click",function(){
   				var bizid = $(this).data("bizid");
   				var balance= parseInt($('.numPic').text());
   				if(fundtotal<balance){
   					toast("基金币不足");
   					//return;
   				}
   				HH.ajax({
   		    		data:{bizId:bizid,balance:balance*100},
   					url:"/yzmm/wxmppay/redpack/exchangeFund",
   				    callback:function(data){
   				   		if(data.success){
	   				   		$('.succExchangecash').fadeIn();
	   						$('.cashPopup').hide();
   			   			}else{
   			   				toast(data.msg);
   			   			}
   				    }
   				});
   			});
    });
    </script>
</body>
</html>