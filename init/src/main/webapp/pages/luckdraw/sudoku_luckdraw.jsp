<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--忽略页面中的邮箱格式为邮箱-->
<meta name="format-detection" content="email=no"/>
 <%@include file="../header_v2.0.jsp" %>
 <%@include file="../header_wxjsapi.jsp"%>
 <link rel="stylesheet" href="<b:staticUrl>/res/css/navigator.css</b:staticUrl>">
<title>九宫格抽奖</title>
<style type="text/css">
.miaoBanner{
	position: relative;
}
.miaoBanner span{
	font-family: 'PingFangSC-Regular', 'PingFang SC';
	font-size: 10px;
	color: #5C291D;
	position: absolute;
	bottom: 1%;
	left: 33%;
}
body{
	background: url(" ${luckDrawManager.bgImg }") center center no-repeat;
	background-color:  ${luckDrawManager.bgColor };
}
.sudoku_ul {
	padding:0px;
}
.sudoku_ul li {
	list-style:none;
	background:white;
	width:calc(33.33% - 20px);
	margin:10px;
	float:left;
	text-align: center ;
	position: relative ;
}
.section .sudoku{
	border-image: url("<b:staticUrl>/res/img/luckdraw/sudoku/border.png</b:staticUrl>") 10 10 round ;
	overflow: auto;
	position: relative ;
}
.coupon{
	height: 40px;
	background: url("<b:staticUrl>/res/img/luckdraw/sudoku/coupon.png</b:staticUrl>") center center no-repeat;
	background-size: 80%;
	position: relative;
}
.coupon span{
	font-size: 14px;
	color:#961E0F;
	position: absolute ;
	top:34%;
	left: 30%;
}
.warp{
	font-size: 12px;
	color:#961E0F;
	font-family: 'TektonPro-Bold', 'Tekton Pro Bold', 'Tekton Pro';
	text-align: center ;
	border: 0.03rem solid #961E0F;
	border-radius: 20px;
	background-color: white ;
}
.name{
	font-size: 14px;
	color:#961E0F;
	font-family: 'TektonPro-Bold', 'Tekton Pro Bold', 'Tekton Pro';
	text-align: center ;
}
.name1{
	font-size: 16px;
	color:#961E0F;
	font-family: 'TektonPro-Bold', 'Tekton Pro Bold', 'Tekton Pro';
	text-align: center ;
}
.luckdraw_empty{
	height: 70px;
	background: url("<b:staticUrl>/res/img/luckdraw/sudoku/empty.png</b:staticUrl>") center center no-repeat;
	background-size: 60%;
	border-radius: 20px;
	margin-top: 25px;
}
.lihe{
	height: 70px;
	background-size: 80%;
	border-radius: 20px;
}
.cntBlock{
		 text-align: center ;
		 padding-top: 0.1rem;	
}
 .cntTitle{
	 	display: inline-block;
		text-align: center;
		padding: 0.1rem 0 0 0;
		width: 50%;
		border-bottom: 0.03rem solid #961E0F;
 }
 .cntTitle span{
 	font-family: 'ArialMT', 'Arial';
 	font-size: 0.45rem;
	position: relative ;
	bottom: -0.4rem;
	color:${luckDrawManager.fontColor };
	background-color: ${luckDrawManager.bgColor };
	padding: 0 0.4rem;
 }
.cntContent{
	color:${luckDrawManager.fontColor };
}
.cntContent ul{
	padding: 0.5rem 0.8rem 0.5rem 0.8rem;
	line-height: 0.5rem;
	list-style-type :square;
}
.cntContent li{
	font-size: 0.34rem;
	text-align: left ;
}
</style>
<style type="text/css">
table {
	width: 100%;
	border: 0px; 
  	border-color: transparent;
 	border-collapse: collapse; 
	border-spacing: 0;
	font-size: 0.3rem;
}
table td{
 padding: 0.1rem;
 width: 33.33%;
 height: 3.11rem;
}
table td .warp{
	width:100%;
	height:100%;
	position: relative;
}
.dianliang{
background-color: #FFCC00;!important;
}
.dianwo{
width: 100%;
height: 100%;
	font-size: 12px;
	font-family: 'TektonPro-Bold', 'Tekton Pro Bold', 'Tekton Pro';
	text-align: center ;
	text-align: center ;
	font-size:0.5rem;
	border-radius: 20px;
	background-color: red;
}
.dianwo ul{
	position: absolute ;
	top: 30%;
	left: 20%;
}
</style>
<script type="text/javascript">
var donghuan = false;
var index = 0;
var speed = 550;
var zjbianhao = 1000;
var noticeUrl='${noticeUrl}';
var skipUrl='${skipUrl}';

function xuanze(i){
	if(0==i){
		i = 0;
		zjbianhao = 1000;
		speed = 550;
		dianling(0);
		donghuan = true;
	}
	i++;
	index = i;
	if(index<5){
		speed -=20;
	}else if(index<14){
		speed -=40;
	}else if(index<24){
		speed = speed;
	}else if(loading){
		
	}else{
		speed +=50;
	}
	if(index >= zjbianhao){
		over();
		donghuan = false;
		return;
	}
	
	/* console.log("index:"+index +" "+speed+" "+zjbianhao); */
	window.setTimeout(function(){
		/* console.log(index%8); */
		dianling(index%8);
		xuanze(index);
	},speed);
}

function over(){
	if(noticeUrl!=""){
		//执行通知url
		HH.ajax({
			url: noticeUrl,
			callback:function(data){
			}
		});
	}
	//alert(winningId);
	if(winningId==-1){
		$('.luckdrawFa').show();
	}else{
		$('.luckdrawSe').show();
		var obj=$(".dianliang").find('.lihe');
		var typeAmount=obj.data('amount');
		
		var zjtitle=$('#zjtitle b');//中奖标题
		
		if(typeAmount!="undefined"){
			zjtitle.html("¥"+typeAmount/100);
		}else{
			zjtitle.html(obj.data('name'));
		}
		
		$('#zjcontent').html(obj.data('name'));//中奖内容
		
		var validTime=$('#validTime');//有效期
		
		var useRange=$('#useRange');//适用范围
		var bustype=obj.data('bustype');
		var couponid=obj.data('couponid');//优惠券id
		
		if(bustype=='COURSE'){
			useRange.html('喵姐说微课');
			$('.rulebuttom').find('a').on('click',function(){
				tocourse();
			});
		}else if(bustype=='MIAOQA'){
			useRange.html('1对1咨询专场');
			$('.rulebuttom').find('a').on('click',function(){
				HH.href('/yzmm/account/miaoqa/gotoAskMiaoQa');
			});
		}else if(bustype=='GODDESSACTIVITY'){
			useRange.html('行动计划专场');
			$('.rulebuttom').find('a').on('click',function(){
				toactivity();
			});
		}else if(bustype=='ALL'){
			useRange.html('喵姐说全网站');
			$('.rulebuttom').find('a').on('click',function(){
				HH.href('/yzmm/index');
			});
		}else if(bustype=='YEARCARD'){
			useRange.html('购买vip会员卡');
			$('.rulebuttom').find('a').on('click',function(){
				HH.href('/yzmm/wxmppay/vipstatus');
			});
		}
		
		var validstarttime=obj.data('validstarttime');
		var validendtime=obj.data('validendtime');
		validTime.html(fmtDate(new Date(validstarttime*1000),'yyyy.MM.dd')+"-"+fmtDate(new Date(validendtime*1000),'yyyy.MM.dd'));
		
		if(typeAmount=="undefined"){
			typeAmount="";
		}
		HH.ajax({
			url: "/yzmm/account/luckDraw/luckDraw",
			data:{"couponId":couponid,"businessOriginalId":'${luckDrawManager.activityId}',"typeAmount":typeAmount,'winningId':winningId},
			callback:function(data){
				if(data.success){
					
				}else{
					toast(data.msg);
				}
			}
		});
	}
}

function dianling(index){
	$(".dianliang").removeClass("dianliang");
	$(".d"+index).addClass("dianliang");
}
var loading=false;//loading 加载
var winningId='';//中奖id

$(function(){
	var w = $("table td").width();
	$("table td").height(w);
	
	$("table td .dianwo").click(function(){
		if(donghuan){
			return;
		}
			//TODO 恢复
		/* try{
			if(parseInt('${personalDayLuckDrawNum }')<=0){
				toast('抽奖次数不足');
				return;
			}
		}catch (e) {
		} */
		
		loading=true;

		var tempbh = 0;
		HH.ajax({
			url: "/yzmm/account/luckDraw/startDraw",
			data:{"ldwid":'${luckDrawManager.id}'},
			callback:function(data){
				if(data.success){
					winningId=data.ext;
				}else{
					winningId=-1;
				}
				loading=false;
				if(winningId==-1){
					var empty_index=$('table ').find('.warp').find('.luckdraw_empty').parent().attr('class').substring(6,7);
					tempbh=parseInt(empty_index);
				}else{
					var lihes=$('table ').find('.lihe');
					lihes.each(function(){
						if($(this).data('prizeid')==winningId){
							var empty_index=$(this).parent().attr('class').substring(6,7);
							tempbh=parseInt(empty_index);
						}
					});
				}
				
				loading=false;
				
				var quan = parseInt(index/8);
				var last3 = 0 ;
				if(quan<3){
					last3 = 24;
				}else{
					last3 = quan*8;
				}
				/* console.log("------------------------last3:"+last3); */
				zjbianhao = last3 + 8 + tempbh+1;
				console.log("r:"+tempbh +" "+zjbianhao);
			}
		});
		xuanze(0);
	});
});

</script>
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
//测试自定义页面跳转
//var loginReferParam = "/yzmm/account/miao/topic/viewDetailIncludeReply?id=252";
//loginBar.setLoginReferParam(loginReferParam);
</script>

</head>
<body>
<div class="mainDiv">
<div class="miaoBanner" >
	<img src="${luckDrawManager.titleImg }" >
</div>
<div class="section">
<div class="sudoku">

	<table class="">
		<tr>
			<td>
				<div class="warp d0">
					<div class="luckdraw_empty"></div>
				</div>
			</td>
			<td>
				<div class="warp d1">
					<div class="luckdraw_empty"></div>
				</div>
			</td>
			<td>
				<div class="warp d2">
					<div class="luckdraw_empty"></div>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div class="warp d7">
					<div class="luckdraw_empty"></div>
				</div>
			</td>
			<td style="position: relative;color: white ;">
				<div class="dianwo">
					<ul>
						<li><span>点我抽奖</span></li>
						<li><p style="font-size: 10px">剩余${personalDayLuckDrawNum }次</p></li>
					</ul>
				</div>
			</td>
			<td>
				<div class="warp d3">
					<div class="luckdraw_empty"></div>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div class="warp d6">
					<div class="luckdraw_empty"></div>
				</div>
			</td>
			<td>
				<div class="warp d5">
					<div class="luckdraw_empty"></div>
				</div>
			</td>
			<td>
				<div class="warp d4">
					<div class="luckdraw_empty"></div>
				</div>
			</td>
		</tr>
	</table>
	</div>
</div>
<div class="cntBlock">
	<div class="cntTitle">
		<span class="title">使用说明</span>
	</div>
	<div class="cntContent">
		<ul>
			<li>1）中奖优惠券即时领取，用户需在券面指定的有效期内使用，过期则失效；</li>
			<li>2）中奖后可获得三种优惠券：超值现金券（可抵扣平台付费）、超值兑换券（可兑换平台各项课程及提问或活动）、实物兑换券（可兑换实物奖品）；</li>
			<li>3）现金券在购买优惠券对应的喵姐早教说产品时根据券面值抵扣相应金额；</li>
			<li>4）兑换券可以在相对应的产品中直接换得免费使用权限；</li>
			<li>5）实物兑换券获得后可联系客服人员兑换相应说明的实物奖品；</li>
			<li>6）用户若因任何原因取消含优惠券订单，则视为自动放弃此次优惠，不再享受福利价；</li>
			<li>7）如用户参与活动的订单产生退款等情形，本平台有权利收回用户抽奖所得优惠券。</li>
			<li>8）抽奖已经开始后，用户点击返回、底部菜单等其他按钮，视为用户选择离开抽奖，自动放弃本次抽奖机会。</li>
			<li>9）独乐乐不如众乐乐，获得的优惠券可赠送给身边的朋友，互相分享也是一种美德。中奖资格的排除：活动过程中如发现有碍其他用户公平参加活动或违反本活动目的之行为（包括但不限于作弊领取、机器刷奖、恶意套现等）本公司将取消有此行为的用户参加本次活动的资格或其因参加活动所获赠品或因此享有的利益。奖品发放期限及方式：</li>
			<li>1、实物奖品将在获奖后7-10个工作日内发货；</li>
			<li>2、平台优惠券由喵姐早教说平台在1-2个工作日内发放至用户账户，优惠券仅可在喵姐早教说平台使用；</li>
			<li>3、优惠券可在个人中心【我的优惠券】栏中查看全部中奖记录；</li>
			<li>4、如对规则说明或抽奖优惠券有任何疑问的请联系客服热线：010-57207965。</li>
		</ul>
	</div>
	<div class="cntBottom">
	</div>
</div>
</div>
<%@include file="showFaToast.jsp"%>
<%@include file="showSeToast.jsp"%>
<jsp:include page="/pages/header_footer.jsp">
		<jsp:param value="2" name="menu"/>
</jsp:include>
<script type="text/javascript">
$(function(){
	var luckDrawPrizeList=JSON.parse('${luckDrawPrizeList}');
	var warps=$('.section').find('.warp');
	for (var int = 0; int < 8; int++) {
		var ldp=luckDrawPrizeList[int];
		/* if(int>=4){
			ind=int+1;
		} */
		if(ldp.type=='EMPTY'){
			$(warps[int]).html('<div class="luckdraw_empty" style="background: url(\''+ldp.ldImg+'\') center center no-repeat;background-size: 60%;"></div><div class="name">'+(ldp.amount?ldp.amount/100+'¥':'')+'</div>');
		}else{
			var h='';
			if(!ldp.ldImg){
				h='height:30%;';
			}
			$(warps[int]).html('<div class="lihe" data-prizeid="'+ldp.id+'" data-bustype="'+ldp.businessType+'" data-couponid="'+ldp.couponId+'" data-amount="'+ldp.amount+'" data-validstarttime="'+ldp.validStartTime+'" data-validendtime="'+ldp.validEndTime+'" data-name="'+ldp.name+'" style="background: url(\''+ldp.ldImg+'\') center center no-repeat;background-size: 30%;background-position-y: 25px;'+h+'"></div><div class="name1">'+(ldp.amount?'¥'+ldp.amount/100:'')+'</div><div class="name">'+(ldp.name)+'</div>');
		}
	}
});
</script>
</body>
</html>