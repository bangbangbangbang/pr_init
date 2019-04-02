<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head lang="en">
<meta charset="UTF-8">
<title>喵姐早教说</title>
<%@include file="../header_v2.1.jsp"%>
<style type="text/css">
.mainDiv .massage{
	font-size: 0.32rem;
	margin-bottom: 0.8rem;
}
.mainDiv .massage .desc{
	font-size: 0.3rem;
    text-align: center;
    color: #999;
    margin: 0.3rem 0;
}
.insertMassage{
	    margin-bottom: 10px;
    	margin: 0 20px;
}
.insertMassage p{
	border-bottom: solid 1px #F2F2F2;
    padding: 5px;
    color:#333333;
    padding-top: 0.4rem;
}
.insertMassage input,.insertMassage textarea{
	width: 70%;
}
.insertMassage input{
	height: 25px;
}
.insertMassage textarea{
	height: 50px;
	resize: none;
	margin-left: 20%;
}
.font16 {
    font-size: 16px;
}
.submitBtn {
    display: block;
    width: 82%;
    height: 1.02rem;
    line-height: 1.02rem;
    background-color: rgba(229, 15, 18, 1);
    text-align: center;
    text-decoration: none;
    color: #fff;
    border-radius: 100px;
    margin: 0 auto ;
}
.downbuttom{
	background: rgb(242, 242, 242);
    height: 4rem;
    padding-top: 1rem;
}
.ignore{
	font-size: 15px;
    text-align: center;
    margin-top: 10px;
    color: #999;
}
.ignore a{
	text-decoration: none;
    color: #9b9b9b;
}
</style>
</head>
<body>
<section class="mainDiv">
	<c:if test="${not empty backgroundImg}">
		<img style="width: 100%; background-color: rgb(242, 242, 242);" alt="" src="${backgroundImg}">
	</c:if>
	<div class="massage">
		<p class="desc">留下您的签收地址，方便小喵将${userCoupon.name}托快递小哥，送到女王府上</p>
		<div class="insertMassage">
			<c:if test="${'DELIVERIED'==userCoupon.deliveryStatus}">
				<p>快递信息：${userCoupon.deliveryExpress} (${userCoupon.deliveryExpressNum})</p>
			</c:if>
			<p>签收人姓名：<input type="hidden" name="id" class="id" value="${userCoupon.id}">
			<input class="deliveryUsername delivery" name="deliveryUsername"  value="${userCoupon.deliveryUsername}"/></p>
	 		<p>签收人手机号：<input class="deliveryTelephone delivery" name="deliveryTelephone" value="${userCoupon.deliveryTelephone}" placeholder=""/></p>
	 		<p>所在地区：<input class="deliveryRegion delivery" name="deliveryRegion" value="${userCoupon.deliveryRegion}"  placeholder="省、市等"/></p>
			<p><span style="position: absolute;">详细地址：</span><textarea class="deliveryAddress delivery" name="deliveryAddress" placeholder="街道、门牌号等">${userCoupon.deliveryAddress}</textarea></p>
		</div>
	</div>
	<div class="downbuttom">
		<button type="submit" class="font16 submitBtn"><b>领&nbsp;取</b></button>
		<p class="ignore"><a href="/yzmm/account/usercoupon/useCouponList">过会儿再领</a></p>
	</div>
</section>
<script type="text/javascript">
	var status = '${userCoupon.deliveryStatus}';
	$(function(){
		if(status=="NODELIVERYINFO"||status=="PERFECTINFO"){
			$(".submitBtn").click(function(){
				var id = $(".id").val();
				var deliveryUsername = $(".deliveryUsername").val();
				var deliveryTelephone = $(".deliveryTelephone").val();
				var deliveryRegion = $(".deliveryRegion").val();
				var deliveryAddress = $(".deliveryAddress").val();
				if(!id){
					toast("请求失败，请刷新重试");
				}
				if(!deliveryUsername||!deliveryTelephone||!deliveryRegion||!deliveryAddress){
					toast("只有完善签收信息，才能收到喵姐送的礼物哟");
				}
				if(deliveryAddress.length<5){
					toast("详细地址描述信息不得小于5个字符");
				}
				var url = '/yzmm/account/usercoupon/ajaxCompleteDeliverInfo';
				HH.ajax({
					waiting:false,
					data:{id:id,deliveryUsername:deliveryUsername,deliveryTelephone:deliveryTelephone,deliveryRegion:deliveryRegion,deliveryAddress:deliveryAddress},
					url:url,
					success:function(data){
						if(data.success){				
							window.location.href="/yzmm/account/usercoupon/useCouponList";
						}else{
							toast(data.msg);
						}
					},
				});
			});
		}else if(status=="DELIVERIED"){
			$(".delivery").attr('disabled',true);
			
			$(".submitBtn").click(function(){
				toast("您的快递已经向你飞奔而来");
			});
		}
	})
</script>
</body>
</html>