<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--忽略页面中的邮箱格式为邮箱-->
<meta name="format-detection" content="email=no"/>
 <%@include file="../header_v2.0.jsp" %>
 <%@include file="../header_wxjsapi.jsp"%>
 <script src="<b:staticUrl>/res/js/scroll.js</b:staticUrl>"></script>
 <link rel="stylesheet" href="<b:staticUrl>/res/css/activity-v2.0.css</b:staticUrl>" >
 <script src="<b:staticUrl>/res/js/evaluation/idenify.js</b:staticUrl>"></script>
<title>喵姐早教说</title>
<style type="text/css">
	p{
		font-size: 12.3px;
	}
	section{
		text-align: center;
		padding: 1rem;
	}
	.topDiv{
		margin-bottom: 1rem;
	}
	.marginTop{
		margin-top:1.5rem;
	}
	.marginTop img{
		width:50px;
		height:50px;
		cursor: pointer;
	}
	.marginTop span{
		font-size:14px;
		cursor: pointer;
	}
	.idenify{
		float: left;
		width: 33.333%;
	}
	.span-prompt{
		font-size: 10px;
		color: #AEAEAE;
		text-align: center;
	}
	.tipInfo{
		bottom: 5px;
	    position: absolute;
	    margin: 0 auto;
	    width: 100%;
	    text-align: center;
	}
	p span{
		line-height: 0.6rem;
	}
	p small{
		margin-top: 2rem;
		float: left;
		color: #FF9900;
		line-height: 0.4rem;
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
<section>
<div class="topDiv">
	<img alt="" src="/../../../res/img/evaluation/welcome.png">
</div>
	<p style="font-size:0.2rem;">嗨，欢迎您来到喵姐早教说专业测评栏目，为保证测评结果的准确性，喵姐需要知道您目前属于</p>
<div class="marginTop">
	<div>
		<div class="idenify">
			<div><img alt="" src="/../../../res/img/evaluation/baby.png"></div>
			<span>宝妈/爸</span>
		</div>
		<div class="idenify">
			<div><img alt="" src="/../../../res/img/evaluation/yuchan.png"></div>
			<span>孕妈/爸</span>
		</div>
		<div class="idenify">
			<div><img alt="" src="/../../../res/img/evaluation/beiyun.png"></div>
			<span>测完生宝宝</span>
		</div>
	</div>
</div>
<p><small style="font-size:0.4rem;">为获得准确的测评结果及提升建议，请依照您的真实做法选择最接近的答案。</small></p>
<ul class="border0 baoHandle marginTop" style="display: none">
	<li style="text-align: center;">
		<div class="cont idenfyValue">
			<span class="txt2">
				<a class='font13' href="#">添加宝宝信息</a>
			</span>
		</div>
	</li>
</ul>
</section>
<!--身份选择-->
	<div class="font18 idenfy">
		<div class="idenfyList">
			<div class="idenfyItem">
				<div class="perCont">
					<span>小公主</span>
					<span class="active">小王子</span>
				</div>
			</div>
			<div class="handleBtn">
				<a href="javascript:void(0)" class="btn_cancle">取消</a>
				<a href="javascript:void(0)" class="btn_sure">确定</a>
			</div>
		</div>
	</div>
	<!--日历控件-->
	<div class="font18 scroll" style="display:none;">
		<div class="scrollList">
			<div class="scrollTit">
				<span class="per33">年</span>
				<span class="per33">月</span>
				<span class="per33">日</span>
			</div>
			<div class="line"></div>
			<div class="scollItem per33 year">
				<div class="perCont">
					<span>2014</span>
					<span>2015</span>
					<span>2016</span>
					<span class="active">2017</span>
					<span>2019</span>
					<span>2020</span>
					<span>2021</span>
					<span>2022</span>
					<span>2023</span>
				</div>
			</div>
			<div class="scollItem per33 month">
				<div class="perCont">
					<span>1</span>
					<span>2</span>
					<span>3</span>
					<span class="active">4</span>
					<span>5</span>
					<span>6</span>
					<span>7</span>
					<span>8</span>
					<span>9</span>
					<span>10</span>
					<span>11</span>
					<span>12</span>
				</div>
			</div>
			<div class="scollItem per33 day">
				<div class="perCont">
					<span>1</span>
					<span>2</span>
					<span>3</span>
					<span>4</span>
					<span>5</span>
					<span>6</span>
					<span>7</span>
					<span>8</span>
					<span>9</span>
					<span>10</span>
					<span>11</span>
					<span>12</span>
					<span>13</span>
					<span>14</span>
					<span class="active">15</span>
					<span>16</span>
					<span>17</span>
					<span>18</span>
					<span>19</span>
					<span>20</span>
					<span>21</span>
					<span>22</span>
					<span>23</span>
					<span>24</span>
					<span>25</span>
					<span>26</span>
					<span>27</span>
					<span>28</span>
					<span>29</span>
					<span>30</span>
					<span>31</span>
				</div>
			</div>
			<div class="scollItem per25" style="display:none"></div>
			<div class="clearfloat"></div>
			<div class="handleBtn">
				<a href="javascript:void(0)" class="btn_cancle">取消</a>
				<a href="javascript:void(0)" class="btn_sure">确定</a>
			</div>
			<div class="tipInfo"><span class="span-prompt">请选择宝宝出生日期</span></div>
		</div>
	</div>
	<script type="text/javascript">
		var cpid="${id}";
	</script>
</body>
</html>
