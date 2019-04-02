<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<head lang="en">
<meta charset="UTF-8">
 <%@include file="../../header_v2.1.jsp" %>
 <%@include file="../../header_wxjsapi.jsp"%>
<title>喵姐早教说</title>
<style type="text/css">
* {
	font-family: 'ArialMT', 'Arial';
}

.askname, .answername {
	font-size: 0.36rem;
	font-weight: bold;
}

.myAskList {
	position: relative;
	padding-top: 0.4rem;
}

.miaoAsk p {
	margin-top: 0.33rem;
}
.myAskList .miaoAsk, .myAskList .miaoAnswer {
 padding-top: 0rem;
 padding-left:0.4rem;
}


.myAskList .miaoAsk:before, .myAskList .miaoAnswer:before {
	content: '';
	width: 0.25rem;
	height: 0.25rem;
	line-height: 0.25rem;
	position: absolute;
	left: 0;
	top: 0.08rem;
	background-color: #fff;
	border-radius: 100%;
	color: #fff;
}


.myAskList .miaoAsk a, .myAskList .miaoAnswer a {
	text-decoration: underline;
	color: white;
}

.myAskList .miaoAnswer:before {
	content: '';
}

.myAskList .miaoAsk:after, .myAskList .miaoAnswer:after {
	border-left: 0px solid #e4e4e4;
}

.myAskList .miaoAnswer {
	margin-top:0.4rem;
	min-height: 42px;
}

.myAskList .miaoAsk, .myAskList .miaoAnswer {
	font-size: 0.32rem;
	color: white !important;
}

.myAskList li {
	padding: 0px;
	padding-left: 0.4rem;
	padding-right: 0.4rem;
}

.miaoAnswer p {
	margin-top: 0.1rem;
	margin-bottom: 0.1rem;
}

.miaoAnswer p.jianyi {
	margin-top: 0.33rem;
	margin-bottom: 0.33rem;
}

.detailDiv{
	width: 100%;
}

.mytitle {
	width: 100%;
	font-size: 0.5rem;
	font-weight: bold;
	color: white;
	padding-top: 0.4rem;
	padding-left: 0.4rem;
	padding-right: 0.4rem;
	padding-bottom: 0.3rem;
}

.mytitle .fenshu {
	float: right;
	font-style: italic;
}

.fengexian {
	width: 99%;
	height: 1px;
	background-repeat: repeat-x;
	background-image:
		url("<b:staticUrl>/res/img/cp/wd/onexuxian.png</b:staticUrl>");
}
</style>
<style type="text/css">
table {
	width: 100%;
	border: 0px;
	border-color: transparent;
	margin-top: 0.3rem;
	margin-bottom: 0;
	border-collapse: collapse;
	border-spacing: 0;
}

table td {
	font-size: 0.2rem;
	text-align: center;
	padding: 0 0.05rem;
}

table thead td div {
	line-height: 0.6rem;
	color: #868686;
	font-weight:bold;
	background-color: rgba(242, 242, 242, 1);
}

table thead td .active {
	border: 1px solid #868686;
	border-radius: 0.1rem;
}

table tbody td .active {
	width: 0;
	height: 0;
	border-left: 0.2rem solid transparent;
	border-right: 0.2rem solid transparent;
	border-bottom: 0.2rem solid #868686;
	margin: 0 auto;
}

.containerOther {
	border-radius: 0.1rem;
}

section {
	padding: 0 0.2rem;
}


.wenxintishi{
	width:100%;
	position: relative;
	padding:0.2rem;
	padding-left:1rem;
	margin-top: 0.4rem;
	margin-bottom: 0.8rem;
	font-size: 0.2rem;
	border-radius: 0.1rem;
	border: 1px solid #868686;
}
.wenxintishi .ljjr{
	  position: absolute;
	  right: 0.5rem;
	  bottom: 1.5rem;
	  font-weight: bold;
	  font-size: 0.33rem;
}

.wenxintishi p{
	line-height: 0.6rem;
	color: #515151;
}
.wenxintishi p.huiyuanshu{
	color: #949494;
}
.wenxintishi .laba{
	position:absolute;
	left:0.2rem;
	top:0.32rem;
	width: 0.54rem;
	height: 0.38rem;
	background-repeat:no-repeat;
	background-size:contain;
	background-image: url("<b:staticUrl>/res/img/cp/wd/laba.png</b:staticUrl>");
}

.foot{
	    width: 100%;
	    text-align: center;
	}
	.foot .comment{
	    font-size: 0.4rem;
	    line-height: 38px;
	    margin-top: 20px;
	    margin-left: auto;
	    margin-right: auto;
	    border: 1px solid #ff9900;
	    border-radius: 20px;
	    width: 177px;
	    height: 40px;
	    text-align: center;
	    color: #ff9900;
	}

</style>
<c:forEach items="${list}" var="a" varStatus="v" >
<style type="text/css">

thead .li${a.id}.active {
	border-color: ${a.tone};
	color:${a.tone};
}

tbody .li${a.id}.active {
	border-bottom-color: ${a.tone};
}

.colorbgli${a.id} {
	background-color: ${a.tone};
}
.wenxintishi.li${a.id}{
	border-color: ${a.tone};
}
.wenxintishi.li${a.id} .laba{
	background-color: ${a.tone};
}
.wenxintishi.li${a.id} .ljjr{
	color: ${a.tone};
}

</style>
</c:forEach>

</head>
<body>
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
<section>
		<table class="tableli">
			<thead>
				<tr>
				<c:forEach items="${list}" var="a" varStatus="v" >
				<td data-id="${a.id}"><div data-id="${a.id}" class='li${a.id} ${v.first?"active":"" }'>${a.dimensionName}</div></td>
				</c:forEach>
				</tr>
			</thead>
			<tbody>
				<tr>
				<c:forEach items="${list}" var="a" varStatus="v" >
				<td><div class='li${a.id} ${v.first?"active":"" }'></div></td>
				</c:forEach>
				</tr>
			</tbody>
		</table>
<c:forEach items="${list}" var="a" varStatus="v" >
<div class="containerOther wdid${a.id} colorbgli${a.id}" style="display:${v.first?'':'none'}" >
	<div class="mytitle">
		<span class="name">${a.dimensionName}</span>
		<span class="fenshu">${a.score}分</span>
	</div>
	<div class='fengexian'></div>
	<ul class="myAskList">
		<li>
			<div class="miaoAsk">
				<label class="askinfo"><span class="askname">分析</span></label>
				<p>${v.first?resp.analysisTxt1:""}</p>
			</div>
			<div class="miaoAnswer">
				<label class="answerinfo"><span class="answername">提升建议</span></label>
				<p class='jianyi'>${v.first?resp.adviceTxt1:""}</p>
				<div class="detailDiv">
					<c:if test="${v.first}">
						<c:forEach items="${detailSqw}" var="d">
						<p class="detail">◇ <a onclick="to_sqw(${d.code})">${d.msg}</a></p>
						</c:forEach>
						<c:forEach items="${detailCourse}" var="d">
						<p class="detail">◇ <a onclick="to_course('${d.code}')">《${d.msg}》</a></p>
						</c:forEach>
					</c:if>
				</div>
			</div>
		</li>
	</ul>
</div>
</c:forEach>
<div class="wenxintishi li${wdId}" style="display: ${self?'':'none'}" >
	<div class="laba"></div>
	<div>
		<p style="font-size:0.35rem;">加入喵姐早教说</p>
		<p style="font-size:0.32rem;">价值千元单项内容，一键解锁。</p>
		<p style="font-size:0.30rem;" class="huiyuanshu">和${count}位辣妈一起，培养出乐观有竞争力的精英宝宝</p>
	</div>
	<div class="ljjr">立即加入</div>
</div>
<div class="foot" style="display: ${self?'none':''}">
	<div class="comment" onclick="HH.href('/yzmm/account/evaluation/toWelcome?id=${cpId}');">我要测试</div>
</div>
<br>
</section>
<script type="text/javascript">
 	$(".wenxintishi").click(function(){
 		HH.href("/yzmm/wxmppay/vipstatus");
 	});
 	function to_course(id){
 		HH.href("/yzmm/account/course/toVodDetail?courseId="+id);
 	}
 	function to_sqw(id){
 		HH.href("/yzmm/account/knowledge/toDetail?knowledgeId="+id);
 	}
 	var touchmove = false;
 	var touchX = 0;
 	$(function(){
 		function touchStart(e) {
 			//e.preventDefault();
 			touchmove = true;
 			var touch = e.originalEvent.targetTouches[0];
 			touchX = touch.pageX;
 		}
 		function touchMove(e) {
 			//e.preventDefault();
 			if(!touchmove){
 				return;
 			}
 			var touch = e.originalEvent.targetTouches[0];
 			 if(touchX - touch.pageX > 50){
 				var td = $("thead .active").parent("td").next();
 				td.click();
 				touchmove = false;
 			 }else if(touch.pageX-touchX > 50){
 				var td = $("thead .active").parent("td").prev();
 				td.click();
 				touchmove = false;
 			 }
 		}
 		function touchEnd(e) {
 			//e.preventDefault();
 			touchmove = false;
 		}
 		$(".myAskList").on("touchstart", touchStart);
 		$(".myAskList").on("touchmove", touchMove);
 		$(".myAskList").on("touchend", touchEnd);
 	})
 	
 	$(function(){
 		$("thead td").click(function(){
 			var o = $(this);
 			var id = o.data("id");
 			if($("thead .li"+id).hasClass("active")){
 				return;
 			}
 			if(!isloaded){
				 toastWaiting();
				window.setTimeout(function(){
					toastWaitingColse();
				},5000)  
				return;
			}
 			var oid = $("thead .active").data("id");
 			$("thead .active,body .active").removeClass("active");
 			$("thead .li"+id+","+"body .li"+id).addClass("active");
 			$(".wdid"+oid).hide();
 			$(".wdid"+id).show();
 			$(".wenxintishi").attr("class","wenxintishi li"+id);
 		});
 	})
 	var resultId="${resultId}";
 	var uid = "${uid}";
 	var isloaded = false;
	
 	$(function(){
 		 HH.ajax({
				data:{resultId:resultId,uid:uid},
				waiting:false,
				url:"/yzmm/account/evaluation/result/detail/more",
			    callback:function(data){
	   				if(data.success){
						var ext = data.ext;
						for(var i =0;i<ext.length;i++){
							var obj = ext[i];
							var resp = obj.resp;
							var hm = $(".wdid"+resp.relateId);
							hm.find(".miaoAsk p").html(resp.analysisTxt1);
							hm.find(".jianyi").html(resp.adviceTxt1);
							var detailDiv = hm.find(".detailDiv");
							try{
								var detailSqw = obj.detailSqw;
								for(var j =0;j<detailSqw.length;j++){
									var ds = detailSqw[j];
									detailDiv.append('<p>◇ <a onclick="to_sqw('+ds.code+')">'+ds.msg+'</a></p>');
								}
								var detailCourse = obj.detailCourse;
								for(var j = 0;j<detailCourse.length;j++){
									var dc = detailCourse[j];
									detailDiv.append('<p>◇ <a onclick="to_course(\''+dc.code+'\')">《'+dc.msg+'》</a></p>');
								}
							}catch (e) {
							}
						}
					}
	   				toastWaitingColse();
	   				isloaded = true;
		   		}
			});
 	})
</script>
</body>
</html>
