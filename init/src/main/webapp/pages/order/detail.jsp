<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@include file="../header.jsp" %>
<title>喵姐早教说</title>
</head>
<body>
 <section class="besiness_wrap">
    <section class="besiness_con1 cf">
        <div class="left">
            <h1>订单实付金额</h1>
            <p><span>${detail.originalPrice}</span><em>${detail.orderAmount}</em></p>
        </div>
        <div class="right"><a href="javascript:;">${detail.tradeState}</a></div>
    </section>
    <section class="besiness_con2">
        <h1>${detail.productName}</h1>
        <div class="besiness_con2_con cf"> 
        		<c:set var="defaultCard" value="<b:staticUrl>/res/img/update/early_edu_img1.png</b:staticUrl>" />   
            <h2><img src="${empty detail.productUrl ? defaultCard : detail.productUrl}"/></h2>
            <p>${detail.description}</p>
            
        </div>
        <div class="besiness_con2_b">支付方式/账户<span>${detail.payChannel}</span></div>
    </section>
    <section  class="besiness_con3"> 
        <dl class="cf besiness_con3_list cf">
            <dt>有效期</dt>
            <dd>${detail.validStartTime}-${detail.validEndTime}</dd>
        </dl>
        <dl class="cf besiness_con3_list cf">
            <dt>订单号</dt>
            <dd>${detail.orderId}</dd>
        </dl>
        <dl class="cf besiness_con3_list cf">
            <dt>下单时间</dt>
            <dd>${detail.createTime}</dd>
        </dl>
        <dl class="cf besiness_con3_list cf">
            <dt>支付时间</dt>
            <dd>${detail.completeTime}</dd>
        </dl>
        
    </section>
</section>
	
<script src="${baseStaticUrl}/res/js/scrollpagination.js?v=${version}"></script>
<script type="text/javascript">

</script>
</body>
</html>
