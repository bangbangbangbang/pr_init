<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <!--忽略页面中的邮箱格式为邮箱-->
    <meta name="format-detection" content="email=no">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
    <meta name="format-detection" content="telephone=no,address=no,email=no">
    <meta name="keywords" content="喵姐,喵姐早教说,0到6岁早期教育,家庭教育,家长教育,父母课堂,育儿知识,儿童教育,母婴育儿,">
    <meta name="description" content="喵姐早教说是喵姐高寿岩创办的为家庭教育提供专业靠谱的0到6岁早期教育、育儿知识的平台。">
    <title>喵姐早教说-测评个人登记表</title>
    <%@include file="../../header_v2.3.jsp" %>
    <%@include file="../../header_wxjsapi.jsp"%>
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
	<style>
		.active{
			color: #ff9900;
		}
	</style>
</head>
<body style="background-color: rgba(242, 242, 242, 1) ">
    <div class="wrap">
        <div class="public">
            <div class="testDivision">
                <div class="testMess clearfix">
                    <!--左边测试人的信息-->
                    <div class="messLeft">
                        <span class="testTime">入园时间：${babyGoSchoolTime}</span>
                        <span class="testBaby">宝宝 ：${babynickname}</span>
                        <span class="testName">测试人：${nickname}</span>
                        <img src="<b:staticUrl>/res/img/evaluation/scissors.png</b:staticUrl>" alt="" class="scissors">
                    </div>
                    <div class="mainDiv">
                    	<!--右边选项部分-->
                    	<!-- <div class="messRight">
	                        <div class="rightTit">
	                            <h3>请选择符合孩子早上起床情形的描述</h3>
	                        </div>
	                        <div class="rightContent">
	                            <div class="conL">
	                                <span class="conChoice">A</span>
	                            </div>
	                            <div class="conR">
	                                <span>每天早上7：30之前自然醒，醒来会很高兴地起床,醒来会很高兴地起床</span>
	                            </div>
	                        </div>
	                        <div class="rightContent" style="padding-top: 0.6rem;">
	                            <div class="conL ">
	                                <span class="conChoice">B</span>
	                            </div>
	                            <div class="conR">
	                                <span>起床时间不确定，要看前一天晚上睡觉时间早晚,醒来会很高兴地起床</span>
	                            </div>
	                        </div>
	                        <div class="rightContent"  style="padding-top: 0.6rem;">
	                            <div class="conL">
	                                <span class="conChoice">C</span>
	                            </div>
	                            <div class="conR">
	                                <span>每天早上7：30之前能醒，但是醒来会磨磨蹭蹭不愿起床,醒来会很高兴地起床</span>
	                            </div>
	                        </div>
	                        <div class="rightContent" style="padding-top: 0.6rem;">
	                            <div class="conL">
	                                <span class="conChoice">D</span>
	                            </div>
	                            <div class="conR">
	                                <span>每天早上7：30之前起不来，如果叫醒，会有很大的起床气,醒来会很高兴地起床</span>
	                            </div>
	                        </div>
	                    </div> -->
                    </div>
                    
                    <!--右边下面的页数显示 -->
                    <div class="choiceCycle nocommit">
                        <div class="costMon">
                            <span class="costNum pageNum">P1</span>
                            <span class="costOrig">/ 31</span>
                        </div>
                        <div class="testNext">上一题</div>
                    </div>
                    <div class="choiceCycle clearfix commit" style="display:none">
                        <div class="testNext testUp" >上一题</div>
                        <div class="costMon testSub" >
                            <span class="costNum comment">提&nbsp;&nbsp;交</span>
                        </div>
                        <div class="testTimeBtn">总用时  3分 23秒</div>
                    </div>
                </div> 
            </div>
        </div>     
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
			if(m==0){
				load(true,m);
			}else{
				load(false,m);
			}
		}
		for(var n=2;n<totalRows;n++){
			load(false,n);
		}
		
		$('.costOrig').html('/ '+totalRows);
		
		var index=totalRows-1;
		
		
		$(".comment").click(function(){
			
			if(!$('.index'+index).find('.rightContent').hasClass('active')){
				toast("请选择答案");
				return;
			};
			var optInfo=$('.index'+index).find('.active').find('.conR');
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
		
	  /**
		*下一题
		**/
		$('.rightContent').on('click',function(){
			var self=$(this);
			var index=parseInt(self.parent().data('index'));
			var messRightLen=$('.messRight').length;
			
			self.parent().find('.active span').css('color','#000')
			self.parent().find('.active').removeClass('active');
			
			self.addClass('active');
			self.find('span').css('color','#ff9900');
			
			if(index<messRightLen-1){
				$('.index'+(index)).hide();
				$('.index'+(index+1)).show();
				$('.testNext').data('index',index+1);
				$('.pageNum').html("P"+(parseInt(index)+2));
				
				var optInfo=self.find('.conR');
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
			}
			if(index==messRightLen-2){
				$('.nocommit').hide();
				$('.commit').show();
				var endtime=new Date().getTime();
				var time = endtime-starttime;
				$('.testTimeBtn').html('总用时 '+formatSeconds(time/1000));
			}
		});
		$('.testNext').on('click',function(){
			var self=$(this);
			var index=self.data('index');
			if(index>0){
				$('.index'+(index)).hide();
				$('.index'+(index-1)).show();
				$('.testNext').data('index',index-1);
				$('.pageNum').html("P"+index);
			}
			$('.nocommit').show();
			$('.commit').hide();
			
		});
	});
	function load(display,index){
		 HH.ajax({
				data:{pageSize:1,pageIndex:pageIndex,subjectId:subjectId},
				url:"/yzmm/account/evaluation/ajaxEvaluationProblem",
				async:false,
			    callback:function(data){
		   		if(data.success){
		   			//是否为空
						var len = data.list.length;
						totalRows = data.totalRows;
						if (len) {
							//增加页码
							 ++pageIndex;
						}
						var mainDiv=$(".mainDiv");
						
						for (var i = 0; i < len; i++) {
							var problem = data.list[i];
							var messRight=null;
							if(display){
								messRight=$('<div class="messRight index'+index+'" data-index="'+index+'" ></div>').appendTo(mainDiv);
							}else{
								messRight=$('<div class="messRight index'+index+'" style="display:none;" data-index="'+index+'"></div>').appendTo(mainDiv);
							}
							
							$('<div class="rightTit"><h3>'+problem.problemContent+'</h3></div>').appendTo(messRight);
							
							var optLen =problem.optionList.length; 
							for(var j = 0;j<optLen;j++){
								var opt = problem.optionList[j];
								var rightContent=$('<div class="rightContent"></div>').appendTo(messRight);
								$('<div class="conL"> <span class="conChoice">'+opt.optionCode+'</span> </div>').appendTo(rightContent);
								$('<div class="conR" data-id="'+opt.id+'" data-subjectid="'+opt.subjectId+'" data-dimensionid="'+opt.dimensionId+'" data-problemid="'+opt.problemId+'" data-score="'+opt.score+'" > <span>'+opt.optionContent+'</span> </div>').appendTo(rightContent);
							}
						}
		   			}
			    }
			});
		}
	
	</script>
</body>
</html>
