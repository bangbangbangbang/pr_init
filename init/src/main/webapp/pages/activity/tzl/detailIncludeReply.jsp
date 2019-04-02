<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta name="format-detection" content="telephone=no" />
	<meta name="format-detection" content="email=no"/>
	<title>${activityTitle}</title>
	
	 <%@include file="../../header_v13.jsp" %>
	 <script src="<b:staticUrl>/res/js/scrollpaginationme.js</b:staticUrl>"></script> 
	 <link rel="stylesheet" href="<b:staticUrl>/res/css/activity_tzl/activity.css</b:staticUrl>"> 
	 <link rel="stylesheet" href="<b:staticUrl>/res/css/activity_tzl/common.css</b:staticUrl>"> 
	 <link rel="stylesheet" href="<b:staticUrl>/res/css/activity_tzl/group.css</b:staticUrl>"> 
	 <script src="<b:staticUrl>/res/js/custom/lightbox/lightbox.js</b:staticUrl>"></script> 
	
	<style type="text/css">
		.endDate{
			text-align:right;
		}
		.rule{
			border-bottom: 0 solid #efeff4;
		}
		.contword img{
			 width: 9rem;
			 height: 4rem;
		}
		.note{
			margin-top: 0.5rem;
		}
		#nav { 
		width:60px; 
		height:60px;  
		position:fixed;
		left:80%;
		background:url(<b:staticUrl>/res/img/test/answer.png</b:staticUrl>);
		top:80% 
		}
		.topic-list .rightcont .img{
			border-bottom: 0px solid #ccc;
		}
		.voterights .voteright h3 span {
		    float: right;
		    color: #666;
		}
		.els3 {
		    width: 100%;
		    max-height: 54px;
		    height:54px;
		    line-height: 18px;
		    overflow: hidden;
		    -webkit-line-clamp: 3;
		    display: -webkit-box;
		    -webkit-box-orient: vertical;
		}
		.font12 {
		    line-height: 18px;
		}
		.voteword{
			word-break:break-all;
		}
		.showall {
			display: block;
		    width: 1.94666667rem;
		    color: #999;
		}
		/** 图片圆角 **/
		.radius{
		    border-radius: 12px;    
		}
		.brace{
			height: 0.2rem;
		}
	</style>
</head>
<body id="bgwhite">
	<!-- 回答浮框 -->
	<c:if test="${userReplyStatus==0 }">
	<div id="nav"></div>
	</c:if>
	<div class="bigTitle2">
	<div class="font17">
		${activityTitle }</div>
	</div>
	<div class="font12 contword">
		<img alt="" src="${activityTitleImg }">
		<div class="font15 tit note">活动说明：</div>
		<p>${titleDescription }</p>
	</div>
	<div class="font12 contword">
		<div class="font15 tit">活动内容：</div>
		<div class="case"><i class="i-clock"></i>
		${activityContent }
		</div>
		<img alt="" src="${activityImg }">
	</div>
	<div class="font12 contword rule">
		<div class="font15 tit">游戏规则：</div>
		${activityRule}
	</div>
	<div class="font12 contword endDate">
		<span>
			<c:if test="${empty activityEndTime }"> ${activityStartTime }</c:if>
			<c:if test="${empty not activityEndTime }">结束时间： ${activityEndTime }</c:if>
		</span>
	</div>
	<c:choose>
			<c:when test="${isReply}">
				<div id="bb"></div>
				<div id="showloaddiv" style="display: none;">正在加载数据</div>
			</c:when>
			<c:otherwise>
			<div class="font12 contword endDate">
				<p style="text-align: center;"><c:out value="${replyNum}"></c:out> 人已经参与了活动的问题回答</p>
				<br>
				<p style="text-align: center;">参与后可见其他用户的发言</p>
			</div>
			</c:otherwise>
	</c:choose>
	<div class="topic-list tzlList" id="tzlList">
		<ul>
			<!-- <li>
				<div class="photo"><img src="http://file.dev.sevenkids.cn/uploadm/201608/22/1471851595597fS84.JPG" ></div>
				<div class="rightcont">
					<h2 class="font15"><i class="font12">24小时前</i>疯狂的苹果</h2>
					<div class="font12 sex">
						<span class="i-boy"></span>小王子&nbsp;&nbsp;3岁
						<span class="i-pos"></span>北京市
					</div>
					<div class="font12 word">我每天陪伴孩子有固定的3个时间段早上7:00，中我每天陪伴孩子有固定的3个时间段早上7:00，中...</div>
					<div class="img">
						<span class="imgitem"><img src="http://file.dev.sevenkids.cn/uploadm/201608/22/1471851595597fS84.JPG" ></span>
						<span class="imgitem"><img src="http://file.dev.sevenkids.cn/uploadm/201608/22/1471851595597fS84.JPG" ></span>
						<span class="imgitem"><img src="http://file.dev.sevenkids.cn/uploadm/201608/22/1471851595597fS84.JPG" ></span>
					</div>
				</div>
			</li> -->
		</ul>
	</div>
<!--尾部-->
	<jsp:include page="/pages/header_footer.jsp">
		<jsp:param value="3" name="menu"/>
	</jsp:include>
<!--回复-->
<script type="text/javascript">
		$(function(){
			$("#nav").click(function(){
				var activityId = '${id}';
				//发表喵说
				window.location = "/yzmm/account/activity/tzl/reply/toPublicationMiao?activityId="+activityId;
			})
		});
</script>
<c:if test="${isReply}">
<script type="text/javascript">
	var pageIndex = 1;
	var sm = {};
	var id = '${id}';
	//楼层数
	var floorNum = 0;
	$(function(){
		sm = $(window).scrollme({
			target:$("#bb"),
			data:{pageSize:10,activityId:id},
			url:"/yzmm/account/activity/tzl/reply/ajaxtolist",
			beforeLoad:function(){
				//查询之前调用
				if(1!=pageIndex){
					//$("#showloaddiv").show();
				}
			},
			callback:function(data,params){
				//$("#showloaddiv").hide();
				var h = "";
				if (data.success) {
					//现有li长度
					var liLength = $("#tzlList>ul>li").length;
					var len = data.list.length;
					//是否为空
					if (!data.totalPage) {
						$(".noresult").remove();
						
					} else {
						$(".noresult").hide();
						
						if (len) {
							//增加页码
							params.pageIndex = ++pageIndex;
						}
						for (var i = 0; i < len; i++) {
							var o = data.list[i];
							floorNum = floorNum +1;
							
							h+='<li data-id='+o.id+'>';
							h+='<div class="photo"><img src="'+o.rAlbumUrl+'" ></div>';
							h+='<div class="rightcont">';
							h+='<h2 class="font15">';
							h+='<i class="font12">';
							h+=o.replyTimeString;
							h+='&nbsp&nbsp&nbsp&nbsp'+floorNum+'楼';
							h+='</i>'+o.rNickName+'</h2>';
							
							if(o.education != "HELPER"){
								h+='<div class="font12 sex">';
								if(o.education == "GRAVIDA"){
									h+='<span class="i-yun">';
									h+='</span>已怀孕&nbsp;&nbsp;';
									h+=o.rBabyAgeString;
								}else if(o.education == "MOM"){
									if(o.rBabySex == 'MALE'){
										h+='<span class="i-boy">';
										h+='</span>小王子&nbsp;&nbsp;';
									}else {
										h+='<span class="i-girl">';
										h+='</span>小公主&nbsp;&nbsp;';
									}
									h+=o.rBabyAgeString;
								}
								h+='<span class="i-pos">';
								
								if( o.rCity == null){
									h+='</span>北京';
								}else{
									h+='</span>'+o.rCity+'';
								}
								h+='</div>';
							}else{
								h+='<div class="font12 sex">';
								h+='<span class="i-other">';
								h+='</span>喵星人&nbsp;&nbsp;';
								h+='</div>';
							}
								
							
							if((o.replyType)  == 'TEXTIMG'){
								h+='<div class="contentText">';
								h+='<p class="font12 voteword">'+o.replyContent+'';
								h+='</div>';
								//h+='<a href="javascript:void(0)" class="font12 showall">展开</a>';
							}else if(o.replyType == 'AUDIOIMG'){
								
							}
							h+='<div class="img">';
							if(o.imgFirst != null){
								h+='<span class="imgitem"><img class="radius" src="'+o.imgFirst+'" ></span>';
							}
							if(o.imgSecond != null){
								h+='<span class="imgitem"><img class="radius" src="'+o.imgSecond+'" ></span>';
							}
							if(o.imgThird != null){
								h+='<span class="imgitem"><img class="radius" src="'+o.imgThird+'" ></span>';
							}
							h+='</div>';
							h+='</li>';
						}
					}
				} 
				$(".topic-list > ul").append(h);
				//给图片绑定展示事件
				initMyImgShow();
				//隐藏显示多行文本
				
				//绑定评论事件，先解除绑定再绑定
				$('.votebtn').unbind("click").bind('click', function(event) {
					votebtnClick();
				  });
				//遍历新添加的dom,如果<p>的内容高于隐藏样式的指定的最大高度，则添加显示按钮，否则删除显示按钮
				var newLiLength = liLength + len;
				for (var i=0;i<len;i++)
				{
					var contentText = $($($("#tzlList>ul>li")[liLength+i]).children(".rightcont")).children(".contentText");
					//位置的开始值为 liLength 新增前的li长度
					if($(contentText).innerHeight()>54){
						//添加隐藏样式
						$(contentText).children("p").addClass("els3");
						$(contentText).after('<a href="javascript:void(0)" class="font12 showall">展开</a>');
					}
				}
				$('.showall').unbind("click").bind('click', function(event) {
					showAndHide(this);
				  });	
				
			}
		});
		//加载数据
		sm.reload();
	})
	function reload(){
		pageIndex = 1;
		sm.reload({pageIndex:1});
	}
</script>
</c:if>
<script type="text/javascript">
function showAndHide(thet){
	if($(thet).text() == "展开"){
		//如果是隐藏，修改为展开啊状态，修改文字为隐藏
		$(thet).siblings("div").children("p").removeClass("els3");
		$(thet).text("隐藏")
	}else if($(thet).text() == "隐藏"){
		$(thet).siblings("div").children("p").addClass("els3");
		$(thet).text("展开")
	}
}
</script>
</body>
</html>