<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
	<meta name="format-detection" content="telephone=no,address=no,email=no">
	<title>电脑直播测试页面</title>
	<%@include file="../header_v2.0.jsp"%>
	<script src="<b:staticUrl>/res/js/vote.js</b:staticUrl>"></script>
	<style type="text/css">
	.rem{
		line-height: 0.42666667rem;
	    font-size: 0.32rem;
	    text-align: center;
	    color: #f8e71c;
	}
	</style>
</head>
<body>
<div style="position: absolute;top: 0;left: 0;z-index: -999;">
	<div id="playercontainer"></div>
</div>
    <script type="text/javascript" src="<b:staticUrl>/res/player/cyberplayer.js</b:staticUrl>"></script>
    <script type="text/javascript">
        var myPlayer = cyberplayer("playercontainer").setup({
            width: 1,
            height: 1,
            stretching: "uniform",
            file: "${playUrl}",
            autostart: false,
            repeat: false,
            volume: 100,
            controls: true,
            barLogo:false,
            ak: '${baiduoak}' // 公有云平台注册即可获得accessKey
        });
        myPlayer.on('ready', function () {
        		myPlayer.play();
   	});
    </script>
<div class="live">
	<img src="${imgUrl}" class="livephoto" >
	<div class="liveTop">
		<div class="liveNote" >
			<div class="photo"><img src="<b:staticUrl>/res/img/miaojie.jpg</b:staticUrl>" ></div>
			<span class="horn"></span>
		</div>
	</div>
	<div class="liveTit">${name}</div>
	<div class="rem liveTit"><p>本页面仅作测试直播所用</p><p>为了更好的为您服务</p><p>如若本页面能听，请反馈 《电脑测试页面3》能听</p><p>谢谢您的合作</p></div>
	<div class="answer" >
			<div class="answerImg"><img src="${imgUrl}" >
				<span class="answerOrend">直播中</span>
			</div>
	</div>
</div>
</body>
</html>