<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--忽略页面中的邮箱格式为邮箱-->
<meta name="format-detection" content="email=no"/>
 <%@include file="../../header_v2.0.jsp" %>
 <%@include file="../../header_wxjsapi.jsp"%>
 
 <link rel="stylesheet" href="<b:staticUrl>/res/css/navigator.css</b:staticUrl>">
<title>喵姐早教说</title>
<style type="text/css">
	*{
		color:#666;
	}
	.mainDiv .problemNo{
		    margin: 20px 10px 20px 10px;
		    text-align: center;
		    border: 1px solid rgba(242, 242, 242, 1);
		    padding: 15px;
		    border-radius: 5px;
	}
	.mainDiv .problemNo p{
		color:#ff9900;
	}
	.mainDiv .problemDetail{
		margin: 30px 40px;
	}
	.mainDiv .problemDetail p{
		font-size: 0.39rem;
	}
	.mainDiv .problemOption{
	    font-size: 0.35rem;
  		margin: 0px 45px;
	}
	.mainDiv .problemOption p{
		padding: 10px 0;
	}
	.mainDiv .problemOption .active{
		font-size: 0.37rem;
		color:#ff9900;
	}
	.mainDiv .problemOption .active i{
		color:#ff9900;
	}
	.mainDiv .problemOption p i{
		font-size: 0.42rem;
		margin-right:10px;
	}
	.mainDiv .problemOption .page,.mainDiv .problemOption .firstpage{
	    display: block;
   		margin-top: 20px;
   		margin-bottom: 80px;
	}
	.mainDiv .problemOption .page .next,.mainDiv .problemOption .firstpage .next{
		float:right;
	}
	.mainDiv .problemOption .firstpage .prev{
		display:none;
	}
	.mainDiv .problemOption .page .comment,.mainDiv .problemOption .firstpage .comment{
	   display:none;
	}
	.mainDiv .problemOption .lastpage .next{
		display:none;
	}
	.mainDiv .problemOption .lastpage .prev{
		text-align: center;
    	margin-top: 10px;
	}
	   
	.mainDiv .problemOption .lastpage .comment{
	    font-size: 0.4rem;
	    line-height: 25px;
	    margin-top: 20px;
	    margin-left: auto;
	    margin-right: auto;
	    border: 1px solid #ff9900;
	    border-radius: 20px;
	    width: 177px;
	    height: 30px;
	    text-align: center;
	    color: #ff9900;
	    margin-bottom: 20px;
	}
	.mainDiv .processBar{
		margin:20px;
	}
	.mainDiv .processBar{
		text-align: center;
		margin-top: 80px;
	}
	.mainDiv .processBar p{
		color:#797979;
	}
	.mainDiv .processBar .bar{
	    margin: 12px 0;
	    width: 100%;
	    height: 5px;
	    background-color: rgba(242, 242, 242, 1);
	}
	.mainDiv .processBar .bar .alreadly{
	    height: 5px;
	    background-color: #ff9900;
	}
	.fengexian {
		width: 99%;
		height: 1px;
		background-repeat: repeat-x;
		background-image:
			url("<b:staticUrl>/res/img/cp/wd/onexuxian2.png</b:staticUrl>");
	}
	.font19{
		font-size:17px;
		line-height:17px;
	}
	.font15{
		font-size:15px;
		line-height:16px;
	}
	.font11{
		font-size:11px;
		line-height:11px;
	}
	.problemDetail:before{
	    content: '';
	    width: 0.2rem;
	    height: 0.2rem;
	    line-height: 0.25rem;
	    position: absolute;
	    margin-left: -16px;
	    margin-top: 6px;
	    border-radius: 100%;
	    border: 1px solid #ff9900;
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
<div>
	<p>${nickname}</p>
	<p>${babynickname}</p>
	<p>${babyGoSchoolTime}</p>
</div>
<div class="mainDiv">
	<!-- <section>
		<div class="problemNo">
		<p class="font15">第1题（共30题）</p>
		</div>
		<div class="problemDetail">
			<p>孩子一出生便生活在金钱的世界里。在理财已经成为基本生存能力的今天，如果小时候缺少对金钱的了解和良好的财商教育，长大后就很可能为金钱所累、受金钱之苦。所以，一定让孩子尽早和“钱”相遇。</p>
		</div>
		<div class="problemOption">
			<p class="active"><i>A:</i>有事儿没事儿就喜欢笑，应该比较乐观</p>
			<p><i>B:</i>有事儿没事儿就喜欢笑，应该比较乐观</p>
			<p><i>C:</i>有事儿没事儿就喜欢笑，应该比较乐观</p>
			<p><i>D:</i>有事儿没事儿就喜欢笑，应该比较乐观</p>
			<div class="lastpage">
				<div class="comment">快速提问</div>
				<div class="next">下一题&gt;</div>
				<div class="prev">&lt;上一题</div>
			</div>
		</div>
		<div class="processBar">
			<div class="bar"><div class="alreadly"></div></div>
			<p class="font11">测试进度</p>
		</div>
	</section> -->
	</div>
	<script type="text/javascript">
	var sm = {};
	var pageIndex = 1;
	var subjectId = '${subjectId}';
	var cpResultId = '${cpResultId}';
	var totalRows = 10;
	var starttime=new Date().getTime(); 
	$(function(){
		for(var m=0;m<2;m++){
			load();
		}
		for(var n=2;n<totalRows;n++){
			load();
		}
		$(".next").click(function(){
			var thisSession = $(this).parent().parent().parent();
			if(!$(this).parent().parent().children("p").hasClass("active")){
				toast("请选择答案");
				return;
			};
			var optInfo = $(this).parent().parent().children(".active");
			if(subjectId!=optInfo.data("subjectid")){
				toast("请刷新重试");
				return;
			}
			var id = optInfo.data("id");
			var dimensionId = optInfo.data("dimensionid");
			var problemId = optInfo.data("problemid");
			var score = optInfo.data("score");
			if(!(id&&dimensionId&&problemId)){
				toast("请刷新重试");
				return;
			}
			 HH.ajax({
					data:{
						cpId:subjectId,
						cpWdId:dimensionId,
						questionId:problemId,
						answerId:id,
						score:score,
						cpResultId:cpResultId
					},
					url:"/yzmm/account/evaluation/doDimensionEvaluation",
					async:false,
				    callback:function(data){
				   		if(data.success){
				   			thisSession.hide();
				   			thisSession.next().show();
			   			}else{
			   				toast(data.msg);
			   			}
				    }
				});
		});
		$(".prev").click(function(){
			$(this).parent().parent().parent().hide();
			$(this).parent().parent().parent().prev().show();
		});
		$(".option").click(function(){
			$(this).parent().children("p").removeClass("active");
			$(this).addClass("active");
			try{
				if($(this).parent().children().hasClass("lastpage")){
					var endtime=new Date().getTime();
					var time = endtime-starttime;
					$(".taketime").html("用时&nbsp;"+formatSeconds(time/1000));
				};
			}catch(e){
					
			}
		});
		$(".comment").click(function(){
			if(!$(this).parent().parent().children("p").hasClass("active")){
				toast("请选择答案");
				return;
			};
			if($(".problemOption .active").length<totalRows){
				toast("为了测评的准确性，请你完善所有答案");
				return;
			};
			var optInfo = $(this).parent().parent().children(".active");
			if(subjectId!=optInfo.data("subjectid")){
				toast("请重试");
				return;
			}
			var id = optInfo.data("id");
			var dimensionId = optInfo.data("dimensionid");
			var problemId = optInfo.data("problemid");
			var score = optInfo.data("score");
			if(!(id&&dimensionId&&problemId)){
				toast("请重试");
				return;
			}
			 HH.ajax({
					data:{
						cpId:subjectId,
						cpWdId:dimensionId,
						questionId:problemId,
						answerId:id,
						score:score,
						cpResultId:cpResultId
					},
					url:"/yzmm/account/evaluation/commentDimensionEvaluation",
					async:false,
				    callback:function(data){
				   		if(data.success){
				   			HH.href("/yzmm/account/activity/prekindergarten/toEnlistPage?cpResultId="+cpResultId);
			   			}else{
			   				toast(data.msg);
			   			}
				    }
				});
			
		});
	});
	function load(){
		 HH.ajax({
				data:{pageSize:1,pageIndex:pageIndex,subjectId:subjectId},
				url:"/yzmm/account/evaluation/ajaxEvaluationProblem",
				async:false,
			    callback:function(data){
			    var h = "";
		   		if(data.success){
		   			//是否为空
						var len = data.list.length;
						totalRows = data.totalRows;
						if (len) {
							//增加页码
							 ++pageIndex;
						}
						//alert(pageIndex);
						var progress = ((pageIndex-1)/totalRows)*100;
						for (var i = 0; i < len; i++) {
							var problem = data.list[i];
						if(pageIndex==2){
							h+='<section id='+problem.id+'>';
						}else{
							h+='<section id='+problem.id+' style="display:none;">';
						}
							h+='<div class="problemNo">';
								h+='<p class="font15">第'+(pageIndex-1)+'题（共'+totalRows+'题）</p>';
							h+='</div>';
							h+='<div class="problemDetail">';
								h+='<p>'+problem.problemContent+'</p>';
							h+='</div>';
							h+='<div class="problemOption">';
								var optLen =problem.optionList.length; 
								for(var j = 0;j<optLen;j++){
									var opt = problem.optionList[j];
									h+='<p class="option" data-id="'+opt.id+'" data-subjectid="'+opt.subjectId+'" data-dimensionid="'+opt.dimensionId+'" data-problemid="'+opt.problemId+'" data-score="'+opt.score+'"><i>'+opt.optionCode+':</i>'+opt.optionContent+'</p>';
									h+='<div class="fengexian"></div>';
								}
								//h+='<p class="active"><i>A:</i>有事儿没事儿就喜欢笑，应该比较乐观</p>';
								//h+='<p><i>B:</i>有事儿没事儿就喜欢笑，应该比较乐观</p>';
								if(pageIndex==2){
									h+='<div class="firstpage">';
								}else if(pageIndex-1==totalRows ){
									h+='<div class="lastpage">';
								}else{
									h+='<div class="page">';
								}
									h+='<div class="comment">提交</div>';
									h+='<div class="next">下一题&nbsp;&gt;</div>';
									h+='<div class="prev">&lt;&nbsp;上一题</div>';
								h+='</div>';
							h+='</div>';
							h+='<div class="processBar">';
								h+='<div class="bar"><div class="alreadly" style="width:'+progress+'%;"></div></div>';
								h+='<p class="font11 taketime">测试进度</p>';
							h+='</div>';
						h+='</section>';
						$(".mainDiv").append(h);
						}
		   			}
			    }
			});
		}
	
	</script>
</body>
</html>
