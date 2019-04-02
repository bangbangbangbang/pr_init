<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/commons/header-static.jsp" %>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no">
<meta name="keywords" content="喵姐,喵姐早教说,0到6岁早期教育,家庭教育,家长教育,父母课堂,育儿知识,儿童教育,母婴育儿,${metaKeywords}" />
<meta name="description" content="喵姐早教说是喵姐高寿岩创办的为家庭教育提供专业靠谱的0到6岁早期教育、育儿知识的平台。${metaDescription}" />
<link rel="shortcut icon" type="image/x-icon" href="<b:staticUrl>/res/img/favicon.ico</b:staticUrl>" media="screen">
<link rel="apple-touch-icon" href="<b:staticUrl>/res/img/favicon.ico</b:staticUrl>">
 <%@include file="../../header_wxjsapi.jsp"%>
 <title>喵姐早教说</title>
<script src="<b:staticUrl>/res/js/jquery-2.1.1.min.js</b:staticUrl>"></script> 
<script src="<b:staticUrl>/res/js/hh.js</b:staticUrl>"></script> 
<script src="<b:staticUrl>/res/js/toast-v1.js</b:staticUrl>"></script>
<script src="<b:staticUrl>/res/js/common.js</b:staticUrl>"></script> 
<link rel="stylesheet" href="<b:staticUrl>/res/css/base.css</b:staticUrl>">
<link rel="stylesheet" href="<b:staticUrl>/res/css/prekindergarten/layer.css</b:staticUrl>">
<link rel="stylesheet" href="<b:staticUrl>/res/css/prekindergarten/recommend.css</b:staticUrl>">
<link rel="stylesheet" href="<b:staticUrl>/res/css/prekindergarten/mobiscroll.custom-2.5.2.min.css</b:staticUrl>">
<link href="<b:staticUrl>/res/mobiscroll-plugin/css/mobiscroll.core-2.5.2.css</b:staticUrl>" rel="stylesheet" type="text/css" />
<link href="<b:staticUrl>/res/mobiscroll-plugin/css/mobiscroll.animation-2.5.2.css</b:staticUrl>" rel="stylesheet" type="text/css" />
<link href="<b:staticUrl>/res/mobiscroll-plugin/css/mobiscroll.android-ics-2.5.2.css</b:staticUrl>" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="<b:staticUrl>/res/css/anniversary/swiper-3.4.2.min.css</b:staticUrl>">

<script src="<b:staticUrl>/res/js/myTime.js</b:staticUrl>"></script> 
<script src="<b:staticUrl>/res/js/prekindergarten/mobiscroll.custom-2.5.2.min.js</b:staticUrl>"></script>
<script src="<b:staticUrl>/res/mobiscroll-plugin/js/mobiscroll.core-2.5.2.js</b:staticUrl>" type="text/javascript"></script>
<script src="<b:staticUrl>/res/mobiscroll-plugin/js/mobiscroll.core-2.5.2-zh.js</b:staticUrl>" type="text/javascript"></script>
<script src="<b:staticUrl>/res/mobiscroll-plugin/js/mobiscroll.datetime-2.5.1.js</b:staticUrl>" type="text/javascript"></script>
<script src="<b:staticUrl>/res/mobiscroll-plugin/js/mobiscroll.datetime-2.5.1-zh.js</b:staticUrl>" type="text/javascript"></script>
<script src="<b:staticUrl>/res/mobiscroll-plugin/js/mobiscroll.android-ics-2.5.2.js</b:staticUrl>" type="text/javascript"></script>
<script src="<b:staticUrl>/res/js/anniversary/swiper-3.4.2.min.js</b:staticUrl>"></script>
<script src="<b:staticUrl>/res/js/prekindergarten/selectDate1.js</b:staticUrl>" type="text/javascript"></script>
    <style id="imgh">  
        .rotateBox{
            position: absolute;
            animation: turn 0.5s none;
            }
        .donut-front {
            z-index: 5;
            backface-visibility: hidden;
        }
        .hidden{
            display:none;}
        .show{
            display:block;}
        @keyframes turn {
            to {
                transform: rotateY(360deg);
            }
        } 
        .swiper-slide {
            overflow: auto;
        }
    </style>
     <style>
        .sense-ui .dw {
            background: #fff;
            color: #000;
            border-radius: 0.3rem;
        }
        .dw-arr {
            border:none;
        }
        .dwv {
            padding: 10px 0;
            border-bottom: none;
        }
        .sense-ui .dwwc {
            background: #fff;
            border: none;
            padding: 0;
        }
        .dwrc {
            border: none;
            padding: 0;
        }
        .sense-ui .dwv {
            font-size: 0.5rem;
            padding: 0.3rem 0;
            text-align: center;
            color: #fff;
            border-bottom: none;
            background-color: rgba(255, 153, 51, 1);
        }
        .dw-i {
            color: #A1A1A1;
            font-size: 0.5rem;
        }
        table{ margin:0px;border-style:none;}
        td{ margin:0px;border-style:none;}
        .dw-li {
            text-shadow: none;
        }

        .dwl {
            font-size: 0.4rem;
        }
        .dwwol {
            width: 60px;
            height: 40px;
            position: absolute;
            z-index: 3;
            border-top: none;
            border-bottom: none;
        }
        .dwwo {
            position: absolute;
            z-index: 3;
            top: 0px;
            left: 0px;
            width: 100%;
            height: 100%;
            background: -webkit-gradient(linear, 0% 100%, 0% 0%, from(rgb(255, 255, 255)), color-stop(0.48, rgba(255, 255, 255, 1)), color-stop(0.52, rgba(255, 255, 255, 1)), to(rgb(255, 255, 255)));
        }
        .dw-ul {
            position: relative;
            z-index: 30;
        }
        .sense-ui .dwbc {
            padding: 5px 1px;
            background: #fff;
            background: linear-gradient(#fff 50%,#eee 50%);
            background: -webkit-gradient(linear,left bottom,left top,color-stop(0.5,#fff),color-stop(0.5,#fff));
            background: -moz-linear-gradient(#fff 50%,#fff 50%);
            background: -o-linear-gradient(#fff 50%,#fff 50%);
            border-top: 1px solid #f2f2f2;
        }
        .sense-ui .dw .dwb {
            margin: 0 5px;
            border: none;
            background: #fff;
            box-shadow: none;
            background: -moz-linear-gradient(#fff,#fff);
            background: -o-linear-gradient(#fff,#fff);
        }
        .dwbg .dwb {
            cursor: pointer;
            overflow: hidden;
            display: block;
            height: 40px;
            line-height: 40px;
            padding: 0 15px;
            margin: 0 2px;
            font-size: 14px;
            font-weight: bold;
            text-decoration: none;
            text-shadow: none;
            border-radius: 0;
            color: #A1A1A1;
            white-space: nowrap;
            text-overflow: ellipsis;
            -webkit-border-radius: 0;
            background: #fff;
            background: linear-gradient(#fff 50%,#fff 50%);
            background: -webkit-gradient(linear,left bottom,left top,color-stop(0.5, #fff),color-stop(0.5, #fff));
            background: -moz-linear-gradient(#fff 50%,#fff 50%);
            background: -o-linear-gradient(#fff 50%,#fff 50%);
        }
        .dwbg .dwwbp {
            background: linear-gradient(#fff,#fff);
            background: -webkit-gradient(linear,left bottom,left top,from(#fff),to(#fff));
            background: -moz-linear-gradient(#fff,#fff);
            background: -o-linear-gradient(#fff,#fff);
        }
        .dwbg .dwwbm {
            background: linear-gradient(#fff,#fff);
            background: -webkit-gradient(linear,left bottom,left top,from(#fff),to(#fff));
            background: -moz-linear-gradient(#fff,#fff);
            background: -o-linear-gradient(#fff,#fff);
        }
        .dwbg .dwb-a {
            background: #fff;
            background: linear-gradient(#fff 50%,#fff 50%);
            background: -webkit-gradient(linear,left bottom,left top,color-stop(0.5, #fff),color-stop(0.5, #fff));
            background: -moz-linear-gradient(#fff 50%,#fff 50%);
            background: -o-linear-gradient(#fff 50%,#fff 50%);
        }
        .dwbg .dwwl .dwb-a {
            background: #fff;
            background: linear-gradient(#fff,#fff);
            background: -webkit-gradient(linear,left bottom,left top,from(#fff),to(#fff));
            background: -moz-linear-gradient(#fff,#fff);
            background: -o-linear-gradient(#fff,#fff);
        }
        .dwbc .dwb-s .dwb{
            color: rgba(255, 153, 51, 1);
            border-right: 1px  solid #f2f2f2;
        }

        .dwsc .dwwl {
            background: #fff;
            background: -moz-linear-gradient(#fff 0,#fff 35%,#fff 50%,#fff 65%,#fff 100%);
            background: -o-linear-gradient(#fff 0,#fff 35%,#fff 50%,#fff 65%,#fff 100%);
        }
        .dwsc .dww {
            color: #fff;
            background: #fff;
            background: linear-gradient(#fff 0%,#fff 45%, #fff 55%, #fff 100%);
            background: -webkit-gradient(linear,left bottom,left top,from(#fff),color-stop(0.45, #fff),color-stop(0.55, #fff),to(#fff));
            background: -moz-linear-gradient(#fff 0%,#fff 45%, #fff 55%, #fff 100%);
            background: -o-linear-gradient(#fff 0%,#fff 45%, #fff 55%, #fff 100%);
        }
        .dwwbp {
            -webkit-border-radius: 0 0 0 0;
            border-radius: 0 0 0 0;
        }
        .dwwbm {
            -webkit-border-radius: 0 0 0 0;
            border-radius: 0 0 0 0;
        }
        .dwsc {
            width: 80%;
        }
        table {
            margin: 0 auto;
        }
        .dw-sel .dw-i {
            color: rgba(255, 153, 51, 1) !important;
        }

    </style>
   <style type="text/css">
		.share1 {
		    display: none;
		    width: 100%;
		    max-width: 540px;
		    margin: 0 auto;
		    height: 100%;
		    position: fixed;
		    top: 0;
		    z-index: 100;
		    background-color: rgba(0, 0, 0, 0.8);
		}
		.share1 .shareBox {
		    width: 100%;
		    padding-top: 1.12rem;
		    position: relative;
		}
		.share1 .sharearrow {
		    display: block;
		    width: 75px;
		    height: 84px;
		    position: absolute;
		    right: 0.48rem;
		    top: 0.21333333rem;
		    background-image: url(<b:staticUrl>/res/img/share/share.png</b:staticUrl>);
		    background-position: right top;
		    background-repeat: no-repeat;
		    background-size: 78px 72px;
		}
		.share1 p {
		    margin-bottom: 0.26666667rem;
		    text-align: center;
		    color: #f8e71c;
		}
		.showname{
			font-size: 0.5rem;
			padding: 0.1rem 0.1rem 0rem;
			color: #000;
			line-height: 0.9rem;
			font-weight: bold;
		}
		.swiper-slide-next {
			color: #ff9900;
		}
    </style>
<!-- <script>
	var wxfenxiangcb={
			title: '${wxshare.title}', // 分享标题
			desc : '${wxshare.desc}',
		    link: '${wxshare.link}', // 分享链接
		    imgUrl: '${wxshare.imgUrl}', // 分享图标
		    shareTimeline:function(bool){
		    	HH.ajax({
					data:{
						shareMan:'${uid}',
						activityId:'${activityId}',
						activityType:'PREKINDERGARTEN',
						configId: $(".cycleCurrent").data("value")
					},
					url:"/yzmm/account/pyramidSchemeShareCarryOut/create",
					async:false,
				    callback:function(data){
				   		if(data.success){
				   			$(".share1").hide();
				   			toast("恭喜你已获得喵姐早教说志愿者身份，3天内邀请3位好友成功报名“家庭版入园适应训练”，即可免费参与，加油！");
				   			setTimeout(function(){
				   				window.location.reload();
				   			},3000);
			   			}else{
			   				//toast(data.msg);
			   			}
				    }
				});
		    },
		    shareAppMessage:function(bool){
		    	HH.ajax({
					data:{
						shareMan:'${uid}',
						activityId:'${activityId}',
						activityType:'PREKINDERGARTEN',
						configId: $(".cycleCurrent").data("value")
					},
					url:"/yzmm/account/pyramidSchemeShareCarryOut/create",
					async:false,
				    callback:function(data){
				   		if(data.success){
				   			$(".share1").hide();
				   			toast("恭喜你已获得喵姐早教说志愿者身份，3天内邀请3位好友成功报名“家庭版入园适应训练”，即可免费参与，加油！");
				   			setTimeout(function(){
				   				window.location.reload();
				   			},3000);
			   			}else{
			   				//toast(data.msg);
			   			}
				    }
				});
		    }
	};
	initwxfx(wxfenxiangcb);
</script> -->
<!-- <script>
	var wxfenxiangcb={
			title: '${wxshare.title}', // 分享标题
			desc : '${wxshare.desc}',
		    link: '${wxshare.link}', // 分享链接
		    imgUrl: '${wxshare.imgUrl}', // 分享图标
		    shareTimeline:function(bool){
		    	HH.ajax({
					data:{
						uid:'${uid}',
						generateActivityId:$("#presharecouponId").val()
					},
					url:"/yzmm/account/KjaLoginShareActivity/ajaxshareGivecoupon",
					async:false,
				    callback:function(data){
				   		if(data.success){
				   			$(".share5").hide();
				   			console.log(data.ext);
				   			$(".pirceClass").html(data.ext/100);
				   			$(".share6").show();
			   			}else{
			   				$(".share5").hide();
			   				toast("优惠券已领取");
			   			}
				    }
				});
		    },
		    shareAppMessage:function(bool){
		    	HH.ajax({
					data:{
						uid:'${uid}',
						generateActivityId:$("#presharecouponId").val()
					},
					url:"/yzmm/account/KjaLoginShareActivity/ajaxshareGivecoupon",
					async:false,
				    callback:function(data){
				   		if(data.success){
				   			$(".share5").hide();
				   			console.log(data.ext);
				   			$(".pirceClass").html(data.ext/100);
				   			$(".share6").show();
			   			}else{
			   				$(".share5").hide();
			   				toast("优惠券已领取");
			   			}
				    }
				});
		    }
	};
	initwxfx(wxfenxiangcb);
</script> -->
    <script>
	    function switchShow(type,obj){
	    	obj.hide();
	    	obj.siblings(".rotateTxt").fadeIn();    
	   }
        $(function(){
                $('#imgh').html(".planContent .planImg{height:"+$('.planImg').width()/3 + "px}");
            })
        // 点击翻转
        function hideOther(curIndex){
            for(var i=1;i<=size;i++){
                if(curIndex!=i){
                    document.getElementById("div"+i).style.display="none";
                }
            }
        }
        function showPrev(){
            if(curIndex>1&&curIndex<=size){
                curIndex-=1;
                hideOther(curIndex);
                document.getElementById("div"+curIndex).style.display="block";
            }
        }
        function showNext(){
            if(curIndex<size){
                curIndex+=1;
                hideOther(curIndex);
                document.getElementById("div"+curIndex).style.display="block";
            }
        }
    </script>
</head>
<body>
<div class="fundPopup">
		<div class="popupBox">
            <div class="popupContent">
                <img src="<b:staticUrl>/res/img/prekindergarten/fund/u9743.png</b:staticUrl>" alt="" class="contentImg">
                <h2 class="contentTitH">专属海报已生成</h2>
                <p class="contentLook">前往公众号查看，成功邀请3位好友完成扫码即可免费参与，加油！</p>
                <a href="javascript:void(0);" class="shadoweBtn">去看看</a>
            </div>
            <img src="<b:staticUrl>/res/img/prekindergarten/fund/u1451.png</b:staticUrl>" alt="" class="popupBotImg">
        </div>
	</div>
    <div class="wrap" style="background-color: #f2f2f2;">
        <div class="public">
            <div class="recommendPage">
                <!--活动推荐个性信息-->
                <div class="recommendMess">
                    <!--顶部的个人信息-->
                    <div class="recommendHeader">
                        <div class="headerMess">
                            <img src="${alumb}" alt="" class="headerImg">
                            <div class="headerName">
                                <span>${nickname}</span>
                                <p>${babySex}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${babyAge}</p>
                            </div>
                        </div>
                       <%--  <span class="headerScore">${wdResult.score }分</span> --%>
                    </div>
                    <!--评测报告-->
                    <div class="recommendContent">
                        <div class="contentTit">
                            <span class="tit">${babynickname}</span><span class="tit">的测评成绩单</span>
                        </div>
	                        <div class="contentSurface">
	                            <p>平均水平</p>
	                            <div class="contentChart">
                                	<div class="dottedLine" style="height: 1.8rem;"></div>
	                            	<c:forEach items="${resultMap}" var="item" varStatus="status">
	                            		<c:if test="${status.index==0}"><span style="height:${item.value.score/100*4.5}rem">${item.value.score}</span><i></i></c:if>
	                                	<c:if test="${status.index==1}"><span style="height:${item.value.score/100*4.5}rem" class="chartTwo">${item.value.score}</span><i class="chartFkTwo"></i></c:if>
	                               		<c:if test="${status.index==2}"><span style="height:${item.value.score/100*4.5}rem" class="chartTthree">${item.value.score}</span><i class="chartFkThree"></i></c:if>
	                                	<c:if test="${status.index==3}"><span style="height:${item.value.score/100*4.5}rem" class="chartFour">${item.value.score}</span><i class="chartFkFour"></i></c:if>
	                                </c:forEach>
	                            </div>
	
	                            <div class="chartText clearfix">
	                               <c:forEach items="${resultMap}" var="item" varStatus="status">
	                            		<c:if test="${status.index==0}"> <font>${item.value.wdname}</font></c:if>
	                                	<c:if test="${status.index==1}"><font class="textTwo">${item.value.wdname}</font></c:if>
	                               		<c:if test="${status.index==2}"><font class="textTthree">${item.value.wdname}</font></c:if>
	                                	<c:if test="${status.index==3}"><font class="textFour">${item.value.wdname}</font></c:if>
	                                </c:forEach>
	                            </div>
	                        </div>
                    </div>
                </div>
                 <!--z总测评-->
                <div class="recommendMess recommendData">
                    <p class="general">总评：<span>${wdResult.score}分</span></p>
                    <p class="dataText">现在开始入园适应训练，至少可以降低宝宝与妈妈70%的分离焦虑，并有效缓解入园哭闹、生病等情况。</p>
                    <p class="presenTop">查看详细测评报告</p>
                    <div class="analysis" style="display: none">
                            <c:forEach items="${resultMap}" var="item">
							<div class="planTit clearfix">
		                        <div class="tit">
		                            <div></div><h4>${item.value.wdname}</h4><span class="headerScore">${item.value.score}&nbsp;<font>分</font></span>
		                        </div>
		                        <div class="planContent">
		                            <div class="planText">
		                                <div class="textP">
		                                    <p style="color:#363636;">${item.value.analysisTxt1}</p>
		                                    
		                                    <p style="color: #6B6B6B;"><span>【${item.value.score>85?'提升建议':'解决方案'}】</span>${item.value.adviceTxt1}</p>
		                                </div>
		                            </div>
		                        </div>
		                    </div>
					</c:forEach>
                    </div>
                    <p class="presenBtn">收起测评报告</p>
                </div>
			<c:if test="${!forcpindex}">
				<!--家庭版入园适应训练-->
                <div class="recommendPark">
                    <h4 class="parkTit parkH4">家庭版入园适应训练</h4>
                    <img src="<b:staticUrl>/res/img/prekindergarten/xunl.jpg</b:staticUrl>" alt="" class="mode">
                    <div class="activity_v">
                        <h4 class="actTit">活动介绍</h4>
                        <p class="actText">家庭版【入园适应训练】是由“喵姐早教说”推出的国内第一套AI人工智能宝宝入园适应训练方案，帮助2-3岁宝宝顺利适应幼儿园生活。能够有效减轻宝宝哭闹、分离焦虑等情况。</p>
                    </div>
                    <div class="activity_v">
                        <h4 class="actTit">活动流程</h4>
                        <p class="actText"> 72个智能任务单元，根据宝宝适应情况变化调整每日任务推送，整个过程就像家长和宝宝一起打怪升级，帮助宝宝顺利适应幼儿园生活。</p>
                    </div>
                    <div class="activity_v activity_r">
                        <h4 class="actTit">推荐理由</h4>
                        <p class="reason">由早期教育专家喵姐高寿岩带团队研发；</p>
                        <p class="reason">72个智能任务单元凝聚国内早教行业最强大脑智慧；</p>
                        <p class="reason">  国内第一套AI人工智能宝宝入园适应训练方案；</p>
                        <p class="reason"> 因材施教，根据宝宝适应情况程度推送任务；</p>
                        <p class="reason">教练式每日指导，清晰指导解决问题具体方法；</p>
                    </div>
                </div>
        	<!--开启入园适应计划-->
        	<c:choose>
		            <c:when test="${empty list}">
		            	<!--自定义训练周期-->
	 				<div class="recommendPark">
	                   <div class="recommendPark customWeek">
			                    <div class="targetList clearfix">
			                        <div class="parkList choice">
			                            <span class="list">自定义训练周期</span>
			                        </div>
			                        <div class="customDiv">
			                            <img src="<b:staticUrl>/res/img/prekindergarten/u5529.png</b:staticUrl>" alt="">
			                            <p class="custom">宝宝的入园时间已不满四周，下方小喵为您推荐两节关于入园相关微课可供学习；<br/>如您宝宝入园时间并不准确，可选择修改入园时间后方可参与活动。</p>
			                        </div>
			                        <span class="modify" id="modify" >修改入园时间</span>
			                    </div>
			                </div>
		                </div>
		                <!--相关微课推荐-->
		                <div class="contentReco clearfix">
		                    <h3 class="recomTit">相关微课推荐</h3>
		                      <div class="recoRelevant clearfix recoRemo">
		                        <img src="http://onlinefile.sevenkids.cn/uploadm/201607/28/14697093868349BC7.jpg" alt="" class="recomImg">
		                        <div class="recomClass">
		                            <p class="classTop">你绝对绝对想不到聪明的妈妈怎么做入园适应</p>
		                            <p class="classMiddle"><span>17910</span>人已看过</p>
		                            <p class="classBottom" onclick="toVod('5f8995cc66a644c6a3ceb03db5c23913')">去听课&nbsp;&nbsp;》</p>
		                            
		                        </div>
		                    </div>
		                    <div class="recoRelevant clearfix">
		                        <img src="http://onlinefile.sevenkids.cn/uploadm/201702/09/1486639613748CHMN.jpg" alt="" class="recomImg">
		                        <div class="recomClass">
		                            <p class="classTop">入园前你必须搞清楚的那些事儿</p>
		                            <p class="classMiddle"><span>8700</span>人已看过</p>
		                            <p class="classBottom" onclick="toVod('81edc163b7254836b6d78f38f5bc46ab')">去听课&nbsp;&nbsp;》</p>
		                        </div>
		                    </div>
		                </div>
		            </c:when>
                   <c:otherwise>
	                 <!--训练周期 20170620下午修改-->
	                <div class="recommendPark" id="recommendPark">
	                    <div class="targetList">
	                        <div class="parkList choice">
	                            <span class="list">根据测评结果，已为您匹配智能化训练方案</span>
	                        </div>
	                       <!--  <p class="listSubtitle">•  提示：准备周期越长，效果越佳。</p> -->
	                        <div class="choiceCycle clearfix">
	                            <ul>
	                            	<c:forEach items="${list}" var="item" varStatus="status">
	                                <li>
	                                	<%-- <c:if test="${(empty optdaycount) or (optdaycount==0)}">
	                                		<a data-value="${item.id}" data-days="${item.dayCount}" class="cyclevalue <c:if test="${status.index==0}">cycleCurrent</c:if>" href="javascript:void (0);" ><span class="choiceWeek">${item.name}&nbsp;•&nbsp;${item.dayCount}天 </span><span class="choicePirc">/&nbsp;限时特惠${item.amount}元（会员五折）</span></a>
	                                	</c:if>
	                                	<c:if test="${(not empty optdaycount) and (optdaycount!=0)}">
	                                		<a data-value="${item.id}"  data-days="${item.dayCount}"  class="cyclevalue <c:if test="${optdaycount==item.dayCount}">cycleCurrent</c:if>" href="javascript:void (0);" ><span class="choiceWeek">${item.name}&nbsp;•&nbsp;${item.dayCount}天 </span><span class="choicePirc">/&nbsp;限时特惠${item.amount}元（会员五折）</span></a>
	                                	</c:if> --%>
	                                	<c:if test="${status.index==0}">
	                                		<a data-value="${item.id}" data-days="${item.dayCount}" class="cyclevalue cycleCurrent" href="javascript:void (0);" ><span class="choiceWeek">${item.name}&nbsp;</span><span class="choicePirc">/&nbsp;限时特惠${item.amount}元（会员五折）</span></a>
	                               		</c:if>
	                                </li>
	                                </c:forEach>
	                            </ul>
	                            <p class="surplus">你还剩  <span class="lasttime">30:00</span> 分钟支付，逾时恢复原价￥199</p>
	                            <div class="volunteerBtn payBtn">
	                                <a href="#">付费报名</a>
	                            </div>
	                        </div>
	                    </div>
	                </div>
					
	                <!--免费参与通道  20170620下午修改
	                <div class="contentReco clearfix qudao" style="display: none;">
	                    <h2 class="passageway">免费参与通道</h2>
	                    <div class=passTxt>
	                        <p>分享活动链接，邀请3位好友成功报名 家庭版入园适应训练，即可免费参与本 次活动</p>
	                        <p class="free" onclick="showShare();">我要免费参加&nbsp;&nbsp;&nbsp;></p>
	                    </div>
	                    <img src="<b:staticUrl>/res/img/prekindergarten/u5054.png</b:staticUrl>" alt="" class="passImg">
	                </div>
	                -->
             		</c:otherwise>
                	<%-- <c:when test="${not empty carryOut}">
   					 <!--训练周期 20170620下午修改-->
		                <div class="recommendPark" id="recommendPark" style="display: none;">
		                    <div class="targetList">
		                        <div class="parkList choice">
		                            <span class="list">根据测评结果，已为您匹配智能化训练方案</span>
		                        </div>
		                      <!--   <p class="listSubtitle">•  提示：准备周期越长，效果越佳。</p> -->
		                        <div class="choiceCycle clearfix">
		                            <ul>
		                            	<c:forEach items="${list}" var="item" varStatus="status">
		                                <li>
		                                	<a data-value="${item.id}"  data-days="${item.dayCount}"  class="cyclevalue <c:if test="${optdaycount==item.dayCount}">cycleCurrent</c:if>" href="javascript:void (0);" ><span class="choiceWeek">${item.name}&nbsp;</span><span class="choicePirc">/&nbsp;限时特惠${item.amount}元（会员五折）</span></a>
		                                </li>
		                                </c:forEach>
		                            </ul>
		                        </div>
		                    </div>
		                </div>
			                 <div class="contentReco clearfix" id="contentReco">
			                    <h3><span>${babynickname}</span>入园适应训练计划</h3>
			                    <p class="recoTime">总训练时长：${optweekcount}周 ·${optdaycount}天</p>
			                   <!--  <p class="recoTerm">总训练任务：38项</p> -->
			                     <img src="<b:staticUrl>/res/img/prekindergarten/u1283.png</b:staticUrl>" alt="" class="recoImg">
			                </div>
			               <c:if test="${carryOut.kpiNum > carryCount}">
			                   <div class="contentReco clearfix">
				                    <div class="messContent">
				                        <div class="contentHeader volunteerHeader">
				                            <h3>志愿者记录</h3>
				                            <p class="volunteerText"><font>7月14日</font>之前邀请3位好友成功报名家庭版入园适应训练，即可获得免费学习资格。</p>
				                            <ul class="clearfix">
				                                <li><img src="<b:staticUrl>/res/img/prekindergarten/u1041.png</b:staticUrl>" alt=""></li>
				                                <li><img src="<b:staticUrl>/res/img/prekindergarten/u1041.png</b:staticUrl>" alt=""></li>
				                                <li><img src="<b:staticUrl>/res/img/prekindergarten/u1041.png</b:staticUrl>" alt=""></li>
				                            </ul>
				                            <div class="volunteerBtn">
				                                <a href="#" onclick="showShare();">邀请好友加入</a>
				                            </div>
				                            <div class="volunteerTime">
				                                <span class="recoDn">⏳ 2天 14小时 52分 11秒</span>
				                            </div>
				                        </div>
				                    </div>
				                     </div>
				                   
					                 <div class="contentRecoLimit clearfix ">
					                    <div class="messContentBorder">
					                        <div class="payContent">
					                            <h4>限时特惠</h4>
					                            <div class="choiceCycle">
					                                <div class="costMon">
					                                    <span class="costCur">￥</span>
					                                    <c:if test="${isVip}">
				                                      	   <span class="costNum">${vipAmount}</span>
				                                    		<span class="costOrig">/ 原价 ￥199</span>
					                                    </c:if>
					                                    <c:if test="${!isVip}">
					                                    	 <span class="costNum">${amount}</span>
					                                    	 <span class="costOrig">/ 原价 ￥199</span>
					                                    </c:if>
					                                </div>
					                                 
					                            </div>
					                            <p>你还剩  <span class="lasttime">29:59</span>  分钟支付，逾时恢复原价￥199</p>
					                            <div class="volunteerBtn payBtn">
					                                <a href="#">立即支付</a>
					                            </div>
					                        </div>
					                    </div>
					                </div>
			                </c:if> 
			               <c:if test="${carryOut.kpiNum <= carryCount}">
				               	<!--学籍卡志愿者记录  有三个头像状态-->
				                <div class="contentReco clearfix">
				                    <div class="messContent">
				                        <div class="contentHeader volunteerHeader">
				                            <h3>志愿者记录</h3>
				                            <p>恭喜你，已获得免费入学资格，快快开始吧！</p>
				                            <ul class="clearfix">
				                                 <li><img src="<b:staticUrl>/res/img/prekindergarten/u1041.png</b:staticUrl>" alt=""></li>
				                                <li><img src="<b:staticUrl>/res/img/prekindergarten/u1041.png</b:staticUrl>" alt=""></li>
				                                <li><img src="<b:staticUrl>/res/img/prekindergarten/u1041.png</b:staticUrl>" alt=""></li>
				                            </ul>
				                            <div class="volunteerBtn" onclick="HH.href('/yzmm/account/activity/prekindergarten/checkinSuccessPage?scopeId=${scopeId}');">
				                                <a>马上开启</a>
				                            </div>
				                        </div>
				                    </div>
				                </div>
			                </c:if>
			                <script type="text/javascript">
			                $(function(){
			                	   if('${imgUrls}'!=''){
			                		   var kpi = '${carryOut.kpiNum}';
					            	 	var imgUrls=JSON.parse('${imgUrls}');
					                	var clearfix = $('.volunteerHeader').find('.clearfix').find('img');
					                	for(var i=0;i<imgUrls.length;i++){
					                		if(i<kpi){
					                			clearfix[i].src=imgUrls[i];
						                		$(clearfix[i]).addClass("volunteerImg");
					                		}
					                	}
					                	imgUlrsLeng=imgUrls.length;
					            	}
			                });
			                </script>
                   		</c:when> --%>
                    </c:choose>
                    <a href="#joinFixed" class="joinFixed">付费报名</a>
        	</c:if>
        	<div class="contentReco clearfix" id="joinFixed">
                  <h3 class="listJoin"><span>免费参与</span>（名额有限）</h3>
                  <!--邀请好友成功之后显示下面的"p"和"ul"-->
                  <c:if test="${carryOut==null}">
	                  <p class="listTextP">点击“领取海报”生成你的专属海报，邀请${carryCount }位好友扫描海报二维码即可领取免费参与资格，加油吧！</p>
	                  <p class="fundvNothing">· 暂无推行记录 ·</p >
	                  <a class="join" id="join">领取海报</a>
                  </c:if>
                  <c:if test="${carryOut!=null}">
                  	  <p class="listTextP">点击“我要免费参与”生成你的专属海报，分享海报邀请 <span>${carryOut.kpiNum } 位</span>好友完成测试，即可。</p>
	                  <%-- <p class="listTextP">恭喜已成功邀请 ${carryCount } 位好友完成测评，再邀请 ${carryOut.kpiNum-carryCount<=0?0:carryOut.kpiNum-carryCount } 位好友即可免费参与，加油 ~</p> --%>
	                  <ul class="fundvimplement clearfix">
		    			<%-- <li><img src="<b:staticUrl>/res/img/activity/prekindergarten/default_album_url.png</b:staticUrl>" alt=""></li> --%>
		    			<c:forEach items="${imgUrls}" var="item">
		    				<li><img src="${item==null?'<b:staticUrl>/res/img/activity/prekindergarten/default_album_url.png</b:staticUrl>':item }" alt=""></li>
		    			</c:forEach>
		    		  </ul>
		    		  <a class="join" id="join">${ carryOut.kpiNum-carryCount<=0?'马上开始':'我要免费参与' }</a>
                  </c:if>
                  <p class="listBot">已有${psmAllCount }位家长获得免费参与资格</p>
              </div>
              <script type="text/javascript">
	                $(function(){
	                	
	                	$('.shadoweBtn').on('click',function(){
	                		wx.closeWindow();
	                	});
	                	
	                	   $('.join').on('click',function(){
	                		   HH.ajax({
	                				url:"/yzmm/account/pyramidSchemeShareCarryOut/checkIsKpiNum",
	                				data:{
	                					shareMan:'${uid}',
	        	             			activityId:'${activityId}',
	        	             			activityType:'PREKINDERGARTEN'
	                				}, 
	                				callback:function(data){
	                					if(data.success) {
	                						HH.href('/yzmm/account/activity/kja/task/receivetasklist?activityId=${activityId}');
	                	                } else {
	                	                	//TODO 发送海报
	                	                	 HH.ajax({
	         	                				url:"/yzmm/account/pyramidSchemeShareCarryOut/sendPoster",
	         	                				data:{
	         	                					shareMan:'${uid}',
	         	        	             			activityId:'${activityId}',
	         	        	             			activityType:'PREKINDERGARTEN',
	         	        	             			configId: $(".cycleCurrent").data("value")
	         	                				}, 
	         	                				callback:function(data){
	         	                					if(data.success) {
	         	                						$('.fundPopup').fadeIn();
	         	                					}else{
	         	                						toast(data.msg);
	         	                					}
	         	                				}
	         	                			});
	                	                }
	                				}
	                			});
	                	   });
	                	   $('.popupBotImg').click(function(){
        						$('.fundPopup').fadeOut();
        					});
	                });
	               <%//TODO 生成海报后创建 分享传销执行表 %>
	                /*  HH.ajax({
	             		data:{
	             			shareMan:'${uid}',
	             			activityId:'${activityId}',
	             			activityType:'PREKINDERGARTEN',
	             			configId: $(".cycleCurrent").data("value")
	             		},
	             		url:"/yzmm/account/pyramidSchemeShareCarryOut/create",
	             		async:false,
	             	    callback:function(data){
	             	   		if(data.success){
	                			}else{
	                				//toast(data.msg);
	                			}
	             	    }
	             	}); */
			  </script>
        	<%-- <div class="contentReco clearfix logincoupon" id="joinFixed" style="display: none;">
	         <h2 class="passageway">领券后付费更划算</h2>
	         <div class=passTxt>
	             <p>分享链接获得一张现金优惠券，可抵扣报名费哟！最高可减免￥99元。</p>
	             <p class="freebtn5" style="color:#0099ff" >领取优惠券&nbsp;&nbsp;&nbsp;></p>
	             <input type="hidden" id="presharecouponId" value="f0d17fcc644f448092b71eprekindshare"/>
	         </div>
	         <img src="<b:staticUrl>/res/img/prekindergarten/u5054.png</b:staticUrl>" alt="" class="passImg">
	     </div> --%>
        </div>
    </div>
    </div>
<!-- <div class="share1">
		<div class="shareBox">
			<div class="sharearrow"></div>
				<p class="font15" style="margin-top: 40px;">邀请三位好友成功报名“家庭版入园适应训练”活动</p>
				<p class="font15">即可免费参与！</p>
		</div>
	</div> -->
	<div class="share5" style="display:none;">
        <div class="sharearrow"></div>
           <p>点击右上角，分享成功即可获得优惠券哦！</p>
    </div>
	<div class="share6" style="display:none;">
        <div class="shareBox">
            <div class="conThree">    
                <div class="seriousPrize">
                    <span class="reward">恭喜你</span>
                    <p class="rewardTxt">获得 ￥<span class="pirceClass">4.5</span> 元现金券一张</p>
                </div>
                <p class="promptTxt">现金券有效期：3天</p>
                <p class="promptTxt promptFont">现在支付，立享优惠</p>
                <a class="couponSharePayBtn">立即支付</a>
            </div>
            <p class="conThreeP">关闭弹窗，可在个人中心“优惠券 - 获赠奖券”中查看</p>
            <img src="<b:staticUrl>/res/img/prekindergarten/comment/u4933.png</b:staticUrl>" alt="" class="conThreeBotImg">
        </div>
    </div>
	 <c:if test="${not empty list}">
		<script src="<b:staticUrl>/res/js/wxmppay.js</b:staticUrl>"></script>
		<c:forEach items="${list}" var="item" varStatus="status" begin="0" end="0">
         	<jsp:include page="../../pay/coupon_new.jsp">
				<jsp:param value="PREKINDERGARTEN" name="businessType"/>
				<jsp:param value="${activity.img}" name="imgUrl"/>
				<jsp:param value="${activity.name}" name="name"/>
				<jsp:param value="0" name="count"/>
	            <jsp:param value="${isVip?item.vipAmount:item.amount}" name="money"/>
				<jsp:param value="${activity.id}" name="bizId"/>
			</jsp:include>
        </c:forEach>
		<script type="text/javascript">
		var isWeixin = '${isWeixin}';
		$(function(){
			$(".payBtn").click(function(){
				if(!$(".cyclevalue").hasClass("cycleCurrent")){
					toast("请先选择您的准备周期~~~");
					return;
				}
				 if(isWeixin!="true"){
					  toast("请您进入微信支付");
					  return false;
				 }
				showCoupon(callbackPay,".wrap");
			});
			
		});
		function callbackPay(id){
			var type = 'PREKINDERGARTEN';
			 var body = "家庭版入园适应训练";
			 var scopeId = '${scopeId}';
			 if(!scopeId){
				 return;
			 }
			 wxmpprekindergartenpay(body,scopeId,id,type,function(orderId,result){
					 if(result=="ok"){
						 var tourl = "/yzmm/account/activity/prekindergarten/checkinSuccessPage";
					 	window.location.href="/yzmm/wxmppay/order/checkPay?couponId="+id+"&scopeId="+scopeId+"&orderId="+orderId+"&toPage="+tourl;
					 }
				 });
			}
		</script>
	</c:if>
 <!-- 时间插件相关 -->
  <c:if test="${empty list}">
  <script type="text/javascript">
  $(function() {
//    $('.swiper-wrapper').height($('.swiper-slide').height()*3);
////    $('#recommendPark').hide();
//    $(".choiceCycle ul li").click(function(){
//        $(".choiceCycle ul li a").removeClass("cycleCurrent");
//       $(this).children("a").addClass("cycleCurrent");
//    });

    var currYear = (new Date()).getFullYear();
    var opt={};
    opt.date = {preset : 'date'};
    //opt.datetime = { preset : 'datetime', minDate: new Date(2012,3,10,9,22), maxDate: new Date(2014,7,30,15,44), stepMinute: 5  };
    opt.datetime = {preset : 'datetime'};
    opt.time = {preset : 'time'};
    opt.default = {
        theme: 'sense-ui', //皮肤样式
        display: 'bottom', //显示方式
        mode: 'scroller', //日期选择模式
        lang:'zh',
        setText: '确定',
        cancelText: '取消',
        defaultValue:new Date('${startGoSchoolTime}'* 1000),
        // dateFormat:'yy-mm-dd',
        // startYear: (new Date()+1).getFullYear(),
        startYear:currYear -17, //开始年份
        endYear:currYear + 10, //结束年份
		onSelect:function(valueText,inst){
		var scopeId = '${scopeId}';
		var babyGoSchoolTime2 = $.myTime.DateToUnix(valueText+' 00:00:00');
		 var timestamp = Date.parse(new Date())/1000;
		if(babyGoSchoolTime2<(timestamp+345600)){
			toast("入园时间距离今天不能小于四周。")
			$("#dateLarge").val("");
			return;
		}
		
		HH.ajax({
			url:"/yzmm/account/activity/prekindergarten/updateGoschoolTime",
			data:{scopeId:scopeId,babyGoSchoolTime:babyGoSchoolTime2}, 
			callback:function(data){
				//判断发送是否成功
				if(data.success) {
					window.location.reload();
                } else {
                    toast(data.msg);
                }
			}
		});
		}
    };

    //$("#modify").val('').scroller('destroy').scroller($.extend(opt['date'], opt['default']));

});
</script>
</c:if>
<script type="text/javascript">
var kpiNum=0;//完成指标数量
var imgUlrsLeng=-1;//被分享人，报名成功头像数量，默认-1
var actDays = 0;
$(function(){
    $(".choiceCycle ul li").click(function(){
        $(".choiceCycle ul li a").removeClass("cycleCurrent");
       var a = $(this);
       	var configId =  $(this).children("a").data("value");
       	var days = a.children("a").data("days");
   		var scopeId = '${scopeId}';
	   	 if(!configId||!scopeId){
	   		 toast("请刷新后，重试~~");
	   	 }
	   	 
	  /*
	  	推荐三人
	  	actDays = parseInt(days)*24*60*60;//活动周期 换算成秒
	   	var startGoSchoolTime=parseInt('${startGoSchoolTime}');//开园时间
		var unixTime=new Date().getTime()/1000;
		var sanDaym=4*60*60*24;
		var num=startGoSchoolTime-unixTime-actDays-sanDaym;
		console.log(startGoSchoolTime+" "+unixTime+" "+actDays+" "+sanDaym);
		console.log(num);
		if(num<0){
			$('.qudao').hide();
		}else{
			$('.qudao').show();
		} */
   		HH.ajax({
			url:"/yzmm/account/activity/prekindergarten/updateConfig",
			data:{scopeId:scopeId,configId:configId}, 
			callback:function(data){
				//判断发送是否成功
				if(data.success) {
					 a.children("a").addClass("cycleCurrent");
                } else {
                    toast(data.msg);
                }
			}
		});
    });
    $(".cycleCurrent").parent("li").click();
});
var la = '${la}';

function toVod(id){
	HH.href("/yzmm/account/course/toVodDetail?courseId="+id);
}
$(function(){
    $('.recoImg').click(function(){$('#contentReco').hide();$('#recommendPark').show();});
});
//倒计时
	$('.volunteerText font').html(fmtDate(new Date(parseInt('${carryOut.endTime }')*1000),'MM月dd日'));
var endTime='${carryOut.endTime}';
var time=parseInt(endTime)-new Date().getTime()/1000;
var timer = setInterval(function(){
	var dateStr=formatSecondsDDHHmmss(time);
	$('.recoDn').html(dateStr);
	time--;
	if(time<0){
		//删除定时器
    	clearInterval(timer);
	}
},1000);//1000为1秒钟
</script>
<script>
   $(function(){
    	$(".share1").click(function(){
 			$(".share1").hide();
 		});	
   });
	function showShare(){
		if($(".cyclevalue").hasClass("cycleCurrent")){
			$('.share1').show();
		}else{
			toast("请先选择您的准备周期~~~");
		}
	}
	
   function timestart(){
		var timeP  = $(".lasttime");
		var m=29;
		var s=59;
		timestartInterval = window.setInterval(function(){
	       if(s<10){
	       		timeP.html(m+':0'+s);
	       }else{
	      	 	timeP.html(m+':'+s);
	       }
	       s--;
			if(0==m && 0==s){
				window.clearInterval(timestartInterval);
	       }
	       if(s<0){
	       	 	s=59;
		        m--;
	       }
	   },1000)
	}
	timestart();
	//志愿者被分享头像
  </script>
  <script>
         $('.presenTop').click(function(){
             $(this).hide();
             $('.analysis').show();
             $('.presenBtn').show();
         });
         $('.presenBtn').click(function(){
             $(this).hide();
             $('.analysis').hide();
             $('.presenTop').show();
         });

    </script>
    <script type="text/javascript">
    /*朦层*/
    $(function(){
        var  share = $('div.share5');
        $('.freebtn5').click(function(){
            $(share).show();
        });
        share.click(function(){
            $(this).hide();
        });
    });  
    $(function(){
        var  share2 = $('div.share6');
        $('.btn6').click(function(){
            $(share2).show();
        });
        $('.conThreeBotImg').click(function(){
            $(share2).hide();
        });
        HH.ajax({
    		waiting:true,
    		url:"/yzmm/account/KjaLoginShareActivity/ajaxList",
    		callback:function(data){
    			if (data.success) {
    				//是否为空
    				if (!data.totalPage) {
    					$(".logincoupon").hide();
    				}else{
    					var acId = data.list[0].id;
    					if(acId){
    						$("#presharecouponId").val(acId);
        					$(".logincoupon").show();
    					}
    				}
    			}
    		}
        });
      $(".couponSharePayBtn").on("click",function(){
    	  $(".share6").hide();
    	  $(".payBtn").click();
      });
    });
    var temp = 0;
    $(function() {
        $('.joinFixed').click(function() {
            $(this).fadeOut();
        });
        $(window).scroll(function(){
            var topDistance = $(window).scrollTop();
            if($(window).scrollTop() > 730 && $(window).scrollTop()!=0) {
                $('.joinFixed').fadeOut();
            }else {
                $('.joinFixed').fadeIn();
            }
            temp =  topDistance;
        })
    })
    
    function getDate() {
				//拼接年月日标签
				var str = "";
				str += "<div class=\"scrollDateTime\">";
				str += "	<div class=\"scrollList\">	";
				str += "		<div class=\"scrollTit clearfix\">";
				str += "			<a href=\"javascript:void(0)\" class=\"btn_cancle1\"><&nbsp;取消</a>";
				str += "			<span class=\"showTime1\">2014</span>年";
				str += "			<span class=\"showTime1\">07</span>月";
				str += "			<span class=\"showTime1\">11</span>日";
				str += "				<a href=\"javascript:void(0)\" class=\"btn_sure1\" onclick=\"updateGoschoolTime()\">确定&nbsp;></a>";
				str += "		</div>";
				str += "		<ul class=\"scrollTime\">";
				str += "			<li class=\"scrollYear\">";
				str += "				<div class=\"swiper-container\" id=\"swiperYear1\">";
				str += "					<div class=\"swiper-wrapper\">";
											for(var i = 1; i <= 50; i++) {
												str += "<div class=\"swiper-slide\">" + (2013 + i) + "</div>";
											}
				str += "					</div>";
				str += "				</div>";
				str += "			</li>";
				str += "			<li class=\"scrollMonth\">";
				str += "				<div class=\"swiper-container\" id=\"swiperMonth1\">";
				str += "					<div class=\"swiper-wrapper\">";
										for(var i = 1; i <= 12; i++) {
											if(i>=10){
												str += "<div class=\"swiper-slide\">" + i + "</div>";
											}else {
												str += "<div class=\"swiper-slide\">" + "0" + i + "</div>";
											}
										}
				str += "					</div>";
				str += "				</div>";
				str += "			</li>";
				str += "			<li class=\"scrollDay\"> ";
				str += "				<div class=\"swiper-container\" id=\"swiperDay1\">";
				str += "					<div class=\"swiper-wrapper\">";
										for(var i = 1; i <= 31; i++) {
											if(i>=10) {
												str += "<div class=\"swiper-slide\">" + i + "</div>";
											}else {
												str += "<div class=\"swiper-slide\">" + "0" + i + "</div>";
											}
										}
				str += "					</div>";
				str += "				</div>";
				str += "			</li>";
				str += "		</ul>";
				str += "	</div>";
				str += "</div>";
				return str;
			}
			document.write(getDate());
			
			function updateGoschoolTime(){
				var scopeId = '${scopeId}';
				var babyGoSchoolTime2 = $.myTime.DateToUnix(($('.showTime1:eq(0)').text()+"-"+$('.showTime1:eq(1)').text()+"-"+$('.showTime1:eq(2)').text())+' 00:00:00');
				 var timestamp = Date.parse(new Date())/1000;
				if(babyGoSchoolTime2<(timestamp+345600)){
					toast("入园时间距离今天不能小于四周。")
					$("#dateLarge").val("");
					return;
				}
				
				HH.ajax({
					url:"/yzmm/account/activity/prekindergarten/updateGoschoolTime",
					data:{scopeId:scopeId,babyGoSchoolTime:babyGoSchoolTime2}, 
					callback:function(data){
						//判断发送是否成功
						if(data.success) {
							window.location.reload();
		                } else {
		                    toast(data.msg);
		                }
					}
				});
			}
    </script>
  </body>
</html>