<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head lang="en">
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta name="format-detection" content="telephone=no" />
	<meta name="format-detection" content="email=no"/>
	
 <title>喵姐早教说</title>
 <%@include file="../header_v12_1.jsp" %>
<script src="<b:staticUrl>/res/js/flexible.js</b:staticUrl>"></script>
<script src="<b:staticUrl>/res/js/scrollpaginationme.js</b:staticUrl>"></script> 
</head>
<style type="text/css">
html,body {
	overflow-x:initial;
}
</style>
<body id="bgwhite">
<section class="wrapper">
		<div class="font18 detail-title">${title}</div>
		<div class="font12 detail-other2"><em>推荐${minAge}-${maxAge}</em></div>
		<div class="font12 message-tit"><a class="write">写留言</a></div>
		<div class="message-list">
			<div class="list-box" id="toagree">
				
			</div>
		</div>
	</section>
	<div class="layer layer-message">
	    <div class="message-box">
	        <div class="messageCont">
	            <div class="textarea">
	                <textarea onkeyup="fn()" onblur="fn()" maxlength="120" name="comment" id="comment" placeholder="请输入留言内容"></textarea>
	                <span id="span">0／120</span>
	            </div>
	            <button class="submit" onclick="tobutton()">发表</button>
	        </div>
	    </div>
	</div>
<script>
var hasAuth = "${hasAuth}"=="true";
var authMsg = "亲，听完语音，再来点我~";
var pageIndex = 1;
var sm = {};
var knowledgeId="${knowledgeId}";
var commentData={
		pageSize:15,
		id:knowledgeId
};
$(function(){
	sm = $(window).scrollme({
		target:$("#bb"),
		data:commentData,
		url:"/yzmm/account/knowledgeComment/ajaxComment",
		beforeLoad:function(){
			//查询之前调用
			if(1!=pageIndex){
			}
		},
		callback:function(data,params){
			var h = "";
			if (data.success) {
				//是否为空
				if (!data.totalPage) {
				} else {
					$(".noresult").hide();
					var len = data.list.length;
					if (len) {
						//增加页码
						params.pageIndex = ++pageIndex;
					}
					for(var i=0;i<len;i++){
						   var o = data.list[i];
						   h+='<div id="cdiv'+o.id+'" class="list-item" >'
							   if(o.status==1){
								  h+='<div class="photo"><img src="'+o.pic+'" style="height: 50px;"></div>'
								   +'<div class="info">'
								   +'<div class="font15 info-top">'
								   +'<span class="font12">'
								   +o.time
								   if(o.agreeInfo==1){
									   h+='<a data-info='+o.agreeInfo+' onclick="ajaxAgree(this,\''+o.id+'\')" class="zan zan1"></a>'
									     +'<a >'+o.agreeCount+'</a>'
								   }else{
									   h+='<a data-info='+o.agreeInfo+' onclick="ajaxAgree(this,\''+o.id+'\')" class="zan"></a>'
									     +'<a >'+o.agreeCount+'</a>'
								   }
								   h+='</span>'
								   +o.nickName
								   +'</div>'
								   +'<div class="font12 info-title">'+o.message+'</div>'
								   if(o.deleteUserMessage== 1&& o.isToday==1){
									   h+='<a data-id="'+o.id+'" onclick="todelete(\''+o.id+'\')" class="font12 remove">删除</a>'
								   }
								   h+='</div>'
				              }
						   h+='</div>'
					   }
				 }
			} 
			$("#toagree").append(h);
		}
	});
	//加载数据
	sm.reload();
})
function reload(){
	pageIndex = 1;
	sm.reload({pageIndex:1});
}


	//点赞
	function ajaxAgree(obj,commentId){
		if(!hasAuth){
			toast(authMsg);
			return;
		}	
	
		var kid = ${knowledgeId};
		var info = $(obj);
		var count =  info.next("a");	
		if(info.data("info")){
			 info.data("info",0);
			 info.removeClass("zan1");
			 count.html(parseInt(count.html())-1);		
		 }else{
			 info.data("info",1);
			 info.addClass("zan1");
			 count.html(parseInt(count.html())+1);		
		 }
		 HH.ajax({
			 waiting:false,
			   url: "/yzmm/account/knowledgeComment/ajaxAgree",
			   data: {commentId : commentId,knowledgeId:kid},
			   callback: function(data){
			   }
		});
	}
	//删除
	function todelete(commentId){
		if(!hasAuth){
			toast(authMsg);
			return;
		}	
			 $("#cdiv"+commentId).remove();
			 var kid = "${knowledgeId}";
		HH.ajax({
			   waiting:false,
			   url: "/yzmm/account/knowledgeComment/ajaxDelete",
			   data: {commentId : commentId,knowledgeId:kid},
			   callback: function(data){
			   }
		   });
	}	
	
	$(".message-list .zan").click(function(){
		$(this).addClass("zan1")
		})
	$(function(){
		$(".write").click(function(){
			$(".layer-message").show();
			$(".layer-message textarea").focus();
			$(".message-box").animate({"bottom":"0px"},200);
		})
		$(".submit").click(function(){
			$(".layer-message").hide()
			})
	})
	
//提交留言
function tobutton(){
		if(!hasAuth){
			toast(authMsg);
			return;
		}	
	 $("#span").html("0/120");
	 var isNull= $("textarea").val();
	 var kid = "${knowledgeId}";
	 if(isNull==""){
		 toast("对不起您的留言不能为空！");
	 }else{
		 HH.ajax({
			   url: "/yzmm/account/knowledgeComment/ajaxMessage",
			   data: {comment : $("textarea").val(),knowledgeId:kid},
			   callback: function(data){
				   if(data.success){
					   var h="";
					   var o = data.ext;
					   h+='<div id="cdiv'+o.id+'" class="list-item" >'
					   if(o.status==1){
						  h+='<div class="photo"><img src="'+o.pic+'"></div>'
						   +'<div class="info">'
						   +'<div class="font15 info-top">'
						   +'<span class="font12">'
						   +o.time
						   if(o.agreeInfo==1){
							   h+='<a data-info='+o.agreeInfo+' onclick="ajaxAgree(this,\''+o.id+'\')" class="zan"></a>'
							     +'<a >'+o.agreeCount+'</a>'
						   }else{
							   h+='<a data-info='+o.agreeInfo+' onclick="ajaxAgree(this,\''+o.id+'\')" class="zan"></a>'
							     +'<a >'+o.agreeCount+'</a>'
						   }
						   h+='</span>'
						   +o.nickName
						   +'</div>'
						   +'<div class="font12 info-title">'+o.message+'</div>'
						   if(o.deleteUserMessage== 1&& o.isToday==1){
							   h+='<a data-id="'+o.id+'" onclick="todelete(\''+o.id+'\')" class="font12 remove">删除</a>'
						   }
						   h+='</div>'
		              }
		        	$("#toagree").prepend(h);
				   }
				   $("textarea").val("");
			   }
		});
	 }
}
	
	//评论测试
	function fn(){
		var len = $(".textarea textarea").val().length
		$(".textarea span").text(len + "/120")
	}
</script>
</body>
</html>