<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>喵姐早教说</title>
     <%@include file="../header_b.jsp" %>
      <script src="<b:staticUrl>/res/js/flexible.js</b:staticUrl>"></script>  
<style type="text/css">
#dialog {
	height: 0.8rem!important;
	line-height: 0.8rem!important;
	border-radius: 0.1rem!important;
}
</style>
</head>
<body style="background-color:#fff;">
<section class="ui-container">
	<div class="form-question">
		<div class="input-item">
			<div class="ui-font14 name">宝宝信息:</div>
			<div class="value"><input type="text" class="ui-font14" placeholder="请输入宝宝年龄"></div>
		</div>
	</div>
	<div class="form-question">
		<div class="ui-font14 title">您的问题</div>
		<textarea class="ui-font14 textarea" placeholder="请输入您的问题" id="content"></textarea>
	</div>
	<div class="form-question">
		<div class="input-item">
			<div class="ui-font14 name">联系手机</div>
			<div class="value"><input type="tel" class="ui-font14" placeholder="选填" id="contactInfo"></div>
		</div>
	</div>
	<a href="javascript:void(0)" class="ui-font16 ques-btn" id="submit">提交</a>
	<a href="javascript:history.go(-1)" class="ui-font16 ques-btn" id="back" style="display: none">返回</a>
</section>
<script type="text/javascript">
$(function(){
	var contentFlag = "输入最少5个字";
      $(".ques-btn").on('click', function() {
    	  
    	var content = $("#content").val();
    	var tel =$("#contactInfo").val();
  		if(!content || content == contentFlag ){
  	    	//弹吐丝
  			toast("您遇到的问题不可为空");
  			return;
  		}
  		if(getLength(content)>100 || getLength(content)<5){
  		    	//弹吐丝
  				toast("请输入5-100字的内容");
  				return;
  		}
  		if(getLength(tel)>100){
  		    	//弹吐丝
  				toast("您的联系方式内容长度不得大于60字");
  				return;
  		}
    	  HH.ajax({
        		url:"/yzmm/account/feedback/questionSubmit",
        		data:{
        			main:true,
    		    	queryType:04,
    		    	content:content,
    		    	contactInfo:tel,
        		},
        		callback:function(data){
        			if(data.success){
        					toast("提交成功!");
        					$("#submit").hide();
        					$("#back").show();
        				}
        			else{
        				toast("提交失败!");
        			}
        		}
        	});
      
});
      function getLength(msg){
    		if(msg){
    			return msg.length;
    		}
    		return 0;
    	};     
      
});
      
</script>  
</body>
</html>
