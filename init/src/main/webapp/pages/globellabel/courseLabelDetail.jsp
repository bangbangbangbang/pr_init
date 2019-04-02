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
			<p class="font19">${globalLabel.name}</p>
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
	$(function(){
		var id='${globalLabel.id}';
		var type = '${type}';
		var pageIndex = 1;
		var sm = {};
		if(type=="COURSE_GROUP"||type=="COURSE"){
			sm = $(window).scrollme({
					target:$("#miaoListFour"),
				    url:'/yzmm/account/homegloballabel/courseGroupLabelInfo',
				    data:{
				    	id:id,
				    	type:type,
				    	pageSize:10,
				    	pageIndex:pageIndex
				    },
				    callback:function(data,params){
				   		if(data.success){
				   			var len = data.list.length;
				   			if (len) {
								//增加页码
								params.pageIndex = ++pageIndex;
							}
				   			for(var i=0;i<len;i++){
				   				var o = data.list[i]; 
				   				var h = "";
					   			 h+='<li onclick="toVod(this);" data-courseid="'+o.courseId+'">'
								h+='<a>'
								h+='<div class="photo"><img src="'+o.imgUrl+'" onclick="toVod(this);" data-courseid="'+o.courseId+'"></div>'
								h+='<div class="info">'
								h+='<h2 class="tit" onclick="toVod(this);" data-courseid="'+o.courseId+'">'+o.name+'</h2>'
								h+='<p>直播时间：';
								if(o.playStartTime){
									h+=fmtSecondyyyMMDD(o.playStartTime);
								}
								h+='</p>';
								h+='<div class="other">'
								if(o.money){
									h+='<span class="money"><i>￥</i><em>'+o.money+'</em></span>'
								}
								h+='<span class="num2">'+o.listenCount+'人已看过</span>'
								h+='</div>'
		   					    h+='</div>'
								h+='</a></li>';
								$("#miaoListFour").append(h);
				   			}
				   		}
				    }
				 });
			sm.reload();
		}else if(type=="EXCELLENTCOURSE"){
			sm = $(window).scrollme({
					target:$("#miaoListFour"),
				    url:'/yzmm/account/homegloballabel/groupLabelInfo',
				    data:{
				    	labelId:id,
				    	pageSize:10,
				    	pageIndex:pageIndex
				    },
				    callback:function(data,params){
				   		if(data.success){
				   			var len = data.list.length;
				   			if (len) {
								//增加页码
								params.pageIndex = ++pageIndex;
							}
				   			for(var i=0;i<len;i++){
				   				var o = data.list[i];
				   				var h = "";
				   				h+='<li onclick="toLabel(this);" data-id="'+o.id+'" style="height:auto;">';
									h+='<a >';
										h+='<div>';
											h+='<img style="width: 100%;" src="'+o.img+'" >';
										h+='</div>';
										h+='<div class="info">';
											h+='<div class="left">';
												h+='<h2 class="tit" style="margin-top: 5px;"><img style="width: 15px; margin-bottom: 5px;" src="<b:staticUrl>/res/img/u2918.png</b:staticUrl>">&nbsp;'+o.remarks+'</h2>';
												h+='<p>推荐指数：';
												for(var j=0;j<5;j++){
													h+='<img style="width: 15px; margin-bottom: 5px;" src="<b:staticUrl>/res/img/star.png</b:staticUrl>">';
												}	
												h+='</p>';
											h+='</div>';
										h+='</div>';
									h+='</a>';
								h+='</li>';
								$("#miaoListFour").append(h);
				   			}
				   		}
				    }
				 });
			 sm.reload();
		}
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