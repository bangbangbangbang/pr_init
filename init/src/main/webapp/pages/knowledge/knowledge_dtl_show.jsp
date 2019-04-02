<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="<b:staticUrl>/res/js/wxmppay.js</b:staticUrl>"></script> 
<%@include file="../header_wxjsapi.jsp"%>
<div id="mainFrameWarpDiv" onclick="clearDetail()" style="display:none;position: fixed;z-index: 9999999;height:100%;max-width:540px;width:100%;top:110%;background-color: rgba(0,0,0,0.3);"></div>
<script type="text/javascript">
var wxfenxiangcb_list={
		title: '${wxshare.title}', // 分享标题
	    link: '${wxshare.link}', // 分享链接
	    imgUrl: '${wxshare.imgUrl}', // 分享图标
	    desc : '${wxshare.desc}',
	    shareTimeline:function(bool){
	    },
	    shareAppMessage:function(bool){
	    }
}
initwxfx(wxfenxiangcb_list);

var vNewIframe;//新建的iframe
var playIframe;

function removeOver(){
	var mfwd = $("#mainFrameWarpDiv");
	mfwd.children().each(function(){
		var o = $(this);
		var c = o.children();
		if(!playIframe || playIframe.attr("id") != c.attr("id")){
			o.remove();
		}
	});
}

function newIframe(id){
	var mfwd = $("#mainFrameWarpDiv");
	removeOver();
	var mainFrameDiv = $('<div style="display:none;height:100%;width:100%;"></div>');
	var h = document.documentElement.clientHeight;
	var iframe = $('<iframe id="iframe'+id+'" width="100%" height="'+h+'px" style="border: 0;" scrolling="no" src="" ></iframe>');
	mainFrameDiv.append(iframe);
	mfwd.append(mainFrameDiv);
	return iframe;
}


function viewDetail(id) {
	if(playIframe){
		if(("iframe"+id) == playIframe.attr("id")){
			showIframe(playIframe);
			return ;
		}
	}
	var src = "/yzmm/account/knowledge/viewDetail?knowledgeId="+id;
	toastWaiting();
	vNewIframe = newIframe(id);
	vNewIframe.bind("load", function() {
		vNewIframe.get(0).contentWindow.top_iframe_id = vNewIframe.attr("id");
		var aa = vNewIframe.get(0).contentWindow.wxfenxiangcb_dtl;
		initwxfx(aa);
	});
	vNewIframe.get(0).src = src;
	showIframe(vNewIframe);
}

	function showIframe(iframeDiv) {
		iframeDiv.parent().fadeIn(300);
		$("#mainFrameWarpDiv").show();
		$("#mainFrameWarpDiv").animate({
			top : "0%"
		}, 200, function() {
			toastWaitingColse();
			$("html").css("overflow", "hidden");
		});
	}

	function clearDetail() {
		toastWaiting();
		$("html").css("overflow", "auto");
		vNewIframe.parent().fadeOut(300);
		$("#mainFrameWarpDiv").animate({
			top : "110%"
		}, 200, function() {
			initwxfx(wxfenxiangcb_list);
			toastWaitingColse();
			$("#mainFrameWarpDiv").hide();
			$("#mainFrameWarpDiv div").hide();
		});
	}

	function clearPlay(top_iframe_id) {
		playIframe = $("#" + top_iframe_id);
		removeOver();
	}
/**
 * 浮球
 */
	function fuqiu(img) {
		var temp = $("#floatingBallTemp");
		$("#floatingBallTemp .circleLayer").show();
		$("#floatingBallTemp .circleLayer #circleLayerImg").attr("src",img);
		temp.click(function(){
			showIframe(playIframe);
		});
		temp.show();
// 		$(".circleLayer").css("display", "block").attr('href',
// 				temp.find('a').attr('href')).find('img').attr('src',
// 				temp.find('img').attr('src')).css('width', '56px').css(
// 				'height', '56px');
	}
</script>