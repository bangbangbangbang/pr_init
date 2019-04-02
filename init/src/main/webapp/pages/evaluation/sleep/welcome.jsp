<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--忽略页面中的邮箱格式为邮箱-->
<meta name="format-detection" content="email=no"/>
 <%@include file="../../header_v2.4.0.jsp" %>
 <%@include file="../../header_wxjsapi.jsp"%>
<link rel="stylesheet" href="<b:staticUrl>/res/css/prekindergarten/sleepTrain.css</b:staticUrl>">
    <style type="text/css">
    	:-moz-placeholder { /* Mozilla Firefox 4 to 18 */
            color: #C9C9C9; opacity:1; 
            font-size:0.36rem;
        }
            
        ::-moz-placeholder { /* Mozilla Firefox 19+ */
            color: #C9C9C9;opacity:1;
             font-size:0.36rem;
        }
            
        input:-ms-input-placeholder{
            color: #C9C9C9;opacity:1;
             font-size:0.36rem;
        }
            
        input::-webkit-input-placeholder{
            color: #C9C9C9;opacity:1;
        	 font-size:0.36rem;
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
	<div class="wrapPage">
		<div class="testStart">
			<h2 class="evaluationTit">好习惯养成·好好睡觉</h2>
			<div class="regionTxt">
				<div class="txtTitle clearfix">
					<h2>14天</h2>
					<span>睡眠引导训练，解决宝宝安睡一大难题</span>
				</div>
			</div>
			<div class="messNickname">
				<input type="text" class="textIpt babyNickname" id="textIpt" placeholder="点击输入宝宝昵称">
			</div>
			<p class="evaluationText">为保证训练效果，先让我们一起了解现在的情况吧</p>
			<div class="evaluationStart">
				<a href="#" class="btnJoin">好 的</a>
				<p class="startBottm">共 8 道测评题目，预计需要5分钟</p>
			</div>
		</div>
	</div>
	<script type="text/javascript">
        $(function () {
                $(".evaluationStart .btnJoin").click(function(){
            		var cpId = '${id}';
        			var babyNickname = $(".babyNickname").val();
        			if(!babyNickname){
        				toast("请完善信息");
        				return;
        			}
        		
        			HH.ajax({
        				url:"/yzmm/account/evaluation/result/saveIdentity",
        				data:{cpId:cpId,babyNickname:babyNickname}, 
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
