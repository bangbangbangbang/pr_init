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
    
		.fastAsk {
		    font-size: 15px;
		    line-height: 38px;
		    margin: 0.7rem auto 0 auto;
		    border: 1px solid #ff9900;
		    border-radius: 20px;
		    width: 177px;
		    height: 40px;
		    text-align: center;
		    color: #ff9900;
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
			height: 4rem;
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
			margin-top: 10px;
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
		    border-bottom: 5px solid #f2f2f2;
		    margin-top: 12px;
		}
		.miaoAnswer p{
		    margin-top: 12px;
   			color: #9E9E9E;
		}
</style>
</head>
<body>
<div>
	<%-- <img class="askimg" alt="" src="<b:staticUrl>/res/img/miaoqaask.png</b:staticUrl>"/> --%>
	<div class="askmain">
		<div class="questionAsk"><img class="askimg" alt="" src="<b:staticUrl>/res/img/miaoqaask.png</b:staticUrl>"/></div>
		<div class="fastAsk" onclick="justAsk();">快速提问</div>
	</div>
</div>
<div class="containerOther">
	<div class="myAskTit"></div>
	<ul class="myAskList">
		<li>
			<c:if test="${ not empty miaoQa}">
				<div class="miaoAsk">
					<label class="askinfo"><span class="askname"><c:out value="${miaoQa.nickname}"></c:out></span>&nbsp;&nbsp;&nbsp;${miaoQa.pbsex}&nbsp;${miaoQa.pbage}</label>
					<p>${miaoQa.questionTxt}</p>
				</div>
			<div class="miaoAnswer">
				<c:if test="${not empty miaoQa.replyTxt}">
					${miaoQa.replyTxt}
				</c:if>
				<c:if test="${not empty miaoQa.knowledgeList}">
					<p>相关三千问:</p>
					<c:forEach items="${miaoQa.knowledgeList}" var="knowledge">
						<p><a onclick="to_sqw(${knowledge.id})">${knowledge.title}</a></p>
					</c:forEach>
				</c:if>
			</div>
			</c:if>
		</li>
		<div id="bb">
		</div>
		<!-- <li>
			<div class="miaoAsk">
				<p>喵姐，你好，我女儿三周半最近一直很喜欢挖鼻子怎么说都说不听，在学校老师也反映最近吃饭很慢，很喜欢自言自语，这个问题我在家也发现了</p>
				<div class="timeout">12.25  13:00</div>
			</div>
			<div class="miaoAnswer">
				<p>给您推荐相关三千问，请查看。</p>
				<p><a href="#">【宝宝晚上不睡觉怎么办？】</a></p>
				<p><a href="#">【宝宝晚上不睡觉怎么办？】</a></p>
				<div class="timeout">12.25  13:00</div>
			</div>
		</li>
		<li>
			<div class="miaoAsk">
				<p>喵姐，你好，我女儿三周半最近一直很喜欢挖鼻子怎么说都说不听，在学校老师也反映最近吃饭很慢，很喜欢自言自语，这个问题我在家也发现了</p>
				<div class="timeout">12.25  13:00</div>
				<p>超时未收到解答，点击<a href="#" class="resubmit">【重新提交】</a></p>
			</div>
		</li> -->
		
	</ul>
</div>
<!--尾部-->
	<jsp:include page="/pages/header_footer.jsp">
		<jsp:param value="1" name="menu"/>
	</jsp:include>
<script type="text/javascript">
	var sm = {};
	var pageIndex = 1;
	var isVip = '${isVip}';
	var id= null;
	if('${miaoQa}'){
		id='${miaoQa.id}';
	}
	$(function(){
		sm = $(window).scrollme({
			target:$("#bb"),
			data:{pageSize:10,pageIndex:pageIndex,id:id},
			url:"/yzmm/account/miaoqa/ajaxQaSpecialList",
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
								h+='<div class="miaoAsk">';
									h+='<label class="askinfo"><span class="askname">'+o.nickname+'</span>&nbsp;'+o.pbsex+'&nbsp;'+o.pbage+'</label>';
									//h+='<h3 class="askname">'+o.nickname+'</h3>';
									h+='<p>'+o.questionTxt+'</p>';
								h+='</div>';
								if(i<2){
									h+='<a href="javascript:;" id="more'+o.id+'" onclick="more(this)" data-id="'+o.id+'" class="viewmore view forfree">展开<span></span></a>';
								}else{
									h+='<a href="javascript:;" id="more'+o.id+'" onclick="more(this)" data-id="'+o.id+'" class="viewmore view">展开<span></span></a>';
								}
								if(isVip=='true'||i<2){
									h+='<div id="leaf'+o.id+'" class="miaoAnswer" style="display:none;">';
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
													h+='<p><a onclick="to_sqw('+k.id+')">'+k.title+'</a></p>';
												}
											}
										}
									}
								h+='</div>';
								h+='<a href="javascript:;" id="little'+o.id+'" onclick="retract(this)" data-id="'+o.id+'" style="display:none;" data-id="9d9f3ba5d50f4306a916503479c5a98a" class="viewlittle view">收起<span></span></a>';
								}
						h+='</li>';
						}
					}
				}
				$("#bb").append(h);
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
	//展开
	function more(obj){
		if(isVip=="false"&&!$(obj).hasClass("forfree")){
			toast("VIP特权内容，暂时无法查看");
			return;
		}
		var id=$(obj).data("id");
		$(obj).hide();
		$("#leaf"+id).show();
		$("#little"+id).show();
	}
	//收起
	function retract(obj){
		var id=$(obj).data("id");
		$(obj).hide();
		$("#leaf"+id).hide();
		$("#more"+id).show();
	}
	function justAsk(){
		HH.href('/yzmm/account/miaoqa/gotoAskMiaoQa');
	}
</script>
</body>
</html>