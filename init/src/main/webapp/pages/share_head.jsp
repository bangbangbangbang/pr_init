<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<style>
.careShareLayer .word{
    margin-top: 0.2666667rem;
}
</style>
<c:if test="${isShare }">
<div class="careShare">
		<a href="javascript:void(0)" class="careBtn">关注</a>
		<img src="<b:staticUrl>/res/img/share/logo.png</b:staticUrl>" class="logo" >
		<span class="font12 tag">会员号</span>
	</div>
<div class="careShareLayer" style="z-index: 999;">
	<div class="careShareBox">
		<img src="<b:staticUrl>/res/img/share/member.jpg</b:staticUrl>" class="mebmber" >
		<img src="<b:staticUrl>/res/img/share/logo.jpg</b:staticUrl>" class="logo" >
		<img src="<b:staticUrl>/res/img/share/code.jpg</b:staticUrl>" class="code" >
		<div class="font14 codeword" >
			<p>长按图片【识别二维码】关注公众号</p>
		</div>
		<div class="font12 word" >
			<h2 class="font14">无法识别二维码？</h2>
			<p>1、打开微信通讯录，进入公众号，点击右上角的“+”</p>
			<p>2、搜索“喵姐早教说会员号”</p>
			<p>3、点击“关注”，完成</p>
		</div>
	</div>
	<a href="javascript:void(0)" class="close"></a>
</div>
<script type="text/javascript">
$(function(){
	$(".careShare").slideDown("slow");
	/*显示分享*/
	$(".careBtn").click(function(){
		$(".careShareLayer").fadeIn();
	})
	/*关闭分享*/
	$(".careShareLayer .close").click(function(){
		$(".careShareLayer").fadeOut();
	})
})
</script>
</c:if>

 