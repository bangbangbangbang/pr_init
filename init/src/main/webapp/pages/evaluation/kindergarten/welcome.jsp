<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--忽略页面中的邮箱格式为邮箱-->
<meta name="format-detection" content="email=no"/>
 <%@include file="../../header_v2.4.0.jsp" %>
 <%@include file="../../header_wxjsapi.jsp"%>
 <link rel="stylesheet" href="<b:staticUrl>/res/css/anniversary/swiper-3.4.2.min.css</b:staticUrl>">
 <link rel="stylesheet" href="<b:staticUrl>/res/css/prekindergarten/evaluation.css</b:staticUrl>">
 <script src="<b:staticUrl>/res/js/scroll.js</b:staticUrl>"></script>
 <script src="<b:staticUrl>/res/js/evaluation/selectDate.js</b:staticUrl>"></script>
 <script src="<b:staticUrl>/res/js/anniversary/swiper-3.4.2.min.js</b:staticUrl>"></script>
<title>喵姐早教说</title>
	<style type="text/css">	
			dd {
				float: left;
				line-height: 37px;
			}
			
			dd:nth-child(3n+1) {
				text-align: right;
				width: 164px;
			}
			
			input[type="radio"] {
				display: none;
			}
			
			input[type="radio"]+label {
				position: relative;
				padding-left: 0.3rem;
				font-weight: normal;
				margin-right: 0.8rem;
				color: #333;
				font-size: 0.34rem;
			}
			
			label {
				display: inline-block;
				max-width: 100%;
				margin-bottom: 5px;
				font-weight: 700;
			}
			
			input[type="radio"]+label::before {
				content: "";
				width: 0.3rem;
				height: 0.3rem;
				border-radius: 50%;
				border: 1px solid #cecece;
				position: absolute;
				top: 0.3rem;
				left: 0;
			}
			
			input[type="radio"]:checked+label::after {
				top: 0.4rem;
				left: 0.1rem;
				content: "";
				background-color: #ff9963;
				width: 0.15rem;
				height: 0.15rem;
				border-radius: 50%;
				position: absolute;
				vertical-align: middle;
			}
			input:-ms-input-placeholder {
				color: #000;
				opacity: 1;
			}
			.current{
	            color:#ff9963;
	        }
			.swiper-slide-next {
				color: #ff9900;
			}
		</style>
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
			<h2 class="evaluationTit">家庭版入园适应训练</h2>
			<div class="regionTxt">
				<div class="txtTitle clearfix">
					<h2 class="fl">4-8周</h2>
					<span class="fl">让宝宝不哭不闹轻松入园</span>
				</div>
				<p>72项智能任务单元</p>
				<p>完美提升入园必备4项核心能力</p>
				<p class="txtP">国内第一套入园适应训练</p>
			</div>
			<!--宝宝个人信息-->
			<div class="evaluationMess">
				<div class="messNickname clearfix">
					<span class="nickname fl">
                    	宝宝昵称：&nbsp;&nbsp;
                	</span>
					<input type="text" class="textIpt" id="babyNickname" name="babyNickname" />
				</div>
				<div class="messNickname">
					<span class="nickname">
                    	宝宝性别：&nbsp;&nbsp;
                	</span>
					<input type="radio" class="couponIdRadio" name="babySex" value="MALE" id="adType1">
					<label for="adType1">
	                   &nbsp;&nbsp;小王子
	                </label>
					<input type="radio" class="couponIdRadio" name="babySex" value="FAMALE" id="adType2">
					<label for="adType2">
                    	&nbsp;&nbsp;小公主
                	</label>
				</div>
				<div class="messNickname" id="messDate">
					<span class="nickname">
                        	宝宝出生日期：
                	</span>
					<span class="nickInput" id="nickSpan"></span>
					<div class="dateLarge">&gt;</div>
				</div>
				<div class="messNickname" id="messDate1">
					<span class="nickname">
                        	幼儿园开园时间：
                	</span>
					<span class="nickInput" id="nickSpan1"></span>
					<div class="dateLarge">&gt;</div>
				</div>
			</div>
			<div class="evaluationStart">
				<div class="btnJoin">
					<a href="#">完成，开始答题</a>
				</div>
				<p class="startBottm">共32道测评题目，预计需要15分钟</p>
			</div>
			<p class="evaBottom">
				温馨提示：此测评每人仅一次机会，且结果与入园准备训练方案相关，请根 据宝宝实际情况进行测评。
			</p>
		</div>
		<script>
			function getStr() {
				//拼接年月日标签
				var str = "";
				str += "<div class=\"scrollDate\">";
				str += "	<div class=\"scrollList\">	";
				str += "		<div class=\"scrollTit clearfix\">";
				str += "			<a href=\"javascript:void(0)\" class=\"btn_cancle\"><&nbsp;取消</a>";
				str += "			<span class=\"showTime\">2014</span>年";
				str += "			<span class=\"showTime\">07</span>月";
				str += "			<span class=\"showTime\">11</span>日";
				str += "				<a href=\"javascript:void(0)\" class=\"btn_sure\">确定&nbsp;></a>";
				str += "		</div>";
				str += "		<ul class=\"scrollTime\">";
				str += "			<li class=\"scrollYear\">";
				str += "				<div class=\"swiper-container\" id=\"swiperYear\">";
				str += "					<div class=\"swiper-wrapper\">";
											for(var i = 1; i <= 50; i++) {
												str += "<div class=\"swiper-slide\">" + (1980 + i) + "</div>";
											}
				str += "					</div>";
				str += "				</div>";
				str += "			</li>";
				str += "			<li class=\"scrollMonth\">";
				str += "				<div class=\"swiper-container\" id=\"swiperMonth\">";
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
				str += "				<div class=\"swiper-container\" id=\"swiperDay\">";
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
			document.write(getStr());
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
				str += "				<a href=\"javascript:void(0)\" class=\"btn_sure1\">确定&nbsp;></a>";
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
		</script>
	<script type="text/javascript">
		var cpid="${id}";
	</script>
	
	<script type="text/javascript">
        $(function () {
                var timestamp = Date.parse(new Date())/1000;
                $(".evaluationStart .btnJoin").click(function(){
            		var cpId = '${id}';
        			var babyNickname = $("#babyNickname").val();
        			var babySex = $("input[name='babySex']:checked").val();
        			var babyAge = $("#nickSpan").html();
        			var babyAge2 = $.myTime.DateToUnix(babyAge.replace('年','-').replace('月','-').replace('日','')+' 00:00:00');
        			var babyGoSchoolTime = $("#nickSpan1").html();
        			var babyGoSchoolTime2 = $.myTime.DateToUnix(babyGoSchoolTime.replace('年','-').replace('月','-').replace('日','')+' 00:00:00');
        			if(!babyNickname||!babySex||!babyAge||!babyGoSchoolTime){
        				toast("请完善信息");
        				return;
        			}
        			
        			if(babyAge2>timestamp){
        				toast("出生日期不能大于今天。")
        				$("#dateIpu").val("");
        				return;
        			}
        		/* 	alert(babyGoSchoolTime2);
        			alert(timestamp+345600); */
        			if(babyGoSchoolTime2<(timestamp)){
        				toast("入园时间不能小于今天。");
        				$("#nickSpan1").html("");
        				return;
        			}
        			HH.ajax({
        				url:"/yzmm/account/evaluation/result/saveIdentity",
        				data:{cpId:cpId,babyNickname:babyNickname,babySex:babySex,babyAge:babyAge2,babyGoSchoolTime:babyGoSchoolTime2}, 
        				callback:function(data){
        					//判断发送是否成功
        					if(data.success) {
        						HH.href("/yzmm/account/evaluation/evaluationProblemList?cpResultId="+data.ext);
        	                } else {
        	                    toast(data.msg);
        	                }
        				}
        			});
                }); 
        });
		
    </script>
</body>
</html>
