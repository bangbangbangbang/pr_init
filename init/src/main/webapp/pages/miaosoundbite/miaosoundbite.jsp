<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
.miaosoundbiteitem{
    min-height: 5.5rem;
    margin: 0.5rem 0.3rem;
    background-color: rgba(248, 242, 224, 1);
    padding-top: 1px;
}
.line1{
	margin: 0.24rem;
    border: 1px solid #FFA12E;
    height: 92%;
    min-height: 5rem;
    border-radius: 5px;
    padding-top: 1px;
}
.line2{
	margin: 0.12rem 0.24rem;
    border: 1px solid #FFA12E;
    height: 94%;
    min-height: 4.6rem;
    border-radius: 5px;
    padding: 20px;
}
.line2 .soundbite{
	font-size: 0.4rem;
    line-height: 0.55rem;
}
.line2 .soundbite span{
	font-size: 1rem;
}
.line2 .from{
    font-size: 0.4rem;
    text-align: right;
    margin-top: 0.5rem;
    color: #FFA12E;
    text-decoration: underline;
}
.line2 .from a{
	color: #FFA12E;
    font-size: 0.3rem;
}
.hr{
		border-bottom: 5px solid rgba(242, 242, 242, 1);
	}
</style>
<div class="miaosoundbiteitem">
	<div class="line1">
		<div class="line2">
			<p class="soundbite"><span><img style="width: 20px;margin-top: -10px;" alt="" src="<b:staticUrl>/res/img/yinhao.png</b:staticUrl>"> </span><label class="content"></label></p>
			<p class="from"></p>
		</div>
	</div>
</div>
<div class="hr"></div>
<%@include file="../course/allcourseSection.jsp"%>
<script>
$(function(){
	var wait = false;
	 HH.ajax({
	    url:'/yzmm/account/miaoSoundbite/ajaxMiaoSoundbite',
	    wait:wait,
	    callback:function(data){
	   		if(data.success){
	   			var soundbite = data.ext;
	   			$(".soundbite .content").html(soundbite.content);
	   			if(soundbite.relateType=="COURSE"){
	   				if(soundbite.relateTItle){
	   					$(".line2 .from").html('<a href="/yzmm/account/course/toVodDetailPay?courseId='+soundbite.relateId+'">——《<span class="comefrom">'+soundbite.relateTItle+'</span>》</a>');
	   				}
	   			}else if(soundbite.relateType=="SQW"){
	   				if(soundbite.relateTItle){
	   					$(".line2 .from").html('<a href="/yzmm/account/knowledge/viewDetail?knowledgeId='+soundbite.relateId+'">——《<span class="comefrom">'+soundbite.relateTItle+'</span>》</a>');
	   				}
	   			}
	   			wait= true;
	   		}
	    }
	 });
});
</script>