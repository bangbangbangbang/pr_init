<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>喵姐早教说</title>
	<%@include file="../../header_v2.4.0.jsp" %>
	<link rel="stylesheet" href="<b:staticUrl>/res/css/prekindergarten/calculation.css</b:staticUrl>">
	<style type="text/css">
	 .currProgress1 .currProgress11{
            background:rgba(255, 153, 51, 1);
            height: 100%;
            width: 0;
            border-radius:1.333333rem 1.3333rem;
            transition: width 1s linear;
            /* Firefox 4 */
            -moz-transition:width 1s linear;
            /* Safari and Chrome */
            -webkit-transition:width 1s linea;
            /* Opera */
            -o-transition:width 1s linear;
                    }
        .currProgress2 .currProgress21{
            background:rgba(255, 153, 51, 1);
            width: 0;
            height: 100%;
            border-radius:1.333333rem 1.3333rem;
            transition: width 1s linear 2s;
            /* Firefox 4 */
            -moz-transition:width 1s linear 1s;
            /* Safari and Chrome */
            -webkit-transition:width 1s linear 1s;
            /* Opera */
            -o-transition:width 1s linear 1s;
        }
        .currProgress3 .currProgress31{
            background:rgba(255, 153, 51, 1);
            height: 100%;
            width: 0;
            border-radius:1.333333rem 1.3333rem;
            transition: width 1s linear 2s;
            /* Firefox 4 */
            -moz-transition:width 1s linear 2s;
            /* Safari and Chrome */
            -webkit-transition:width 1s linear 2s;
            /* Opera */
            -o-transition:width 1s linear 2s;
        }
	</style>
	<script type="text/javascript">
	function genWeekReport(){
		HH.ajax({
			data:{
				uid:'${uid}',
				activityId:'${activityId}',
				dayTime:'${dayTime}'
			},
			url:"/yzmm/account/activity/kja/genWeekReport",
			async:false,
		    callback:function(data){
		   		if(data.success){
		   			HH.href("/yzmm/account/activity/kja/showWeekReport?activityId=${activityId}&uid=${uid}&dayTime=${dayTime}");
	   			}else{
	   				if(data.ext){
	   					HH.href(data.ext);
	   				}
	   			}
		    }
		});
	}
	
	$(function(){
		
		//验证是否生成了
		genWeekReport();
		
		setInterval(function(){
			genWeekReport();
		},20000);
	})
	</script>
</head>
<body>
  <div class="wrapPage"> 
        <!--本周成绩计算中...-->
       <h3>正在计算本周成绩……</h3>
       <p class="tear">智能导师系统正在审阅，请稍等。</p>
       <!--图片和进度条-->
       <div class="progressBar clearfix">
            <img src="<b:staticUrl>/res/img/prekindergarten/u4396.jpg</b:staticUrl>" alt="">
            <div class="progress">  
                <div class="currProgress1">
                    <div class="currProgress11"></div>
                </div>
                <div class="currProgress2">
                    <div class="currProgress21"></div>
                </div>
                <div class="currProgress3">
                    <div class="currProgress31"></div>
                </div>
            </div>
       </div>
       <p class="time">剩余 <span>5</span> 秒</p>
    </div>
    <script>
    var spanS;
	var i=5;
	var v;
   $(function(){
       $('.currProgress1 .currProgress11').width('100%');
       $('.currProgress2 .currProgress21').width('100%');
       $('.currProgress3 .currProgress31').width('100%');
       spanS = $('.time span');
		v=setInterval("changeNum()",700);
       var timer = null;
           timer = setInterval(function(){
               $('.currProgress1 .currProgress11').css('transition','width 1s linear');
               $('.currProgress1 .currProgress11').width('100%');
               $('.currProgress2 .currProgress21').css('transition','width 1s linear 1s');
               $('.currProgress2 .currProgress21').width('100%');
               $('.currProgress3 .currProgress31').css('transition','width 1s linear 2s');
               $('.currProgress3 .currProgress31').width('100%');
           if( $('.currProgress3 .currProgress31').width()/$('.currProgress3').width()==1){
               $('.currProgress1 .currProgress11').width('0');
               $('.currProgress1 .currProgress11').css('transition','none');
               $('.currProgress2 .currProgress21').width('0');
               $('.currProgress2 .currProgress21').css('transition','none');
               $('.currProgress3 .currProgress31').width('0');
               $('.currProgress3 .currProgress31').css('transition','none');
           }
       },700);

   });
		
   function changeNum(){
		i-=1;
		spanS.text(i);
		if(i==0){
           i=6;
		}
   }
</script>
</body>
</html>