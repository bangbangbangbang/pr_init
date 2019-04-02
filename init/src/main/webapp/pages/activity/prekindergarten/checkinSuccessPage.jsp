<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--忽略页面中的邮箱格式为邮箱-->
<meta name="format-detection" content="email=no"/>
<%@include file="../../header_v2.4.0.jsp" %>
<%@include file="../../header_wxjsapi.jsp"%>
    <title>喵姐早教说</title>
    <link rel="stylesheet" href="<b:staticUrl>/res/css/prekindergarten/welcome.css</b:staticUrl>">
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
    <div class="wrap">
        <div class="headerImg clearfix">
            <img src="<b:staticUrl>/res/img/prekindergarten/wel/wel_02.png</b:staticUrl>" alt="" class="welTitle">
        </div>
        <p class="subtitle">恭喜，报名已成功</p>
        <!--欢迎页的内容-->
        <div class="welContent  clearfix">

            <div class="welMess">
                <div class="recoDivImg">
                    <img src="${userAlbumUrl}" alt="" class="recoImg">  
                </div>
                <img src="<b:staticUrl>/res/img/prekindergarten/wel/u2981.png</b:staticUrl>" alt="" class="messImg">
                <b class="messBaby"><span>${babynickname}</span>  宝贝：</b>
                <div class="messText">
                    <p class="text1">
                        再过<span>${goschoolday}</span>天，你就要踏上人生的新旅程，你会去到漂亮的幼儿园，会有许多的小伙伴和你一起开心的成长。<br>
                        <span class="txtSpan">
                            人生的第一次经历，从来都不容易，喵姐和爸爸妈妈会在接下来的一段时间内为你“赋能”，让你学会清晰的表达，勇敢的社交，快乐的在集体生活中照顾自己。    
                        </span>
                        加油吧，小宝贝。
                    </p>
                    <!--<p>
                        我们的目标：不哭、不闹、少生病，快速适应幼儿园
                    </p>
                    <p class="textBtn">喵姐早教说 · 小喵</p>-->
                </div>
                <!--中间黄色的分割线-->
                <div class="line">
                    <ul>
                        <li>
                            <p class="lineTop"></p>
                        </li>
                        <li>
                            <p class="lineTop"></p>
                        </li>
                        <li>
                            <p class="lineTop"></p>
                        </li>
                        <li>
                            <p class="lineTop"></p>
                        </li>
                        <li>
                            <p class="lineTop"></p>
                        </li>
                        <li>
                            <p class="lineTop"></p>
                        </li>
                        <li>
                            <p class="lineTop"></p>
                        </li>
                        <li>
                            <p class="lineTop"></p>
                        </li>
                        <li>
                            <p class="lineTop"></p>
                        </li>
                        <li>
                            <p class="lineTop"></p>
                        </li>
                        <li>
                            <p class="lineTop"></p>
                        </li>
                        <li>
                            <p class="lineTop"></p>
                        </li>
                        <li>
                            <p class="lineTop"></p>
                        </li>
                        <li>
                            <p class="lineTop"></p>
                        </li>
                        <li>
                            <p class="lineTop"></p>
                        </li>
                        <li>
                            <p class="lineTop"></p>
                        </li>
                        
                    </ul>
                </div>
                <h3 class="knowTitle">爸爸妈妈要知道的事儿</h3>
                <img src="<b:staticUrl>/res/img/prekindergarten/wel/xunl.jpg</b:staticUrl>" alt="" class="modeImg">
                 <!--中间黄色的分割线-->
                <div class="line">
                   <ul>
                        <li>
                            <p class="lineTop"></p>
                        </li>
                        <li>
                            <p class="lineTop"></p>
                        </li>
                        <li>
                            <p class="lineTop"></p>
                        </li>
                        <li>
                            <p class="lineTop"></p>
                        </li>
                        <li>
                            <p class="lineTop"></p>
                        </li>
                        <li>
                            <p class="lineTop"></p>
                        </li>
                        <li>
                            <p class="lineTop"></p>
                        </li>
                        <li>
                            <p class="lineTop"></p>
                        </li>
                        <li>
                            <p class="lineTop"></p>
                        </li>
                        <li>
                            <p class="lineTop"></p>
                        </li>
                        <li>
                            <p class="lineTop"></p>
                        </li>
                        <li>
                            <p class="lineTop"></p>
                        </li>
                        <li>
                            <p class="lineTop"></p>
                        </li>
                        <li>
                            <p class="lineTop"></p>
                        </li>
                        <li>
                            <p class="lineTop"></p>
                        </li>
                        <li>
                            <p class="lineTop"></p>
                        </li>
                        
                    </ul>
                </div>
                <!--问答-->
                <div class="messReply">
                    <b class="sak">任务卡和自测：</b>
                    <p class="answer">
                        任务卡是清晰的指导方案，爸爸妈妈执行后自测，智能系统会像教练一样做出准确的反馈，合理安排下一天的任务。领取任务卡 — 执行任务 — 自测，重要的是知行合一噢。
                    </p>
                </div>
                <div class="messReply">
                    <b class="sak">为什么任务会重复出现？</b>
                    <p class="answer">
                        	智能小喵会根据您的自测结果判断宝宝是否需要加强练习，巩固提高。重复出现的任务，代表这项能力很重要，要继续去做噢。
                    </p>
                </div>
                <div class="messReply">
                    <b class="sak">忘记领取当天任务，或没有做怎么办？</b>
                    <p class="answer">
                      	  别着急，忘记领取的任务卡，智能小喵会帮你保存好，可以回归训练的时候别忘了第一时间回来，只是长期缺课会导致后面的训练任务量加大，小喵当然不希望这个事情发生哦。
                    </p>
                </div>
                <p class="messBtn">不哭不闹少生病，快速适应幼儿园</p>
                 <c:choose>
		            <c:when test="${status=='UNSTART'}">
		            	  <div style="text-align: center;margin-top: 30px;color: #a0a0a0;"> <p>等待开始...</p></div>
		            </c:when>
		             <c:when test="${status=='PREVIEW'}">
				            <div class="btnJoin" onclick="HH.href('/yzmm/account/activity/kja/index?activityId=${activityId}');">
			                    <a href="javascript:void(0);">预览本周任务</a>
			                </div>
		            </c:when>
		             <c:when test="${status=='START'}">
				            <div class="btnJoin" onclick="HH.href('/yzmm/account/activity/kja/index?activityId=${activityId}');">
			                    <a href="javascript:void(0);">开始本周任务</a>
			                </div>
		            </c:when>
	            </c:choose>
            </div> 
        </div>
        <div class="welBottom">
            <h5 class="prompt">温馨提示</h5>
            <p>亲，开始活动须扫码关注"喵姐早教说会员号”，这样才不会错过任何重要信息哦！
            </p>
            <div class="botCode clearfix">
                <img src="<b:staticUrl>/res/img/prekindergarten/wel/u3177.jpg</b:staticUrl>" alt="" class="code fl">
                <div class="botRight fl">
                    <p class="rightPress">长按识别二维码</p>
                    <p class="rightFollow">点击菜单【入园适应】进入活动</p>
                </div>
            </div>
        </div>
    </div>  
</body>
</html>