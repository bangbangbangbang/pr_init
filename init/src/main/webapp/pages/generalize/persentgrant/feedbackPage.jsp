<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta name="format-detection" content="telephone=no" />
	<meta name="format-detection" content="email=no"/>
	<title>活动反馈</title>
	
	<%@include file="../../header_v13.jsp"%>
	<script src="<b:staticUrl>/res/js/ajaxfileupload.js</b:staticUrl>"></script> 
	<script src="<b:staticUrl>/res/js/jquery.json-2.4.min.js</b:staticUrl>"></script> 
	<!-- 初始化参数-->
	<script type="text/javascript">
	 var verifyStatus = false;
	 var uploadVoiceStatus = false;
	//文本内容字数显示
		function fn(){
			var len = $(".inputTextArea textarea").val().length;
			$(".wordCount").text(len);
		}
	</script>


<style type="text/css">
	.affirm{
	 background-color: EFEFF4;
	}
	html{
	background: #fff;
	}
	.imglist{
	border-top: 1px solid #E3E3E3;
    border-bottom: 1px solid #E3E3E3;
	}
	.font12 {
    line-height: 18px;
	}
	.playBtn:before {
	    margin-left: 33%;
	}
	.publishBtn{
		margin-top: 5px;
	}
	#showRecordStart{
		margin-top: 17px;
	}
	.wordTextarea textarea{
	    height: 3.89333333rem;
	}
	.inform{
	color: #000000;
	}
	.imglist {
	    border-top: 0px solid #E3E3E3;
	}
	.teachInput .wordTextarea textarea{
		border: 0px solid #999;
		text-align:left;
		height: 1.89333333rem;
		}
	.wordTextarea textarea {
		height: 1.89333333rem;
	}
	.myImglist img {
	    display: block;
	    width: 1.6rem;
	    height: 1.2rem;
	    margin: 0 auto;
	    border-radius: 0.10666667rem;
	}
	.myImglist ul {
    	float: left;
    	width: 100%;
	}
	.myImglist {
    	border-top: 0px solid #E3E3E3;	
    	margin-left: 0.4rem;
	}
	.clear{
	clear:both;
	}
	.myImglist li {
	    float: left;
	    width: 25%;
	    height: 1.2rem;
	    margin: 0.26666667rem 0;
	    position: relative;
	}
	.myImglist input {
	    width: 100%;
	    height: 100%;
	    position: absolute;
	    left: 0;
	    z-index: 99;
	    opacity: 0;
	}
	.myContent{
		margin-left: 0.4rem;
		  width: 90%;
	}
</style>
</head>
<body id="bgwhite">

<div class="font15 tabtit">
</div>

<div class="font12 wordTit"><a href="javascript:void(0)" class="help i-help"></a>反馈流程</div>

<!-- 文字录入框 -->
<div class="wordTextarea inputTextArea">
	<textarea placeholder="请输入备注信息,例如:请尽快审核" onkeyup="fn()" onblur="fn()" maxlength="120" class="font12"></textarea>
	<span class="font12"><i class="wordCount">0</i> / 120</span>
</div>

<div class="recordingbar hidden" style="display:none;">
	<span class="active"></span><span></span><span></span><span></span><span></span><span></span>
	<span></span><span></span><span></span><span></span><span></span><span></span>
</div>
<div class="font12 wordTit"><a href="javascript:void(0)" class="help "></a>图片(请根据活动要求上传图片)</div>
<div class="imglist">
	<ul class="addImgList">
		<li class="addimg"><div><input type="file" id="file" accept="image/*" style="width: 60px;height: 45px" name="file" multiple="multiple" style="display: none;" onchange="uploadImage();"/></div></li>
	</ul>
</div>

<div class="clear"></div>

<div class="teachInput" hidden="hidden">
<div class="font12 wordTit wordTitle"><a href="javascript:void(0)" class="help "></a>最近一次审核记录:</div>

<!-- 您的反馈 -->
<div class="wordTextarea myContent font12">
	哈哈哈哈
	<!-- <textarea placeholder="" class="font12" readonly="readonly"></textarea> -->
</div>
<div class="myImglist">
	<ul class="">
		<li class="myAddimg"><div><input type="text" id="file" accept="image/*" style="width: 60px;height: 45px" name="file" multiple="multiple" style="display: none;" onchange="uploadImage();"/></div></li>
	</ul>
</div>

<div class="wordTextarea feedback">
	<textarea placeholder="点评..." class="font12" readonly="readonly"></textarea>
</div>
</div>
<!-- <div class="font12 wordTit"><a href="javascript:void(0)" class="help"></a>您的审核状态:<b class="inform"></b></div> -->

<div class="font17 publishBtn" hidden="hidden">
	<a href="javascript:void(0)" class="publication">发表</a>
	<a href="javascript:void(0)" class="cancel" onclick="goback()">去首页</a>
</div>
<!--尾部-->
	<jsp:include page="/pages/header_footer.jsp">
		<jsp:param value="3" name="menu"/>
	</jsp:include>
<div class="imgshow"><div class="imgshow-cont"><img src="" ></div></div>

<input style="display:none;"  id="activitygenerilizeId" value="${activitygenerilizeId}">
<!-- 校验相关 -->
<script type="text/javascript">
function verify(text){
	toastWaiting();
	//校验文本是否涉及非法内容
	HH.ajax({
		url: "/yzmm/account/persentgrant/verify",
		data:{
			text:text
			},
		async:false,
		callback:function(data){
			if(data.success){
				verifyStatus = true;
				return;
			}else{
				toast(data.msg);
				verifyStatus = false;
				return;
			}
		}
	});
}
</script>
<script type="text/javascript">
	function submitdata(text,status){
		var urls = "";
		$(".image").each(function(){
			urls += $(this).attr("src") + ",";
		})
		//帖子id
		var activitygenerilizeId = $("#activitygenerilizeId").val();
		HH.ajax({
			url: "/yzmm/account/persentgrant/feedback",
			data:{
				text:text,
				urls:urls,
				activitygenerilizeId:activitygenerilizeId,
				status:status
				},
			callback:function(data){
				if(data.success){
					toast("提交成功,请耐心等待...2秒后将返回首页");
					setTimeout("goback()",1000 * 2);
				}else{
					toast(data.msg);
					return;
				}
			}
		});
	}
	
	function goback(){
		HH.href("/yzmm/index");
	}
	
	//图片上传
	function uploadImage(){
		var url_pb = "/yzmm/upload/temp?yellow=true";
		toastWaiting();
        $.ajaxFileUpload(
			{
				url:url_pb,
				dataType:'text',
				secureuri:false,
				fileElementId:['file'], 
				success: function (data)
				{
					var a = $(data);
					var obj = jQuery.parseJSON(a.html());
					if(!obj.success){
						toast(obj.msg);
					}else{
						$(".addimg").before('<li><div><img class="image" src="'+ obj.msg +'"><a href="javascript:void(0)" class="i-delete"></a></div></li>');
						//图片上传成功后,判断图片数量是否是三个
						if ($(".addImgList").children("li").size() > 3) {
							$(".addimg").hide();
						}
					}
					  toastWaitingColse();
				},error:function (data,status,e){
					toastWaitingColse();
					toast(e);	
				}
			}
		);
	return false;
}
</script>

<script type="text/javascript">
	
	//点击删除
	$(".imglist").on("click",".i-delete",function(){
		$(this).parent().parent().remove();
		if ($(".addImgList").children("li").size() <= 3) {
			$(".addimg").show();
		}
	});
	//点击发表
	$(".publication").click(function(){
		//最少一张图片
		if($(".image").length < 1){
			toast("请上传图片");
			return false;
		}
		//文字提交
		var text = $(".inputTextArea textarea").val();
		var status = 2;
		//校验文本是否涉及非法内容
		verify(text);
		if(!verifyStatus){
			return verifyStatus;
		}
		submitdata(text,status);
		
	});
</script>
<script type="text/javascript">
//若用户已经参与，初始化用户曾经信息
var hasPart = "${hasPart}";
if("false" == hasPart){
	$(".publishBtn").show();
}
if("true" == hasPart){
	var replyStatus = "${replyStatus}";
	var status = "${status}";
	var content = "${content}";
	var manageReplyContent = "${manageReplyContent}";
	var imgFirst = "${imgFirst}";
	var imgSecond = "${imgSecond}";
	var imgThird = "${imgThird}";
	$(".teachInput .myContent").text("您的申请:  "+content);
	fn();
	if(manageReplyContent.length>0){
	$(".teachInput").show();
	$(".teachInput .feedback textarea").val("驳回原因:  "+manageReplyContent);
	}
	//图片回显
	var arr = []
	arr.push(imgFirst,imgSecond,imgThird);
	for(var i=0;i<arr.length;i++){
		if(arr[i].length>0){
			$(".myAddimg").before('<li><div><img class="image" src="'+ arr[i] +'"><a href="javascript:void(0)" class=""></a></div></li>');
		}
	}
	if("AUDIO_REJECT" == replyStatus){
		$(".publishBtn").show();
	}else{
		$(".publishBtn").hide();
	}
	
	switch (replyStatus) {
	case "AUDIO_FIRST":
		$(".wordTitle").remove();
		$(".teachInput").show();
		$(".teachInput .feedback textarea").val("审核中,请耐心等待...");
		$(".teachInput .feedback textarea").attr("style","border: 0px solid #999;text-align:center;height: 1.89333333rem;")
		break;
	case "AUDIO_AGAIN":
		$(".wordTitle").remove();
		$(".teachInput").show();
		$(".teachInput .feedback textarea").val("审核中,请耐心等待...");
		//居中
		$(".teachInput .feedback textarea").attr("style","border: 0px solid #999;text-align:center;height: 1.89333333rem;")
		break;
	case "AUDIO_REJECT":
		break;
	default:
		$(".teachInput").show();
		$(".teachInput .feedback textarea").val("您已经通过审核");
		break;
	}
	
	if("FREEZED" == status){
		$(".teachInput .feedback textarea").val("涉及违规被冻结");
	}
	
	
}
</script>
</body>
</html>