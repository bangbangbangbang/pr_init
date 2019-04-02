<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
.becomeVip{
	margin-top: 0.3rem;
}
.topaya {
    padding: 0.1rem 0.26666667rem;
    border: 1px solid #f57123;
    border-radius: 0.10666667rem;
    color: #f57123;
}
</style>
<div class="prompt" style="display:none;">
    <div class="promptBox box1" hidden="hidden">
        <a href="javascript:void(0)" class="close"></a>
        <div class="font13 word">很抱歉，您暂时没有使用权</div>
        <div class="font17 word">查看完整内容，请先付费</div>
        <div class="font14 payMoney"><sup class="font12">￥</sup><span class="font32 money">5</span>元</div>
        <a href="javascript:void(0);" class="font18 buyBtn">立即购买</a>
        <a href="javascript:void(0);" class="font13 link">充值vip，享受更多免费内容<span class="promptArrow1"></span></a>
    </div>
     <div class="promptBox box2" hidden="hidden" style="padding-top:0.4rem">
        <a href="javascript:void(0)" class="close"></a>
        <div class="font17 word" style="color:#f57123">会员专享</div>
        <div class="font14 " style="padding: 0.3rem 0.6rem 0;"><sup class="font12"></sup><span class="font14" style="line-height: 18px;">该内容当前仅对喵姐早教说VIP会员开放，购买VIP，解锁海量育儿问题库</span></div>
        <br>
        <div style="width: 100%;text-align: center;">
        <a href="javascript:void(0);" class="font18 topaya becomeVip">立即解锁</a>
        </div>
<!--         <a href="javascript:void(0);" class="font13 link becomeVip">充值vip，享受更多免费内容<span class="promptArrow1"></span></a> -->
     </div>
     <div class="promptBox box3" hidden="hidden">
        <a href="javascript:void(0)" class="close"></a>
        <div class="font13 word word2">请先完善个人信息，再发言</div>
        <a href="javascript:void(0);" class="font18 buyBtn">完善信息</a>
     </div>
    <div class="promptBox box4"hidden="hidden">
        <a href="javascript:void(0)" class="close"></a>
        <div class="font13 word word3">留下您的常用手机号，小喵会在开播前一小时准时捎信给您哒～</div>
        <a href="javascript:void(0);" class="font18 buyBtn">好的</a>
    </div>
</div>

<script type="text/javascript">
//弹框方法绑定
$(".promptBox ").click(function(){
	stopevt();
});
$(".prompt,.buyBtn,.close").click(function(){
	 $(".prompt").hide();
});	

$(".becomeVip ").click(function(){
	top.location.href="/yzmm/account/VIPStatus";
});
/**
 * 打开蒙层
 */
function openPromptBack(){
	$(".prompt").attr({"style":"display:block"});
}

/**
 * 单次付费子调用
 */
function oncePayEvent(userAuthObj){
	openPromptBack();
// 	$(".box2 .money").text(userAuthObj.once.price);
	$(".box2 .buyBtn").click(function(){
		if(userAuthOpt.onceClick){
			userAuthOpt.onceClick();
		}else{
			userAuthOpt.authRedirect(userAuthObj);
		}
	});	
	$(".box2").show();
}

</script>

 