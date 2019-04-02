<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--忽略页面中的邮箱格式为邮箱-->
<meta name="format-detection" content="email=no"/>
 <%@include file="../../header_v2.0.jsp" %>
 <%@include file="../../header_wxjsapi.jsp"%>
 <script src="<b:staticUrl>/res/js/scroll.js</b:staticUrl>"></script>
 <link rel="stylesheet" href="<b:staticUrl>/res/css/activity-v2.0.css</b:staticUrl>" >
 <script src="<b:staticUrl>/res/js/evaluation/idenify.js</b:staticUrl>"></script>
<title>喵姐早教说</title>
<style type="text/css">
	p{
		font-size: 12.3px;
	}
	section{
		text-align: center;
		padding: 1rem;
	}
	.topDiv{
		margin-bottom: 1rem;
	}
	.marginTop{
		margin-top:1.5rem;
	}
	.marginTop img{
		width:50px;
		height:50px;
		cursor: pointer;
	}
	.marginTop span{
		font-size:14px;
		cursor: pointer;
	}
	.idenify{
		float: left;
		width: 33.333%;
	}
	.span-prompt{
		font-size: 10px;
		color: #AEAEAE;
		text-align: center;
	}
	.tipInfo{
		bottom: 5px;
	    position: absolute;
	    margin: 0 auto;
	    width: 100%;
	    text-align: center;
	}
	p span{
		line-height: 0.6rem;
	}
	p small{
		margin-top: 2rem;
		float: left;
		color: #FF9900;
		line-height: 0.4rem;
	}
</style>
<script>
var wxfenxiangcb={
		title: '${wxshare.title}', // 分享标题
		desc : '${wxshare.desc}',
	    link: '${wxshare.link}', // 分享链接
	    imgUrl: '${wxshare.imgUrl}', // 分享图标
	    shareTimeline:function(bool){
	    },
	    shareAppMessage:function(bool){
	    }
};
initwxfx(wxfenxiangcb);
</script>
</head>
<body>
<div class="topDiv">
	<img alt="" src="/../../../res/img/evaluation/welcome.png">
</div>
	<p style="font-size:0.2rem;">嗨，欢迎您来到喵姐早教说专业测评栏目，为保证测评结果的准确性，喵姐需要知道您目前属于</p>
<div class="marginTop">
	<p>宝宝昵称：<input type="text" id="babyNickname" name="babyNickname"/></p>
	<p>宝宝性别：
		<input type="radio" name="babySex" value="MALE"/>男  
		<input type="radio" name="babySex" value="FAMALE"/>女</p>
	<p>出生日期：<input type="number" id="babyAge" name="babyAge"/></p>
	<p>入园时间：<input type="number" id="babyGoSchoolTime" name="babyGoSchoolTime"/></p>
	<p><input type="button" value="submit" class="submit"/></p>
</div>
<p><small style="font-size:0.4rem;">为获得准确的测评结果及提升建议，请依照您的真实做法选择最接近的答案。</small></p>
<script type="text/javascript">
	$(function(){
		$(".submit").click(function(){
			var cpId = '${id}';
			var babyNickname = $("#babyNickname").val();
			var babySex = $("input[name='babySex']:checked").val();
			var babyAge = $("#babyAge").val();
			var babyGoSchoolTime = $("#babyGoSchoolTime").val();
			if(!babyNickname||!babySex||!babyAge||!babyGoSchoolTime){
				toast("请完善信息");
			}
			HH.ajax({
				url:"/yzmm/account/evaluation/result/saveIdentity",
				data:{cpId:cpId,babyNickname:babyNickname,babySex:babySex,babyAge:babyAge,babyGoSchoolTime:babyGoSchoolTime}, 
				callback:function(data){
					//判断发送是否成功
					if(data.success) {
						HH.href("/yzmm/account/evaluation/evaluationProblemList?cpResultId="+data.ext);
	                } else {
	                    toast(data.msg);
	                }
				}
			});
		});
	});
</script>
</body>
</html>
