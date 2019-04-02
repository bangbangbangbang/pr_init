<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script type="text/javascript">
//jsapi 是否可用
var canwxaudio = "${jsapi.code}" == "true";
if(canwxaudio){
	wx.config({
	    debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
	    appId: '${jsapi.msg.appId}', // 必填，公众号的唯一标识
	    timestamp: '${jsapi.msg.timestamp}', // 必填，生成签名的时间戳
	    nonceStr: '${jsapi.msg.nonceStr}', // 必填，生成签名的随机串
	    signature: '${jsapi.msg.signature}',// 必填，签名，见附录1
	    jsApiList: ['startRecord','stopRecord','onVoiceRecordEnd','playVoice','pauseVoice','stopVoice','onVoicePlayEnd','uploadVoice','downloadVoice','onMenuShareTimeline','onMenuShareAppMessage','onMenuShareQQ','onMenuShareWeibo','onMenuShareQZone','closeWindow'] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
	});
	wx.error(function(res){
	    // config信息验证失败会执行error函数，如签名过期导致验证失败，具体错误信息可以打开config的debug模式查看，也可以在返回的res参数中查看，对于SPA可以在这里更新签名。
		canwxaudio = false;
	});
}

</script>
<script src="<b:staticUrl>/res/js/share/wxfxyy.js</b:staticUrl>"></script>