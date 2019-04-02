<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="background:#fff;">
<head lang="en">
    <meta charset="UTF-8">
    <title>喵姐早教说</title>
    <%@include file="../header.jsp" %>
</head>
<body  style="background:#fff;">
<section class="inform_update">
		<div class="inform_user"><input value="${nickName}" type="text" id="nickName" placeholder="请输入昵称"></div>
	    <p class="inform_update_tips">2-16个字符,可由中英文字母,数字,“－”,“_”组成</p>
	    <div id="submit"  class="inform_update_btn "><button>保存</button></div>  
</section>

<script type="text/javascript">

//表单校验
function validNickname(nickname){
	var re=/^[^@\/\'\\\"#$%&\^\*]+$/;
	if(nickname==""||nickname.length>16||nickname.length<2||!re.test(nickname)){
		toast("请输入正确格式的昵称！");
		return false;
	}else{
		return true;
	}

	
}

$(function() {
	//- 修改昵称~
	$(submit).on('click', function() {
		var nickName = trim($('#nickName').val());
		if(!validNickname(nickName))
		{
			return;
		}
		
		if(!$(submit).hasClass("btn_on")){
			//console.log(""+nickName.val());
			return false;
		}
			HH.ajax({
				url:'/yzmm/account/modifyNickName', 
				data:{nickName: nickName}, 
				callback:function(data){
					//判断发送是否成功
					if(data.success) {
                			location.href='/yzmm/account/user/infoDetail';
	                } else {
	                    toast(data.msg);
	                }
				}
			});
	});

    $('.inform_user input').on('input',function(){
        $('.inform_update_btn').addClass('btn_on');
    })
});
	
</script>
</body>
</html>