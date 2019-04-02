<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@include file="../header.jsp"%>
<title>喵姐早教说</title>
<style type="text/css">
	*{
		margin:0;
		padding:0;
		box-sizing:border-box;
		-webkit-box-sizing:border-box;
		-moz-box-sizing:border-box;
		-o-box-sizing:border-box;
	}
	input,textarea{
		outline:none;
	}
	.btnfixed{
		padding:0 15px;
	}
	.btnfixed a {
	    display: block;
	    height: 44px;
	    width: 100%;
	    line-height: 44px;
	    margin:0 auto;
	    text-decoration: none;
	    font-size: 18px;
	    background-color: #e51812;
	    border:none;
	    border-radius:4px;
	    text-align: center;
	    color: #fff;
	}
	.btnfixed a:active{
		background-color: #e51812;
	}
</style>
</head>
<body>
 <div>
	<div style="margin-bottom:20px;padding:0 15px;">
		<div style="padding:10px 0;border-bottom:1px solid #ccc;">
			<p align="center" style="font-size:20px;"><span class="conproblem" >常见问题</span></p>
		</div>
	</div>
	<div style="margin-bottom:20px;padding:0 15px;">
	   <span style="font-size:16px;color:#666;">请您提供以下信息，方便技术人员及时处理:</span> 
	</div>
    <div style="margin-bottom:20px;padding:0 15px;">
      <span style="font-size:16px;color:#666;">设备型号 :&nbsp;
      	<input type="text" style="padding:4px;font-size:15px;border:1px solid #ccc;border-radius:2px;color:#666;" name="version" id="version" class="version"/>
      </span>
    </div>
    <div style="margin-bottom:20px;padding:0 15px;">
		<span style="font-size:16px;color:#666;">网络环境:
			<input style="height:12px;width:20px;" type="radio" id="environment" class="environment" name="environment" checked="checked" value="WiFi"/>WiFi&nbsp;
			<input style="height:12px;width:20px;" type="radio" id="environment" class="environment" name="environment" value="4G"/>4G&nbsp;
			<input style="height:12px;width:20px;" type="radio" id="environment" class="environment" name="environment" value="2G"/>2G
		</span>
    </div>
	<div style="margin-bottom:20px;padding:0 15px;color:#666;">
		<span style="font-size:16px">运营商:&nbsp;
			<input style="height:12px;width:18px;" type="radio" name="operator" id="operator" class="operator" checked="checked" value="联通"/>联通&nbsp;
			<input style="height:12px;width:18px;" type="radio" name="operator" id="operator" class="operator" value="移动"/>移动&nbsp;
			<input style="height:12px;width:18px;" type="radio" name="operator" id="operator" class="operator" value="电信"/>电信
		</span>
	</div>
	<div style="margin-bottom:20px;padding:0 15px;color:#666;">
		<span style="font-size:16px">您的联系方式：
			<input type="text" style="padding:4px;font-size:15px;border:1px solid #ccc;border-radius:2px;color:#666;" class="mobilePhone" name="mobilePhone" id="mobilePhone"/>
		</span>
	</div>
	<div style="margin-bottom:20px;padding:0 15px;color:#666;">
		<textarea id="remindss" class="remindss" name="remindss" placeholder="请输入您的问题" style="height:150px;line-height:16px;font-size:16px;width:100%;padding:8px;resize:none;border:1px solid #ccc;border-radius:4px;color:#666;"></textarea>
	</div>
	 <div class="btnfixed">
	    <a href="javascript:void(0)" class="ques-btn">提交</a>
	 </div>
	</div>
<script type="text/javascript">

 $(function(){
	 $(".ques-btn").on('click', function() {
		 	var version = $(".version").val();
			var len = $("textarea").val().length;
			var environment =$(".environment").val();
			var mobilePhone =$(".mobilePhone").val();
			var operator =$(".operator").val();
			var remindss= $(".remindss").val();
			if(version==""){
				toast("请输入手机型号 ");
				return;
			};
			if(!isPhone($(".mobilePhone").val())){
				toast("请填写正确的手机号");
				return;
			};
			if(len < 5){
				toast("内容至少输入5个字符");
				return;
			};
			  HH.ajax({
		    		url:"/yzmm/account/conproblem/createFeedBack",
		    		data:{
		    			mobilePhone:mobilePhone,
				    	version:version,
				    	operator:operator,
				    	remindss:remindss,
				    	environment:environment,
		    		},
		    		callback:function(data){
		    			if(data.success){
		    					toast("提交成功!");
		    					HH.href("/yzmm/account/knowledge/index");
		    				}
		    			else{
		    				toast("提交失败!");
		    			}
		    		}
		    	});
		});
});
</script>
</body>
</html>
