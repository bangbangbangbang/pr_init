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
	.u45_div{
		width: 3px;
		height: 13px;
		background-color: rgba(0, 0, 0, 1);
		float: left;
	}
	.showall{
		text-align: center;
	    font-size: 12px;
	    line-height: 12px;
	    margin-top: 12px;
	    color: #999;
	}
</style>
</head>
<body>
<div class="wrap parent">
	<div class="section">
		<div class="sectionTit">
				<div class="box_align" style="position: relative;width: 100%">
					 <div id="" class="u45_div"></div>
					 &nbsp;<span class="sectitle" style="font-size:0.40rem;color:rgba(72, 72, 72, 1)"><b>全部微课</b></span>
				</div>
			 <div style="font-size: 15px;border-bottom: 0.022rem solid rgba(217, 217, 217, 0.58);margin: 10px 0 0 0;width: 100%;"></div>
		</div>
		<ul id="miaoListall" class="activityList miaoList">
			
		</ul>
	</div>
</div>
<%@include file="/commons/thumbnail.js.jsp" %>
<script type="text/javascript">
$(function(){
	var pageIndex = 1;
	var sm = {};
	sm = $(window).scrollme({
	target:$("#miaoListall"),
	  url:'/yzmm/account/homegloballabel/allcourse',
	    data:{
	    	pageIndex:pageIndex,
	    	pageSize:10
	    },
	    callback:function(data,params){
	      	var h = "";
    		if(data.success){
    			var len = data.list.length;
    			if (len) {
					//增加页码
					params.pageIndex = ++pageIndex;
				}
				for(var i=0;i< len;i++){
					var o = data.list[i];
						h+='<li>'
						h+='<a onclick="toVod(this);" data-courseid="'+o.courseId+'">'
						h+='<div class="photo"><img src="'+thumbnailImg(o.imgUrl)+'" onclick="toVod(this);" data-courseid="'+o.courseId+'"></div>'
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
				} 
    		}
       		$("#miaoListall").append(h);
       		
	    }
	 });
	sm.reload();
});
function toVod(obj){
	HH.href("/yzmm/account/course/toVodDetail?courseId="+$(obj).data('courseid'));
}
</script>
</body>
</html>