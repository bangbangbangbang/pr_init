<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--忽略页面中的邮箱格式为邮箱-->
<meta name="format-detection" content="email=no"/>
 <%@include file="../../header_v2.2.jsp" %>
<%@include file="../../header_wxjsapi.jsp"%>
<link rel="stylesheet" href="<b:staticUrl>/res/css/course/page/column.css</b:staticUrl>">
<link rel="stylesheet" href="<b:staticUrl>/res/css/course/base.css</b:staticUrl>">
<link rel="stylesheet" href="<b:staticUrl>/res/css/course/said.css</b:staticUrl>">
<link rel="stylesheet" href="<b:staticUrl>/res/css/navigator.css</b:staticUrl>">
<title>喵姐早教说</title>
 <script type="text/javascript">
	var wxfenxiangcb_dtl={
				title: '${wxshare.title}', // 分享标题
				desc : '${wxshare.desc}',
			    link: '${wxshare.link}', // 分享链接
			    imgUrl: '${wxshare.imgUrl}', // 分享图标
			    shareTimeline:function(bool){
			    	//TODO 待处理
			    },
			    shareAppMessage:function(bool){
			    	//TODO 待处理
			    }
			};
			 initwxfx(wxfenxiangcb_dtl);
	</script>
	<style id="imgh" type="text/css">
	
	</style>
  
</head>
<body>
  <!--8分钟经典育儿栏目列表-->
		<div class="wrapPage">
			<img src="/res/img/course/smalldayupdate/u33.jpg" alt="" class="listPageImg" />
			<div class="listTitle clearfix">
				<p class="fl titLeft">栏目主编：喵姐 — 高寿岩</p>
				<p class="fr titRight">已更新${count }条音频</p>
			</div>
			 <!-- 小日更列表内容 -->
		</div>
		<script type="text/javascript">
			$(function(){
				//第几讲
				var courseIndex=parseInt('${count }');
				
				var pageIndex = 1;
				var sm = {};
				sm = $(window).scrollme({
				target:$("#miaoListall"),
				  url:'/yzmm/account/smallDayUpdate/ajaxList',
				    data:{
				    	pageIndex:pageIndex,
				    	pageSize:10
				    },
				    callback:function(data,params){
				    	$('.load').hide();
			    		if(data.success){
			    			var list=JSON.parse(data.ext);
			    			var len = list.length;
			    			if (len) {
								//增加页码
								params.pageIndex = ++pageIndex;
							}
							for(var i=0;i< len;i++){
								var o = list[i];
								var div1=$('<div class="listDetails clearfix" data-sduid='+o.id+'></div>').appendTo($('.wrapPage'));
								var img1=$('<img src="/res/img/course/smalldayupdate/u125.png" alt="" class="fl detailsImg" />').appendTo(div1);
								var div2=$('<div class="fl detailsContent"></div>').appendTo(div1);
								var h4=$('<h4>第'+(courseIndex--)+'讲 | '+o.themeContent+'</h2>').appendTo(div2);
								var div3=$('<div class="textTime clearfix"></div').appendTo(div2);
								var pclazz='';
								if(o.heard){
									pclazz='hearEnd';
								}else{
									pclazz='hearStart';
								}
								var p1=$('<p class="'+pclazz+'">'+o.themeName+'  | '+fmtDate(new Date(o.smduTime*1000),'MM-dd')+'  |  时长'+formatSecondsDDHHmmss(o.timeLen)+'</p>').appendTo(div3);
								var img2=$('<img src="/res/img/course/smalldayupdate/u133.png" alt="" />').appendTo(div3);
								var div4=$('<div class="line"></div>').appendTo($('.wrapPage'));
							} 
			    		}
			    		$('.listDetails').on('click',function(){
							var self=$(this);
							HH.href('/yzmm/account/smallDayUpdate/detail?id='+self.data('sduid'));
						});
				    }
				 });
				sm.reload();
			});
		</script>
</body>
</html>