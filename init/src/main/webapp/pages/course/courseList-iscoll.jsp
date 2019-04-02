<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@include file="../header.jsp" %>
<link rel="stylesheet" href="<b:staticUrl>/res/css/iscroll.css</b:staticUrl>">
<title>喵姐早教说</title>
</head>
<body>
    <section class="index_tab_wrap">
     <!--早教说 start -->
        <section class="index_tab_con" id="tab2">
            <div class="knowledge_wrap cf">
                <div class="left"><input type="text" id="queryIpt" class="search"/><img class="search_cancel" src='<b:staticUrl>/res/img/icon/search_cancel_icon.png</b:staticUrl>'/></div>
                <div class="left"><button  id="queryBtn" >搜索</button></div>
            </div>
            <div class="early_edu_wrap">
                <div class="early_edu_con">
                    <div class="early_edu_con1">
                        <ul class="cf">
                            <li onclick="window.location.href= '/yzmm/account/course/orderLiveList';return false">
                                <dl>
                                    <dt><img src="<b:staticUrl>/res/img/icon/early_edu_icon1.png</b:staticUrl>"/></dt>
                                    <dd>最新直播课</dd>
                                    <dd>近期${live}节课</dd>
                                </dl>
                            </li>
                            <li>
                                <dl>
                                    <dt><img src="<b:staticUrl>/res/img/icon/early_edu_icon2.png</b:staticUrl>"/></dt>
                                    <dd>我的足迹</dd>
                                    <dd>课程${myCourse}节</dd>
                                </dl>
                            </li>
                        </ul>
                    </div>
                    <div id="content"></div>
                </div>

            </div>
        </section>
        <!--早教说 end -->
      <footer class="menu">
        <ul class="cf">
            <li><a href="#tab1"><h2></h2><p>知识库</p></a></li>
            <li class="on" onclick="test()"><a href="#tab2"><h2></h2><p>早教说</p></a></li>
            <li><a href="/yzmm/account/user/info"><h2></h2><p>个人中心</p></a></li>
        </ul>
    </footer>
     </section>
    <div id="wrapper" style="height: 300px;"></div>
    <script>
    function test(){
    	$("#contentDiv").append("asdf<br><br>");
    	myScroll.refresh();
    }
$(function(){
    $('.search').bind('input propertychange', function() {
        $(this).next().show();


    });
    $('.search_cancel').click(function(){
            $(this).prev().val("");
            $(this).hide();

        })
})
    </script>
<script src='<b:staticUrl>/res/js/iscroll.js</b:staticUrl>'></script>
<script src='<b:staticUrl>/res/js/myIscroll.js</b:staticUrl>'></script>
<script type="text/javascript">

$(function(){
	var scroll = initScroll("#wrapper");
	scroll.slideUp(function(){
		for(var i=0 ;i<5 ;i++){
			scroll.content.append("asdf<br><br>");
			console.log(scroll.content.height());
		}
	});
	scroll.slideDown(function(){
		for(var i=0 ;i<5 ;i++){
			scroll.content.append("asdf<br><br>");
			console.log(scroll.content.height());
		}
	});
	for(var i=0 ;i<20 ;i++){
		scroll.content.append("asdf<br><br>");
		console.log(scroll.content.height());
	}
	//刷新下拉条
	scroll.refresh();
})
</script>
</body>
</html>