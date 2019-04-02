<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<%@include file="../header_v2.0.jsp"%>
<title>喵姐早教说</title>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	-o-box-sizing: border-box;
}

i.point {
	display: inline-block;
	width: 8px;
	height: 8px;
	margin-right: 6px;
	vertical-align: 2px;
	background-color: #333;
	border-radius: 100%;
}
</style>
</head>
<body>
	<div>
		<div style="margin-bottom: 20px; padding: 0 15px;">
			<div style="padding: 10px 0; border-bottom: 1px solid #ccc;">
				<p align="center" style="font-size:20px;"><span class="conproblem" >常见问题</span></p>
	    	</div>
 	 	</div>
	  <div style="margin-bottom:10px;padding:0 15px;color:#333;">
	     <span style="font-weight:bold;font-size:16px;">一、直播课程没有声音？</span> 
	  </div>
	  <div style="margin-bottom:20px;">
	    <span style="margin-left:50px;font-size:14px;">1、切换视频直播</span>
	    <div style="margin-bottom:20px;margin-top:20px;">
	      <img id="u92_img" class="img" style="margin-left:90px;width:200px;height:350px;" src="<b:staticUrl>/res/img/u92.png</b:staticUrl>"/>
	    </div>	
	    <p><span style="margin-left:50px;font-size:14px;"> 2、点击屏幕右上角按钮,通过浏览器打开</span></p>
	    <div style="margin-bottom:20px;margin-top:20px;">
	      <img id="u94_img" class="img" style="margin-left:90px;width:200px;height:350px;" src="<b:staticUrl>/res/img/u94.png</b:staticUrl>"/>
	    </div>
	    <p><span style="margin-left:50px;font-size:14px;"> 3、PC端输入 c.sevenkids.cn</span></p>
	  </div>
	  <div style="margin-bottom:10px;padding:0 15px;color:#333;">
	     <span style="font-weight:bold;font-size:16px;">二、点播课程、三千问没有声音？</span> 
	  </div>
	  <div style="margin-left:50px;margin-top:10px;font-size:14px;">
	    <span><i class="point"></i>硬件故障排查</span>
	  </div>
	  <div style="margin-left:64px;line-height:24px;font-size:12px;color:#666;margin-top:5px">
	    <span>1、检查当前设备是否处于静音模式</span><br>
	    <span>2、检查手机通话是否正常</span><br>
	    <span>3、检查是否关闭微信的声音及麦克风权限</span>
	  </div>
	  	<div style="margin-left:50px;margin-top:10px;font-size:14px;">
	      <span><i class="point"></i>软件故障排查</span>
	    </div>
	    <div style="margin-left:64px;line-height:24px;font-size:12px;color:#666;margin-top:5px">
	      <span> 1、点击屏幕右上角按钮，通过浏览器打开</span><br>
	      <span> 2、PC端输入 c.sevenkids.cn</span><br>
	      <span> 3、切换网络</span>
	    </div>
	    <div style="margin-top:5px;margin-bottom:20px;padding:0 15px;">
	       <span style="font-size:12px">以上步骤均已尝试，仍然没有声音？</span>
	    </div>
	    <div style="margin-bottom:20px;font-size:14px;padding:0 15px;">
	    	<span style="text-decoration:underline;color:#0066FF;" onclick="feed()">点我提交反馈</span>
	    </div>
	</div>
<script type="text/javascript">
			function feed(){
				HH.href("/yzmm/account/conproblem/feedBackList");
			}
 </script>
</body>
</html>