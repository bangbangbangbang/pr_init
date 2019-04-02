<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="j" uri="/jsputil" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head lang="en">
<meta charset="UTF-8">
<title>女神行动计划</title>
<%@include file="../../../header_v2.1.jsp"%>
<%@include file="../../../header_wxjsapi.jsp"%>
<script src="<b:staticUrl>/res/js/scrollpaginationme.js</b:staticUrl>"></script>
<script src="<b:staticUrl>/res/js/package/activity/goddessplan/activity.js</b:staticUrl>"></script>
	<style type="text/css">
		.font18 {
		    font-size: 15px;
		}
		.btnfixed {
		    width: 100%;
		    height: 1.86666667rem;
		    position: relative;
		    z-index: 10;
		}
		.btnfixed a {
		    display: block;
		    width: 5.06666667rem;
		    height: 1.2rem;
		    line-height: 1.2rem;
		    position: fixed;
		    left: 50%;
		    bottom: 1.70666667rem;
		    z-index: 110;
		    margin-left: -2.53333333rem;
		    background-color: #e51812;
		    border-radius: 1.33333333rem;
		    text-align: center;
		    color: #fff;
		}
		.to-comment {
		    position: fixed;
		    width: 100%;
		    top: 0px;
		    left: 0px;
		}
		.publishVote {
		    width: 100%;
		    max-width: 540px;
		    margin: 0 auto;
		    height: 100%;
		    background: #fff;
		    position: absolute;
		    top: 0;
		    z-index: 99;
	        box-sizing: border-box;
   			font-family: 微软雅黑, PingFangSC-Light;
	    }
	    .publishVote .voteTit {
		    width: 100%;
		    padding: 0.46666667rem 0 0.53333333rem 0;
		    text-align: center;
		}
		.font17 {
		    font-size: 17px;
		    line-height: 17px;
		}
		.publishVote .voteBox {
		    width: 9.17333333rem;
		    height: 3.86666667rem;
		    position: relative;
		    margin: 0 auto;
		    padding: 0.25333333rem 0.53333333rem 0.8rem 0.53333333rem;
		    border: 1px solid #999;
		    border-radius: 0.10666667rem;
		}
		.publishVote textarea {
		    width: 100%;
		    height: 100%;
		    overflow: hidden;
		    resize: none;
		}
		
		.publishVote .num {
		    position: absolute;
		    right: 0.26666667rem;
		    bottom: 0.32rem;
		    color: #ccc;
		}
		
		.font12 {
		    font-size: 12px;
		    line-height: 12px;
		}
		.publishVote .submit, .publishVote .cancle {
		    float: right;
		    width: 1.54666667rem;
		    height: 0.76rem;
		    line-height: 0.76rem;
		    margin-right: 0.4rem;
		    margin-top: 0.32rem;
		    background-color: #e51812;
		    border-radius: 6px;
		    text-align: center;
		    color: #fff;
		}
		.publishVote .cancle {
			background-color: #666;
		}
		.font15 {
			    font-size: 15px;
			    line-height: 15px;
			}
		.codeTypeMiaoClass {
		    margin-top: 20px;
		    text-align: center;
		    color: #cccccc;
		}
	</style>
</head>
<body>
	<div class="show">
		<h1 class="activityTitle"><c:out value="${title}"></c:out><span class="backBtn" onclick="window.history.back();"></span></h1>
		<ul class="activityClass" id="bb">
		
		</ul>
		<div class="font18 btnfixed"><a class="votebtn" href="javascript:void(0)">聊一聊</a></div>
		<!-- 底脚 -->
		<jsp:include page="/pages/header_footer.jsp">
			<jsp:param value="3" name="menu" />
		</jsp:include>
	</div>
	<!--发表评论-->
	<div class="to-comment" id="to-comment" style="display:none;">
		<form class="publishVote" style="display:block;">
			<div class="font17 voteTit"></div>
			<div class="voteBox">
				<textarea class="font12" id="talkcontent" onkeyup="fn()" onblur="fn()" placeholder="写下想和大家聊的话..." maxlength="120"></textarea>
				<span class="font12 num"><i class="wordCount">0</i> / 120</span>
			</div>
			<a href="javascript:void(0)" onclick="doCommentText(this)" class="font15 submit" >发表</a>
			<a href="javascript:void(0)"  class="font15 cancle" >取消</a>
		</form>
	</div>
	<!-- 初始化参数 -->
	<script type="text/javascript">
	var dayId = '${dayId}';
	/**
	 * 评论刷新
	 */
	//上次的数据还没有返回
	 var ajaxCommentReqing = false; 
	//后台所有评论的数量
	var pageMark = 0;
	//评论刷新开关
	var flushCommentStop = false;
	
	//初始化pageSize数量
	var pageSize = 10;
	
	//backwardBeginIndex--向上翻的开始索引 默认为-100 任何操作都会改变该值
	var backwardBeginIndex = -100;
	
	</script>
	<script type="text/javascript">
	$(function(){
		$(".votebtn").click(function(){
			$(".voteBox textarea").val("");
			$(".to-comment").fadeIn("slow");
			$(".show").fadeOut("slow");
		});
		$(".publishVote .cancle").click(function(){
			$(".show").fadeIn("slow");
			$(".to-comment").fadeOut("slow");
		});
	});
	//文本内容字数显示
	function fn(){
		var len = $("#talkcontent").val().length;
		$(".wordCount").text(len);
	}
	</script>
	<!-- 添加评论 -->
	<script type="text/javascript">
		var activityId = '${activityId}';
		function doCommentText(obj){
			//获取评论
			var comment = $("#talkcontent").val();
			console.log(comment);
			$("#talkcontent").val("");
	
			HH.ajax({
				url: "/yzmm/account/activity/goddessplan/miaoclass/publishMiaoclass",
				data:{
					text:comment,
					activityId:activityId
					},
				callback:function(data){
					if(data.success){
						$("#comment").val("");
						$(".show").fadeIn("slow");
						$(".to-comment").fadeOut("slow");
						flushComment();
						$(".codeTypeMiaoClass").remove();
					}else{
						toast(data.msg);
						return;
					}
				}
			});
		}
	</script>
	
	<script type="text/javascript">
		var pageIndex = 1;
		var sm = {};
		//向下滑动分页总页数
		var inittotalRow = -1;
		$(function(){
			sm = $(window).scrollme({
				//target:$("#bb"),
				data:{pageSize:10,activityId:activityId,inittotalRow:inittotalRow},
				url:"/yzmm/account/activity/goddessplan/miaoclass/ajaxGetUpMoreClassList",
				callback:function(data,params){
					var h = "";
					if (data.success) {
						//是否为空
						if (!data.totalPage) {
							$(".noresult").remove();
							$("#miaoclassNull").remove();
							h='<div id ="miaoclassNull" class="font15 codeTypeMiaoClass">静悄悄的喵班级，大家都在等你聊！</div>'
						} else {
							$(".noresult").hide();
							var len = data.list.length;
							if (len) {
								//增加页码
								//console.log("before totalRow:"+data.pageMark);
								params.inittotalRow = data.pageMark;
								//console.log("向下滑动:"+data.pageMark);
								if(backwardBeginIndex==-100){
									backwardBeginIndex = data.msg;
								}
								//console.log("next totalRow:"+data.pageMark);
							}
							//console.log("len"+len);
							for (var i = len-1; i >= 0; i--) {
								var o = data.list[i];
								if(o.isMyComment){
									h+='<li class="listitem miaoclassmetalk">';
								}else{
									h+='<li class="listitem">';
								}
								if(i==0){
									h+='<div class="taggray">'+data.ext+'</div>';
								}
									h+='<div class="photo"><img src="'+o.userAlbumUrl+'" ><div class="tit">'+o.userName+'</div></div>';
									h+='<div class="listcont">';
										h+=o.content;
									h+='</div>';
								h+='</li>';						
							}
						}
					} 
					$("#bb").append(h);
				}
			});
			//加载数据
			sm.reload();
		})
		function reload(){
			pageIndex = 1;
			sm.reload({pageIndex:1});
		}
	</script>
	<!-- 心跳展示 -->
	<script type="text/javascript">
	$(function(){
		openHeartbeat();
	});
	function openHeartbeat(){
		 //心跳
	  var timestamp=new Date().getTime();
	  var timeInterval = (55+timestamp%10)*100;
	 //console.log(timeInterval); 
	  window.setInterval(function(){
	  		//评论刷新
	  		console.log("刷新");
	  		flushComment();
	  },timeInterval);
	}
	
	function flushComment(){
		if(ajaxCommentReqing){
			return ;
		}
		if(flushCommentStop){
			return;
		}
		console.log("backwardBeginIndex"+backwardBeginIndex);
		if(backwardBeginIndex==-100){
			backwardBeginIndex=1;
		}
		ajaxCommentReqing = true;
		HH.ajax({
			waiting:false,
			data:{
				activityId:activityId,
				pageSize:pageSize,
				backwardBeginIndex:backwardBeginIndex
			},
			url:"/yzmm/account/activity/goddessplan/miaoclass/ajaxClassMiaoList",
			success:function(data){
				$(".local").remove();
				//console.log("this pageMark:"+pageMark);
				//当上次全部页数为0,即为初始化
				backwardBeginIndex = data.pageMark;
				//console.log("next pageMark:"+pageMark);
				var len = data.list.length;
				for(var i=0;i<len;i++){
					var o = data.list[i];
					var h = "";
					if(o.isMyComment){
						h+='<li class="listitem miaoclassmetalk">';
					}else{
						h+='<li class="listitem">';
					}
					if(i==0){
						h+='<div class="taggray">'+data.ext+'</div>';
					}
						h+='<div class="photo"><img src="'+o.userAlbumUrl+'" ><div class="tit">'+o.userName+'</div></div>';
						h+='<div class="listcont">';
							h+=o.content;
						h+='</div>';
					h+='</li>';	
					$("#bb").prepend(h);
				}
			},
			complete:function(){
				ajaxCommentReqing = false;
			}
		});
	}
</script>
</body>
</html>