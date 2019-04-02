<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>喵姐早教说</title>
    <%@include file="../header_v2.4.0.jsp" %>
    <!--忽略页面中的邮箱格式为邮箱-->
    <meta name="format-detection" content="email=no">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
    <meta name="format-detection" content="telephone=no,address=no,email=no">
    <meta name="keywords" content="喵姐,喵姐早教说,0到6岁早期教育,家庭教育,家长教育,父母课堂,育儿知识,儿童教育,母婴育儿,">
    <meta name="description" content="喵姐早教说是喵姐高寿岩创办的为家庭教育提供专业靠谱的0到6岁早期教育、育儿知识的平台。">
    <link rel="stylesheet" href="<b:staticUrl>/res/css/base.css</b:staticUrl>">
    <link rel="stylesheet" href="<b:staticUrl>/res/css/red_page.css</b:staticUrl>">
</head>
<body>
    <div class="page">
        <div class="red_header"> 
             <!--顶部的登录人的头像-->
            <div class="picture">
            	<img src="${alumb}">
            </div>
            <!--顶部登录人的网名-->
            <p>${nickname}</p>
        </div>
        <!--文章的标题-->
        <div class="red_title">
            <h3>花钱给你请私人育儿顾问</h3>
            <img src="<b:staticUrl>/res/img/redpage/u157.png</b:staticUrl>" alt="">
        </div>
        <!--中间的黄色线-->
        <div class="read_line"></div>
        <!--里面的内容区域-->
        <div class="red_content">
            <div class="red_shadow">
                <div class="red_content_title">
                <h3>${name}</h3>
                </div>
                <div class="red_content_source">来自 · ${topicname}</div>
                
                <div class="red_content_read">
                    <div class="read_mid">
                        <div class="triangle"></div>
                        <c:choose>
                        	<c:when test="${restNumber!=0||auth=='true'}">
                        		<div class="read_circular hasauth2">
		                            <span>抢 读</span>
		                        </div>
                        	</c:when>
                        	<c:otherwise>
                        		<div class="read_circular notauth ">
		                            <span>抢 读</span>
		                        </div>
                        	</c:otherwise>
                        </c:choose>
                        <div class="read_foo">喵姐早教说</div>
                    </div>
                </div>
            </div>
            
        </div>
        <!--底部-->
        <c:choose>
        	<c:when test="${auth=='true'}">
        		<div class="red_footer" style="height:0.5rem;">
        		</div>
        	</c:when>
			<c:when test="${restNumber==totalNumber}">
        		<div class="red_footer">
           			 限量${restNumber} 个名额，速速领取
        		</div>
			</c:when>
			<c:when test="${restNumber!=0}">
				<div class="red_footer">
           			还剩${restNumber} 个名额，速速领取
        		</div>
			</c:when>
			<c:otherwise>
				<div class="red_footer" style="height:0.5rem;">
        		</div>
			</c:otherwise>
       </c:choose>
    </div>
    <script type="text/javascript">
    	$(function(){
    		$(".hasauth2").click(function(){
    			 HH.ajax({
    					waiting : false,
    					url : "/yzmm/account/sharefromfriend/receive",
    					data : {
    						fromUid :'${fromUid}',
    						shareType:'${shareType}',
    						shareRelateId:'${shareRelateId}',
    						shareId:"${shareId}"
    					},
    					callback:function(data){
    						if(data.success){
    							
    							if('${shareType}'=='COURSE_GROUP'){
    								if(data.ext){
    									HH.href("/yzmm/account/course/topic/fromShare?id=${courseTopicId}&courseId=${shareRelateId}&comeinNumber="+data.ext);
    								}else{
    									HH.href("/yzmm/account/course/topic/fromShare?id=${courseTopicId}&courseId=${shareRelateId}");
    								}
    							}else if('${shareType}'=='DAYUPDATE'){
    								if(data.ext){
    									HH.href("/yzmm/account/smallDayUpdate/detail?id=${shareRelateId}&comeinNumber="+data.ext);
    								}else{
    									HH.href("/yzmm/account/smallDayUpdate/detail?id=${shareRelateId}");
    								}
    								
    							}
    							
    						}else{
    							toast(data.msg);
    						}
    					}
    			});
    		});
    		$(".notauth").click(function(){
    			toast("抱歉！来晚啦，已经抢完了");
    			t=setTimeout('HH.href("/yzmm/index");',2000);
    		});
    	});
    </script>
</body>
</html>