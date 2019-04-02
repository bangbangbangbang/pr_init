<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@include file="../header.jsp" %>
<title>喵姐早教说</title>
</head>
<body>
	<section class="index_tab_wrap">
	    <!-- start      onclick="window.location.href='/yzmm/account/feedback/index';return false"-->
	    <section class="index_tab_con" id="tab2" style="background:none;">
	        <div id="content">  	       
	        </div>
	    </section>
	    <!-- end -->
	</section>
	<div id="content">
    </div>
<script src="${baseStaticUrl}/res/js/scrollpagination.js?v=${version}"></script>
<script type="text/javascript">
var content = {};
var pageIndex = 1;
totalPage = 1;
$(function(){
	content = scrollPagination({
		id:"content",
		url:'/yzmm/account/message/ajaxDetailList', 
		data:{pageIndex:pageIndex},
		callback:function(data,params){
			if(data.success){				
				if(data.totalPage == params.pageIndex){
					content.stopScrollPagination();
				}
				totalPage = data.totalPage;
				if(data.totalPage == 0){
					$(".noneData").remove();
					return '<div class="noneData"><span>还没有新消息</span></div>';
				}else{
					var len = data.list.length;
					if(len){
						//增加页码
						params.pageIndex = ++pageIndex;
					}
					var h = "";
					for(var i=0;i< len;i++){
						var o = data.list[i];	
						h+='<ul class="message_con">'
				            +'<li class="message_con_l" style="display:block;">'
				                +'<div>'
					                +'<h1><i>公告</i><span>'+o.title+'</span></h1>'
					                +'<p>'+o.content+'</p>'
					                +'<h2>'+o.creatTime+'</h2>'
				               +'</div>'               
				            +'</li>'
			              +'</ul>';						
					}
					return h;
				}
			}
		}
	});	
});

</script>
</body>
</html>
