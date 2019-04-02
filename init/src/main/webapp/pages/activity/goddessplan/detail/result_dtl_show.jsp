<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="<b:staticUrl>/res/js/wxmppay.js</b:staticUrl>"></script> 
<%@include file="../../../header_wxjsapi.jsp"%>
<style>


</style>
<div id="mainFrameWarpDiv" onclick="clearDetail()" ></div>
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

function removeOver(id){
	var mfwd = $("#mainFrameWarpDiv");
	mfwd.children().each(function(){
		var o = $(this);
		var c = o.children();
		if(id!=c.attr("id")){
			if(!playIframe || playIframe.attr("id") != c.attr("id")){
				o.remove();
			}
		}
	});
}

function newIframe(){
	var mfwd = $("#mainFrameWarpDiv");
	removeOver(1);
	var mainFrameDiv = $('<div class="iframeLayer"></div>');
	var iframe = $('<iframe id="'+(new Date().getTime())+'" width="100%" height="100%" style="border: 0;" src="" ></iframe>');
	mainFrameDiv.append(iframe);
	mfwd.append(mainFrameDiv);
	return iframe;
}


function viewDetail(id) {
	var src = "/yzmm/account/activity/goddessplan/detail/statusSeleter?activityId="+id+"&processStatus=DOING";
	
	try{
		var ifs=$("#mainFrameWarpDiv iframe");
		for (var i = 0; i < ifs.size(); i++) {
			if(ifs[i]){
				var ifsrc=ifs[i].src;
				if (Number(ifsrc.substring(ifsrc.indexOf('=') + 1)) == id) {
					vNewIframe[0]=ifs[i];
				}
			}
		}
	}catch (e) {
	}

	if (vNewIframe && vNewIframe.get(0).src.indexOf(src) >= 0) {
		showIframe(vNewIframe);
		
		var aa=vNewIframe.get(0).contentWindow.wxfenxiangcb_dtl;
		initwxfx(aa);
		return;
	}
	toastWaiting();
	vNewIframe = newIframe();
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
			//$(".parent").css("overflow", "hidden");
			//$(".parent").css("position","fixed");
			$(".parent").css("display","none");
			$(window).scrollTop(0);
		});
	}

	function clearDetail() {
		toastWaiting();
		$(".parent").css("overflow", "auto");
		//$(".parent").css("position","static");
		$(".parent").css("display","block");
		vNewIframe.parent().fadeOut(300);
		$("#mainFrameWarpDiv").animate({
			top : "110%"
		}, 200, function() {
			initwxfx(wxfenxiangcb_list);
			toastWaitingColse();
			$("#mainFrameWarpDiv").hide();
		});
	}

	function clearPlay(top_iframe_id) {
		playIframe = $("#" + top_iframe_id);
		removeOver(top_iframe_id);
	}

	function fuqiu() {
		var temp = $("#floatingBallTemp");
		$(".circleLayer").css("display", "block").attr('href',
				temp.find('a').attr('href')).find('img').attr('src',
				temp.find('img').attr('src')).css('width', '56px').css(
				'height', '56px');
	}
</script>