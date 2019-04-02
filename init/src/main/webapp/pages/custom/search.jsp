<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
	.cancelImg{
		display: inline;
	    width: 1rem;
	    float: right;
	    vertical-align: middle;
	    margin-top: -5px;
	}
</style>
<div class="searchItem" style="display:none">
	<form class="search mySearch" target="hideIframe">
		<div class="searchBox">
			<a href="javascript:void(0)" class="cancleBtn backBtn searchCancleBtn cancelShow" style="display:none;">取消</a>
			<input type="submit" class="cancleBtn submitShow" value="搜索" style="display:block">
			<div class="searchTxt">
				<a href="javascript:void(0)" class="clear"></a>
				<img class="cancelImg cancelImgDiv2" alt="" src="<b:staticUrl>/res/img/cancelSearch.png</b:staticUrl>">
				<input type="text"  onkeyup="fn2()" onblur="fn2()" id="keyword2" placeholder="请输入关键字,点击键盘'前往'" class="inputFocus searchTitle mySearchTitle" >
			</div>
		</div>
	</form>
	<iframe id="hideIframe" name="hideIframe" style="display: none"></iframe>
	<div class="empty emptyAndVip" style="display: none;">
		<div class="icon"></div>
		<div class="word">很抱歉,没有找到内容</div>
		<a href="javascript:void(0)" class="quizBtn">我要提问</a>
	</div>
	<div class="empty emptyAndNovip" style="display: none;">
		<div class="icon"></div>
		<div class="word">很抱歉,没有找到内容</div>
		<P>表急，换个关键词，或者秒变VIP,个性定制您的问题</P>
		<a href="javascript:void(0)" class="vipBtn">我要成为VIP</a>
	</div>
	<div class="section">
		<div class="sectionTit">按年龄段搜索</div>
		<div class="tagList">
			<a href="javascript:void(0)" id="age-01" class="age-1 age" data-minScope="0" data-maxScope="1">0-1岁</a>
			<a href="javascript:void(0)" id="age-12" class="age-2 age" data-minScope="1" data-maxScope="2">1-2岁</a>
			<a href="javascript:void(0)" id="age-23" class="age-3 age" data-minScope="2" data-maxScope="3">2-3岁</a>
			<a href="javascript:void(0)" id="age-36" class="age-4 age" data-minScope="3" data-maxScope="6">3-6岁</a>
		</div>
	</div>
	<div class="section">
		<div class="sectionTit">大家都在搜</div>
		<div class="tagList hotSearch">
			<!-- <a href="javascript:void(0)" class="hotWord">不睡觉</a>
			<a href="javascript:void(0)" class="hotWord">被蚊子咬就哭</a> -->
		</div>
	</div>
	<div class="section sectionBorder0 searchHistory">
		<div class="sectionTit">你搜过的</div>
		<div class="tagList mySearchHistory">
			<!-- <a href="javascript:void(0)" class="memory">不睡觉<i class="remove"></i></a>
			<a href="javascript:void(0)" class="memory">被蚊子咬就哭<i class="remove"></i></a> -->
		</div>
	</div>
</div>
<script src="<b:staticUrl>/res/js/package/search.js</b:staticUrl>"></script> 
<script>
function fn2(){
	
	var len = $("#keyword2").val().length;
	if(len){
		$(".cancelShow").hide();
		$(".submitShow").show();
		$(".cancelImgDiv2").show();
	}else{
		$(".cancelShow").show();
		$(".submitShow").hide();
	}
}
$(function(){
	$(".cancelImgDiv2").click(function(){
		$("#keyword2").val("");
		$(".cancelShow").show();
		$(".submitShow").hide();
		$(".cancelImgDiv2").hide();
	});
});
</script>