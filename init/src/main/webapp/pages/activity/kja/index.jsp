<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='j' uri='/jsputil'%>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@include file="../../header_v2.4.0.jsp" %>
 	<%@include file="../../header_wxjsapi.jsp"%>
 	<title>喵姐早教说</title>
    <link rel="stylesheet" href='<b:staticUrl>/res/css/prekindergarten/lifetable.css</b:staticUrl>'>
     <link rel="stylesheet" href="<b:staticUrl>/res/css/prekindergarten/swiper-3.4.2.min.css</b:staticUrl>">
    <script type="text/javascript" src="<b:staticUrl>/res/js/prekindergarten/swiper-3.4.2.min.js</b:staticUrl>"></script>
    <script src='<b:staticUrl>/res/js/prekindergarten/selectionTime.js</b:staticUrl>'></script>
    <style>
        .show{
            display:block;
        }
        .hidden{
           display:none; 
        }
         .swiper-container {
            width: 50%;
        }
	
        .current{
            color:#ff9963 !important;
        }
        .swiper-slide-active{color: #ff9963;}
        .wrapPage .mark {
		    min-height: 15rem;
		}
		.wrapPage .mark h3 {
		 font-size: 0.48rem;
		 padding: 0.61333333rem 0 0.50666667rem;
		 font-weight: bold;
		 color: #141414;
		}
    </style>
</head>
<body>
    <!--任务列表  点击显示隐藏-->
    <div class="share1">
        <div class="shareBox">
            <div class="shareHeader">
                <h3>好好先生入园适应训练<span>&nbsp;· 第1周</span></h3>
            </div>
            <div class="shareHeader clearfix" onclick="HH.href('/yzmm/account/activity/kja/task/weekTargetList?activityId=${activityId}&dayTime=${dayTime}');">
                <p class="navLeft">本周目标</p>
                <p class="navRight"><span>></span></p>
            </div>
 				<div class="initDiv" style="display: none;">
            	  <div class="shareHeader clearfix completeDiv">
		                <p class="navLeft navImg">Day01</p>
		                <div class="navRight"><img src="<b:staticUrl>/res/img/prekindergarten/u2672.png</b:staticUrl>" alt=""></div>
		                <div class="navText">
		                </div>
		            </div>
		            <div class="shareHeader clearfix uncommentDiv">
		                <p class="navLeft navImg">Day02</p>
		                <p class="navRight card">未打卡</p>
		            </div>
		            <div class="shareHeader clearfix navCard goingDiv">
		                <p class="navLeft navImg">Day03</p>
		                <p class="navRight card cardCon">进行中</p>
		                <div class="navText">
		               
		                </div>
		            </div>
            </div>
            <div class="bb">
            
            </div>
        </div>
    </div>
    <div class="wrapPage show"> 
        <div class="headerImg">
            <!--顶部的导航条-->
            <div class="lifeNav hidden" >
                <p class="navLeft navList">任务列表</p>
                <p class="navRight">1 / 1</p>
            </div>
            <!--顶部的图片-->
            <img src="${empty task.img?'<b:staticUrl>/res/img/prekindergarten/taskdefult.jpg</b:staticUrl></b:staticUrl>':task.img}" alt="">
        </div>
        <!--NO.1制作生活常规表-->
        <div class="mark">
            <h3>No.1 ${task.description}</h3>
           	<p>
           		<j:codeToLabel value='${empty task.guide?"":task.guide}'></j:codeToLabel>
           		<j:codeToLabel value='${empty task.guideOne?"":task.guideOne}'></j:codeToLabel>
           		<j:codeToLabel value='${empty task.guideTwo?"":task.guideTwo}'></j:codeToLabel>
           		<j:codeToLabel value='${empty task.guideThree?"":task.guideThree}'></j:codeToLabel>
           		<j:codeToLabel value='${empty task.guideFour?"":task.guideFour}'></j:codeToLabel>
           		<j:codeToLabel value='${empty task.guideFive?"":task.guideFive}'></j:codeToLabel>
           	</p>
        </div>
    </div>  

</body>
</html>
