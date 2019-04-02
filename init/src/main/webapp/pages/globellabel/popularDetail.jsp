<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<!--忽略页面中的邮箱格式为邮箱-->
		<meta name="format-detection" content="email=no"/>
		 <%@include file="../header_v2.0.jsp" %>
		 <%@include file="../header_wxjsapi.jsp"%>
		 <link rel="stylesheet" href="<b:staticUrl>/res/css/navigator.css</b:staticUrl>">
		<script src="<b:staticUrl>/res/js/scrollpaginationme.js</b:staticUrl>"></script>
		<title>喵姐早教说</title>
		<style type="text/css">

		.header .name{
			text-align: center;
    		margin: 25px;
		}
		.font19{
			font-size: 19px;
		    line-height: 40px;
		    font-weight: 500;
		}
		.font15{
			font-size: 12px;
    		line-height: 15px;
		}
		.hr{
			border-bottom: 5px solid rgba(242, 242, 242, 1);
		}
		.hr2{
			border-bottom: 2px solid rgba(242, 242, 242, 1);
			margin: 10px auto;
    		width: 150px;
		}
		.miaojie-icon{
			width: 50px;
		    height: 50px;
		    border-radius: 50px;
		    margin-top: -30px;
		    z-index: 99999986;
		    position: fixed;
		}
		</style>
	</head>
	<body>
	<div class="header">
		<div class="name">
			<p class="font19">热播排行</p>
			<div class="hr2"></div>
			<p class="font15">${globalLabel.content}</p>
		</div>

	</div>
	<div class="hr"></div>
	<div class="body">
		<ul id="miaoListFour" class="activityList miaoList">
			
		</ul>
	</div>
	<script type="text/javascript">
	var labelId = '${globalLabel.id}';
	var setp = "";
	$(function(){
		var pageIndex = 1;
		var sm = {};
		 sm = $(window).scrollme({
			target:$("#miaoListFour"),
		    url:'/yzmm/account/homegloballabel/ajaxPopularList',
		    data:{pageIndex:pageIndex,pageSize:10,labelId:labelId,setp:setp},
		    callback:function(data,params){
		    	var h = "";
	    		if(data.success,params){
	    			var len = data.list.length;
	    			params.setp = data.ext;
					if(len){
						//增加页码
						params.pageIndex = ++pageIndex;
					} 
					for(var i=0;i< len;i++){
						var o = data.list[i];
							h+='<li>'
							h+='<a onclick="toVod(this);" data-courseid="'+o.courseId+'">'
							h+='<div class="photo"><img src="'+o.imgUrl+'" onclick="toVod(this);" data-courseid="'+o.courseId+'"></div>'
							h+='<div class="info">'
							h+='<h2 class="tit" onclick="toVod(this);" data-courseid="'+o.courseId+'">'+o.name+'</h2>'
							h+='<p>直播时间：'+o.startTime+'</p>'
							h+='<div class="other">'
							if(!o.free&&!o.auth){
								h+='<span class="money"><i>￥</i><em>'+o.money+'</em></span>'
							}
							h+='<span class="num2">'+o.count+'人已看过</span>'
							h+='</div>'
	   					    h+='</div>'
							h+='</a></li>';
					} 
	    		}
	       		$("#miaoListFour").append(h);
	       		
		    }
		 });
		 sm.reload(); 
	});
	function toVod(obj){
		HH.href("/yzmm/account/course/toVodDetail?courseId="+$(obj).data('courseid'));
	}
	function toLabel(obj){
		HH.href("/yzmm/account/homegloballabel/globalLabelInfoDetail?id="+$(obj).data('id'));
	}
	</script>
</body>
</html>