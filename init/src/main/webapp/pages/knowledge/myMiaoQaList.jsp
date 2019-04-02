<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="j" uri="/jsputil" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head lang="en">
<meta charset="UTF-8">
<title>喵姐早教说</title>
<%@include file="../header_v2.1.jsp"%>
<%@include file="../header_wxjsapi.jsp"%>
<script src="<b:staticUrl>/res/js/scrollpaginationme.js</b:staticUrl>"></script>
<style type="text/css">
		*{
			font-family: "微软雅黑", "PingFangSC-Light";
		}
    
		.continueQuestioning {
		    font-size: 15px;
		    line-height: 38px;
		    margin: 0.7rem auto 0 auto;
		    border: 1px solid #F39D39;
		    border-radius: 20px;
		    width: 95%;
		    height: 40px;
		    text-align: center;
		    color: #fff;
    		background: #F39D39;
		}
		.questionAsk {
		    font-size: 19px;
		    line-height: 19px;
		    text-align: center;
		}
	
		.askimg{
			width: 8rem;
    		margin-top: 0.8rem;
		}
		.askmain{
			height: 1.5rem;
			font-size: 0.32rem;
			margin: 10px;
		}
		.askname{
			color:rgba(255, 153, 0, 1);
			font-size: 0.4rem;
		}
		.askinfo{
			font-size: 10px;
			color: #9E9E9E;
		}
		.view{
			display: block;
		    height: 1.06666667rem;
		    line-height: 1.06666667rem;
		    text-align: right;
		    font-size: 12px;
		    color: #9E9E9E;
		    margin-right: 5px;
		}
		.myAskList {
		    position: relative;
		    padding-top: 0;
		}
		.miaoAsk p{
			margin-top: 0px;
		}
		.myAskList .miaoAsk:before, .myAskList .miaoAnswer:before {
		    content: '问';
		    width: 30px;
		    height: 30px;
		    line-height: 30px;
		    position: absolute;
		    left: 0px;
		    top: 0;
		    background-color: rgba(255, 153, 0, 1);
		    border-radius: 100%;
		    text-align: center;
		    font-size: 12px;
		    color: #fff;
		}
		.myAskList .miaoAsk2:before{
			content: '追';
		}
		.myAskList .miaoAnswer:before {
		    content: '答';
		    background-color: #fff;
		    border: 1px solid rgba(255, 153, 0, 1);
		    color: 1px solid rgba(255, 153, 0, 1);
		}
		.myAskList .miaoAsk a, .myAskList .miaoAnswer a {
		    color:rgba(255, 153, 0, 1);
		}
		
		.myAskList .miaoAnswer:before {
		    content: '答';
		    background-color: #fff;
		    border: 1px solid rgba(255, 153, 0, 1);
		    color: rgba(255, 153, 0, 1);
		    margin-top: 10px;
		}
		.myAskList .miaoAsk:after, .myAskList .miaoAnswer:after {
    		border-left: 0px solid #e4e4e4;
    	}
    	.myAskList .miaoAnswer {
		    min-height: 42px;
		    padding-top: 17px;
		}
		.myAskList .miaoAsk, .myAskList .miaoAnswer {
		   	font-size: 0.32rem;
    		color: #666;
		}
		.myAskList li {
		    border-bottom: 0.02rem solid #f2f2f2;
		    margin-top: 0px;
		}
		.miaoAnswer p{
		    margin-top: 12px;
   			color: #9E9E9E;
		}
		.font16{
			font-size:16px;
			line-height:16px;
		}
		.title{
			margin: 20px 10px 10px;
		}
		.line{
			border-bottom:1px solid #f2f2f2
		}
		.miaoRecommend p{
			margin-top: 12px;
    	color: #9E9E9E;
		}
		.myAskList .miaoAnswer2:before {
		    content: '';
		    background-color: #fff;
		    border: 0px;
		    color: "";
		}
		.voteSpan .leftDiv,.voteSpan .rightDiv{
			display: block; 
			width: 45%;
			height: 4rem;
			text-align: center;
			padding: 20px;"
		}
		.voteSpan .rightVote{
			float: right;
		}
		.voteSpan .vote{
			font-size: 15px;
		    line-height: 0.9rem;
		    margin: 0.7rem auto 0 auto;
		    border: 1px solid #ff9900;
		    border-radius: 5px;
		    width: 3rem;
		    height: 1rem;
		    text-align: center;
		    color: #ff9900;
		}
		.babyInfo{
			color:#949494;
		}
		.myAskTit {
		  position: relative;
		  top: 0;
		  padding: 3px 15px;
		  background-color: #efeff4;
		  font-size: 12px;
		  color: #333;
		}
		.baseInfo p{
			padding:1px
		}
		.span-prompt{
			font-size: 10px;
			color: #AEAEAE;
			text-align: center;
		}
</style>
</head>
<body>
<div style="border-bottom: 0.02rem solid #efeff4;">
	<div class="font16 title" style="font-size: 0.40rem;margin: 20px auto 10px 20px;"><b>基本信息：</b></div>
</div>
<div style="margin:0px 20px;">
	<div class="askmain babyInfo baseInfo">
		<p>宝宝信息：${pbsex}&nbsp;&nbsp;&nbsp;&nbsp;${pbage}</p>
		<p>提问时间：${questionTime}</p>
		<p>当前状态：<span style="color: rgba(255, 153, 0, 1);">${replyStatusDesc}</span></p>
	</div>
</div>
<div class="containerOther">
	<div class="myAskTit"></div>
	<ul class="myAskList">
		<li>
			<div class="miaoAsk">
				<p>${question}</p>
			</div>
			<div class="xiaomiaorecommend">
				
			</div>
		</li>
		<!-- 主贴上面的回答 -->
		<c:if test="${not empty answerTxt or not empty knowledgeList }">
		<li>
			<div  class="miaoAnswer">
			<c:if test="${not empty answerTxt}">
				${answerTxt}
			</c:if>
			<c:forEach items="${knowledgeList}" var="knowledge" varStatus="status">
				<c:if test="${status.index==0}">
					<p>相关三千问:</p>
				</c:if>
				<p><a onclick="to_authsqw(${knowledge.id})"><c:out value="${knowledge.title}"></c:out></a></p>
			</c:forEach>
			</div>
		</li>
		</c:if>
	</ul>
	<div class="myAskTit"></div>
	<c:if test="${replyStatus=='NO'}">
		<c:if test="${canQuesting ==true}">
			<div class="miaoTextarea textarea" style="border-bottom: 0.12rem solid #efeff4;">
				<textarea class="font13" placeholder="补充内容，写这里~" onkeyup="fn()" onblur="fn()" maxlength="200"></textarea>
				<span style="right: 0.28rem;margin-top: -25px;margin-right: 10px;color: #999;font-size: 13px;float: right">0/200</span>
				<div class="askmain">
					<div class="continueQuestioning">继续追问</div>
				</div>
				<div class="miaoTips span-prompt">
					<c:if test="${payType==0 }">
						<p>亲爱的，您的咨询已成功提交，喵姐将在1-3个工作日给出解答，请耐心等待~</p>
					</c:if>
					<c:if test="${payType==2 }">
						<p>亲爱的，您的咨询已成功提交，喵姐将在24小时内给出解答，请耐心等待~</p>
					</c:if>
				</div>
			</div>
		</c:if>
		<c:if test="${canQuesting ==false}">
			<div class="miaoTextarea" style="border-bottom: 0.12rem solid #efeff4;">
				<div class="miaoTips">
					<p style="text-align: left"><b>提醒:</b></p>
					<c:if test="${payType==0 }">
						<p>亲爱的，您的咨询已成功提交，喵姐将在1-3个工作日内给出解答，请耐心等待~</p>
					</c:if>
					<c:if test="${payType==2 }">
						<p style="text-align: left">亲爱的，您的咨询已成功提交，喵姐将在24小时内给出解答，请耐心等待~</p>
					</c:if>
				</div>
			</div>
		</c:if>
	</c:if>
	<c:if test="${replyStatus=='YES'}">
	<div style="margin: 20px;" class="voteScope">
		<div class="font16 title">评价：</div>
		<div class="line"></div>
		<div class="voteSpan">
			<div class="rightDiv rightVote">
				<img alt="" src="<b:staticUrl>/res/img/miaoqa/u1679.png</b:staticUrl>" />
				<div class="vote voteup" style="border: 1px solid #949494;color: #949494;">未解決</div>
			</div>
			<div class="leftDiv">
				<img alt="" src="<b:staticUrl>/res/img/miaoqa/u1677.png</b:staticUrl>" />
				<div class="vote votedown">解決</div>
			</div>
		</div>
	</div>
	<div class="miaoTextarea" style="display:none;border-bottom: 0.12rem solid #efeff4;">
			<textarea class="font13" placeholder="问题未解决？继续追问" onkeyup="fn()" onblur="fn()" maxlength="200"></textarea>
			<span style="right: 0.28rem;margin-top: -25px;margin-right: 10px;color: #999;font-size: 13px;float: right">0/200</span>
			<div class="askmain">
				<div class="continueQuestioning">继续追问</div>
			</div>
		</div>
	</c:if>
	<c:if test="${replyStatus=='COMMENDED'||replyStatus=='USERCLOSED'}">
		<div class="miaoTextarea" style="border-bottom: 0.12rem solid #efeff4;">
			<div class="miaoTips">
				<p><b>提醒:</b></p>
				<p>感谢您的认可，祝宝宝茁壮成长...</p>
			</div>
		</div>
	</c:if>
	<c:if test="${replyStatus=='IGNORE'}">
		<div class="miaoTextarea" style="border-bottom: 0.12rem solid #efeff4;">
			<div class="miaoTips">
				<p><b>提醒:</b></p>
				<p>${reason}</p>
			</div>
		</div>
	</c:if>
	<c:if test="${replyStatus=='QUESTIONINGIN'}">
		<div class="miaoTextarea" style="border-bottom: 0.12rem solid #efeff4;">
			<div class="miaoTips">
				<p><b>提醒:</b></p>
				<p>您的追问已提交，静待老师回答...</p>
			</div>
		</div>
	</c:if>
	
</div>
<!--尾部-->
	<jsp:include page="/pages/header_footer.jsp">
		<jsp:param value="1" name="menu"/>
	</jsp:include>
<script type="text/javascript">
$(function(){
	
	//初始化宝宝信息
	try{
		var babyInfoDiv=$('.babyInfo');
		var idenfy=JSON.parse('${babyInfo}').idenfy;
		var pbage='';
		if(idenfy=='孕妈／爸'){
			var dt=280 * 24 * 60 * 60-parseInt('${pbage}');
			var age=getDateObject(dt);
			pbage=(parseInt(age.month)*4+parseInt(age.week))+'周'+(age.day?parseInt(age.day)+'天':'');
		}else{
			var dt=parseInt('${pbage}');
			var age=getDateObject(dt);
			var yearMonth=ageYearMonth(age);
			pbage=yearMonth;
		}
		if(idenfy=='孕妈／爸'){
			babyInfoDiv.html(null);
			$('<p>已怀孕：${pbsex}&nbsp;&nbsp;&nbsp;&nbsp;'+pbage+'</p>').appendTo(babyInfoDiv);
			$('<p>提问时间：${questionTime}</p>').appendTo(babyInfoDiv);
			$('<p>当前状态：<span style="color: rgba(255, 153, 0, 1);">${replyStatusDesc}</span></p>').appendTo(babyInfoDiv);
		}else{
			$('.babyInfo p:eq(0)').html('宝宝信息：${pbsex}&nbsp;&nbsp;&nbsp;&nbsp;'+pbage);
		}
	}catch (e) {
		// TODO: handle exception
	}
	
	$(".continueQuestioning").click(function(){
		var groupId = '${groupId}';
		var uid = '${uid}';
		var content = $(".miaoTextarea textarea").val();
		if(content.replace(" ","").length==0){
			toast("请输入内容~");
			return;
		}
		var len = content.length
		if(len < 5){
			toast("至少输入5个字符");
			return false;
		}
		//校验位
		var check = false;
		//后台校验集
		HH.ajax({
        		url:"/yzmm/account/miaoqa/check",
        		async:false,
        		data:{
    		    	txt:content
        		},
        		callback:function(data){
        			if(data.code == 200){
        				check = true;
        				}
        			else{
        				toast(data.msg);
						check =  false;
        			}
        		}
        	});
	if(check){
		HH.ajax({
			 waiting:false,
			   url: "/yzmm/account/miaoqa/continueQuestioning",
			   data: {groupId:groupId,questionTxt:content,uid:uid},
			   callback: function(data){
				   if(data.success){
	 				   window.location.reload();
	 			   }else{
	 				   toast("提交失败，请重新提交问题");
	 			   }
			   }
		});
	}else{
		return;
	} 
	});
	//对于教师的回答进行评价
	$(".leftDiv").click(function(){
		var groupId = '${groupId}';
		var uid = '${uid}';
		 HH.ajax({
			 waiting:false,
			   url: "/yzmm/account/miaoqa/doagreeMiaoQa",
			   data: {groupId:groupId,uid:uid},
			   callback: function(data){
				   if(data.success){
	 				   window.location.reload();
	 			   }else{
	 				   toast("请稍后再试~");
	 			   }
			   }
		});
	})
	$(".rightDiv").click(function(){
		$(".voteScope").hide();
		$(".miaoTextarea").show();
	})
});
</script>
<script type="text/javascript">
	var sm = {};
	var pageIndex = 1;
	var isVip = '${isVip}';
	var id= null;
	if('${miaoQa}'){
		id='${miaoQa.id}';
	}
	var groupId = '${groupId}';
	$(function(){
		sm = $(window).scrollme({
			/* target:$(".myAskList"), */
			data:{pageSize:10,pageIndex:pageIndex,groupId:groupId},
			url:"/yzmm/account/miaoqa/ajaxGetQaChildrenList",
			beforeLoad:function(){
			},
			callback:function(data,params){
				$("#showloaddiv").hide();
				var h = "";
				if (data.success) {
					//是否为空
					if (!data.totalPage) {
						$(".noresult").remove();
						
					} else {
						$(".noresult").hide();
						var len = data.list.length;	
						if (len) {
							//增加页码
							params.pageIndex = ++pageIndex;
						}
						for (var i = 0; i < len; i++) {
							
							var o = data.list[i];
							h+='<li>';
								h+='<div class="miaoAsk miaoAsk2">';
									h+='<p>'+o.questionTxt+'</p>';
								h+='</div>';
								if(o.replyTxt){
									h+='<div id="leaf'+o.id+'" class="miaoAnswer" style="border-top: 7px solid #efeff4;margin-top: 0.2rem;">';
										if(o.replyTxt){
											h+=o.replyTxt;
										}
										if(o.knowledgeList){
											var klen = o.knowledgeList.length;
											if(klen>0){
												h+='<p>相关三千问:</p>';
												for (var j = 0; j < klen; j++) {
													var k = o.knowledgeList[j];
													if(k){
														h+='<p><a onclick="to_authsqw('+k.id+')">'+k.title+'</a></p>';
													}
												}
											}
										}
									h+='</div>';
								}
						h+='</li>';
						}
					}
				}
				$(".myAskList").append(h);
			}
		});
		//加载数据
		sm.reload();
	})
	function reload(){
		pageIndex = 1;
		sm.reload({pageIndex:1});
	}
	function to_sqw(knowledgeId) {
		HH.href("/yzmm/account/knowledge/viewDetail?showTips=true&knowledgeId="+knowledgeId);
	}
	function to_authsqw(knowledgeId){
		HH.href("/yzmm/account/knowledge/setAuthViewDetails?showTips=true&knowledgeId="+knowledgeId+"&groupId="+groupId);
	}
	function justAsk(){
		HH.href('/yzmm/account/miaoqa/gotoAskMiaoQa');
	}
	function fn(){
		var len = $(".textarea textarea").val().length
		$(".textarea span").text(len + "/200")
	}
	
	//用戶收听的小喵推荐三千问
	var sqwIds = null;
	//小喵推荐ajax请求	
	$(function(){
		var id='${id}';
		$(".xiaomiaorecommend").html("");
		HH.ajax({
			url:'/yzmm/account/miaoqa/ajaxXiaoMiaoRecommend',
			data:{
				id:id
			},
			callback:function(data,params){
				if(data.success){
					var len = data.recommend.length;
					var h='';
					//拼接的字符串
					if(len>0){
						h+='<div class=" miaoAnswer miaoAnswer2">';
							h+='<p>小喵推荐</p>';
							for(var i = 0;i<len;i++){
								var knowledge = data.recommend[i];
								h+='<p><a onclick="to_sqw('+knowledge.id+')">'+knowledge.title+'</a></p>';
								if(knowledge.listenOrNo){
									if(sqwIds){
										sqwIds+="|"+knowledge.id;
									}else{
										sqwIds = knowledge.id
									}
								}
							}
						h+='</div>'
						if(data.isScore){
							h+='<div style="font-size: 0.32rem;color: #9E9E9E;margin-top: 10px;padding: 10px;border-top: 0.02rem solid #f2f2f2;">';
								h+='<p>小喵的推荐是否已解决您的问题呢？<span onclick="solve();" style="float: right;color: rgba(255, 153, 0, 1);text-decoration: underline;">解决<span></p>';
							h+='</div>';
						}
						$(".xiaomiaorecommend").html(h);
						
					}	
				}
			}
		});
	});
	function solve(){
		var id='${id}';
		var uid = '${uid}';
		 HH.ajax({
			 waiting:false,
			   url: "/yzmm/account/miaoqa/xiaomiaosolve",
			   data: {id:id,uid:uid,sqwIds:sqwIds},
			   callback: function(data){
				   if(data.success){
	 				   window.location.reload();
	 			   }else{
	 				   toast("请稍后再试~");
	 			   }
			   }
		});
	};
</script>
</body>
</html>