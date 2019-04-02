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
	<title>发表喵说</title>
	
	<%@include file="../header_v13.jsp"%>
	<script src="<b:staticUrl>/res/js/recording-v1.js</b:staticUrl>"></script>
	<script src="<b:staticUrl>/res/js/ajaxfileupload.js</b:staticUrl>"></script> 
	<script src="<b:staticUrl>/res/js/jquery.json-2.4.min.js</b:staticUrl>"></script> 
	<%@include file="../header_wxjsapi.jsp"%>
	<!-- 初始化参数-->
	<script type="text/javascript">
	 var verifyTextStatus = false;
	 var uploadVoiceStatus = false;
$(function(){
	
	 wxfenxiangcb={
				playUrl: '',
				localId: '',
				uploadVoice:function(){
					uploadVoice(okfn);
				},
				voiceRecordEnd:function(){
					_voiceRecordEnd();
				}
			};
	 
	 function _voiceRecordEnd(){
			weixinPauseVoice();
			//隐藏录音框
			$($(".recording")[0]).click();
		}
})
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
		margin-top:90px;
	}
	#showRecordStart{
		margin-top: 17px;
	}
</style>
</head>
<body id="bgwhite">

<div class="font15 tabtit">
	<a href="javascript:void(0)" class="audioArea">语音</a>
	<a href="javascript:void(0)" class="textArea active">文字</a>
</div>

<div class="font12 wordTit"><a href="javascript:void(0)" class="help i-help"></a>如何抢占封面</div>

<!-- 文字录入框 -->
<div class="wordTextarea">
	<textarea placeholder="分享精彩瞬间..." onkeyup="fn()" onblur="fn()" maxlength="120" class="font12"></textarea>
	<span class="font12"><i class="wordCount">0</i> / 120</span>
</div>

<div class="recordingbar hidden" style="display:none;">
	<span class="active"></span><span></span><span></span><span></span><span></span><span></span>
	<span></span><span></span><span></span><span></span><span></span><span></span>
</div>

<!-- 语音录入框 -->
<div id="showRecordStart">
	<div class="recording record-start" style="display:none;"  tabindex="1"><i class="i-recording"></i></div>
	<div class="font12 playword" style="display:none;">点击上面按钮，进行录音</div>
</div>
<div id="showPlayVoice" hidden="hidden">
	<a href="javascript:void(0)" class="playBtn" id="playVoice"><span class="font12 txt">点击试听</span></a>
	<div class="font12 playword" style="display:none" id = "pauseVoice">点击暂停按钮，停止播放</div>
	<div class="font15 playvoice" style="display:block;" id="againRecord"><i class="i-voice"></i><span>重新录制</span></div>
</div>

<div class="imglist">
	<ul class="addImgList">
		<li class="addimg"><div><input type="file" id="file" accept="image/*" style="width: 60px;height: 45px" name="file" multiple="multiple" style="display: none;" onchange="uploadImage();"/></div></li>
	</ul>
</div>
<div class="font17 publishBtn">
	<a href="javascript:void(0)" class="publication">发表</a>
	<a href="javascript:void(0)" class="cancel" onclick="cancel()">取消</a>
</div>
<!--尾部-->
	<jsp:include page="/pages/header_footer.jsp">
		<jsp:param value="3" name="menu"/>
	</jsp:include>
<div class="slidedown">
	<div class="font15 slidedown-cont">
		<h2 class="font17">小喵告诉你如何抢占封面：</h2>
		<p><i class="ix">1：</i><span class="ct">话题内容要贴切生活实际</span></p>
		<p><i class="ix">2：</i><span class="ct">话题内容要适用于0~6岁宝宝哦</span></p>
		<p><i class="ix">3：</i><span class="ct">选一张可以闪瞎小喵眼睛的活动宣传图，让我一
     眼看到你【偷笑】</span></p>
		<p><i class="ix">4：</i><span class="ct">喊你的亲朋好友来助威，提高 个人楼层热度</span></p>
		<div class="greeting">小喵在领奖台等你呦~</div>
		<a href="javascript:void(0)" class="font17 knowbtn">知道了</a>
	</div>
</div>
<div class="imgshow"><div class="imgshow-cont"><img src="" ></div></div>

<input style="display:none;"  id="topicId" value="${topicId}">
<!-- 校验相关 -->
<script type="text/javascript">
function verifyText(text){
	toastWaiting();
	//校验文本是否涉及非法内容
	HH.ajax({
		url: "/yzmm/account/miao/verifyText",
		data:{
			text:text
			},
		async:false,
		callback:function(data){
			if(data.success){
				verifyTextStatus = true;
				return;
			}else{
				toast(data.msg);
				verifyTextStatus = false;
				return;
			}
		}
	});
}
</script>
<script type="text/javascript">
	function submitdata(text,status,playUrl){
		var urls = "";
		$(".image").each(function(){
			urls += $(this).attr("src") + ",";
		})
		//帖子id
		var topicId = $("#topicId").val();
		
		HH.ajax({
			url: "/yzmm/account/miao/publicationMiao",
			data:{
				text:text,
				urls:urls,
				topicId:topicId,
				status:status,
				playUrl:playUrl
				},
			callback:function(data){
				if(data.success){
					location.href='/yzmm/account/miao/topic/viewDetailIncludeReply?id='+${topicId}+'&mark=newPublication';
				}else{
					toast(data.msg);
					return;
				}
			}
		});
	}
	
	//文本内容字数显示
	function fn(){
		var len = $(".wordTextarea textarea").val().length;
		$(".wordCount").text(len);
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

<!-- 页面控制 -->
<script type="text/javascript">
$(".text").click(function(){
	$("#showPlayVoice").attr("style","display: display;");
})
//重新录制
$("#againRecord").click(function(){
	if($("#againRecord").hasClass("affirm")){
		//展示录音框
		$("#showRecordStart").show();
		//隐藏播放框
		$("#showPlayVoice").hide();
		//暂停语音
		 weixinStopVoice();
		 wxfenxiangcb.localId = "";
		//修改样式,设置为播放图片
		$("#playVoice").removeClass("pausebtn");
		//展示提示文字
		$(".playword").show();
	}else{
		$("#againRecord").addClass("affirm");
		//修改重录为再次点击确认重录
		$("#againRecord").children("span").text("点击重录");
		
	}
})
</script>
<!-- 录音相关 -->
<script type="text/javascript">
//播放与暂停
$("#playVoice").click( function () {
	
	if($("#playVoice").hasClass("pausebtn")){
		//播放
		$("#playVoice").removeClass("pausebtn");
		
		//暂停录音
		weixinPauseVoice();
		
	}else if(!$("#playVoice").hasClass("pausebtn")){
	
		//暂停
		$("#playVoice").addClass("pausebtn");
		
		//播放录音
		weixinPlayVoice();
		
	}
	
});
$($(".recording")[0]).click(function(){
	if($($(".recording")[0]).hasClass("record-start")){
		//开始录音
		weixinStartRecord();
	}else{
		//停止录音
		weixinStopRecord();
		//隐藏录音框
		$("#showRecordStart").hide();
		//展示播放框
		$("#showPlayVoice").show();
		//隐藏提示文字
		$(".playword").hide();
	}
	
})

//4.8 上传语音
function uploadVoice(okfn) {
if (wxfenxiangcb.localId == '') {
	 toast('请先录制您的声音');
 return;
}
 wx.uploadVoice({
 localId:  wxfenxiangcb.localId,
 success: function (res) {
 var serverId = res.serverId;
	HH.ajax({
		url: "/yzmm/upload/temp/wxaudio",
		data:{serverId:serverId,parent:"wxaudio",type:"TOPICREPLY"},
		async:false,
		callback:function(data){
			if(data.success){
				playUrl = data.msg;
				uploadVoiceStatus = true;
				okfn(playUrl);
				return;
			}else{
				toast(data.msg);
				uploadVoiceStatus = false;
				return;
			}
		}
	});
   
 },
 fail:function(){
 	 toast('您的声音上传失败');
 }
});
};

function goback(){
	//history.back(-1);
	//去列表页
	location.href='/yzmm/account/miao/topic/viewDetailIncludeReply?id='+${topicId};
}
function cancel(){
	 weixinPauseVoice();
	 setTimeout("goback()", 100);
}
</script>
<script type="text/javascript">
	
	//点击录音模块
	$(".audioArea").click(function(){
		if($(".audioArea").hasClass("active")){
			return true;
		}
		$(".audioArea").addClass("active");
		$(".textArea").removeClass("active");
		$(".wordTit").hide();
		$(".wordTextarea").hide();
		$(".recordingbar").show();
		$(".recording").show();
		$(".playword").show();
		$("#showPlayVoice").hide();
		$("#showRecordStart").show();
	});
	
	//点击文字模块
	$(".textArea").click(function(){
		if($(".textArea").hasClass("active")){
			return true;
		}
		//正在录制的语音停止
		if(!$($(".recording")[0]).hasClass("record-start")){
			$(".recording").click();
		}
		
		$(".textArea").addClass("active");
		$(".audioArea").removeClass("active");
		$(".recordingbar").hide();
		$(".recording").hide();
		$(".playword").hide();
		$(".wordTit").show();
		$(".wordTextarea").show();
		$("#showPlayVoice").hide();
	});
	
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
		
		//判断提交的是文字还是语音
		if ($(".textArea").hasClass("active")) {
			//文字提交
			var text = $(".wordTextarea textarea").val();
			var status = 2;
			//校验文本是否涉及非法内容
			verifyText(text);
			if(!verifyTextStatus){
				return verifyTextStatus;
			}
			submitdata(text,status,null);
		}else {
			//语音提交
			var status = 3;
			uploadVoice(function(playUrl){
				submitdata(null,status,playUrl);
			});
		}
		
	});
</script>
<script type="text/javascript">
$(".audioArea").click();
</script>
</body>
</html>