<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@include file="../header.jsp" %>
<title>喵姐早教说</title>
</head>
<body>
<div class="mask"></div>
	<section class="index_tab_wrap">
        <!-- start -->
        <section class="index_tab_con" id="tab2" style="background:none;">
       	<%--  <ol class="business_tab_wrap">
            	<li><span>购买类型<em></em></span></li>   
                <li><span>全部状态<em></em></span></li>
            </ol>
            <ul class="business_tab_list">
                <li class="on">
                	<p id="completed" onclick="selectAllabout();">全部状态</p>
                    <p id="completed" onclick="selectcompleted();">已完成</p>
                    <p id="paying" onclick="selectpaying();">待支付</p>
                </li>
               <li>
                    <p>会员卡</p>
                    <p>课程包</p>
                </li>   
            </ul> --%>
            <div id="content">
            </div>
        </section>
        <!-- end -->
        
    </section>

<script src="${baseStaticUrl}/res/js/scrollpagination.js?v=${version}"></script>
<script type="text/javascript">
/**
 * 全屏滚动的话去除target
 * 局部滚动用div target为div的id
 */
var content = {};
var pageIndex = 1;
var toEnd = false;
$(function(){
	content = scrollPagination({
		id:"content",
		heightOffset:150,
		url:'/yzmm/account/order/ajaxList', 
		data:{pageIndex:pageIndex},
		beforeLoad:function(params){
			if(toEnd){
				toast("没有下一页了！");
				return false;
			}
			return true;
		},
		callback:function(data,params){
			if(data.success){
				if(data.totalPage == params.pageIndex){
					content.stopScrollPagination();
				}
				toEnd = data.totalPage==pageIndex;
				if(!data.totalPage){
					$(".noneData").remove();
					return '<div class="noneData"><span>该状态下没有订单</span></div>';
					content.stopScrollPagination();
				}else{
					var len = data.list.length;
					if(len){
						//增加页码
						params.pageIndex = ++pageIndex;
					}
					var h ="";
					for(var i=0;i< len;i++){
						var o = data.list[i];
						var isNew = !$("#"+o.month).get(0);
						if(isNew){
							content.append('<div id="'+o.month+'Div" class="early_edu_wrap my_honor_con business_list_wrap" style="background:none;"></div>');
						}
						
						 h = '<div class="early_edu_con2 business_list_con" onclick="toOrder(this);" id="'+o.orderId+'">';
						
						if(isNew){
							h+=	'<h1 id="'+o.month+'">'+o.month+'</h1>';
						}
						
						var productUrl = o.productUrl;
						if(!productUrl){
							productUrl = "<b:staticUrl>/res/img/bg/vip_card_bg.png</b:staticUrl>";
						}
						
						h += '<dl class="cf">'
	                        +'<dt><img src="'+productUrl+'"/></dt>'
	                        +'<dd>'    
	                            +'<h2>'+o.productName+'</h2>'
	                            +'<h3>'+o.createTime+'</h3>'
	                            +'<h4>'+o.saleMoney+'</h4>'
	                        	+'</dd>'
	                 	  	 +'</dl>'
	                    	+'<h6 class="cf"><a onclick="toOrder(this);">'+o.status+'</a></h6>'
	                	+'</div>';
						
						h+='</div>';
						
						$("#"+o.month+'Div').append(h);
					}
					return "";
				}
			}else{
				return '<div>请稍后重试</div>';
			}
		}
	});
	<%--
	$("#tradeState").change(function(){
		pageIndex = 1;
		scrollPageReload(content,{tradeState:$("#tradeState").val()});
	}); --%>
});
function toOrder(obj){
	window.location.href="/yzmm/account/order/detail?orderId="+obj.id;
}

function selectAllabout(){
	toEnd = false;
	$('.business_tab_list').hide();
	$('.mask').hide();
	$('.business_tab_wrap li span').html("全部状态<em></em>");
	pageIndex = 1;
	scrollPageReload(content,{tradeState:''});
}
function selectcompleted(){
	toEnd = false;
	$('.business_tab_list').hide();
	$('.mask').hide();
	$('.business_tab_wrap li span').html("已完成<em></em>");
	pageIndex = 1;
	scrollPageReload(content,{tradeState:'COMPLETE'});
}

function selectpaying(){
	toEnd = false;
	$('.business_tab_list').hide();
	$('.mask').hide();
	$('.business_tab_wrap li span').html("待支付<em></em>");
	pageIndex = 1;
	scrollPageReload(content,{tradeState:'TOBEPAID'});
}
$(function(){
    //tab切换
	$('.business_tab_wrap li').click(function(){
	    $('.business_tab_list').show();
	    $('.mask').show();
	    $('.business_tab_list li').hide();
	    $('.business_tab_list li').eq($(this).index()).show();
	    $('.business_tab_wrap li').removeClass('on');
	    $(this).addClass('on');
	});
	$('.mask').click(function(){
	    $('.business_tab_list').hide();
	    $('.mask').hide();
	});
});
</script>
</body>
</html>
