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
	<title>编辑答案</title>
	
	<%@include file="../../header_v13.jsp"%>
	<script src="<b:staticUrl>/res/js/recording-v1.js</b:staticUrl>"></script>
	<script src="<b:staticUrl>/res/js/ajaxfileupload.js</b:staticUrl>"></script> 
	<script src="<b:staticUrl>/res/js/jquery.json-2.4.min.js</b:staticUrl>"></script> 
	<%@include file="../../header_wxjsapi.jsp"%>

<style type="text/css">
	.affirm{
	 background-color: skyblue;
	}
	.wordTextarea{
		    margin-top: 50px;
	}
	html, body{
		background-color: #fff !important;
	}
	.publishBtn{
		 margin-top: 40px;
	}
</style>
</head>
<body id="bgwhite">
<!-- 文字录入框 -->
<div class="wordTextarea">
	<textarea placeholder="请输入您的答案" onkeyup="fn()" onblur="fn()" maxlength="120" class="font12"></textarea>
	<span class="font12"><i class="wordCount">0</i> / 120</span>
</div>

<div class="recordingbar hidden" style="display:none;">
	<span class="active"></span><span></span><span></span><span></span><span></span><span></span>
	<span></span><span></span><span></span><span></span><span></span><span></span>
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
	<%-- <jsp:include page="/pages/header_footer.jsp">
		<jsp:param value="3" name="menu"/>
	</jsp:include> --%>
<div class="imgshow"><div class="imgshow-cont"><img src="" ></div></div>

<input style="display:none;"  id="topicId" value="${topicId}">
<!-- 初始化参数-->
<script type="text/javascript">
 var playUrl = ""
 var localId = "";
 var verifyTextStatus = false;
 var uploadVoiceStatus = false;
</script>
<!-- 校验相关 -->
<script type="text/javascript">
function verifyText(text){
	toastWaiting();
	//校验文本是否涉及非法内容
	HH.ajax({
		url: "/yzmm/account/verify/verifyText",
		data:{
			text:text
			},
		async:false,
		callback:function(data){
			if(data.success){
				//
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
	$(function(){
		
		
		//点击删除
		$(".imglist").on("click",".i-delete",function(){
			$(this).parent().parent().remove();
			if ($(".addImgList").children("li").size() <= 3) {
				$(".addimg").show();
			}
		});
		
		//点击发表
		$(".publication").click(function(){
				//文字提交
				var text = $(".wordTextarea textarea").val();
				var status = 2;
				//校验文本是否涉及非法内容
				verifyText(text);
				if(!verifyTextStatus){
					return verifyTextStatus;
				}
				
			
			var urls = "";
			$(".image").each(function(){
				urls += $(this).attr("src") + ",";
			})
			//帖子id
			var activityId = "${activityId}";
			
			HH.ajax({
				url: "/yzmm/account/activity/tzl/reply/publicationMiao",
				data:{
					text:text,
					urls:urls,
					activityId:activityId,
					status:status,
					playUrl:playUrl
					},
				callback:function(data){
					if(data.success){
						location.href="/yzmm/account/activity/tzl/detailIncludeReply?id="+${activityId};
					}else{
						toast(data.msg);
						return;
					}
				}
			});
		});
		
	})
	
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
function cancel(){
	location.href="/yzmm/account/activity/tzl/detailIncludeReply?id="+${activityId};
}
</script>
<!-- 录音相关 -->
<script type="text/javascript">
//播放与暂停
$("#playVoice").click( function () {
	if($("#playVoice").hasClass("pausebtn")){
		//播放
		$("#playVoice").removeClass("pausebtn");
		
		wx.pauseVoice({
			 localId: localId
			});
		
	}else if(!$("#playVoice").hasClass("pausebtn")){
		//暂停
		$("#playVoice").addClass("pausebtn");
		
		//播放音频
		if (localId == '') {
			  toast('请先录制您的声音');
		 return;
		}
		wx.playVoice({
		 localId: localId
		});
		
	}
	
});


//4.8 上传语音
function uploadVoice() {
if (localId == '') {
	 toast('请先录制您的声音');
 return;
}
wx.uploadVoice({
 localId: localId,
 success: function (res) {
 var serverId = res.serverId;
	HH.ajax({
		url: "/yzmm/upload/temp/wxaudio",
		data:{serverId:serverId,parent:"wxaudio"},
		callback:function(data){
			if(data.success){
				playUrl = data.msg;
				uploadVoiceStatus = true;
			}else{
				toast(data.msg);
				uploadVoiceStatus = false;
			}
		}
	});
   
 },
 fail:function(){
 	 toast('您的声音上传失败');
 }
});
};

wx.ready(function () {
	//是否可用
if(!canwxaudio){
	return;
}
	//4.4 监听录音自动停止
	wx.onVoiceRecordEnd({
	  complete: function (res) {
	    localId = res.localId;
	    toast('录音时间最长60S');
	    //修改样式
	  }
	});
});

</script>
</body>
</html>
