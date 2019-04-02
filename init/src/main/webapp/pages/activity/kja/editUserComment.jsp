<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>喵姐早教说</title>
	<%@include file="../../header_v2.4.0.jsp" %>
	<%@include file="../../header_wxjsapi.jsp"%>
	 <link rel="stylesheet" href="<b:staticUrl>/res/css/prekindergarten/evaluatePage.css</b:staticUrl>">
    <script type="text/javascript">
	var wxfenxiangcb_dtl={
				title: '${wxshare.title}', // 分享标题
				desc : '${wxshare.desc}',
			    link: '${wxshare.link}', // 分享链接
			    imgUrl: '${wxshare.imgUrl}', // 分享图标
			    shareTimeline:function(bool){
			    
			    },
			    shareAppMessage:function(bool){
			     
			    }
			};
	
			 initwxfx(wxfenxiangcb_dtl);
			
	</script>
	  <style>
    	dd {
            float:left;
            line-height:37px;
        }
        dd:nth-child(3n+1) {
            text-align:right;
            width:164px;
        }
        input[type="radio"]{
            display:none;
        }
        input[type="radio"]+label{
            display: block;
            position:relative;
            padding-left:0.7rem;
            line-height:20px;
            color:#333;
            font-weight:normal;
            margin-left:0.1rem;
        }
        label {
            display:inline-block;
            max-width:100%;
            margin-bottom:5px;
            font-weight:700;
        }
        input[type="radio"]+label::before {
            content:"";
            width:0.3rem;
            height:0.3rem;
            border-radius:50%;
            border:1px solid #cecece;
            position:absolute;
            top: -0.15rem;
            left:-0.3rem;;
            z-index: 22;
            background: #fff;
        }
        input[type="radio"]:checked+label::after {
            top: -0.065rem;
    		left: -0.21rem;
            content:"";
            background-color:#ff9963;
            width:0.18rem;
            height:0.18rem;
            border-radius:50%;
            position:absolute;
            vertical-align:middle;
            z-index: 33;
        }
    </style>
</head>
<body>
    <div class="wrapPage ${alreadyEdit?'':'canEdit'}">
    	<!--标题-->
    	<h3 class="evaluateTit"><span>${babyNickname}</span>${name}第${week}阶段</h3>
    	<!--任务感兴趣程度-->
    	<div class="evaluateStar clearfix">
    		<p class="starInterest fl">任务感兴趣程度</p>
    		<div class="fl starContent">
    			<a href="javascript:void(0);" data-check="1" data-value="1" data-params="interestingDegree"><img src="<b:staticUrl>/res/img/activity/prekindergarten/u9130.png</b:staticUrl>" id="star1"/></a>
			    <a href="javascript:void(0);" data-check="2" data-value="2" data-params="interestingDegree"><img src="<b:staticUrl>/res/img/activity/prekindergarten/u9130.png</b:staticUrl>" id="star2"/></a>
			    <a href="javascript:void(0);" data-check="3" data-value="3" data-params="interestingDegree"><img src="<b:staticUrl>/res/img/activity/prekindergarten/u9130.png</b:staticUrl>" id="star3"/></a>
			    <a href="javascript:void(0);" data-check="4" data-value="4" data-params="interestingDegree"><img src="<b:staticUrl>/res/img/activity/prekindergarten/u9130.png</b:staticUrl>" id="star4"/></a>
			    <a href="javascript:void(0);" data-check="5" data-value="5" data-params="interestingDegree"><img src="<b:staticUrl>/res/img/activity/prekindergarten/u9130.png</b:staticUrl>" id="star5"/></a>
    		</div>
    	</div>
    	<!--内容质量-->
    	<div class="evaluateStar clearfix">
    		<p class="starInterest fl">内容质量</p>
    		<div class="fl starContent">
    			<a href="javascript:void(0);"  data-check="6" data-value="1" data-params="commentQuality"><img src="<b:staticUrl>/res/img/activity/prekindergarten/u9130.png</b:staticUrl>" id="star6"/></a>
			    <a href="javascript:void(0);"  data-check="7" data-value="2" data-params="commentQuality"><img src="<b:staticUrl>/res/img/activity/prekindergarten/u9130.png</b:staticUrl>" id="star7"/></a>
			    <a href="javascript:void(0);" data-check="8" data-value="3" data-params="commentQuality"><img src="<b:staticUrl>/res/img/activity/prekindergarten/u9130.png</b:staticUrl>" id="star8"/></a>
			    <a href="javascript:void(0);" data-check="9" data-value="4" data-params="commentQuality"><img src="<b:staticUrl>/res/img/activity/prekindergarten/u9130.png</b:staticUrl>" id="star9"/></a>
			    <a href="javascript:void(0);" data-check="10" data-value="5" data-params="commentQuality"><img src="<b:staticUrl>/res/img/activity/prekindergarten/u9130.png</b:staticUrl>" id="star10"/></a>
    		</div>
    	</div>
    	<!--难易适中度-->
    	<div class="evaluateStar clearfix">
    		<p class="starInterest fl">难易适中度</p>
    		<div class="starBtn">
				<div>
					<input id="adType1" name="level" type="radio" value="1">
					<label for="adType1"></label>
				</div>
				<div class="inputBox">
					<input id="adType2" name="level" type="radio" value="2">
					<label for="adType2"></label>
				</div>
				<div>
					<input id="adType3" name="level" type="radio" value="3">
					<label for="adType3"></label>
				</div>
			</div>
			<div class="starP">
				<p>非常简单</p>
				<p class="moderate">适中</p>
				<p class="difficulty">非常困难</p>
			</div>
    	</div>
    	<!--线-->
    	<div class="evaluateLine"></div>
    	<!--多行文本框-->
    	<h3 class="multiTit">这一阶段下来你的感受如何？<span>（选填）</span></h3>
		<div  class="multilineText">
			<textarea id="content"  ${alreadyEdit?'readonly="readonly"':''} name="content" placeholder="对小喵说..."></textarea> 
		</div>
		<!--线-->
    	<div class="evaluateLine"></div>
    	${alreadyEdit?'':'<a href="#" class="planJoinGray">提 交</a>'}
    	<!--线-->
    	<div class="evaluateOccupy"></div>
    </div>  
    
    <script>
	    var check = 0;//该变量是记录当前选择的评分
	    var time = 0;//该变量是统计用户评价的次数，这个是我的业务要求统计的（改变评分不超过三次），可以忽略
		var interestingDegree = null;
	    var commentQuality = null;
	    var level = null;
    	$(function() {
    		$(".canEdit").on("click",".planJoinOrange",function(){
    			level = $("input[name='level']:checked").val();
    			if(!interestingDegree||!commentQuality||!level){
    				toast("请选择评分...");
    			}
    			var content = $("#content").val();
    			HH.ajax({
    				data:{
    					uid:'${uid}',
    					activityId:'${activityId}',
    					dayTime:'${dayTime}',
    					level:level,
    					interestingDegree:interestingDegree,
    					commentQuality:commentQuality,
    					content:content
    				},
    				url:"/yzmm/account/activity/kja/ajaxEditcomment",
    				async:false,
    			    callback:function(data){
    			   		if(data.success){
    			   			toast("提交成功，感谢您的参与~");
    			   			setTimeout(function(){
    			   				HH.href("/yzmm/account/activity/kja/showWeekReport?activityId=${activityId}&uid=${uid}&dayTime=${dayTime}");
				   			},2000);
    		   			}else{
    		   				toast(data.msg);
    		   			}
    			    }
    			});
    		});
    		  /*selected()点击事件处理，记录打分*/
    	    $(".canEdit .starContent a").on("click",function(){
    	    	check = $(this).data("check");
    	    	var value = $(this).data("value");
    	    	console.log("value:"+value);
    	    	var params = $(this).data("params");
    	    	console.log("params:"+params);
    	    	if(params=='interestingDegree'){
    	    		interestingDegree = value;
    	    	}else if(params=='commentQuality'){
    	    		commentQuality = value;
    	    	}
    	    	console.log("params:"+params);
    	        time++;//记录打分次数
    	        check = check;//记录当前打分
    	        out();//设置星星数
    	        $(".planJoinGray").removeClass().addClass("planJoinOrange");
    	    });
    		  
    		if('${alreadyEdit}'=='true'){
    			var content = '${usercomment.content}';
    			$("#content").val(content);
    			interestingDegree = '${usercomment.interestingDegree}';
    			if(interestingDegree){
    				 check = interestingDegree;//记录当前打分
    	    	     out();//设置星星数
    			}
    			commentQuality = '${usercomment.commentQuality}';
    			if(commentQuality){
    				 check = parseInt(commentQuality)+5;//记录当前打分
    	    	     out();//设置星星数
    			}
    			level = '${usercomment.level}';
    			if(level){
    				$("input[name=level][value="+level+"]").attr("checked",true);  
    			}
    		}
    	});
	    /*over()是鼠标移过事件的处理方法*/
	    function over(param){
	        if(param == 1){
	            $("#star1").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9200.png</b:staticUrl>");//第一颗星星亮起来，下面以此类推
	        }else if(param == 2){
	            $("#star1").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9200.png</b:staticUrl>");
	            $("#star2").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9200.png</b:staticUrl>");
	        }else if(param == 3){
	            $("#star1").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9200.png</b:staticUrl>");
	            $("#star2").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9200.png</b:staticUrl>");
	            $("#star3").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9200.png</b:staticUrl>");
	        }else if(param == 4){
	            $("#star1").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9200.png</b:staticUrl>");
	            $("#star2").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9200.png</b:staticUrl>");
	            $("#star3").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9200.png</b:staticUrl>");
	            $("#star4").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9200.png</b:staticUrl>");
	        }else if(param == 5){
	            $("#star1").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9200.png</b:staticUrl>");
	            $("#star2").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9200.png</b:staticUrl>");
	            $("#star3").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9200.png</b:staticUrl>");
	            $("#star4").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9200.png</b:staticUrl>");
	            $("#star5").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9200.png</b:staticUrl>");
	        }
	        if(param == 6){
	            $("#star6").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9200.png</b:staticUrl>");//第一颗星星亮起来，下面以此类推
	        }else if(param == 7){
	            $("#star6").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9200.png</b:staticUrl>");
	            $("#star7").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9200.png</b:staticUrl>");
	        }else if(param == 8){
	            $("#star6").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9200.png</b:staticUrl>");
	            $("#star7").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9200.png</b:staticUrl>");
	            $("#star8").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9200.png</b:staticUrl>");
	        }else if(param == 9){
	            $("#star6").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9200.png</b:staticUrl>");
	            $("#star7").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9200.png</b:staticUrl>");
	            $("#star8").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9200.png</b:staticUrl>");
	            $("#star9").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9200.png</b:staticUrl>");
	        }else if(param == 10){
	            $("#star6").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9200.png</b:staticUrl>");
	            $("#star7").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9200.png</b:staticUrl>");
	            $("#star8").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9200.png</b:staticUrl>");
	            $("#star9").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9200.png</b:staticUrl>");
	            $("#star10").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9200.png</b:staticUrl>");
	        }
	    }
	    /*out 方法是鼠标移除事件的处理方法，当鼠标移出时，恢复到我的打分情况*/
	    function out(){
	        if(check == 1){//打分是1，设置第一颗星星亮，其他星星暗，其他情况以此类推
	            $("#star1").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9200.png</b:staticUrl>");
	            $("#star2").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9130.png</b:staticUrl>");
	            $("#star3").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9130.png</b:staticUrl>");
	            $("#star4").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9130.png</b:staticUrl>");
	            $("#star5").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9130.png</b:staticUrl>");
	        }else if(check == 2){
	            $("#star1").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9200.png</b:staticUrl>");
	            $("#star2").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9200.png</b:staticUrl>");
	            $("#star3").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9130.png</b:staticUrl>");
	            $("#star4").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9130.png</b:staticUrl>");
	            $("#star5").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9130.png</b:staticUrl>");
	        }else if(check == 3){
	            $("#star1").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9200.png</b:staticUrl>");
	            $("#star2").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9200.png</b:staticUrl>");
	            $("#star3").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9200.png</b:staticUrl>");
	            $("#star4").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9130.png</b:staticUrl>");
	            $("#star5").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9130.png</b:staticUrl>");
	        }else if(check == 4){
	            $("#star1").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9200.png</b:staticUrl>");
	            $("#star2").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9200.png</b:staticUrl>");
	            $("#star3").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9200.png</b:staticUrl>");
	            $("#star4").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9200.png</b:staticUrl>");
	            $("#star5").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9130.png</b:staticUrl>");
	        }else if(check == 5){
	            $("#star1").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9200.png</b:staticUrl>");
	            $("#star2").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9200.png</b:staticUrl>");
	            $("#star3").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9200.png</b:staticUrl>");
	            $("#star4").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9200.png</b:staticUrl>");
	            $("#star5").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9200.png</b:staticUrl>");
	        }else if(check == 0){
	            $("#star1").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9130.png</b:staticUrl>");
	            $("#star2").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9130.png</b:staticUrl>");
	            $("#star3").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9130.png</b:staticUrl>");
	            $("#star4").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9130.png</b:staticUrl>");
	            $("#star5").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9130.png</b:staticUrl>");
	        }
	        if(check == 6){//打分是1，设置第一颗星星亮，其他星星暗，其他情况以此类推
	            $("#star6").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9200.png</b:staticUrl>");
	            $("#star7").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9130.png</b:staticUrl>");
	            $("#star8").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9130.png</b:staticUrl>");
	            $("#star9").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9130.png</b:staticUrl>");
	            $("#star10").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9130.png</b:staticUrl>");
	        }else if(check == 7){
	            $("#star6").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9200.png</b:staticUrl>");
	            $("#star7").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9200.png</b:staticUrl>");
	            $("#star8").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9130.png</b:staticUrl>");
	            $("#star9").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9130.png</b:staticUrl>");
	            $("#star10").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9130.png</b:staticUrl>");
	        }else if(check == 8){
	            $("#star6").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9200.png</b:staticUrl>");
	            $("#star7").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9200.png</b:staticUrl>");
	            $("#star8").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9200.png</b:staticUrl>");
	            $("#star9").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9130.png</b:staticUrl>");
	            $("#star10").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9130.png</b:staticUrl>");
	        }else if(check == 9){
	            $("#star6").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9200.png</b:staticUrl>");
	            $("#star7").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9200.png</b:staticUrl>");
	            $("#star8").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9200.png</b:staticUrl>");
	            $("#star9").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9200.png</b:staticUrl>");
	            $("#star10").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9130.png</b:staticUrl>");
	        }else if(check == 10){
	            $("#star6").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9200.png</b:staticUrl>");
	            $("#star7").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9200.png</b:staticUrl>");
	            $("#star8").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9200.png</b:staticUrl>");
	            $("#star9").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9200.png</b:staticUrl>");
	            $("#star10").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9200.png</b:staticUrl>");
	        }else if(check == 0){
	            $("#star6").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9130.png</b:staticUrl>");
	            $("#star7").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9130.png</b:staticUrl>");
	            $("#star8").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9130.png</b:staticUrl>");
	            $("#star9").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9130.png</b:staticUrl>");
	            $("#star10").attr("src","<b:staticUrl>/res/img/activity/prekindergarten/u9130.png</b:staticUrl>");
	        }
	    }
    </script>
</body>
</html>