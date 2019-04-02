<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@include file="../header.jsp"%>
<%@include file="../header_wxjsapi.jsp"%>
<title>weixin demo</title>
</head>
<body style="text-align: center">
<br>
<input id="startRecord" type="button" value="开始录音"><br><br>
<input id="stopRecord" type="button" value="停止录音"><br><br>
<input id="playVoice" type="button" value="播放"><br><br>
<input id="downplayVoice" type="button" value="下载后播放"><br><br>
<input id="pauseVoice" type="button" value="暂停"><br><br>
<input id="stopVoice" type="button" value="停止"><br><br>
<input id="uploadVoice" type="button" value="上传录音"><br><br>
<script type="text/javascript">
var localId = "wxLocalResource://4960777916203686";
var serverId = "ql0BcLdNmY_Z7RzUY7SR8vqKhEswgTPn0MnOatdHCGkIkofQG5a4iupLNxAyUdqb";
// 4.2 开始录音
document.querySelector('#startRecord').onclick = function () {
  wx.startRecord({
    cancel: function () {
    	toast('您拒绝了授权录音');
    }
  });
};
//4.3 停止录音
document.querySelector('#stopRecord').onclick = function () {
  wx.stopRecord({
    success: function (res) {
    		localId = res.localId;
    		HH.ajax({
    			url: "/yzmm/upload/temp/wxaudio",
    			data:{serverId:localId,parent:"wxaudio"},
    			callback:function(data){
    				if(data.success){
    					toast(data.msg);
    				}else{
    					toast(data.msg);
    				}
    			}
    		});
    },
    fail: function (res) {
     	toast("微信停止录音失败");
    }
  });
};

// 4.5 播放音频
document.querySelector('#playVoice').onclick = function () {
  if (localId == '') {
	  toast('请先录制您的声音');
    return;
  }
  wx.playVoice({
    localId: localId
  });
};
// 4.5 播放音频
document.querySelector('#downplayVoice').onclick = function () {
  if (serverId == '') {
	  toast('请先录制您的声音');
    return;
  }
  wx.downloadVoice({
	    serverId: serverId, // 需要下载的音频的服务器端ID，由uploadVoice接口获得
	    isShowProgressTips: 1, // 默认为1，显示进度提示
	    success: function (res) {
	        var localId = res.localId; // 返回音频的本地ID
	        wx.playVoice({
	            localId: localId
	          });
	    }
	});
};
//4.6 暂停播放音频
document.querySelector('#pauseVoice').onclick = function () {
  wx.pauseVoice({
    localId: localId
  });
};
//4.7 停止播放音频
document.querySelector('#stopVoice').onclick = function () {
  wx.stopVoice({
    localId: localId
  });
};

// 4.8 上传语音
document.querySelector('#uploadVoice').onclick = function () {
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
				toast(data.msg);
			}else{
				toast(data.msg);
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
	  }
	});
	// 4.8 监听录音播放停止
	// wx.onVoicePlayEnd({
	//   complete: function (res) {
//	 	  toast('录音（' + res.localId + '）播放结束');
	//   }
	// });
<c:if test="${not empty wxshare}">initfenxiang();</c:if>
});

// 4.9 下载语音
/*
document.querySelector('#downloadVoice').onclick = function () {
  if (voice.serverId == '') {
    alert('请先使用 uploadVoice 上传声音');
    return;
  }
  wx.downloadVoice({
    serverId: voice.serverId,
    success: function (res) {
      alert('下载语音成功，localId 为' + res.localId);
      voice.localId = res.localId;
    }
  });
};
*/
</script>
<script type="text/javascript">
var wxfeixiangcb={};
function initfenxiang() {
//获取“分享到朋友圈”按钮点击状态及自定义分享内容接口
wx.onMenuShareTimeline({
    title: '${wxshare.title}', // 分享标题
    link: '${wxshare.link}', // 分享链接
    imgUrl: '${wxshare.imgUrl}', // 分享图标
    desc: "这个是测试分享的哦",
    success: function () { 
        // 用户确认分享后执行的回调函数
     	//toast('分享到朋友圈');
        if(wxfeixiangcb.shareTimeline){
       	 	wxfeixiangcb.shareTimeline(true);
        }
    },
    cancel: function () { 
        // 用户取消分享后执行的回调函数
    	 if(wxfeixiangcb.shareTimeline){
    			wxfeixiangcb.shareTimeline(false);
       }
    }
});
//获取“分享给朋友”按钮点击状态及自定义分享内容接口
wx.onMenuShareAppMessage({
    title: '${wxshare.title}', // 分享标题
    desc: '${wxshare.desc}', // 分享描述
    link: '${wxshare.link}', // 分享链接
    imgUrl: '${wxshare.imgUrl}', // 分享图标
    type: '${wxshare.type}', // 分享类型,music、video或link，不填默认为link
    dataUrl: '${wxshare.dataUrl}', // 如果type是music或video，则要提供数据链接，默认为空
    success: function () { 
        // 用户确认分享后执行的回调函数
       // alert('分享到朋友');
        if(wxfeixiangcb.shareAppMessage){
       	 	wxfeixiangcb.shareAppMessage(true);
        }
    },
    cancel: function () { 
        // 用户取消分享后执行的回调函数
	    	if(wxfeixiangcb.shareAppMessage){
	       	 wxfeixiangcb.shareAppMessage(false);
        }
    }
});
//获取“分享到QQ”按钮点击状态及自定义分享内容接口
wx.onMenuShareQQ({
	title: '${wxshare.title}', // 分享标题
    desc: '${wxshare.desc}', // 分享描述
    link: '${wxshare.link}', // 分享链接
    imgUrl: '${wxshare.imgUrl}', // 分享图标
    success: function () { 
       // 用户确认分享后执行的回调函数
    	if(wxfeixiangcb.shareQQ){
	       	 wxfeixiangcb.shareQQ(true);
       }
    },
    cancel: function () { 
       // 用户取消分享后执行的回调函数
     	if(wxfeixiangcb.shareQQ){
	       	 wxfeixiangcb.shareQQ(false);
       }
    }
});
//获取“分享到腾讯微博”按钮点击状态及自定义分享内容接口
wx.onMenuShareWeibo({
	title: '${wxshare.title}', // 分享标题
    desc: '${wxshare.desc}', // 分享描述
    link: '${wxshare.link}', // 分享链接
    imgUrl: '${wxshare.imgUrl}', // 分享图标
    success: function () { 
       // 用户确认分享后执行的回调函数
   	 	if(wxfeixiangcb.shareWeibo){
	       	 wxfeixiangcb.shareWeibo(true);
      	}
    },
    cancel: function () { 
        // 用户取消分享后执行的回调函数
    		if(wxfeixiangcb.shareWeibo){
	       	 wxfeixiangcb.shareWeibo(false);
     	}
    }
});
//获取“分享到QQ空间”按钮点击状态及自定义分享内容接口
wx.onMenuShareQZone({
	title: '${wxshare.title}', // 分享标题
    desc: '${wxshare.desc}', // 分享描述
    link: '${wxshare.link}', // 分享链接
    imgUrl: '${wxshare.imgUrl}', // 分享图标
    success: function () { 
       // 用户确认分享后执行的回调函数
   	 	if(wxfeixiangcb.shareQZone){
	       	 wxfeixiangcb.shareQZone(true);
     	}
    },
    cancel: function () { 
        // 用户取消分享后执行的回调函数
    		if(wxfeixiangcb.shareQZone){
	       	 wxfeixiangcb.shareQZone(false);
   	 	}
    }
});

};


</script>

</body>
</html>
