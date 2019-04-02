<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta name="format-detection" content="telephone=no" />
	<meta name="format-detection" content="email=no"/>
	<%@include file="../header_v15.jsp"%>
	<script src="<b:staticUrl>/res/js/process/userInfoReg.js</b:staticUrl>"></script>
</head>
<body id="bgwhite" data-ix="1" data-year="1" style="font-size: 12px;">
<form id="activeForm" action="/yzmm/account/userInfoReg" onSubmit="return sub()">
<div class="font15 regTit"><span class="i-note"></span>完善信息，有助于您获得更准确的育儿知识</div>
<div class="font15 form">
	<div class="item">
		<div class="item-tit">您的身份是：</div>
		<div class="item-cont">
			<span class="radio"><i class="i-radio i-radioactive"></i>宝妈/爸</span>
			<span class="radio mother"><i class="i-radio"></i>孕妈/爸</span>
			<span class="radio others"><i class="i-radio"></i><i>其他</i></span>
		</div>
	</div>	
</div>
<div class="font15 addmiao addmiao2 active">
	<div class="item" style="display: -webkit-box;">
		<div class="item-tit">喵大：</div>
		<div class="item-cont">
			<span class="radio"><i class="i-radio i-radioactive"></i>男</span>
			<span class="radio"><i class="i-radio"></i>女</span>
		</div>
		<div class="birth" id="b1">2012年3月2日</div>
		<span class="i-arrow"></span>
	</div>	
	<div class="item duedate">
		<div class="item-tit">您的预产期</div>
		<div class="item-cont"></div>
		<div class="birth">2016年10月22日</div>
		<span class="i-arrow"></span>
	</div>
	<a href="javascript:void(0)" class="addbtn" style="display: block;">
		<span class="i-add"></span><span class="i-remove"></span>添加宝贝
	</a>
</div>
</form>
<div class="btn"><input type="submit" class="font18 submit" value="完成" onclick="active()"></div>
<div class="btn btn2"><input type="submit" class="font18 submit" onclick='cancelSubmit()'  value="取消"></div>
<!--尾部-->
<jsp:include page="/pages/header_footer.jsp">
	<jsp:param value="4" name="menu"/>
</jsp:include>
<!--日历控件-->
<div class="font18 scroll" style="display: none;">
	<div class="scrollList">
		<div class="scrollTit">
			<span class="per33">年</span>
			<span class="per33">月</span>
			<span class="per33">日</span>
		</div>
		<div class="line"></div>
		<div class="scollItem per33 year">
			<div class="perCont" style="top: -1960px;"><span>1966</span><span>1967</span><span>1968</span><span>1969</span><span>1970</span><span>1971</span><span>1972</span><span>1973</span><span>1974</span><span>1975</span><span>1976</span><span>1977</span><span>1978</span><span>1979</span><span>1980</span><span>1981</span><span>1982</span><span>1983</span><span>1984</span><span>1985</span><span>1986</span><span>1987</span><span>1988</span><span>1989</span><span>1990</span><span>1991</span><span>1992</span><span>1993</span><span>1994</span><span>1995</span><span>1996</span><span>1997</span><span>1998</span><span class="">1999</span><span class="">2000</span><span class="">2001</span><span class="">2002</span><span class="">2003</span><span class="">2004</span><span class="">2005</span><span class="">2006</span><span class="">2007</span><span class="">2008</span><span class="">2009</span><span class="">2010</span><span class="">2011</span><span class="">2012</span><span class="">2013</span><span class="">2014</span><span class="">2015</span><span class="active">2016</span><span>2017</span><span>2018</span><span>2019</span><span>2020</span><span>2021</span><span>2022</span><span>2023</span><span>2024</span><span>2025</span><span>2026</span><span>2027</span><span>2028</span><span>2029</span><span>2030</span><span>2031</span><span>2032</span><span>2033</span><span>2034</span><span>2035</span><span>2036</span><span>2037</span><span>2038</span><span>2039</span><span>2040</span><span>2041</span><span>2042</span><span>2043</span><span>2044</span><span>2045</span><span>2046</span><span>2047</span><span>2048</span><span>2049</span><span>2050</span><span>2051</span><span>2052</span><span>2053</span><span>2054</span><span>2055</span><span>2056</span><span>2057</span><span>2058</span><span>2059</span><span>2060</span><span>2061</span><span>2062</span><span>2063</span><span>2064</span><span>2065</span><span>2066</span></div>
		</div>
		<div class="scollItem per33 month" data-on="9">
			<div class="perCont" style="top: -320px;">
				<span class="">1</span>
				<span class="">2</span>
				<span class="">3</span>
				<span class="">4</span>
				<span class="">5</span>
				<span class="">6</span>
				<span class="">7</span>
				<span class="">8</span>
				<span class="">9</span>
				<span class="active">10</span>
				<span class="">11</span>
				<span class="">12</span>
			</div>
		</div>
		<div class="scollItem per33 day" data-on="27">
			<div class="perCont" style="top: -800px;"><span>1</span><span>2</span><span>3</span><span>4</span><span>5</span><span>6</span><span>7</span><span>8</span><span>9</span><span>10</span><span>11</span><span>12</span><span>13</span><span>14</span><span>15</span><span>16</span><span>17</span><span>18</span><span>19</span><span>20</span><span>21</span><span class="active">22</span><span>23</span><span>24</span><span>25</span><span>26</span><span>27</span><span>28</span><span>29</span><span>30</span><span>31</span></div>
		</div>
		<div class="scollItem per25" style="display:none"></div>
		<div class="clearfloat"></div>
		<div class="handleBtn">
			<a href="javascript:void(0)" class="btn_cancle">取消</a>
			<a href="javascript:void(0)" class="btn_sure">确定</a>
		</div>
	</div>
</div>
<script type="text/javascript">
//跳转url
var toUrl='${toUrl}';
</script>

</html>