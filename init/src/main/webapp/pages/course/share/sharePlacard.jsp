<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>喵姐早教说</title>
<%@include file="../../header_v2.0.jsp" %>
<%@include file="../../header_wxjsapi.jsp"%>

<script src="<b:staticUrl>/res/js/custom/qrcode/jquery.qrcode.js</b:staticUrl>"></script>
<script src="<b:staticUrl>/res/js/custom/qrcode/qrcode.js</b:staticUrl>"></script>
<script src="<b:staticUrl>/res/js/custom/qrcode/qrcodeUtils.js</b:staticUrl>"></script>
<script src="<b:staticUrl>/res/js/qrcode/canvas2image.js</b:staticUrl>"></script>
<script src="<b:staticUrl>/res/js/qrcode/html2canvas.js</b:staticUrl>"></script>
<link rel="stylesheet" href="<b:staticUrl>/res/css/package/course/share.css</b:staticUrl>">
<script src="<b:staticUrl>/res/js/package/course/share.js</b:staticUrl>"></script>
<script src="<b:staticUrl>/res/js/jquery.json-2.4.min.js</b:staticUrl>"></script>
<style type="text/css">
	.shareBoxBottom2 .p2 {
		    font-size: 0.35rem;
		}
		.shareBoxBottom2 .p3 {
	   		 font-size: 0.38rem;
	   		 color: rgba(51, 51, 51, 0.92);
		}
		.shareBoxBottom2 p{
			font-size: 0.30rem;
		}
		.coverTab a {
			margin-left: 0.7rem;
		}
</style>
</head>
<body style="background-color:#efefef">
<div class="shareBox">
	<div id="qrcode" hidden="hidden"></div>
	<div class="title">您的推广海报已生成，长按图片保存到相册分享。</div>
	<div class="cavansImg">
		<div class="cavansImgBox" id="pageContent1" hidden="hidden">
			<img src="/res/img/share/5.png" class="shareBanner" >
			<div class="shareBoxBottom2">
				<div class="cont">
					<div class="p3">${userInfo.nickName } 邀你一起听课</div>
					<div class="code"><img src="/res/img/share/code@2x.png" ></div>
					<p>扫码完善信息收听</p>
					<div class="p2">${course.name }</div>
				</div>
				<img src="/res/img/share/bt2.png" class="btbg" >
			</div>
		</div>
		<div class="cavansImgBox" id="pageContent2" >
			<img src="/res/img/share/4.png" class="shareBanner" >
			<div class="shareBoxBottom2">
				<div class="cont">
					<div class="p3">${userInfo.nickName } 邀你一起听课</div>
					<div class="code"><img src="/res/img/share/code@2x.png" ></div>
					<p>扫码完善信息收听</p>
					<div class="p2">${course.name }</div>
				</div>
				<img src="/res/img/share/bt2.png" class="btbg">
			</div>
		</div>
		<div class="cavansImgBox" id="pageContent3" hidden="hidden">
			<img src="/res/img/share/3.png" class="shareBanner" >
			<div class="shareBoxBottom2">
				<div class="cont">
					<div class="p3">${userInfo.nickName } 邀你一起听课</div>
					<div class="code"><img src="/res/img/share/code@2x.png" ></div>
					<p>扫码完善信息收听</p>
					<div class="p2">${course.name }</div>
				</div>
				<img src="/res/img/share/bt2.png" class="btbg">
			</div>
		</div>
		<!--生成的图片-->
		<div id = "shareImg2Div" hidden="hidden">
		  <img src="" class="shareImg" id="shareImg2">
		</div>
		<div id = "shareImg1Div" hidden="hidden">
		  <img src="" class="shareImg" id="shareImg1">
		</div>
		<div id = "shareImg3Div" hidden="hidden">
		  <img src="" class="shareImg" id="shareImg3">
		</div>
	</div>
	<div class="coverTab">
		<a href="javascript:void(0)" class="selOne">封面一</a>
		<a href="javascript:void(0)" class="active selTwo">封面二</a>
		<!-- <a href="javascript:void(0)" class="selThree">封面三</a> -->
	</div>
	<div class="shareMoreInfo">
		<div class="shareMoreInfoFixed">
			<div class="shareMoreTit"><div><a href="javascript:void(0)" class="more">了解详情</a>课程海报使用指南</div></div>
			<div class="word">
				<h2 class="tit">1. 分享赚会期活动规则</h2>
				<p>每推荐1人扫描您的课程专属二维码关注“喵姐早教说”，您与好友将同时获得1天的免费会员体验卡，如果您是会员，系统将自动为您的会员期限加1天会员时长，更多分享，更多会员体验优惠哦~</p>
				<h2 class="tit">2. 参与方法</h2>
				<p>1）长按图片保存您的专属课程海报图片到手机相册；</p>
				<p>2）分享图片给微信好友、微信朋友圈、qq空间、微博等社圈；</p>
				<p>3）邀请好友扫码或者长按识别二维码，根据提示操作关注“喵姐早教说”，关注成功后，回复“免费会员”，收到小喵回复后点击链接，就可以成为喵姐早教说会员啦；</p>
				<p>4）您也可以直接点击右上角“分享”按钮，一键生成您的专属福利链接，发送给朋友。</p>
			</div>
		</div>
	</div>
	<!-- 导航栏 -->
<jsp:include page="/pages/header_footer.jsp">
		<jsp:param value="2" name="menu"/>
</jsp:include>
</div>
<script type="text/javascript">
wxfenxiangcb_courseShare={
		title: '${wxshare.title}', // 分享标题
		desc : '${wxshare.desc}',
	    link: '${wxshare.link}', // 分享链接
	    imgUrl: '${wxshare.imgUrl}', // 分享图标
	    shareTimeline:function(bool){
	    },
	    shareAppMessage:function(bool){
	    }
};
initwxfx(wxfenxiangcb_courseShare);

function jsappshareinit(order){
	try{
		 if(typeof jsapp !='undefined'){
			wxfenxiangcb_courseShare={
				imgUrl: $("#shareImg"+order+"Div img").attr("src"), // 分享图标
			    link: $("#shareImg"+order+"Div img").attr("src")// 分享链接
			};
			initwxfx(wxfenxiangcb_courseShare);
			jsappshare("img");
		} 
	}catch(e){
			 
	}
}


$(".coverTab a").click(function(){
	//$(".coverTab").children().removeClass("active");
	$(this).addClass("active").siblings().removeClass("active");
})
//初始化二维码画板
var url = "${qrCodeUrl}";
var codeImg1 = $(".code > img").get(0);
var codeImg2 = $(".code > img").get(1);
var codeImg3 = $(".code > img").get(2);
qrcodeUtils.generateQRCode("qrcode","canvas",60,60,utf16to8(url));
var qrcodeCanvas = $("#qrcode > canvas").get(0);
codeImg1.src = qrcodeCanvas.toDataURL("image/png"); 
codeImg2.src = qrcodeCanvas.toDataURL("image/png"); 
//codeImg3.src = qrcodeCanvas.toDataURL("image/png"); 


//初始化图片文字画板
var shareCanvas1;
var shareCanvas2;
var shareCanvas3;

function assemBkImg1(){
	$("#pageContent1").addClass("hasShareImg");
	var shareImg1 = $("#shareImg1").get(0);
	//组装图片	
	html2canvas( $("#pageContent1") ,{
		onrendered: function(canvas){
			shareCanvas1 = canvas;
			shareImg1.src = shareCanvas1.toDataURL('image/png',1);
			//显示第二章图
			$("#pageContent1").hide();	
			$("#shareImg1Div").show();
			jsappshareinit(1);
		}
	});
}
function assemBkImg2(){
	$("#pageContent2").addClass("hasShareImg");
	var shareImg2 = $("#shareImg2").get(0);
	//组装图片	
	html2canvas( $("#pageContent2") ,{
		onrendered: function(canvas){
			shareCanvas2 = canvas;
			shareImg2.src = shareCanvas2.toDataURL('image/png',1);
			//显示第二章图
			$("#pageContent2").hide();	
			$("#shareImg2Div").show();
			jsappshareinit(2);
		}
	});
}
function assemBkImg3(){
	$("#pageContent3").addClass("hasShareImg");
	var shareImg3 = $("#shareImg3").get(0);
	//组装图片	
	html2canvas( $("#pageContent3") ,{
		onrendered: function(canvas){
			shareCanvas3 = canvas;
			shareImg3.src = shareCanvas3.toDataURL('image/png',1);
			//显示第二章图
			$("#pageContent3").hide();	
			$("#shareImg3Div").show();
			jsappshareinit(3);
		}
	});
}
$(".selOne").click(function(){
	if($("#pageContent1").hasClass("hasShareImg")){
		hideShare2();
		hideShare3();
		$("#shareImg1Div").show();
		$("#pageContent1").hide();
		jsappshareinit(1);
	}else{
		hideShare2();
		hideShare3();
		//展示div
		$("#pageContent1").show();
		//初始化图片
		assemBkImg1();
	}
})
$(".selTwo").click(function(){
	if($("#pageContent2").hasClass("hasShareImg")){
		hideShare1();
		hideShare3();
		$("#shareImg2Div").show();
		$("#pageContent2").hide();
		jsappshareinit(2);
	}else{
		hideShare1();
		hideShare3();
		//展示div
		$("#pageContent2").show();
		//初始化图片
		assemBkImg2();
	}
})
$(".selThree").click(function(){
	if($("#pageContent3").hasClass("hasShareImg")){
		hideShare1();
		hideShare2();
		$("#shareImg3Div").show();
		$("#pageContent3").hide();
		jsappshareinit(3);
	}else{
		hideShare1();
		hideShare2();
		//展示div
		$("#pageContent3").show();
		//初始化图片
		assemBkImg3();
	}
})
function hideShare1(){
	$("#pageContent1").hide();
	$("#shareImg1Div").hide();
}
function hideShare2(){
	$("#pageContent2").hide();
	$("#shareImg2Div").hide();
}
function hideShare3(){
	$("#pageContent3").hide();
	$("#shareImg3Div").hide();
}
setTimeout(aa,300);
function aa(){
$(".selTwo").click();
}
</script>
<!-- 自定义组合图片 -->
<script type="text/javascript">
/* //把image 转换为 canvas对象 
function convertImageToCanvas(image) { 
// 创建canvas DOM元素，并设置其宽高和图片一样 
var canvas = document.createElement("canvas"); 
canvas.width = image.width; 
canvas.height = image.height; 
// 坐标(0,0) 表示从此处开始绘制，相当于偏移。 
canvas.getContext("2d").drawImage(image, 0, 0,230,285); 
return canvas; 
} 
//绘制背景图
var topImgCanvas = convertImageToCanvas($(".shareBanner").get(1));
var bottomImgCanvas = convertImageToCanvas($(".btbg").get(1));
topImgCanvas.getContext("2d").drawImage(bottomImgCanvas,0,topImgCanvas.height-100);
topImgCanvas.getContext("2d").drawImage(qrcodeCanvas,90,120);
html2canvas( $(".p3").get(1) ,{
	onrendered: function(canvas1){
			topImgCanvas.getContext("2d").drawImage(canvas1,10,90);
			html2canvas( $(".p2").get(1) ,{
				onrendered: function(canvas2){
						topImgCanvas.getContext("2d").drawImage(canvas2,10,210);
						$("#shareImg2").get(0).src = topImgCanvas.toDataURL("image/png",1); 
						$("#pageContent2").hide();	
						$("#shareImg2Div").show();
				}
			});
	}
});

 */
</script>
</body>
</html>
