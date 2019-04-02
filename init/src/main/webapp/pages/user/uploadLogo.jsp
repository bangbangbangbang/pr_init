<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>喵姐早教说</title>
<%@include file="../header.jsp" %>
</head>
<body>
<div class="wrapper">
	<section class="inform_update">
		<div style="text-align:center;">
			<span class="photo fl">
          	<a href="javascript:void(0)" onclick="clickInput();"><img id="photo" style="width:18em; height:18em; border-radius:50%;" src="${album}" alt=""></a></span>
          	<input type="file" id="file" accept="image/*" name="file" multiple="multiple" style="display: none;" onchange="uploadImage();"/>
		</div>
		<div id="submit"  class="inform_update_btn "><button id="save">保存</button></div>
	</section>
</div>
<script src="${baseStaticUrl}/res/js/ajaxfileupload.js?v=${version}"></script> 
<script src="${baseStaticUrl}/res/js/jquery.json-2.4.min.js?v=${version}"></script> 
<script type="text/javascript">
function jsappuploadimgcallback(url){
	 if(url){
		 $("#photo").attr("src",url);
		 $('.inform_update_btn').addClass('btn_on');
		 toastWaitingColse();
	 }
}

function clickInput(){
	try{
		if(typeof jsapp !='undefined'){
			toastWaiting();
			window.setTimeout(function(){
					toastWaitingColse();
			},15000)
			 jsapp.uploadImg("/yzmm/upload/temp","jsappuploadimgcallback");
		}
	}catch(e){
		
	}
	$('#file').click();
}
function uploadImage(){
		var url_pb = "/yzmm/upload/temp?yellow=true";
		toastWaiting();
        $.ajaxFileUpload(
			{
				url:url_pb,
				dataType:'text',
				data:id=1,
				secureuri:false,
				fileElementId:['file'], 
				success: function (data)
				{
					var a = $(data);
					var obj = jQuery.parseJSON(a.html());
					if(!obj.success){
						toast(obj.msg);
					}else{
						$("#photo").attr("src",obj.msg);	
					}
					  $('.inform_update_btn').addClass('btn_on');
					  toastWaitingColse();
				},error:function (data,status,e){
					  toastWaitingColse();
					toast(e);	
				}
			}
		);
	return false;
}
$(function(){
	$("#save").click(function(){
		if(!$(".inform_update_btn").hasClass("btn_on")){
			return false;
		};
		HH.ajax({
			url: "/yzmm/account/uploadLogo",
			data:{"url":$("#photo").attr("src")},
			callback:function(data){
				if(data.success){
					location.href='/yzmm/account/user/infoDetail';
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