<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<!--忽略页面中的邮箱格式为邮箱-->
	<meta name="format-detection" content="email=no"/>
	<%@include file="../../../header_v2.4.0.jsp" %>
	<%@include file="../../../header_wxjsapi.jsp"%>
	<title>喵姐早教说</title>
	<link rel="stylesheet" href="<b:staticUrl>/res/css/prekindergarten/fund.css</b:staticUrl>">
	<script src="<b:staticUrl>/res/js/scrollpaginationme.js</b:staticUrl>"></script> 
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
    	<div class="fundDetail">
    		<h5 class="detailTit">越认真的家长，宝宝的入园基金越高</h5>
    		<p class="detailMon"><span>${fundtotal}</span> 枚基金币</p>
    		<div class="fundGray"></div>
    		<!--基金币获得的明细-->
    		<!-- <div class="fundDetailTitle clearfix">
    			<div class="detailLine clearfix">
    				<p class="titleTask">炫耀第2阶段 - 第3天任务卡</p>
    				<div class="detaildate fl">2017.07.17  16：55</div>
    				<div class="detailNum fr">+ 10 <span>枚</span></div>
    			</div>
    		</div> -->
    		<div id="bb"></div>
    		<a href="/yzmm/account/activity/kja/fund/index?activityId=${activityId}" class="shadoweBtn">返 回</a>
    		<div class="fundBlank"></div>
    	</div>
    </div>
 <script type="text/javascript">
	var pageIndex = 1;
	var sm = {};
	$(function(){
		sm = $(window).scrollme({
			target:$("#bb"),
			data:{pageSize:10,activityId:'${activityId}'},
			url:"/yzmm/account/activity/kja/fund/ajaxDetail",
			callback:function(data,params){
				$("#showloaddiv").hide();
				var h = "";
				if (data.success) {
					//是否为空
					if (!data.totalPage && data.curPage == 1) {
					} else {
						var len = data.list.length;
						if (len) {
							//增加页码
							params.pageIndex = ++pageIndex;
						}
						for (var i = 0; i < len; i++) {
							var o = data.list[i];
							var conn = (o.type=='OUT'?"-":"+");
							var numcolor = (o.type=='OUT'?"detailColor":"");
							h += '<div class="fundDetailTitle clearfix">';
			    				h+='<div class="detailLine clearfix">';
		    					h+='<p class="titleTask">'+o.info+'</p>';
		    					h+='<div class="detaildate fl">'+fmtSecond(o.createTime)+'</div>';
		    					h+='<div class="detailNum fr '+numcolor+'">'+conn+' '+(o.balance/100)+' <span>枚</span></div>';
		    				h+='</div>';
		    			h+='</div>';
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
</script>
</body>
</html>