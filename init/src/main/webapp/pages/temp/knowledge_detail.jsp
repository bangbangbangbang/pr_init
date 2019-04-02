<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head lang="en">
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta name="format-detection" content="email=no"/>
	<title>喵姐早教说</title>
     <%@include file="../header_v12_1.jsp" %>
     <%@include file="../header_wxjsapi.jsp"%>
     <link rel="stylesheet" type="text/css" href="<b:staticUrl>/res/css/share.css</b:staticUrl>" />
    <style>
    	.audio-haddle{ padding:0 1.5rem;}
		.wrap{ padding:0 0.54rem;}
/* 		.box5{height:1.58rem; overflow:hidden;} */
		/* 阻止长按出现的复制框 */
		body{
   			-webkit-user-select:none;
			-ms-user-select: none;
			-moz-user-select: none;
			user-select: none;
			-webkit-touch-callout:none;
			-ms-touch-callout:none;
			-mozt-touch-callout:none;
			touch-callout:none;
   		}
	.oneyuan{
		margin-left:5%;
		width: 90%;
		height: 1.2rem;
		background:url(<b:staticUrl>/res/img/background-oneyuan.png</b:staticUrl>);
		background-size: 100%;
		border-radius: 12px;
	}
</style>
 
</head>
<body>
<%@include file="../share_head.jsp"%>
<%@include file="../userAuthorise.jsp" %>
<script type="text/javascript">
var isIframe = top != window;

	  var wxfenxiangcb_dtl={
			title: '${wxshare.title}', // 分享标题
			desc : '${wxshare.desc}',
		    link: '${wxshare.link}', // 分享链接
		    imgUrl: '${wxshare.imgUrl}', // 分享图标
		    shareTimeline:function(bool){
		    },
		    shareAppMessage:function(bool){
		    }
	};
	  initwxfx(wxfenxiangcb_dtl);

var hasAuth = "${hasAuth}"=="true";
var authMsg = "亲，听完语音，再来点我~";
/*$(function(){
	 if("${not hasAuth}"=="true"){
		userAuthOpt.once("${money}");
		userAuthOpt.onceClick=function(){
			$(".oneyuan").click();
		};
	} 
})*/

$(function(){
	if(isIframe){
		$("#clearDetailDiv").show();
	}
});

</script>
<input type="hidden" id="limit" value="${listen+1}">
	<div id="clearDetailDiv" style="position: fixed;right: 5%;top:1%;display: none;cursor:pointer;" onclick="top.clearDetail()">╳</div>
	<section class="wrapper">
		<div class="miao-info">
			<div class="miao-cont">
				<div class="miao-photo"><img src="<b:staticUrl>/res/img/Oval37.png</b:staticUrl>" ></div>
				<div class="font12 miao-about">
					<h2 class="font15">喵姐</h2>
					<p class="info-1">0-6岁育儿江湖资深女侠</p>
					<p class="info-2">超级辣妈</p>
					<p class="info-3">气质女神</p>
					<p class="info-4">著有育儿宝典无数</p>
				</div>
			</div>
		</div>
		<div class="font18 detail-title">${knowledge.title}</div>
		<div class="font12 detail-other"><span>推荐${minAge}-${maxAge}</span>
		<c:if test="${questionFromUser != null}">
		问题出自：${questionFromUser}
		</c:if>
		</div>
		<c:if test="${hasAuth}">
            <audio preload="none" style="visibility:hidden;" controls>
                <source src="${playUrl}" />
            </audio>
		</c:if>
		<c:if test="${not hasAuth}">
			<div class="oneyuan"></div>
		</c:if>
		<ul class="font15 audio-info">
		
			<li><p id="listencount">${listen}</p><p>听过</p></li>
			<li><p id="miaocount">${miao}</p><p>喵过</p></li>
			<li class="xie" onclick="commentlist()">
				<p class="mymessage">&nbsp;</p>
				<p>留言</p>
			</li>
			<li class="xie collect">
				<c:if test="${hasCollect==0}">
					<p class="pt mycollection-no">&nbsp;</p>
					<p class="pw mycollection-txt-no">收藏</p>
				</c:if>
				<c:if test="${hasCollect==1}">
					<p class="pt mycollection-yes">&nbsp;</p>
					<p class="pw">收藏</p>
				</c:if>
			</li>
		</ul>
		<div class="font15 audio-haddle" style="padding: 0 1.5rem;" id="all">
		<%-- <c:if test="${uState==0}"> --%>
			<a id="miao" class="audio-miao" style="display: none;" onclick="miao()">喵一下</a>
			<a id="pei" class="audio-pei" style="display: none;" onclick="pei()">呸一下</a>
		<%-- </c:if> --%>
		
		<%-- <c:if test="${uState==1}">
		<a  class=" audio-miao2">您已经喵过</a>
		</c:if>
		<c:if test="${uState==2}">
		<a  class=" audio-pei2">您已经呸过</a>
		</c:if> --%>
		<a id="miaoNEW" class=" audio-miao2" style="display: none;">您已经喵过</a>
		<a id="peiNEW" class=" audio-pei2" style="display: none;">您已经呸过</a>
		
		</div>
		<div class="audio-about">
			<div class="font15 about-tit " >内容简介：</div>
			<div class="font12 about-box box5"  style="line-height: 19px;">
				${content}
			</div>
		</div>
		<div class="audio-list">
			<div class="font15 list-tit">大家都在听：</div>
			<div class="list-box box6" id="tonewmiao"> 	
				
			</div>
		</div>
		
		<!--尾部-->
	<jsp:include page="/pages/header_footer.jsp">
		<jsp:param value="1" name="menu"/>
	</jsp:include>
	</section>
    	<div class="layer layer-message">
	    <div class="message-box">
	        <div class="messageCont">
	            <div class="textarea">
	                <textarea onkeyup="fn()" onblur="fn()" maxlength="120" placeholder="请输入留言内容"></textarea>
	                <span>0／120</span>
	            </div>
	            <button class="submit biao" id="tobutton">发表</button>
	        </div>
	    </div>
	</div>
	<div class="layer sw">
		<div class="layer-box">
			<div class="font12 pei-cont yp">
				<p class="font15">很抱歉，该回答让您失望了，您对哪方面最不满意：</p>
				<div class="radio" >内容难以理解</div>
				<div class="radio" >回答不正确</div>
				<div class="radio" >声音不好听</div>
				<div class="radio qita" id="question">其他</div>
			</div>
            <a id="toradio" class="queding">提交</a>
		</div>
	</div>

</body>
<script src="<b:staticUrl>/res/js/wxmppay.js</b:staticUrl>"></script> 
<script type="text/javascript">
//是否有访问权限
var hasAuth = ${hasAuth};
var authStatus = "${authStatus}";
$(function(){
	 $(".oneyuan").click(function(){
			userAuthOpt.once("${money}");
			userAuthOpt.onceClick=function(){
				 top.wxmppayasqw("${kid}",function(orderId,result){
		 			if("ok"==result){
		 				if(isIframe){
		 					window.location.href="/yzmm/wxmppay/sqw/checkPay?knowledgeId=${kid}&orderId="+orderId;
		 				}else{
		 					window.location.href="/yzmm/wxmppay/sqw/checkPay?knowledgeId=${kid}&orderId="+orderId;
		 				}
		 			 }else{
							return;
					  }
			 	}); 
			};
	 	});
	 var kid="${knowledge.id}";
	 //防止返回出现多次提交
	 HH.ajax({
		 url: "/yzmm/account/knowledgeMiaoListen/ajaxmiaopeicollect",
		 data:{id : kid},
		 callback: function(data,params){
			         if(data.success){
			        	 var len=data.list.length;
			        	 if(len!=0){
			        		 var o = data.list[0];
					    	 if(o.miao==1){
									$("#miaoNEW").show();
							 }else if(o.miao==2){
							         $("#peiNEW").show();
							 }else{
									 $("#pei").show();
									 $("#miao").show();
							 }
						     if(o.collect){
						    	 if ($(".collect p").hasClass("mycollection-no")) {
										$(".pt").removeClass("mycollection-no").addClass("mycollection-yes");
										$(".pw").removeClass("mycollection-txt-no")
									} else {
										$(".pt").removeClass("mycollection-yes").addClass("mycollection-no");
										$(".pw").addClass("mycollection-txt-no");
									}
						     }
			        	 }else{
			        		 $("#miao").show();
			        		 $("#pei").show();
			        	 }
			         }
		 }
	 });
})
</script>
<script type="text/javascript">
	$(function(){
		$(".collect").click(function(){
			var uid = "${uid}";
			var kid = ${knowledgeId};
			var collectStatus;
			if ($(".collect p").hasClass("mycollection-yes")) {
				//此次点击会取消收藏
				collectStatus = 0;
			} else {
				//此次点击会添加收藏
				collectStatus = 1;
			}
			HH.ajax({
				   waiting:false,
				   async:false,
				   url: "/yzmm/account/user/collectKnowledge",
				   data: {
					   uid : uid,
					   knowledgeId : kid,
					   collectStatus : collectStatus
				   },
				   callback: function(data){
						if (data.success) {
							if ($(".collect p").hasClass("mycollection-no")) {
								$(".pt").removeClass("mycollection-no").addClass("mycollection-yes");
								$(".pw").removeClass("mycollection-txt-no")
							} else {
								$(".pt").removeClass("mycollection-yes").addClass("mycollection-no");
								$(".pw").addClass("mycollection-txt-no");
							}
						}
				   }
			});
		})
	})
</script>

<script>

//评论测试字数限制
function fn(){
	var len = $(".textarea textarea").val().length
	$(".textarea span").text(len + "/120")
}
//呸的内容(其他)
$("#tobutton").click(function(){
	if(!hasAuth){
		toast(authMsg);
		return;
	}	
	var pro =$("textarea").val();
	if(pro == ""){
		toast("请输入您的建议！");
	}else{
		$(".layer-message").hide();
		var kid = "${knowledge.id}";
		 HH.ajax({
			   url: "/yzmm/account/knowledgeMiaoListen/ajaxQuestion",
			   data: {question:pro,knowledgeId:kid},
		       success: function(data){
			   }
		});
	}
})
//呸的前三个
$("#toradio").click(function(){
	var radio = $(".radio1").html();
	 if(radio==null){
		 toast("请您选择一项内容！");
	 }else{
		 $(".sw").hide();
		 var kid="${knowledge.id}";
		 HH.ajax({
			   waiting:false,
			   url: "/yzmm/account/knowledgeMiaoListen/ajaxQuestion",
			   data: {question:radio,knowledgeId:kid},
		       success: function(data){
			   }
		});
	 }
})
//呸
function pei(){
	if(!hasAuth){
		toast(authMsg);
		return;
	}	
	var kid="${knowledge.id}";
	 HH.ajax({
		 waiting:false,
		   url: "/yzmm/account/knowledgeMiaoListen/ajaxPei",
		   data: {knowledgeId:kid},
		   callback: function(data){
			   if(!data.success){
				   return;
			   }
			   $("#pei").hide();
			   $("#miao").hide();
			   $("#peiNEW").show();
			   paiclick();
		   }
	});
}
//喵
function miao(){
	if(!hasAuth){
		toast(authMsg);
		return;
	}	
	var kid="${knowledge.id}";
	 HH.ajax({
		 waiting:false,
		   url: "/yzmm/account/knowledgeMiaoListen/ajaxMiao",
		   data: {knowledgeId:kid},
		   callback: function(data){
			   if(!data.success){
				   return;
			   }
				   $("#miao").hide();
				   $("#miaoNEW").show();
				   var x =$("#miaocount").html();
				   x = parseInt(x) + 1;
				   $("#miaocount").html(x);
				   miaoclick();
		   }
	});
}

$(function(){
	tonewmiao();
})
function tonewmiao(){
	var knowledgeId = "${knowledge.id}";
	var knowledgeRemark = "${knowledge.remark}";
	var mimAge="${newMinAge}";
	var maxAge="${newMaxAge}";
	HH.ajax({
		 waiting:false,
		 url: "/yzmm/account/knowledge/ajaxgetKnowledge",
		 data: {
			 knowledgeId:knowledgeId,
			 knowledgeRemark:knowledgeRemark,
			 mimAge:mimAge,
			 maxAge:maxAge},
		 callback: function(data){
			 var h="";
			 var a =data.list[0];
			 if(data.success){
				   h+='<a onclick="toNewMiaoIndex('+a.newKid+')" class="list-item">'
				     +'<div class="font15 info-title jump">'+a.newTitle+'</div>'
					 +'<div class="info info-title" style="margin-top: 6px;">'
					 +'<span class="font12">推荐'+a.minage+'-'+a.maxage+'<i>|</i>听过'+a.newListen+'<i>|</i>喵过'+a.newMiao+'</span>'
					 +'</div></a>'
				 $("#tonewmiao").html(h);
			 }else{
				 $("#tonewmiao").hide();
			 }
		  }
	});
}
function toNewMiaoIndex(newkid){
	window.location = "/yzmm/account/knowledge/viewDetail?knowledgeId="+newkid;
}

//跳转到留言的页面
function commentlist(){
	window.location ="/yzmm/account/knowledge/commentlist?knowledgeId=${knowledgeId}";
}
function addTimelen(obj){
	obj = $(obj);
	var a = obj.get(0);
	if(a && !obj.hasClass("time")){
		window.setTimeout(function() {
			if(isNumeric(a.duration)){
				var duration = a.duration;
				var o = obj;
				o.addClass("time");
				 if(duration){
					 HH.ajax({
						   waiting:false,
						   url: "/yzmm/account/knowledge/ajaxAddTime",
						   data: {kid:'${knowledge.id}',time:duration},
					});
				 }
			}
		}, 2000);
	}
}
//用来判断听过数+1的方法
var lim=$("#limit").val();
var x = $("#listencount").html();
var noListen = true;
var kid=${knowledge.id};

var audioplaytime = {};
	 $( function()
		{
			$( 'audio' ).myaudio({
					play:function(thet){
						if(noListen){
			            	 HH.ajax({
			            		 waiting:false,
								   url: "/yzmm/account/knowledgeMiaoListen/tolistencount",
								   data: {knowledgeId:kid},
								   callback: function(data){
										   var x =$("#listencount").html();
										   x = parseInt(x) + 1;
										   $("#listencount").html(x);
								   }
							});
			            	 noListen = false;
			            }
					},
					audioPlay:function(audio){
						audioplaytime["currentTime${kid}"] = audio.currentTime;
						//记录播放时间
						var starttime = audioplaytime["start${kid}"];
						if(!starttime){
							audioplaytime["start${kid}"] = new Date().getTime();
						}
						if("0" == "${playTimeSec}"){
							addTimelen($( 'audio' ))
						}
					},
					audioPause:function(audio){
						//记录播放时间
						uploadPlayTime(audio);
					}
			});
			
			if("0" != "${playTimeSec}"){
				$(".myaudio .duration").html("${playTime}");
			}
		});
	//记录播放时间
	 function uploadPlayTime(audio){
			HH.ajax({
				   waiting:false,
				   url: "/yzmm/account/knowledge/sqwPlayTime",
				   data: {kid:'${kid}',start:audioplaytime["start${kid}"],end:new Date().getTime(),duration:audio.duration,endCurrentTime:audio.currentTime,startCurrentTime:audioplaytime["currentTime${kid}"]},
			});
			
		}
		
		 function miaoclick(){
			$(this).addClass("audio-miao2")
			$(this).text("您已经喵过")
			$(".audio-pei").css("display","none")
			}
	 function paiclick(){
			$(".audio-pei").addClass("audio-pei2")
			$(".audio-pei").text("您已经呸过")
			$(".audio-miao").css("display","none")
			}
		
	$(".audio-pei").click(function(){
		if(!hasAuth){
			return;
		}
		$(".sw").show();
		$(".sw > div").animate({"bottom":"0px"},200);
		})
	$(".yp div").click(function(){
		if(!hasAuth){
			return;
		}
		
		$(".yp div").removeClass("radio1")
		$(this).addClass("radio1")
		})
	
	
		$(".qita").click(function(){
			if(!hasAuth){
				return;
			}
			$(".sw").hide()
			$(".layer-message").show()
			$(".layer-message textarea").focus();
			$(".message-box").animate({"bottom":"0px"},200);
			})
			
		$(".biao").click(function(){
			if(!hasAuth){
				return;
			}
			$(".audio-pei").addClass("audio-pei2")
			$(".audio-pei").text("您已经呸过")
			$(".audio-miao").css("display","none")
			})
	</script>
	<!-- footer目录 -->
	<script type="text/javascript">
		function tosqw() {
			top.location = "/yzmm/account/knowledge/index";
		}
		//喵姐说
		function tocourse() {
			top.location = "/yzmm/account/course/list";
		}
		function miaoquan(){
			top.location = "/yzmm/account/miaoquan/index";
		}
		//我
		function tome() {
			top.location = "/yzmm/account/user/info";
		}
	</script>
</html>