<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="j" uri="/jsputil"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<%@include file="../header.jsp" %>
    <title>喵姐早教说</title>
    <style type="text/css">
    	.dislike_icon{
    		vertical-align:bottom;
    		float:right;
    		display:inline-block;
    		width: 0.3rem;
    		height: 0.26rem;
    		background: url(<b:staticUrl>/res/img/icon/dislike_icon.png</b:staticUrl>) 0 0 no-repeat;
    		background-size: 0.3rem 0.26rem;}
    	}
    </style>
</head>
<body >
    <section class="index_tab_wrap">
        <!--早教说 start -->
        <section class="index_tab_con order_live_list" id="tab2">
            <div class="early_edu_wrap">
               <div class="order_live_con">
               		<c:forEach var="o" items="${liveList}">
	               		<div class="early_edu_con2"	>
		                	<h1 class="cf to_content_url"  onclick="toDetail('${o.courseId}')">【直播】${o.name}<span></span></h1>
		                    <dl class="cf">
		                        <dt  onclick="toDetail('${o.courseId}')"><img src="${o.imgUrl}"/></dt>
		                        <dd>    
		                            <h2 onclick="toDetail('${o.courseId}')">${o.description}</h2>
		                            <h3>主讲人：<span  onclick="window.location.href='/yzmm/account/teacher/tcInfo?tcUid=${o.tcUid}'">${o.tcName}</span></h3>
		                            <h4><span  onclick="toDetail('${o.courseId}')"  class="">${o.startTime}</span>
		                              <i  onclick="toDetail('${o.courseId}')"><em></em></i>
		                            <b onclick="followClick(this);" class="${o.followTo==1 ? 'like_icon' : 'dislike_icon' }" data-id="${o.courseId}"></b>
		                            </h4>
		                        </dd>
		                    </dl>
		                </div>
				</c:forEach>
               </div>

            </div>
        </section>
        <!--早教说 end -->
    </section>
	<script type="text/javascript">
	function toDetail(courseId){
		window.location.href= '/yzmm/account/course/liveDetail?courseId='+courseId;
	}
	
	function followClick(obj){
		var o = $(obj);
		var courseId = o.data("id");
		if(o.hasClass("dislike_icon")){
			// 取消关注
			  HH.ajax({
					url:'/yzmm/account/course/followLive', 
					data:{courseId:courseId,follow:0}, 
					callback:function(data){
						//判断发送是否成功
						if(data.success) {
							o.removeClass("dislike_icon").addClass("like_icon");
		                } else {
		                   toast(data.msg)
		                }
					}
				});
		}else if(o.hasClass("like_icon")){
			// 关注
			 HH.ajax({
					url:'/yzmm/account/course/followLive', 
					data:{courseId:courseId,follow:1}, 
					callback:function(data){
						//判断发送是否成功
						if(data.success) {
							o.removeClass("like_icon").addClass("dislike_icon");
							toast("我们会提前1小时提示您哟~")
		                } else {
		                	  toast(data.msg)
		                }
					}
				});
		}
	}
	</script>
</body>
</html>