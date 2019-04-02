<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <!--忽略页面中的邮箱格式为邮箱-->
    <meta name="format-detection" content="email=no">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
    <meta name="format-detection" content="telephone=no,address=no,email=no">
    <meta name="keywords" content="喵姐,喵姐早教说,0到6岁早期教育,家庭教育,家长教育,父母课堂,育儿知识,儿童教育,母婴育儿,">
    <meta name="description" content="喵姐早教说是喵姐高寿岩创办的为家庭教育提供专业靠谱的0到6岁早期教育、育儿知识的平台。">
    <title>喵姐早教说</title>
    <%@include file="../../header_v2.3.jsp" %>
    <%@include file="../../header_wxjsapi.jsp"%>
    <link rel="stylesheet" href="<b:staticUrl>/res/css/activity/prekindergarten/share.css</b:staticUrl>">
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
        <!--顶部的logo-->
        <img src="<b:staticUrl>/res/img/activity/prekindergarten/logo.png</b:staticUrl>" alt="" class="logo">
        <div class="shareContent">
            <!--头像部分-->
            <div class="picture">
                <img src="${shareManAlbumUrl }" alt="">
            </div>
            <p class="shareName">${shareManNickName }</p>
            <!--下面的内容-->
            <div class="shareTitle">
                <p class="shareJoin">邀您参加</p>
                <img src="<b:staticUrl>/res/img/activity/prekindergarten/jt.png</b:staticUrl>" alt="" class="shareFam">
                <div class="shareleft"></div>
                <div class="shareRight"></div>
                <div class="shareBot">
                    <p class="shareMM">喵姐早教说出品 <span></span></p>
                </div>
            </div>
            <p class="shareFirst">国内第一套智能化入园适应训练</p>
            <div class="shareImg" class="clearfix">
                <img src="<b:staticUrl>/res/img/activity/prekindergarten/week.png</b:staticUrl>" alt="" class="leftImg">
                <img src="<b:staticUrl>/res/img/activity/prekindergarten/baby.png</b:staticUrl>" alt="" class="rightImg">
            </div>
            <p class="titText">
                72项智能任务单元
            </p>
            <p class="titText">
                完美提升入园必备4项核心能力
            </p>
            <div class="ability clearfix">
                <p class="abilityLeft">社会交往</p>
                <p class="abilityRight">语言表达</p>
                <p class="abilityLeft">生活自理</p>
                <p class="abilityRight">家庭准备</p>
            </div>
            <div class="btn">
                <a href="#">限 时 免 费 测 评</a>
            </div>
            <p class="btnText">获取宝宝专属训练方案</p>
        </div>
    </div>
    <script type="text/javascript">
    var resultMap;
    	$(function(){
             if('${resultMap}'!=''){
	    		resultMap=JSON.parse('${resultMap}');
	    		var index=0;
	    		for ( var r in resultMap) {
	    			$('.topTxt:eq('+index+')').parent().find('p').html(r);
	    			$('.topTxt:eq('+index+')').parent().find('span').html(resultMap[r]);
	    			index++;
	    		}
             }
             $(".btn").click(function(){
           	    HH.ajax({
   					data:{
   						uid:'${uid}',
   						activityId:'${activityId}',
   						activityType:'${activityType}',
   						psscoId:'${psscoId}',
   						pssId:'${pssId}'
   					},
   					url:"/yzmm/account/passivelyShareMan/create",
   					async:false,
   				    callback:function(data){
   				   		if(data.success){
   				   			HH.href("/yzmm/account/activity/prekindergarten/testordetail?id=${activityId}");
   			   			}else{
   				   			HH.href("/yzmm/account/activity/prekindergarten/testordetail?id=${activityId}");
   			   			}
   				    }
   				});
             });
    	})
    </script>
</body>
</html>