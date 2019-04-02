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
	<title>提交作业</title>
	
	<%@include file="../../header_v15.jsp"%>
	<script src="<b:staticUrl>/res/js/recording-v1.js</b:staticUrl>"></script>
	<script src="<b:staticUrl>/res/js/ajaxfileupload.js</b:staticUrl>"></script> 
	<script src="<b:staticUrl>/res/js/jquery.json-2.4.min.js</b:staticUrl>"></script> 
	<script src="<b:staticUrl>/res/js/jquery.cookie.js</b:staticUrl>"></script>
	<%@include file="../../header_wxjsapi.jsp"%>

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
    line-height: 12px;
	}
	.playBtn:before {
	    margin-left: 33%;
	}
	.voteTit{
		 width: 100%;
	    padding: 0.46666667rem 0 0.53333333rem 0;
	    text-align: center;
	}  
}
	.font17 {
	    font-size: 17px;
	    line-height: 17px;
    }
    .font19 {
	    font-size: 19px;
	    line-height: 15px;
    }
    .privacyHomeworkBtn{
        display: block;
	    width: 4.53333333rem;
	    height: 1.22666667rem;
	    line-height: 1.22666667rem;
	    margin: 0 auto;
	    margin-top: 0.4rem;
	    /* background-color: #e51812; */
	    /* border-radius: 0.10666667rem; */
	    text-align: center;
	    color: #2196F3;
	    }
</style>
</head>
<body id="bgwhite">
<div class="font19 objTit2" style="text-align: center;"><a href="javascript:void(0)" class="close cancel"></a>写作业</div>
<div class="font12 objTit2 taskinstruction" style="text-align: right; color: blue;line-height: 10px;">第${week}周作业指导</div>
	
<!-- 文字录入框 -->
<div class="zyTextarea wordTextarea">
	<textarea style="webkit-user-select: auto !important;" placeholder="提交作业前，一定要查看右上角的作业指导哟..." onkeyup="fn()" onblur="fn()" class="font12"></textarea>
	<span class="font12"><i class="wordCount">0</i> </span>
</div>
<div class="font12 zyTit">第${week}周作业配图：</div>
<div class="zyimg">
	<img src="${daysPlanActivity.dayimgFirst}" >
</div>
<div class="font15 objTit2" style="text-align: center;color: red;"><input type="checkbox" id='isPrivacy' name="isPrivacy"/>设为私密作业<span class="icon openprivacyHomework"></span></div>
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

<!-- <div class="imglist">
	<ul class="addImgList">
		<li class="addimg"><div><input type="file" id="file" accept="image/*" style="width: 60px;height: 45px" name="file" multiple="multiple" style="display: none;" onchange="uploadImage();"/></div></li>
	</ul>
</div> -->
<div class="font18 btnfixed2">
	<a href="javascript:void(0)" style="bottom: 0.6rem;" class="publication">发表</a>
	<!-- <a href="javascript:void(0)" class="cancel">取消</a> -->
</div>
<div class="imgshow"><div class="imgshow-cont"><img src="" ></div></div>

<input style="display:none;" id="activityId" value="${activityId}">
<input style="display:none;" id="dayId" value="${dayId}">

<div class="zyzd zuoyezhidao" hidden="">
	<div class="zyzdBox zuoyezhidaoBox">
	<div class="font17 tit">第${week}周作业指导</div>
		<div class="zyzdItem">
		  <c:if test="${not empty daysPlanActivity.activityDetailOneTitle or not empty daysPlanActivity.activityDetailOne}">
			<div>
				  <c:if test="${not empty daysPlanActivity.activityDetailOneTitle}">
				<h2 class="font15">${daysPlanActivity.activityDetailOneTitle}：</h2>
				</c:if>
				  <c:if test="${not empty daysPlanActivity.activityDetailOne}">
				<p class="font12">${daysPlanActivity.activityDetailOne}</p>
				</c:if>
			</div>
			</c:if>
		  <c:if test="${not empty daysPlanActivity.activityDetailTwoTitle or not empty daysPlanActivity.activityDetailTwo}">
			<div>
				<c:if test="${not empty daysPlanActivity.activityDetailTwoTitle}">
				<h2 class="font15">${daysPlanActivity.activityDetailTwoTitle}：</h2>
				</c:if>
				<c:if test="${not empty daysPlanActivity.activityDetailTwo}">
				<p class="font12">${daysPlanActivity.activityDetailTwo}</p>
				</c:if>
			</div>
			</c:if>
		  <c:if test="${not empty daysPlanActivity.activityDetailThreeTitle or not empty daysPlanActivity.activityDetailThree}">
			<div>
				 <c:if test="${not empty daysPlanActivity.activityDetailThreeTitle}">
				<h2 class="font15">${daysPlanActivity.activityDetailThreeTitle}：</h2>
				</c:if>
				 <c:if test="${not empty daysPlanActivity.activityDetailThree}">
				<p class="font12">${daysPlanActivity.activityDetailThree}</p>
				</c:if>
			</div>
			</c:if>
		</div>
	<a href="javascript:void(0)" class="font18 zyzdBtn zuoyezhidaoBtn">我学会了</a>
	</div>
</div>

<div class="zyzd privacyHomework" hidden="">
	<div class="zyzdBox">
	<div class="font17 tit">发现新功能</div>
		<div class="zyzdItem">
			<div>
				<h2 class="font15">今天的作业只想给你导师一人看，可是作业打卡必须要分享朋友圈做么办？</h2>
				<br/>
				<h2 class="font15"><span style="color:#f57123;">大招：</span>打卡时选择设为私密作业就可以啦~</h2>
			</div>
		</div>
	<a href="javascript:void(0)" class="font18 privacyHomeworkBtn">知道啦</a>
	</div>
</div>

		
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
		url: "/yzmm/account/activity/daysPlan/verifyText",
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
if('${isShowPrivateTips}'!='true'){
	$(".privacyHomework").show();
}
</script>
<script type="text/javascript">
	$(function(){
		
		//点击录音模块
		$(".audio").click(function(){
			$(".audio").addClass("active");
			$(".text").removeClass("active");
			$(".wordTit").hide();
			$(".wordTextarea").hide();
			$(".recordingbar").show();
			$(".recording").show();
			$(".playword").show();
		});
		
		//点击文字模块
		$(".text").click(function(){
			$(".text").addClass("active");
			$(".audio").removeClass("active");
			$(".recordingbar").hide();
			$(".recording").hide();
			$(".playword").hide();
			$(".wordTit").show();
			$(".wordTextarea").show();
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
			//可以不用上传图片
			/* if($(".image").length < 1){
				toast("请上传图片");
				return ;
			} */
			//文字提交
			var text = $(".wordTextarea textarea").val();
			//获取是否设置了 私密作业
			var isPrivacy=$('#isPrivacy')[0].checked?'PRIVACY':'OPEN';
			var status = 2;
			//校验文本是否涉及非法内容
			verifyText(text);
			if(!verifyTextStatus){
				return verifyTextStatus;
				if (localId == '') {
				 }
				if(!uploadVoiceStatus){
					return uploadVoiceStatus;
				}
			}
			var urls = "";
			
			$(".image").each(function(){
				urls += $(this).attr("src") + ",";
			})
			//活动id
			var activityId = $("#activityId").val();
			//当天id
			var dayId = $("#dayId").val();
			var uid = "${uid}";
			HH.ajax({
				url: "/yzmm/account/activity/daysPlan/publishHomework",
				data:{
					text:text,
					urls:urls,
					activityId:activityId,
					dayId:dayId,
					status:status,
					playUrl:playUrl,
					isPrivacy:isPrivacy
					},
				callback:function(data){
					if(data.success){
						//location.href='/yzmm/account/activity/daysPlan/everyDayDetail?dayId='+dayId;
						//去分享页
						
						HH.href('/yzmm/account/activity/daysPlan/toShareMyHomeWork?dayId='+dayId+'&uid='+uid);
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
$(".text").click(function(){
	$("#showPlayVoice").attr("style","display: display;");
})
$(".audio").click(function(){
	//如果是录音框为显示状态，则不改变
	$("#showRecordStart").show();
})
//重新录制
$("#againRecord").click(function(){
	if($("#againRecord").hasClass("affirm")){
		//展示录音框
		$("#showRecordStart").show();
		//隐藏播放框
		$("#showPlayVoice").hide();
		//暂停语音
		wx.stopVoice({
			 localId: localId
			});
		//修改样式,设置为播放图片
		$("#playVoice").removeClass("pausebtn");
		localId = "";
	}else{
		$("#againRecord").addClass("affirm");
		//修改重录为再次点击确认重录
		$("#againRecord").children("span").text("点击重录");
		
	}
	
})
</script>
<script type="text/javascript">
//init
//初始化页面值
var unfinishHomeworkContent = "${unfinishHomeworkContent}";
if(unfinishHomeworkContent != ""){
	 //初始化文本输入框
	 $("textarea").val(unfinishHomeworkContent);
	 fn();
}

//提示语
$(".taskinstruction").click(function(){
	$(".zuoyezhidao").show();
});
$(".privacyHomeworkBtn").click(function(){
	$(".privacyHomework").hide();
});
$(".zuoyezhidao").click(function(){
	$(".zuoyezhidao").hide();
});
$(".zuoyezhidaoBtn").click(function(){
	$(".zuoyezhidao").hide();
});
$(".close").click(function(){
	 stopevt();
	 var activityId = $("#activityId").val();
	 location.href='/yzmm/account/activity/goddessplan/detail/statusSeleter?activityId='+activityId+'&processStatus=DOING';
});
$(".zuoyezhidaoBox").click(function(){
	stopevt();
});
//隐私作业
$(".openprivacyHomework").click(function(){
	$(".privacyHomework").show();
});
</script>
</body>
</html>