<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style type="text/css">
	.u45_div{
		width: 3px;
		height: 0.43rem;
		background-color: rgba(0, 0, 0, 1);
		float: left;
		margin-top: 0px !important;
	}
	.showall{
		text-align: center;
	    font-size: 12px;
	    line-height: 12px;
	    margin-top: 12px;
	    color: #999;
	}
	.showall a{
		color: #999;
	}
</style>
<div class="wrap parent">
	<div class="section">
		<div class="sectionTit">
				<div class="box_align" style="position: relative;width: 100%">
					 <div id="" class="u45_div"></div>
					 &nbsp;<span class="sectitle" style="font-size:0.40rem;color:rgba(72, 72, 72, 1)"><b>全部微课</b></span>
					 <label style="font-size: 12px; color: #9E9E9E;float: right!important;" onclick="changeAnther()"><img style="margin:3px 5px 5px 5px;" alt="" src="<b:staticUrl>/res/img/u2253.png</b:staticUrl>">换一批&nbsp;</label>
				</div>
			 <div style="font-size: 15px;border-bottom: 0.022rem solid rgba(217, 217, 217, 0.58);margin: 10px 0 0 0;width: 100%;"></div>
		</div>
		<ul id="miaoListall" class="activityList miaoList">
			
		</ul>
		<div class="showall"><a href="/yzmm/account/homegloballabel/allcourseList"><p>查看全部</p></a></div>
	</div>
</div>
<%@include file="/commons/thumbnail.js.jsp" %>
<script type="text/javascript">
$(function(){
	changeAnther();
	
})
function toVod(obj){
	HH.href("/yzmm/account/course/toVodDetail?courseId="+$(obj).data('courseid'));
}
var pageIndex2=1;
var totalPage = 1;
function changeAnther(){
	 HH.ajax({
		    url:'/yzmm/account/homegloballabel/allcourse',
		    data:{
		    	pageIndex:pageIndex2,
		    	pageSize:15
		    },
		    callback:function(data){
		      	var h = "";
	    		if(data.success){
	    			var len = data.list.length;
	    			if(len){
	    				totalPage = data.totalPage;
	    				if(pageIndex2<totalPage){
	    					pageIndex2++;
	    				}else{
	    				    pageIndex2=1;
	    				}
	    				console.log(pageIndex2);
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
	       		$("#miaoListall").html(h);
	       		
		    }
		 });
}
</script>